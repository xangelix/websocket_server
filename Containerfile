FROM docker.io/node:lts-alpine

WORKDIR /app

# Copy dependency files first to leverage Docker layer caching
COPY package*.json ./
RUN npm install --production

# Copy the rest of the application
COPY . .

# Set the port for the advanced script to use
ENV PORT=8080
EXPOSE 8080

# Run the advanced server (which falls back to HTTP for Traefik)
CMD ["npm", "run", "start:advanced"]
