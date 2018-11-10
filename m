From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 10 Nov 2018 15:08:27 +0100
Subject: [Buildroot] [PATCH 0/5] luarocks addon
Message-ID: <20181110140832.9700-1-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This serie introduces a luarocks addon which populates BR files for Luarocks
infrastructure.

And now, like with perl modules, I can upgrade easily lua modules.

Francois Perrad (5):
  luarocks: add buildroot addon
  lua*: regeneration of *.mk files
  lua*: regeneration of Config.in
  lua*: regeneration of hash files
  pkg-luarocks: add per package upgrade target

 docs/manual/adding-packages-luarocks.txt      |   9 +
 package/argparse/argparse.hash                |   5 +-
 package/argparse/argparse.mk                  |   3 +-
 package/cgilua/Config.in                      |   3 +-
 package/cgilua/cgilua.hash                    |   5 +-
 package/copas/Config.in                       |   7 +-
 package/copas/copas.hash                      |   5 +-
 package/copas/copas.mk                        |   2 +-
 package/coxpcall/coxpcall.hash                |   5 +-
 package/dado/dado.hash                        |   5 +-
 package/ljlinenoise/Config.in                 |   4 +-
 package/ljlinenoise/ljlinenoise.hash          |   5 +-
 package/ljsyscall/Config.in                   |   3 +-
 package/lpeg/Config.in                        |   3 +-
 package/lpeg/lpeg.hash                        |   4 +-
 package/lpty/Config.in                        |   1 -
 package/lpty/lpty.hash                        |   5 +-
 package/lrandom/Config.in                     |   1 -
 package/lrandom/lrandom.hash                  |   6 +-
 package/lsqlite3/Config.in                    |   3 +-
 package/lsqlite3/lsqlite3.hash                |   4 +-
 package/lsqlite3/lsqlite3.mk                  |   2 +-
 package/lua-basexx/lua-basexx.hash            |   5 +-
 package/lua-basexx/lua-basexx.mk              |   4 +-
 package/lua-bit32/lua-bit32.hash              |   5 +-
 package/lua-cjson/Config.in                   |   1 -
 package/lua-cjson/lua-cjson.hash              |   5 +-
 package/lua-coat/Config.in                    |   2 +-
 package/lua-coat/lua-coat.hash                |   5 +-
 package/lua-coatpersistent/Config.in          |   5 +-
 .../lua-coatpersistent.hash                   |   7 +-
 package/lua-compat53/Config.in                |   2 +-
 package/lua-compat53/lua-compat53.hash        |   5 +-
 package/lua-csnappy/lua-csnappy.hash          |   5 +-
 package/lua-curl/lua-curl.hash                |   5 +-
 package/lua-datafile/lua-datafile.hash        |   5 +-
 package/lua-fifo/lua-fifo.hash                |   5 +-
 package/lua-fifo/lua-fifo.mk                  |   4 +-
 package/lua-flu/lua-flu.hash                  |   5 +-
 package/lua-flu/lua-flu.mk                    |   2 +-
 package/lua-http/Config.in                    |  18 +-
 package/lua-http/lua-http.hash                |   5 +-
 package/lua-iconv/lua-iconv.hash              |   5 +-
 package/lua-lpeg-patterns/Config.in           |   3 +-
 .../lua-lpeg-patterns/lua-lpeg-patterns.hash  |   5 +-
 package/lua-markdown/lua-markdown.hash        |   5 +-
 package/lua-markdown/lua-markdown.mk          |   2 +-
 package/lua-messagepack/lua-messagepack.hash  |   6 +-
 package/lua-periphery/Config.in               |   1 -
 package/lua-periphery/lua-periphery.hash      |   5 +-
 package/lua-resty-http/lua-resty-http.hash    |   5 +-
 package/lua-sailor/Config.in                  |  15 +-
 package/lua-sailor/lua-sailor.hash            |   5 +-
 package/lua-sailor/lua-sailor.mk              |   2 +-
 package/lua-stdlib/lua-stdlib.hash            |   5 +-
 package/lua-testmore/lua-testmore.hash        |   5 +-
 package/lua-utf8/lua-utf8.hash                |   4 +-
 package/lua-valua/lua-valua.hash              |   5 +-
 package/luabitop/luabitop.hash                |   4 +-
 package/luacrypto/Config.in                   |   2 +-
 package/luacrypto/luacrypto.hash              |   5 +-
 package/luadbi-sqlite3/Config.in              |   2 +-
 package/luadbi-sqlite3/luadbi-sqlite3.hash    |   5 +-
 package/luadbi-sqlite3/luadbi-sqlite3.mk      |   2 +-
 package/luadbi/luadbi.hash                    |   5 +-
 package/luadbi/luadbi.mk                      |   2 +-
 package/luaexpat/Config.in                    |   3 +-
 package/luaexpat/luaexpat.hash                |   5 +-
 package/luaexpat/luaexpat.mk                  |   2 +-
 package/luafilesystem/Config.in               |   1 -
 package/luafilesystem/luafilesystem.hash      |   5 +-
 package/luafilesystem/luafilesystem.mk        |   4 +-
 package/luajson/Config.in                     |   3 +-
 package/luajson/luajson.hash                  |   5 +-
 package/lualogging/Config.in                  |   2 +-
 package/lualogging/lualogging.hash            |   5 +-
 package/luaossl/luaossl.hash                  |   5 +-
 package/luaposix/Config.in                    |   2 +-
 package/luarocks/0002-Buildroot-addon.patch   | 348 ++++++++++++++++++
 package/luasec/Config.in                      |   3 +-
 package/luasec/luasec.hash                    |   5 +-
 package/luasocket/Config.in                   |   1 -
 package/luasocket/luasocket.hash              |   5 +-
 package/luasql-sqlite3/Config.in              |   1 -
 package/luasql-sqlite3/luasql-sqlite3.hash    |   5 +-
 package/lunit/lunit.hash                      |   5 +-
 package/orbit/Config.in                       |   7 +-
 package/orbit/orbit.hash                      |   6 +-
 package/orbit/orbit.mk                        |   7 +-
 package/pkg-luarocks.mk                       |   6 +
 package/rings/Config.in                       |   1 -
 package/rings/rings.hash                      |   5 +-
 package/wsapi-fcgi/Config.in                  |   7 +-
 package/wsapi-fcgi/wsapi-fcgi.hash            |   6 +-
 package/wsapi-fcgi/wsapi-fcgi.mk              |  12 +-
 package/wsapi-xavante/Config.in               |  11 +-
 package/wsapi-xavante/wsapi-xavante.hash      |   6 +-
 package/wsapi-xavante/wsapi-xavante.mk        |  10 +-
 package/wsapi/Config.in                       |   7 +-
 package/wsapi/wsapi.hash                      |   6 +-
 package/wsapi/wsapi.mk                        |   4 +-
 package/xavante/Config.in                     |   9 +-
 package/xavante/xavante.hash                  |   5 +-
 103 files changed, 608 insertions(+), 217 deletions(-)
 create mode 100644 package/luarocks/0002-Buildroot-addon.patch

-- 
2.17.1
