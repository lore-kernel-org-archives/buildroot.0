From: Francois Perrad <fperrad@gmail.com>
Date: Thu, 31 Oct 2013 11:16:07 +0100
Subject: [Buildroot] [pkg-luarocks infra 0/5] a package infrastructure for
	Lua modules
Message-ID: <1383214572-8216-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

LuaRocks is a deployment and management system for Lua modules.
(see http://luarocks.org/)

I write a package infrastructure with it.
luarocks is used by 3 steps :
 - download
 - extract
 - target build/install

This current implementation needs 2 small patches for LuaRocks, and works only with pure Lua modules.
I plan future works for :
 - split build & install step
 - support of native modules (C cross-compilation)
but I think that they need more intrusive changes in LuaRock.

So, I think what community feedback are wellcome at this stage.

Francois Perrad (5):
  lua*: restore version in module paths
  lua: remove too invasive patch
  luarocks: new package
  add luarocks infrastructure
  refactor with luarocks infrastructure

 Makefile                                         |    1 +
 package/Makefile.in                              |    1 +
 package/cgilua/cgilua.mk                         |   15 +---
 package/copas/copas.mk                           |   15 +---
 package/coxpcall/coxpcall.mk                     |    4 +-
 package/lbase64/lbase64.mk                       |    4 +-
 package/lua-ev/lua-ev.mk                         |    2 +-
 package/lua-msgpack-native/lua-msgpack-native.mk |    4 +-
 package/lua/lua-01-root-path.patch               |   21 +----
 package/lua/lua-03-shared-libs-for-luac.patch    |   97 ----------------------
 package/luabitop/luabitop.mk                     |    5 +-
 package/luacjson/luacjson.mk                     |    4 +-
 package/luaexpat/luaexpat.mk                     |   10 +--
 package/luaexpatutils/luaexpatutils.mk           |    4 +-
 package/luafilesystem/luafilesystem.mk           |    4 +-
 package/luajit/luajit-01-root-path.patch         |   22 -----
 package/luaposix/luaposix.mk                     |    2 +-
 package/luarocks/luarocks-build-minimal.patch    |   17 ++++
 package/luarocks/luarocks-unpack.patch           |   24 ++++++
 package/luarocks/luarocks.mk                     |   29 +++++++
 package/luasec/luasec.mk                         |   12 ++-
 package/luasocket/luasocket.mk                   |   16 ++--
 package/luasql/luasql.mk                         |    7 +-
 package/orbit/orbit-01-fix-installation.patch    |   26 ------
 package/orbit/orbit.mk                           |   13 +--
 package/pkg-luarocks.mk                          |   76 +++++++++++++++++
 package/rings/rings.mk                           |    7 +-
 package/wsapi/wsapi.mk                           |   16 +---
 package/xavante/xavante.mk                       |   18 +---
 29 files changed, 207 insertions(+), 269 deletions(-)
 delete mode 100644 package/lua/lua-03-shared-libs-for-luac.patch
 delete mode 100644 package/luajit/luajit-01-root-path.patch
 create mode 100644 package/luarocks/luarocks-build-minimal.patch
 create mode 100644 package/luarocks/luarocks-unpack.patch
 create mode 100644 package/luarocks/luarocks.mk
 delete mode 100644 package/orbit/orbit-01-fix-installation.patch
 create mode 100644 package/pkg-luarocks.mk

-- 
1.7.9.5
