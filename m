From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 15:15:11 +0100
Subject: [Buildroot] [PATCH 1/2] package/lua*: drop redundant dependencies
 on BR2_PACKAGE_HAS_LUAINTERPRETER
Message-ID: <20181230141512.12222-1-thomas.petazzoni@bootlin.com>
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
 package/lpeg/Config.in               | 1 -
 package/lpty/Config.in               | 1 -
 package/lrandom/Config.in            | 1 -
 package/lsqlite3/Config.in           | 1 -
 package/lua-cjson/Config.in          | 1 -
 package/lua-ev/Config.in             | 1 -
 package/lua-msgpack-native/Config.in | 1 -
 package/lua-periphery/Config.in      | 1 -
 package/luaexpat/Config.in           | 1 -
 package/luafilesystem/Config.in      | 1 -
 package/luaposix/Config.in           | 1 -
 package/luasec/Config.in             | 1 -
 package/luasocket/Config.in          | 1 -
 package/luasql-sqlite3/Config.in     | 1 -
 package/lutok/Config.in              | 1 -
 package/rings/Config.in              | 1 -
 17 files changed, 17 deletions(-)

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
 
diff --git a/package/lpeg/Config.in b/package/lpeg/Config.in
index 957991d416..5cdf4e5966 100644
--- a/package/lpeg/Config.in
+++ b/package/lpeg/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LPEG
 	bool "lpeg"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LPeg is a new pattern-matching library for Lua,
 	  based on Parsing Expression Grammars (PEGs).
diff --git a/package/lpty/Config.in b/package/lpty/Config.in
index 50cbd2548a..ee2d4c20b4 100644
--- a/package/lpty/Config.in
+++ b/package/lpty/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LPTY
 	bool "lpty"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  A simple facility for lua to control other programs via
 	  PTYs.
diff --git a/package/lrandom/Config.in b/package/lrandom/Config.in
index 64bcf0ce01..a8a0a837a5 100644
--- a/package/lrandom/Config.in
+++ b/package/lrandom/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LRANDOM
 	bool "lrandom"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  A library for generating random numbers
 	  based on the Mersenne Twister
diff --git a/package/lsqlite3/Config.in b/package/lsqlite3/Config.in
index 223fb59c91..8af091c5e7 100644
--- a/package/lsqlite3/Config.in
+++ b/package/lsqlite3/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LSQLITE3
 	bool "lsqlite3"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_SQLITE
 	help
 	  a thin Lua wrapper for the SQLite3 library.
diff --git a/package/lua-cjson/Config.in b/package/lua-cjson/Config.in
index 262452a827..9474b3176c 100644
--- a/package/lua-cjson/Config.in
+++ b/package/lua-cjson/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUA_CJSON
 	bool "lua-cjson"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  The Lua CJSON module provides JSON support for Lua.
 	  It features:
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
diff --git a/package/lua-periphery/Config.in b/package/lua-periphery/Config.in
index de5a71633c..e40abd712f 100644
--- a/package/lua-periphery/Config.in
+++ b/package/lua-periphery/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUA_PERIPHERY
 	bool "lua-periphery"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  A library for GPIO, SPI, I2C, MMIO, and Serial peripheral I/O
 	  interface access in userspace Linux with Lua.
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index 7139e8c6da..186c5c917b 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_EXPAT
 	help
 	  LuaExpat is a SAX XML parser based on the Expat library.
diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
index 50e7975b92..7c130f8d3b 100644
--- a/package/luafilesystem/Config.in
+++ b/package/luafilesystem/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUAFILESYSTEM
 	bool "luafilesystem"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaFileSystem offers a portable way to access
 	  the underlying directory structure and file attributes.
diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index 91abcb9e32..fc223e169e 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	# "bit32" is included in Lua 5.2+. luajit has an equivalent
 	# "bit" module, but since it has a different name, luaposix
 	# doesn't find it.
diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index d7900a081f..e949ee7be2 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUASEC
 	bool "luasec"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LUASOCKET
 	help
diff --git a/package/luasocket/Config.in b/package/luasocket/Config.in
index 45f959e8d0..45263030f3 100644
--- a/package/luasocket/Config.in
+++ b/package/luasocket/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUASOCKET
 	bool "luasocket"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaSocket is the most comprehensive networking support library
 	  for the Lua language.
diff --git a/package/luasql-sqlite3/Config.in b/package/luasql-sqlite3/Config.in
index 483d6a0f37..cc4d3d5450 100644
--- a/package/luasql-sqlite3/Config.in
+++ b/package/luasql-sqlite3/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_LUASQL_SQLITE3
 	bool "luasql-sqlite3"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_SQLITE
 	help
 	  LuaSQL is a simple interface from Lua to a DBMS.
diff --git a/package/lutok/Config.in b/package/lutok/Config.in
index ab9c32b6d5..abeaa4011d 100644
--- a/package/lutok/Config.in
+++ b/package/lutok/Config.in
@@ -9,4 +9,3 @@ config BR2_PACKAGE_LUTOK
 
 comment "lutok needs a toolchain w/ C++ and full Lua"
 	depends on !BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_LUAJIT
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
diff --git a/package/rings/Config.in b/package/rings/Config.in
index 87ade07cb1..d1f1efe553 100644
--- a/package/rings/Config.in
+++ b/package/rings/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_RINGS
 	bool "rings"
-	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  Provides a way to create new Lua states from within Lua.
 
-- 
2.20.1
