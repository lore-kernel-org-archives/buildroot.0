From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun,  5 Jan 2014 16:48:04 +0100
Subject: [Buildroot] [PATCH 6/9] lua-cjson: restore official name
In-Reply-To: <cover.1388936665.git.yann.morin.1998@free.fr>
References: <cover.1388936665.git.yann.morin.1998@free.fr>
Message-ID: <68c274b976501bffd84c43c1d90d2e909fd9d2a9.1388936665.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Francois Perrad <fperrad@gmail.com>

(need by LuaRocks)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 Config.in.legacy                                        |  7 +++++++
 package/Config.in                                       |  2 +-
 package/{luacjson => lua-cjson}/Config.in               |  4 ++--
 .../{luacjson/luacjson.mk => lua-cjson/lua-cjson.mk}    | 17 ++++++++---------
 4 files changed, 18 insertions(+), 12 deletions(-)
 rename package/{luacjson => lua-cjson}/Config.in (90%)
 rename package/{luacjson/luacjson.mk => lua-cjson/lua-cjson.mk} (56%)

diff --git a/Config.in.legacy b/Config.in.legacy
index c75e25e..ce05177 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -118,6 +118,13 @@ config BR2_PACKAGE_NETKITTELNET
 	  been deprecated since 2012.11. 'busybox' provides a telnet
 	  client and should be used instead.
 
+config BR2_PACKAGE_LUACJSON
+	bool "luacjson has been replaced by lua-cjson"
+	select BR2_PACKAGE_LUA_CJSON
+	select BR2_LEGACY
+	help
+	  The option has been renamed BR2_PACKAGE_LUA_CJSON.
+
 ###############################################################################
 comment "Legacy options removed in 2013.11"
 
diff --git a/package/Config.in b/package/Config.in
index 66fd800..77f362f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -363,10 +363,10 @@ source "package/cgilua/Config.in"
 source "package/copas/Config.in"
 source "package/coxpcall/Config.in"
 source "package/lbase64/Config.in"
+source "package/lua-cjson/Config.in"
 source "package/lua-ev/Config.in"
 source "package/lua-msgpack-native/Config.in"
 source "package/luabitop/Config.in"
-source "package/luacjson/Config.in"
 source "package/luacrypto/Config.in"
 source "package/luaexpat/Config.in"
 source "package/luaexpatutils/Config.in"
diff --git a/package/luacjson/Config.in b/package/lua-cjson/Config.in
similarity index 90%
rename from package/luacjson/Config.in
rename to package/lua-cjson/Config.in
index d3665c0..8129fab 100644
--- a/package/luacjson/Config.in
+++ b/package/lua-cjson/Config.in
@@ -1,5 +1,5 @@
-config BR2_PACKAGE_LUACJSON
-	bool "luacjson"
+config BR2_PACKAGE_LUA_CJSON
+	bool "lua-cjson"
 	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
 	help
 	  The Lua CJSON module provides JSON support for Lua. It features:
diff --git a/package/luacjson/luacjson.mk b/package/lua-cjson/lua-cjson.mk
similarity index 56%
rename from package/luacjson/luacjson.mk
rename to package/lua-cjson/lua-cjson.mk
index 86be875..92af23f 100644
--- a/package/luacjson/luacjson.mk
+++ b/package/lua-cjson/lua-cjson.mk
@@ -1,17 +1,16 @@
 ################################################################################
 #
-# luacjson
+# lua-cjson
 #
 ################################################################################
 
-LUACJSON_VERSION       = 2.1.0
-LUACJSON_SOURCE        = lua-cjson-$(LUACJSON_VERSION).tar.gz
-LUACJSON_SITE          = http://www.kyne.com.au/~mark/software/download
-LUACJSON_DEPENDENCIES  = luainterpreter
-LUACJSON_LICENSE       = MIT
-LUACJSON_LICENSE_FILES = LICENSE
+LUA_CJSON_VERSION       = 2.1.0
+LUA_CJSON_SITE          = http://www.kyne.com.au/~mark/software/download
+LUA_CJSON_DEPENDENCIES  = luainterpreter
+LUA_CJSON_LICENSE       = MIT
+LUA_CJSON_LICENSE_FILES = LICENSE
 
-define LUACJSON_BUILD_CMDS
+define LUA_CJSON_BUILD_CMDS
 	$(MAKE) -C $(@D) \
 		CFLAGS="$(TARGET_CFLAGS)"   \
 		LDFLAGS="$(TARGET_LDFLAGS)" \
@@ -20,7 +19,7 @@ define LUACJSON_BUILD_CMDS
 		PREFIX=$(STAGING_DIR)/usr
 endef
 
-define LUACJSON_INSTALL_TARGET_CMDS
+define LUA_CJSON_INSTALL_TARGET_CMDS
 	$(MAKE) DESTDIR="$(TARGET_DIR)" PREFIX="/usr" -C $(@D) install
 endef
 
-- 
1.8.1.2
