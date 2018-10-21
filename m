From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 21 Oct 2018 18:32:54 +0200
Subject: [Buildroot] [scanrock 0/5] scanrock
Message-ID: <20181021163259.28335-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This serie introduces `scanrock` which populates BR files for Luarocks
infrastructure.

And now, like with perl modules, I can upgrade easily lua modules.

Francois Perrad (5):
  utils/scanrock: new utility for Luarocks infrastructure
  lua*: regeneration of hash files
  lua*: regeneration of *.mk files
  lua*: regeneration of Config.in
  [RFC] pkg-luarocks: add per package upgrade target

 docs/manual/adding-packages-luarocks.txt      |  12 +
 package/argparse/Config.in                    |   6 +-
 package/argparse/argparse.hash                |   5 +-
 package/argparse/argparse.mk                  |   3 +-
 package/cgilua/Config.in                      |   7 +-
 package/cgilua/cgilua.hash                    |   3 +-
 package/copas/Config.in                       |  12 +-
 package/copas/copas.hash                      |   3 +-
 package/copas/copas.mk                        |   2 +-
 package/coxpcall/Config.in                    |   6 +-
 package/coxpcall/coxpcall.hash                |   3 +-
 package/dado/Config.in                        |   4 +-
 package/dado/dado.hash                        |   3 +-
 package/ljlinenoise/Config.in                 |   7 +-
 package/ljlinenoise/ljlinenoise.hash          |   5 +-
 package/ljsyscall/Config.in                   |   6 +-
 package/lpeg/Config.in                        |   6 +-
 package/lpeg/lpeg.hash                        |   4 +-
 package/lpty/Config.in                        |   4 +-
 package/lpty/lpty.hash                        |   5 +-
 package/lrandom/Config.in                     |   4 +-
 package/lrandom/lrandom.hash                  |   6 +-
 package/lsqlite3/Config.in                    |   3 +-
 package/lsqlite3/lsqlite3.hash                |   4 +-
 package/lsqlite3/lsqlite3.mk                  |   2 +-
 package/lua-basexx/Config.in                  |   4 +-
 package/lua-basexx/lua-basexx.hash            |   3 +-
 package/lua-basexx/lua-basexx.mk              |   4 +-
 package/lua-bit32/Config.in                   |   4 +-
 package/lua-bit32/lua-bit32.hash              |   5 +-
 package/lua-cjson/Config.in                   |  12 +-
 package/lua-cjson/lua-cjson.hash              |   5 +-
 package/lua-coat/lua-coat.hash                |   5 +-
 package/lua-coatpersistent/Config.in          |   7 +-
 .../lua-coatpersistent.hash                   |   7 +-
 package/lua-compat53/lua-compat53.hash        |   3 +-
 package/lua-csnappy/Config.in                 |   3 +-
 package/lua-csnappy/lua-csnappy.hash          |   5 +-
 package/lua-curl/Config.in                    |   4 +-
 package/lua-curl/lua-curl.hash                |   3 +-
 package/lua-datafile/Config.in                |   5 +-
 package/lua-datafile/lua-datafile.hash        |   3 +-
 package/lua-fifo/Config.in                    |   2 +-
 package/lua-fifo/lua-fifo.hash                |   3 +-
 package/lua-fifo/lua-fifo.mk                  |   4 +-
 package/lua-flu/Config.in                     |   5 +-
 package/lua-flu/lua-flu.hash                  |   5 +-
 package/lua-flu/lua-flu.mk                    |   2 +-
 package/lua-http/Config.in                    |  16 +-
 package/lua-http/lua-http.hash                |   3 +-
 package/lua-iconv/Config.in                   |   4 +-
 package/lua-iconv/lua-iconv.hash              |   5 +-
 package/lua-iconv/lua-iconv.mk                |   2 +-
 package/lua-lpeg-patterns/Config.in           |   5 +-
 .../lua-lpeg-patterns/lua-lpeg-patterns.hash  |   3 +-
 package/lua-markdown/Config.in                |   3 +-
 package/lua-markdown/lua-markdown.hash        |   3 +-
 package/lua-markdown/lua-markdown.mk          |   2 +-
 package/lua-messagepack/Config.in             |   4 +-
 package/lua-messagepack/lua-messagepack.hash  |   3 +-
 package/lua-periphery/Config.in               |   4 +-
 package/lua-periphery/lua-periphery.hash      |   5 +-
 package/lua-resty-http/Config.in              |   2 +-
 package/lua-resty-http/lua-resty-http.hash    |   3 +-
 package/lua-sailor/Config.in                  |  20 +-
 package/lua-sailor/lua-sailor.hash            |   3 +-
 package/lua-sailor/lua-sailor.mk              |   2 +-
 package/lua-sdl2/Config.in                    |   6 +-
 package/lua-stdlib/Config.in                  |   7 +-
 package/lua-stdlib/lua-stdlib.hash            |   3 +-
 package/lua-testmore/Config.in                |   2 +-
 package/lua-testmore/lua-testmore.hash        |   5 +-
 package/lua-utf8/Config.in                    |   3 +-
 package/lua-utf8/lua-utf8.hash                |   2 +-
 package/lua-valua/Config.in                   |   5 +-
 package/lua-valua/lua-valua.hash              |   3 +-
 package/luabitop/Config.in                    |   5 +-
 package/luabitop/luabitop.hash                |   4 +-
 package/luacrypto/Config.in                   |   8 +-
 package/luacrypto/luacrypto.hash              |   5 +-
 package/luadbi-sqlite3/Config.in              |   5 +-
 package/luadbi-sqlite3/luadbi-sqlite3.hash    |   3 +-
 package/luadbi-sqlite3/luadbi-sqlite3.mk      |   2 +-
 package/luadbi/Config.in                      |   6 +-
 package/luadbi/luadbi.hash                    |   3 +-
 package/luadbi/luadbi.mk                      |   2 +-
 package/luaexpat/Config.in                    |   5 +-
 package/luaexpat/luaexpat.hash                |   5 +-
 package/luaexpat/luaexpat.mk                  |   2 +-
 package/luafilesystem/Config.in               |   4 +-
 package/luafilesystem/luafilesystem.hash      |   3 +-
 package/luafilesystem/luafilesystem.mk        |   4 +-
 package/luajson/Config.in                     |   6 +-
 package/luajson/luajson.hash                  |   3 +-
 package/lualogging/Config.in                  |   7 +-
 package/lualogging/lualogging.hash            |   5 +-
 package/luaossl/Config.in                     |   9 +-
 package/luaossl/luaossl.hash                  |   3 +-
 package/luaposix/Config.in                    |  10 +-
 package/luasec/Config.in                      |   7 +-
 package/luasec/luasec.hash                    |   5 +-
 package/luasocket/Config.in                   |   6 +-
 package/luasocket/luasocket.hash              |   5 +-
 package/luasql-sqlite3/Config.in              |   5 +-
 package/luasql-sqlite3/luasql-sqlite3.hash    |   5 +-
 package/lunit/Config.in                       |   2 +-
 package/lunit/lunit.hash                      |   5 +-
 package/orbit/Config.in                       |  12 +-
 package/orbit/orbit.hash                      |   2 +-
 package/orbit/orbit.mk                        |   3 +-
 package/pkg-generic.mk                        |   6 +-
 package/pkg-luarocks.mk                       |   8 +
 package/rings/Config.in                       |   5 +-
 package/rings/rings.hash                      |   5 +-
 package/wsapi-fcgi/Config.in                  |  11 +-
 package/wsapi-fcgi/wsapi-fcgi.hash            |   3 +-
 package/wsapi-fcgi/wsapi-fcgi.mk              |   8 +-
 package/wsapi-xavante/Config.in               |  15 +-
 package/wsapi-xavante/wsapi-xavante.hash      |   3 +-
 package/wsapi-xavante/wsapi-xavante.mk        |   6 +-
 package/wsapi/Config.in                       |   9 +-
 package/wsapi/wsapi.hash                      |   5 +-
 package/xavante/Config.in                     |  15 +-
 package/xavante/xavante.hash                  |   3 +-
 utils/rockspec2br.lua                         | 238 ++++++++++++++++++
 utils/scanrock                                | 128 ++++++++++
 126 files changed, 658 insertions(+), 332 deletions(-)
 create mode 100644 utils/rockspec2br.lua
 create mode 100755 utils/scanrock

-- 
2.17.1
