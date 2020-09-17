class BooksController < ApplicationController
    def new
    end

    def index
        @books = Book.all
    end
    
    def show
        @book = Book.find(params[:id])
    end

    def edit
        @book = Book.find(params[:id])
    end

    def update
        @book = Book.find(params[:id])
    
        if @book.update(book_params)
            redirect_to @book
        else
            render 'edit'
        end
    end
      
    def create
        @book = Book.new(params.require(:books).permit(:title,:author,:genre,:price,:published_date))
 
        if @book.save
            redirect_to @book
        else
            render 'new'
        end
    end


    def destroy
        @book = Book.find(params[:id])
        @book.destroy
    
        redirect_to books_path
  end

    private
        def book_params
            params.require(:book).permit(:title,:author,:genre,:price,:published_date)
        end
end
 # title, author, genre, price, published_date