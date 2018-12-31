From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 31 Dec 2018 17:50:01 +0100
Subject: [Buildroot] [PATCH v2 1/2] package/lua*: drop redundant
 dependencies on BR2_PACKAGE_HAS_LUAINTERPRETER
In-Reply-To: <20181231165003.18574-1-thomas.petazzoni@bootlin.com>
References: <20181231165003.18574-1-thomas.petazzoni@bootlin.com>
Message-ID: <20181231165003.18574-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

All the packages modified by this commit have their Config.in included
by package/Config.in inside a BR2_PACKAGE_HAS_LUAINTERPRETER &&
!BR2_STATIC_LIBS condition. Therefore, duplicating the
BR2_PACKAGE_HAS_LUAINTERPRETER condition in each of their Config.in
file is redundant and unnecessary. This commit drops such redundant
"depends on" statements.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/lbase64/Config.in            | 1 -
 package/lua-ev/Config.in             | 1 -
 package/lua-msgpack-native/Config.in | 1 -
 package/luaposix/Config.in           | 1 -
 package/lutok/Config.in              | 1 -
 5 files changed, 5 deletions(-)

diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
index 34ef943aac..c836ffb5e2 100644
--- a/package/lbase64/Config.in
+++ b/package/lbase64/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LBASE64
 	bool "lbase64"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  A base64 library for Lua
 
diff --git a/package/lua-ev/Config.in b/package/lua-ev/Config.in
index 52f82e1128..1e89c270a0 100644
--- a/package/lua-ev/Config.in
+++ b/package/lua-ev/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUA_EV
 	bool "lua-ev"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_LIBEV
 	help
 	  Get access to the libev library from Lua.
diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
index 3837228fa0..8b6283cc95 100644
--- a/package/lua-msgpack-native/Config.in
+++ b/package/lua-msgpack-native/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUA_MSGPACK_NATIVE
 	bool "lua-msgpack-native"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on BR2_PACKAGE_LUA_5_1 || BR2_PACKAGE_LUAJIT
 	help
 	  This is a native, C language implementation of msgpack
diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index d8c30e4fb2..bdc9926b1e 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_LUA_STD_NORMALIZE # runtime
 	# "bit32" is included in Lua 5.2+. luajit has an equivalent
 	# "bit" module, but since it has a different name, luaposix
diff --git a/package/lutok/Config.in b/package/lutok/Config.in
index ab9c32b6d5..abeaa4011d 100644
--- a/package/lutok/Config.in
+++ b/package/lutok/Config.in
@@ -9,4 +9,3 @@ config BR2_PACKAGE_LUTOK
 
 comment "lutok needs a toolchain w/ C++ and full Lua"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
-- 
2.20.1
