From: Francois Perrad <fperrad@gmail.com>
Date: Tue, 14 Jan 2014 14:14:55 +0100
Subject: [Buildroot] [PATCH 0/3] choice between Lua 5.1.x & 5.2.x
Message-ID: <1389705298-27263-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Lua 5.1 and 5.2 could be handled in the same package.
Currently, some modules are written only for Lua 5.1 and are not yet compatible with Lua 5.2
(Note: LuaJIT is binary compatible with Lua 5.1)

See discussion in http://lists.busybox.net/pipermail/buildroot/2013-October/079211.html

Francois Perrad (3):
  lua: choice between 5.1.x & 5.2.x
  lua: add official patches
  lua-modules: choice between Lua 5.1.x & Lua 5.2.x

 package/lbase64/Config.in                          |    4 ++
 package/lua-ev/lua-ev.mk                           |    2 +-
 package/lua-msgpack-native/Config.in               |    4 ++
 package/lua-msgpack-native/lua-msgpack-native.mk   |    3 +-
 package/lua/{ => 5.1.5}/lua-01-root-path.patch     |    0
 .../{ => 5.1.5}/lua-02-shared-libs-for-lua.patch   |    0
 package/lua/{ => 5.1.5}/lua-11-linenoise.patch     |    0
 package/lua/5.1.5/lua-bug2.patch                   |   46 ++++++++++++++++++
 package/lua/5.2.3/lua-01-root-path.patch           |   17 +++++++
 package/lua/5.2.3/lua-02-shared-libs-for-lua.patch |   49 ++++++++++++++++++++
 package/lua/5.2.3/lua-04-lua-pc.patch              |   40 ++++++++++++++++
 package/lua/5.2.3/lua-11-linenoise.patch           |   26 +++++++++++
 package/lua/Config.in                              |   14 ++++++
 package/lua/lua.mk                                 |   18 ++++++-
 package/luaexpat/Config.in                         |    4 ++
 package/luaexpatutils/Config.in                    |    4 ++
 package/luaexpatutils/luaexpatutils.mk             |    2 +-
 package/luainterpreter/Config.in                   |   10 ++++
 package/luaposix/Config.in                         |    2 +-
 package/luaposix/luaposix.mk                       |    2 +-
 package/luarocks/luarocks.mk                       |    4 +-
 package/luasec/Config.in                           |    4 ++
 22 files changed, 246 insertions(+), 9 deletions(-)
 rename package/lua/{ => 5.1.5}/lua-01-root-path.patch (100%)
 rename package/lua/{ => 5.1.5}/lua-02-shared-libs-for-lua.patch (100%)
 rename package/lua/{ => 5.1.5}/lua-11-linenoise.patch (100%)
 create mode 100644 package/lua/5.1.5/lua-bug2.patch
 create mode 100644 package/lua/5.2.3/lua-01-root-path.patch
 create mode 100644 package/lua/5.2.3/lua-02-shared-libs-for-lua.patch
 create mode 100644 package/lua/5.2.3/lua-04-lua-pc.patch
 create mode 100644 package/lua/5.2.3/lua-11-linenoise.patch

-- 
1.7.9.5
