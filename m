From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Sep 2020 10:21:35 +0200
Subject: [Buildroot] [PATCH 1/1] package/lua-gd: bump version
Message-ID: <20200920082135.670074-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to latest master to get latest commit and drop gdlib-config which
is not available on latest gd:
https://github.com/ittner/lua-gd/commit/2ce8e478a8591afd71e607506bc8c64b161bbd30

gd has a pkg-config file since version 2.1.0 and
https://github.com/libgd/libgd/commit/071a2a94ee9f9e5ce00ff689dfe67a0fcb885ad6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/lua-gd/lua-gd.hash | 2 +-
 package/lua-gd/lua-gd.mk   | 5 ++---
 2 files changed, 3 insertions(+), 4 deletions(-)

diff --git a/package/lua-gd/lua-gd.hash b/package/lua-gd/lua-gd.hash
index d1bab37bc1..512573b474 100644
--- a/package/lua-gd/lua-gd.hash
+++ b/package/lua-gd/lua-gd.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  114f273a64da6ccbf6e0555757b952f84ab8c134416dd7aae1aeb666ca0e964d  lua-gd-e60b13b7977bb3424d7044976ccba5d42c256934.tar.gz
+sha256  928fa036b37595d773db1999c9ff43195c4290f0722298fa5b0c3e619c678525  lua-gd-2ce8e478a8591afd71e607506bc8c64b161bbd30.tar.gz
 sha256  b0ca41d88ddb0ca785436d37b08b8f413055755eb6bfd3ea0a6ff3214303aa43  COPYING
diff --git a/package/lua-gd/lua-gd.mk b/package/lua-gd/lua-gd.mk
index e9a51a1677..38e064b77e 100644
--- a/package/lua-gd/lua-gd.mk
+++ b/package/lua-gd/lua-gd.mk
@@ -4,17 +4,16 @@
 #
 ################################################################################
 
-LUA_GD_VERSION = e60b13b7977bb3424d7044976ccba5d42c256934
+LUA_GD_VERSION = 2ce8e478a8591afd71e607506bc8c64b161bbd30
 LUA_GD_SITE = $(call github,ittner,lua-gd,$(LUA_GD_VERSION))
 LUA_GD_LICENSE = MIT
 LUA_GD_LICENSE_FILES = COPYING
-LUA_GD_DEPENDENCIES = luainterpreter gd
+LUA_GD_DEPENDENCIES = host-pkgconf luainterpreter gd
 
 # VERSION follows the scheme described on https://ittner.github.io/lua-gd/manual.html#intro,
 # the current version of the binding is 3.
 define LUA_GD_BUILD_CMDS
 	$(MAKE) -C $(@D) gd.so \
-		GDLIBCONFIG="$(STAGING_DIR)/usr/bin/gdlib-config" \
 		CC=$(TARGET_CC) \
 		CFLAGS="$(TARGET_CFLAGS) -fPIC -DVERSION=\\\"$(GD_VERSION)r3\\\"" \
 		LFLAGS="-shared -lgd"
-- 
2.28.0
