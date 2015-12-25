From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:25:23 +0100
Subject: [Buildroot] [PATCH 54/84 RFC] package/lua{,
	jit}: move inclusion of external libraries/modules
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <3e05c36b15391a7868a92dbc37cb50122a382080.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Introduce a Config.ext for external Lua external libraries/modules, that
both lua and luajit include from their respective sub-menus.

lua and luajit now have more than 5 options, so use a 'menuconfig' to
group the options in sub-menus.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/Config.in         | 46 --------------------------------------------
 package/lua/Config.ext    | 49 +++++++++++++++++++++++++++++++++++++++++++++++
 package/lua/Config.in     |  4 +++-
 package/luajit/Config.ext |  1 +
 package/luajit/Config.in  |  4 +++-
 5 files changed, 56 insertions(+), 48 deletions(-)
 create mode 100644 package/lua/Config.ext
 create mode 120000 package/luajit/Config.ext

diff --git a/package/Config.in b/package/Config.in
index 14c3c2b1..ce148c0 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -466,52 +466,6 @@ menu "Interpreter languages and scripting"
 	source "package/lua/Config.in"
 	source "package/luainterpreter/Config.in"
 	source "package/luajit/Config.in"
-if BR2_PACKAGE_HAS_LUAINTERPRETER && !BR2_STATIC_LIBS
-# lua modules are dynamically loaded, so not available on static builds
-menu "Lua libraries/modules"
-	source "package/cgilua/Config.in"
-	source "package/copas/Config.in"
-	source "package/cosmo/Config.in"
-	source "package/coxpcall/Config.in"
-	source "package/dado/Config.in"
-	source "package/lbase64/Config.in"
-	source "package/ljlinenoise/Config.in"
-	source "package/ljsyscall/Config.in"
-	source "package/lpeg/Config.in"
-	source "package/lpty/Config.in"
-	source "package/lrandom/Config.in"
-	source "package/lsqlite3/Config.in"
-	source "package/lua-cjson/Config.in"
-	source "package/lua-coat/Config.in"
-	source "package/lua-coatpersistent/Config.in"
-	source "package/lua-csnappy/Config.in"
-	source "package/lua-ev/Config.in"
-	source "package/lua-iconv/Config.in"
-	source "package/lua-messagepack/Config.in"
-	source "package/lua-msgpack-native/Config.in"
-	source "package/lua-periphery/Config.in"
-	source "package/lua-testmore/Config.in"
-	source "package/luabitop/Config.in"
-	source "package/luacrypto/Config.in"
-	source "package/luaexpat/Config.in"
-	source "package/luaexpatutils/Config.in"
-	source "package/luafilesystem/Config.in"
-	source "package/luajson/Config.in"
-	source "package/lualogging/Config.in"
-	source "package/luaposix/Config.in"
-	source "package/luasec/Config.in"
-	source "package/luasocket/Config.in"
-	source "package/luasql-sqlite3/Config.in"
-	source "package/lunit/Config.in"
-	source "package/luv/Config.in"
-	source "package/luvi/Config.in"
-	source "package/lzlib/Config.in"
-	source "package/orbit/Config.in"
-	source "package/rings/Config.in"
-	source "package/wsapi/Config.in"
-	source "package/xavante/Config.in"
-endmenu
-endif
 	source "package/lutok/Config.in"
 	source "package/micropython/Config.in"
 	source "package/micropython-lib/Config.in"
diff --git a/package/lua/Config.ext b/package/lua/Config.ext
new file mode 100644
index 0000000..4215e41
--- /dev/null
+++ b/package/lua/Config.ext
@@ -0,0 +1,49 @@
+# This file is included both from lua and luajit
+
+if !BR2_STATIC_LIBS
+
+comment "Lua libraries/modules"
+
+source "package/cgilua/Config.in"
+source "package/copas/Config.in"
+source "package/cosmo/Config.in"
+source "package/coxpcall/Config.in"
+source "package/dado/Config.in"
+source "package/lbase64/Config.in"
+source "package/ljlinenoise/Config.in"
+source "package/ljsyscall/Config.in"
+source "package/lpeg/Config.in"
+source "package/lpty/Config.in"
+source "package/lrandom/Config.in"
+source "package/lsqlite3/Config.in"
+source "package/lua-cjson/Config.in"
+source "package/lua-coat/Config.in"
+source "package/lua-coatpersistent/Config.in"
+source "package/lua-csnappy/Config.in"
+source "package/lua-ev/Config.in"
+source "package/lua-iconv/Config.in"
+source "package/lua-messagepack/Config.in"
+source "package/lua-msgpack-native/Config.in"
+source "package/lua-periphery/Config.in"
+source "package/lua-testmore/Config.in"
+source "package/luabitop/Config.in"
+source "package/luacrypto/Config.in"
+source "package/luaexpat/Config.in"
+source "package/luaexpatutils/Config.in"
+source "package/luafilesystem/Config.in"
+source "package/luajson/Config.in"
+source "package/lualogging/Config.in"
+source "package/luaposix/Config.in"
+source "package/luasec/Config.in"
+source "package/luasocket/Config.in"
+source "package/luasql-sqlite3/Config.in"
+source "package/lunit/Config.in"
+source "package/luv/Config.in"
+source "package/luvi/Config.in"
+source "package/lzlib/Config.in"
+source "package/orbit/Config.in"
+source "package/rings/Config.in"
+source "package/wsapi/Config.in"
+source "package/xavante/Config.in"
+
+endif # !static
diff --git a/package/lua/Config.in b/package/lua/Config.in
index d9cd1dd..65b624d 100644
--- a/package/lua/Config.in
+++ b/package/lua/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_LUA
+menuconfig BR2_PACKAGE_LUA
 	bool "lua"
 	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	help
@@ -68,4 +68,6 @@ config BR2_PACKAGE_LUA_LINENOISE
 
 endchoice
 
+source "package/lua/Config.ext"
+
 endif
diff --git a/package/luajit/Config.ext b/package/luajit/Config.ext
new file mode 120000
index 0000000..62d6109
--- /dev/null
+++ b/package/luajit/Config.ext
@@ -0,0 +1 @@
+../lua/Config.ext
\ No newline at end of file
diff --git a/package/luajit/Config.in b/package/luajit/Config.in
index 8ce528b..4916b21 100644
--- a/package/luajit/Config.in
+++ b/package/luajit/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_LUAJIT_ARCH_SUPPORTS
 		BR2_powerpc || BR2_arm || BR2_armeb || \
 		((BR2_mips || BR2_mipsel) && !BR2_MIPS_SOFT_FLOAT)
 
-config BR2_PACKAGE_LUAJIT
+menuconfig BR2_PACKAGE_LUAJIT
 	bool "luajit"
 	select BR2_PACKAGE_HAS_LUAINTERPRETER
 	depends on !BR2_STATIC_LIBS # dlopen
@@ -32,6 +32,8 @@ config BR2_PACKAGE_PROVIDES_LUAINTERPRETER
 config BR2_PACKAGE_LUAINTERPRETER_ABI_VERSION
 	default "5.1"
 
+source "package/luajit/Config.ext"
+
 endif
 
 comment "luajit needs a toolchain w/ dynamic library"
-- 
1.9.1
