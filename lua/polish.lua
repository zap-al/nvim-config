--  if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
vim.filetype.add {
  extension = {
    foo = "fooscript",
  },
  filename = {
    ["Foofile"] = "fooscript",
  },
  pattern = {
    ["~/%.config/foo/.*"] = "fooscript",
  },
}

local hover = require "hover"

hover.setup {
  init = function()
    require "hover.providers.lsp"
    require "hover.providers.gh"
    require "hover.providers.man"
    require "hover.providers.dictionary"
  end,
  preview_opts = {
    border = "rounded",
  },
  title = true,
}

-- Бинды для Hover
vim.keymap.set("n", "K", hover.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "gK", hover.hover_select, { desc = "Hover Documentation (select)" })

vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next Buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprev<CR>", { desc = "Previous Buffer" })
