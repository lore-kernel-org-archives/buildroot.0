From: Francois Perrad <fperrad@gmail.com>
Date: Sat, 11 Jan 2014 16:42:02 +0100
Subject: [Buildroot] [pkg-luarocks infra v7 00/15] a package infrastructure
	for Lua modules
Message-ID: <1389454937-13494-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Changes v6 -> v7:
  - luarocks 2.1.2 which requires no patch
  - bump and convert more Lua modules

Francois Perrad (15):
  luainterpreter: create virtual package
  luajit: allow to build Lua extensions without lua
  lua*: restore version in module paths
  luarocks: new package
  luarocks: new infrastructure
  lua-cjson: restore official name
  luasql-sqlite3: renamed like with LuaRocks
  lua*: refactor with luarocks infrastructure
  manual: adding packages luarocks
  luasocket: bump to version 3.0-rc1
  coxpcall: bump to version 1.14.0
  copas: bump to version 1.2.1
  rings: bump to version 1.3.0
  wsapi: bump to version 1.6
  xavante: bump to version 2.3.0

 Config.in                                          |    8 ++
 Config.in.legacy                                   |   14 +++
 Makefile                                           |    1 +
 docs/manual/adding-packages-luarocks.txt           |   93 ++++++++++++++++++++
 docs/manual/adding-packages.txt                    |    2 +
 package/Config.in                                  |    7 +-
 package/Makefile.in                                |    1 +
 package/cgilua/cgilua.mk                           |    9 +-
 package/copas/copas.mk                             |   11 +--
 package/coxpcall/coxpcall.mk                       |   11 +--
 package/lbase64/Config.in                          |    1 +
 package/lbase64/lbase64.mk                         |   20 +----
 package/{luacjson => lua-cjson}/Config.in          |    5 +-
 package/lua-cjson/lua-cjson.mk                     |   12 +++
 package/lua-ev/Config.in                           |    1 +
 package/lua-ev/lua-ev.mk                           |    4 +-
 package/lua-msgpack-native/Config.in               |    1 +
 package/lua-msgpack-native/lua-msgpack-native.mk   |    4 +-
 package/lua/Config.in                              |    4 +
 package/lua/lua-01-root-path.patch                 |   21 +----
 package/luabitop/luabitop.mk                       |   20 ++---
 package/luacjson/luacjson.mk                       |   27 ------
 package/luaexpat/Config.in                         |    1 +
 package/luaexpat/luaexpat.mk                       |   27 +-----
 package/luaexpatutils/luaexpatutils.mk             |    2 +-
 package/luafilesystem/Config.in                    |    1 +
 .../luafilesystem-without_large_file.patch         |    8 +-
 package/luafilesystem/luafilesystem.mk             |   18 +---
 package/luainterpreter/Config.in                   |    6 ++
 package/luainterpreter/luainterpreter.mk           |   10 +++
 package/luajit/Config.in                           |    8 ++
 package/luajit/luajit-01-root-path.patch           |   22 -----
 package/luajit/luajit-05-install-inc.patch         |   17 ++++
 package/luaposix/Config.in                         |    1 +
 package/luaposix/luaposix.mk                       |    4 +-
 package/luarocks/luarocks.mk                       |   45 ++++++++++
 package/luasec/Config.in                           |    1 +
 package/luasec/luasec.mk                           |   25 ++----
 package/luasocket/Config.in                        |    1 +
 package/luasocket/luasocket.mk                     |   21 +----
 package/luasql-sqlite3/Config.in                   |    9 ++
 package/luasql-sqlite3/luasql-sqlite3.mk           |   13 +++
 package/luasql/Config.in                           |   21 -----
 package/luasql/luasql.mk                           |   35 --------
 package/orbit/orbit-01-fix-installation.patch      |   26 ------
 package/orbit/orbit.mk                             |   16 ++--
 package/pkg-luarocks.mk                            |   82 +++++++++++++++++
 package/rings/Config.in                            |    1 +
 package/rings/rings.mk                             |   16 +---
 package/wsapi/wsapi.mk                             |   11 +--
 package/xavante/xavante.mk                         |   11 +--
 51 files changed, 401 insertions(+), 335 deletions(-)
 create mode 100644 docs/manual/adding-packages-luarocks.txt
 rename package/{luacjson => lua-cjson}/Config.in (82%)
 create mode 100644 package/lua-cjson/lua-cjson.mk
 delete mode 100644 package/luacjson/luacjson.mk
 create mode 100644 package/luainterpreter/Config.in
 create mode 100644 package/luainterpreter/luainterpreter.mk
 delete mode 100644 package/luajit/luajit-01-root-path.patch
 create mode 100644 package/luajit/luajit-05-install-inc.patch
 create mode 100644 package/luarocks/luarocks.mk
 create mode 100644 package/luasql-sqlite3/Config.in
 create mode 100644 package/luasql-sqlite3/luasql-sqlite3.mk
 delete mode 100644 package/luasql/Config.in
 delete mode 100644 package/luasql/luasql.mk
 delete mode 100644 package/orbit/orbit-01-fix-installation.patch
 create mode 100644 package/pkg-luarocks.mk

-- 
1.7.9.5
