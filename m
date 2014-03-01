From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  1 Mar 2014 18:23:01 +0100
Subject: [Buildroot] [lua V3 0/8] lua
Message-ID: <1393694590-29945-1-git-send-email-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

delta V3 vs V1 (remaining)
  - luajit: refactor without dont-strip.patch
    now with 'true' instead of '@:'
  - luajit: handles BR2_PREFER_STATIC_LIB
    new patch
  - luainterpreter: add host variant
    new patch, previously included in the luarocks one
  - ljlinenoise
    split dependencies for comment statement in Config.in
  - lua-iconv
    add missing dependencies in .mk

delta V2 vs V1
  - only a subset for 2014.02
  - add fix for Blackfin FLAT

Francois Perrad (8):
  luajit: refactor without dont-strip.patch
  luajit: refactor without shared-lib.patch
  luajit: handles BR2_PREFER_STATIC_LIB
  luajit: add host variant
  luainterpreter: add host variant
  luarocks: allow to work with host-luainterpreter
  ljlinenoise: new package
  lua-iconv: new package

 package/Config.in                         |    2 ++
 package/ljlinenoise/Config.in             |   16 ++++++++++++++++
 package/ljlinenoise/ljlinenoise.mk        |   13 +++++++++++++
 package/lua-iconv/Config.in               |    8 ++++++++
 package/lua-iconv/lua-iconv.mk            |   14 ++++++++++++++
 package/luainterpreter/luainterpreter.mk  |    4 ++++
 package/luajit/luajit-02-shared-lib.patch |   17 -----------------
 package/luajit/luajit-03-dont-strip.patch |   23 -----------------------
 package/luajit/luajit.mk                  |   18 +++++++++++++++++-
 package/luarocks/luarocks.mk              |   18 ++++++++++++------
 10 files changed, 86 insertions(+), 47 deletions(-)
 create mode 100644 package/ljlinenoise/Config.in
 create mode 100644 package/ljlinenoise/ljlinenoise.mk
 create mode 100644 package/lua-iconv/Config.in
 create mode 100644 package/lua-iconv/lua-iconv.mk
 delete mode 100644 package/luajit/luajit-02-shared-lib.patch
 delete mode 100644 package/luajit/luajit-03-dont-strip.patch

-- 
1.7.9.5
