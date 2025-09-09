FROM node:18

# Install Python and SQLite3
RUN apt-get update && \
    apt-get install -y python3 python3-pip sqlite3 tesseract-ocr && \
    apt-get clean

WORKDIR /app

# Copy package.json and install dependencies
COPY package.json ./
RUN npm install

# Copy rest of the app
COPY . .

EXPOSE 3000

CMD ["node", "src/index.js"]
