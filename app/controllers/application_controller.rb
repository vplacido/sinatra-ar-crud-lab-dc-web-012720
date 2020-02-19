
require_relative '../../config/environment'
require 'pry'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do 
    
      title = params[:title]
      content = params[:content]
      @article = Article.create(title: title, content: content)
      #  binding.pry
      redirect "/articles/#{@article.id}"
  end

  # put '/articles/:id' do
  #   id = params[:id]
  #   @article = Article.find(id)
  #   redirect "/articles/#{@article.id}"
  # end

  get '/articles/:id' do
    id = params[:id]
    @article = Article.find(id)
    erb :show
  end
end

get '/articles' do
  @articles = Articles.all
  erb :index
end
