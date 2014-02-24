From: Francois Perrad <fperrad@gmail.com>
Date: Mon, 24 Feb 2014 08:34:36 +0100
Subject: [Buildroot] =?utf-8?q?=5BPATCH_00/24=5D_lua?=
Message-ID: <1393227301-14874-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

patches 1/24 & 2/24 are a split of this one http://patchwork.ozlabs.org/patch/314145/
which was a first step for fixing lua on bfin.
patch 3/24 fixes a issue with scripts of cgilua (not visible on autobuilder).
so these 3 patches are good candidate for 2014.02.

patches 4/24 to 7/24 allow luarocks to use host-luajit when luajit is used on target.

patches 8/24 to 24/24 are new packages, all are Lua modules.

Fran?ois

Francois Perrad (24):
  lua: remove LUA_INSTALLED_FILES
  lua: refactor install steps
  luarocks: never wraps script
  luajit: refactor without dont-strip.patch
  luajit: refactor without shared-lib.patch
  luajit: add host-luajit
  luarocks: allow to work with host-luajit
  ljlinenoise: new package
  lpeg: new package
  cosmo: new package
  lua-iconv: new package
  luajson: new package
  lualogging: new package
  dado: new package
  lrandom: new package
  lua-testmore: new package
  lua-coat: new package
  lua-coatpersistent: new package
  lua-messagepack: new package
  lua-csnappy: new package
  lzlib: new package
  lunit: new package
  lpty: new package
  lsqlite3: new package

 package/Config.in                                  |   17 ++++++++
 package/cosmo/Config.in                            |    7 ++++
 package/cosmo/cosmo.mk                             |   10 +++++
 package/dado/Config.in                             |    6 +++
 package/dado/dado.mk                               |   10 +++++
 package/ljlinenoise/Config.in                      |   15 +++++++
 package/ljlinenoise/ljlinenoise.mk                 |   13 +++++++
 package/lpeg/Config.in                             |    8 ++++
 package/lpeg/lpeg.mk                               |   10 +++++
 package/lpty/Config.in                             |    7 ++++
 package/lpty/lpty.mk                               |   13 +++++++
 package/lrandom/Config.in                          |    8 ++++
 package/lrandom/lrandom.mk                         |   15 +++++++
 package/lsqlite3/Config.in                         |    8 ++++
 package/lsqlite3/lsqlite3.mk                       |   12 ++++++
 package/lua-coat/Config.in                         |    6 +++
 package/lua-coat/lua-coat.mk                       |   13 +++++++
 package/lua-coatpersistent/Config.in               |    8 ++++
 package/lua-coatpersistent/lua-coatpersistent.mk   |   13 +++++++
 package/lua-csnappy/Config.in                      |    8 ++++
 package/lua-csnappy/lua-csnappy.mk                 |   13 +++++++
 package/lua-iconv/Config.in                        |    9 +++++
 package/lua-iconv/lua-iconv.mk                     |   13 +++++++
 package/lua-messagepack/Config.in                  |    7 ++++
 package/lua-messagepack/lua-messagepack.mk         |   13 +++++++
 package/lua-testmore/Config.in                     |    6 +++
 package/lua-testmore/lua-testmore.mk               |   13 +++++++
 package/lua/5.1.5/lua-02-shared-libs-for-lua.patch |   22 +++++++++++
 package/lua/5.2.3/lua-02-shared-libs-for-lua.patch |   22 +++++++++++
 package/lua/lua.mk                                 |   41 ++------------------
 package/luainterpreter/luainterpreter.mk           |    4 ++
 package/luajit/luajit-02-shared-lib.patch          |   17 --------
 package/luajit/luajit-03-dont-strip.patch          |   23 -----------
 package/luajit/luajit.mk                           |   12 +++++-
 package/luajson/Config.in                          |    8 ++++
 package/luajson/luajson.mk                         |   13 +++++++
 package/lualogging/Config.in                       |    9 +++++
 package/lualogging/lualogging.mk                   |   13 +++++++
 package/luarocks/luarocks.mk                       |   19 ++++++---
 package/lunit/Config.in                            |   10 +++++
 package/lunit/lunit.mk                             |   13 +++++++
 package/lzlib/Config.in                            |    9 +++++
 package/lzlib/lzlib.mk                             |   12 ++++++
 43 files changed, 443 insertions(+), 85 deletions(-)
 create mode 100644 package/cosmo/Config.in
 create mode 100644 package/cosmo/cosmo.mk
 create mode 100644 package/dado/Config.in
 create mode 100644 package/dado/dado.mk
 create mode 100644 package/ljlinenoise/Config.in
 create mode 100644 package/ljlinenoise/ljlinenoise.mk
 create mode 100644 package/lpeg/Config.in
 create mode 100644 package/lpeg/lpeg.mk
 create mode 100644 package/lpty/Config.in
 create mode 100644 package/lpty/lpty.mk
 create mode 100644 package/lrandom/Config.in
 create mode 100644 package/lrandom/lrandom.mk
 create mode 100644 package/lsqlite3/Config.in
 create mode 100644 package/lsqlite3/lsqlite3.mk
 create mode 100644 package/lua-coat/Config.in
 create mode 100644 package/lua-coat/lua-coat.mk
 create mode 100644 package/lua-coatpersistent/Config.in
 create mode 100644 package/lua-coatpersistent/lua-coatpersistent.mk
 create mode 100644 package/lua-csnappy/Config.in
 create mode 100644 package/lua-csnappy/lua-csnappy.mk
 create mode 100644 package/lua-iconv/Config.in
 create mode 100644 package/lua-iconv/lua-iconv.mk
 create mode 100644 package/lua-messagepack/Config.in
 create mode 100644 package/lua-messagepack/lua-messagepack.mk
 create mode 100644 package/lua-testmore/Config.in
 create mode 100644 package/lua-testmore/lua-testmore.mk
 delete mode 100644 package/luajit/luajit-02-shared-lib.patch
 delete mode 100644 package/luajit/luajit-03-dont-strip.patch
 create mode 100644 package/luajson/Config.in
 create mode 100644 package/luajson/luajson.mk
 create mode 100644 package/lualogging/Config.in
 create mode 100644 package/lualogging/lualogging.mk
 create mode 100644 package/lunit/Config.in
 create mode 100644 package/lunit/lunit.mk
 create mode 100644 package/lzlib/Config.in
 create mode 100644 package/lzlib/lzlib.mk

-- 
1.7.9.5
