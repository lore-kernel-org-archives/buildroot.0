From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 19:20:55 +0200
Subject: [Buildroot] [git commit] package/luainterpreter: rename the _HAS
	and _PROVIDES variables
Message-ID: <20140405172338.C39CB9C5BD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=50dfaef6ec2d1bcfb6db232a3802882d3054707c
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The basic rule for a package is to have its options named
after the package name. There is no reason this should not
also be the case for virtual packages.

Besides, this will allow us to switch luainterpreter to use the
soon-to-be-introduced virtual-package infrastructure.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Cc: Mike Zick <minimod@morethan.org>
Cc: Francois Perrad <fperrad@gmail.com>
Reviewed-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                        |    2 +-
 package/lbase64/Config.in                |    2 +-
 package/lpeg/Config.in                   |    2 +-
 package/lpty/Config.in                   |    2 +-
 package/lrandom/Config.in                |    2 +-
 package/lsqlite3/Config.in               |    2 +-
 package/lua-cjson/Config.in              |    2 +-
 package/lua-ev/Config.in                 |    2 +-
 package/lua-msgpack-native/Config.in     |    2 +-
 package/lua/Config.in                    |    4 ++--
 package/luaexpat/Config.in               |    2 +-
 package/luafilesystem/Config.in          |    2 +-
 package/luainterpreter/Config.in         |    6 +++---
 package/luainterpreter/luainterpreter.mk |    4 ++--
 package/luajit/Config.in                 |    4 ++--
 package/luaposix/Config.in               |    2 +-
 package/luasec/Config.in                 |    2 +-
 package/luasocket/Config.in              |    2 +-
 package/luasql-sqlite3/Config.in         |    2 +-
 package/lzlib/Config.in                  |    2 +-
 package/rings/Config.in                  |    2 +-
 21 files changed, 26 insertions(+), 26 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 945c7ca..9d8b31f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -371,7 +371,7 @@ source "package/jimtcl/Config.in"
 source "package/lua/Config.in"
 source "package/luainterpreter/Config.in"
 source "package/luajit/Config.in"
-if BR2_PACKAGE_HAS_LUA_INTERPRETER && !BR2_PREFER_STATIC_LIB
+if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_PREFER_STATIC_LIB
 # lua modules are dynamically loaded, so not available on static builds
 menu "Lua libraries/modules"
 source "package/cgilua/Config.in"
diff --git a/package/lbase64/Config.in b/package/lbase64/Config.in
index 4593ab9..48d3fdb 100644
--- a/package/lbase64/Config.in
+++ b/package/lbase64/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LBASE64
 	bool "lbase64"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  A base64 library for Lua
diff --git a/package/lpeg/Config.in b/package/lpeg/Config.in
index da54d61..957991d 100644
--- a/package/lpeg/Config.in
+++ b/package/lpeg/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LPEG
 	bool "lpeg"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LPeg is a new pattern-matching library for Lua,
 	  based on Parsing Expression Grammars (PEGs).
diff --git a/package/lpty/Config.in b/package/lpty/Config.in
index 5e7ad14..50cbd25 100644
--- a/package/lpty/Config.in
+++ b/package/lpty/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LPTY
 	bool "lpty"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  A simple facility for lua to control other programs via
 	  PTYs.
diff --git a/package/lrandom/Config.in b/package/lrandom/Config.in
index 661707d..64bcf0c 100644
--- a/package/lrandom/Config.in
+++ b/package/lrandom/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LRANDOM
 	bool "lrandom"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  A library for generating random numbers
 	  based on the Mersenne Twister
diff --git a/package/lsqlite3/Config.in b/package/lsqlite3/Config.in
index e19c789..cc431ae 100644
--- a/package/lsqlite3/Config.in
+++ b/package/lsqlite3/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LSQLITE3
 	bool "lsqlite3"
 	select BR2_PACKAGE_SQLITE
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  a thin Lua wrapper for the SQLite3 library.
 
diff --git a/package/lua-cjson/Config.in b/package/lua-cjson/Config.in
index 8129fab..1f4c7c7 100644
--- a/package/lua-cjson/Config.in
+++ b/package/lua-cjson/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA_CJSON
 	bool "lua-cjson"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  The Lua CJSON module provides JSON support for Lua. It features:
 	  - Fast, standards compliant encoding/parsing routines
diff --git a/package/lua-ev/Config.in b/package/lua-ev/Config.in
index 28da114..74b5dc7 100644
--- a/package/lua-ev/Config.in
+++ b/package/lua-ev/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA_EV
 	bool "lua-ev"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_LIBEV
 	depends on !(BR2_avr32 || BR2_bfin) # libev
 	help
diff --git a/package/lua-msgpack-native/Config.in b/package/lua-msgpack-native/Config.in
index 498b30c..c7b3373 100644
--- a/package/lua-msgpack-native/Config.in
+++ b/package/lua-msgpack-native/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA_MSGPACK_NATIVE
 	bool "lua-msgpack-native"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_PACKAGE_LUA_5_2
 	help
 	  This is a native, C language implementation of msgpack
diff --git a/package/lua/Config.in b/package/lua/Config.in
index c4c12e9..2f1b25b 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUA
 	bool "lua"
-	select BR2_PACKAGE_HAS_LUA_INTERPRETER
+	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  Lua is a powerful, fast, light-weight, embeddable scripting language.
 
@@ -8,7 +8,7 @@ config BR2_PACKAGE_LUA
 
 if BR2_PACKAGE_LUA
 
-config BR2_PACKAGE_PROVIDES_LUA_INTERPRETER
+config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 	default "lua"
 
 choice
diff --git a/package/luaexpat/Config.in b/package/luaexpat/Config.in
index f8db318..6976e40 100644
--- a/package/luaexpat/Config.in
+++ b/package/luaexpat/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LUAEXPAT
 	bool "luaexpat"
 	select BR2_PACKAGE_EXPAT
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaExpat is a SAX XML parser based on the Expat library.
 
diff --git a/package/luafilesystem/Config.in b/package/luafilesystem/Config.in
index 489ebf3..50e7975 100644
--- a/package/luafilesystem/Config.in
+++ b/package/luafilesystem/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUAFILESYSTEM
 	bool "luafilesystem"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaFileSystem offers a portable way to access
 	  the underlying directory structure and file attributes.
diff --git a/package/luainterpreter/Config.in b/package/luainterpreter/Config.in
index a05bde1..e89a9b8 100644
--- a/package/luainterpreter/Config.in
+++ b/package/luainterpreter/Config.in
@@ -1,9 +1,9 @@
-config BR2_PACKAGE_HAS_LUA_INTERPRETER
+config BR2_PACKAGE_HAS_LUAINTERPRETER
 	bool
 
-config BR2_PACKAGE_PROVIDES_LUA_INTERPRETER
+config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 	string
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	string
diff --git a/package/luainterpreter/luainterpreter.mk b/package/luainterpreter/luainterpreter.mk
index f9206e8..40d4290 100644
--- a/package/luainterpreter/luainterpreter.mk
+++ b/package/luainterpreter/luainterpreter.mk
@@ -5,11 +5,11 @@
 ################################################################################
 
 LUAINTERPRETER_SOURCE =
-LUAINTERPRETER_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LUA_INTERPRETER))
+LUAINTERPRETER_DEPENDENCIES = $(call qstrip,$(BR2_PACKAGE_PROVIDES_LUAINTERPRETER))
 
 LUAINTERPRETER_ABIVER = $(call qstrip,$(BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION))
 
-ifeq ($(BR2_PACKAGE_HAS_LUA_INTERPRETER),y)
+ifeq ($(BR2_PACKAGE_HAS_LUAINTERPRETER),y)
 ifeq ($(LUAINTERPRETER_DEPENDENCIES),)
 $(error No lua interpreter implementation selected. Configuration error.)
 endif
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index bce9cc4..58b1653 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUAJIT
 	bool "luajit"
-	select BR2_PACKAGE_HAS_LUA_INTERPRETER
+	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	# Luajit is only available for some target architectures, and
 	# has some complexity wrt 32/64. See luajit.mk for details.
 	depends on BR2_i386 || (BR2_x86_64 && BR2_HOSTARCH='x86_64') || BR2_powerpc || BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel
@@ -14,7 +14,7 @@ config BR2_PACKAGE_LUAJIT
 
 if BR2_PACKAGE_LUAJIT
 
-config BR2_PACKAGE_PROVIDES_LUA_INTERPRETER
+config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 	default "luajit"
 
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
diff --git a/package/luaposix/Config.in b/package/luaposix/Config.in
index a95c825..04269fb 100644
--- a/package/luaposix/Config.in
+++ b/package/luaposix/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUAPOSIX
 	bool "luaposix"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_LUABITOP if BR2_PACKAGE_LUA_5_1
 	# LuaBitOp is already included in LuaJIT
 	help
diff --git a/package/luasec/Config.in b/package/luasec/Config.in
index ed55df7..a8cc9c9 100644
--- a/package/luasec/Config.in
+++ b/package/luasec/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_LUASEC
 	bool "luasec"
 	select BR2_PACKAGE_OPENSSL
 	select BR2_PACKAGE_LUASOCKET
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaSec is a binding for OpenSSL library to provide TLS/SSL
 	  communication.
diff --git a/package/luasocket/Config.in b/package/luasocket/Config.in
index 619d649..45f959e 100644
--- a/package/luasocket/Config.in
+++ b/package/luasocket/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUASOCKET
 	bool "luasocket"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  LuaSocket is the most comprehensive networking support library
 	  for the Lua language.
diff --git a/package/luasql-sqlite3/Config.in b/package/luasql-sqlite3/Config.in
index fca6582..3bd73f3 100644
--- a/package/luasql-sqlite3/Config.in
+++ b/package/luasql-sqlite3/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LUASQL_SQLITE3
 	bool "luasql-sqlite3"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	select BR2_PACKAGE_SQLITE
 	help
 	  LuaSQL is a simple interface from Lua to a DBMS.
diff --git a/package/lzlib/Config.in b/package/lzlib/Config.in
index d2b4818..c123019 100644
--- a/package/lzlib/Config.in
+++ b/package/lzlib/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_LZLIB
 	bool "lzlib"
 	select BR2_PACKAGE_ZLIB
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  This package provides a library to access zlib library
 	  functions and also to read/write gzip files using an
diff --git a/package/rings/Config.in b/package/rings/Config.in
index b1d41f3..87ade07 100644
--- a/package/rings/Config.in
+++ b/package/rings/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_RINGS
 	bool "rings"
-	depends on BR2_PACKAGE_HAS_LUA_INTERPRETER
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
 	  Provides a way to create new Lua states from within Lua.
 
