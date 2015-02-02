From: Vanya Sergeev <vsergeev@gmail.com>
Date: Sun,  1 Feb 2015 20:50:16 -0800
Subject: [Buildroot] [PATCH 1/1] lua-periphery: new package
Message-ID: <1422852616-32612-1-git-send-email-vsergeev@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
---
 package/Config.in                      |  1 +
 package/lua-periphery/Config.in        |  8 ++++++++
 package/lua-periphery/lua-periphery.mk | 13 +++++++++++++
 3 files changed, 22 insertions(+)
 create mode 100644 package/lua-periphery/Config.in
 create mode 100644 package/lua-periphery/lua-periphery.mk

diff --git a/package/Config.in b/package/Config.in
index dd011be..ca63d4f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -425,6 +425,7 @@ menu "Lua libraries/modules"
 	source "package/lua-ev/Config.in"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
+	source "package/lua-periphery/Config.in"
 	source "package/lua-testmore/Config.in"
 	source "package/luabitop/Config.in"
 	source "package/luacrypto/Config.in"
diff --git a/package/lua-periphery/Config.in b/package/lua-periphery/Config.in
new file mode 100644
index 0000000..59cf17f
--- /dev/null
+++ b/package/lua-periphery/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_PERIPHERY
+	bool "lua-periphery"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  A library for GPIO, SPI, I2C, MMIO, and Serial peripheral I/O interface
+	  access in user space Linux with Lua.
+
+	  https://github.com/vsergeev/lua-periphery
diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
new file mode 100644
index 0000000..0717a27
--- /dev/null
+++ b/package/lua-periphery/lua-periphery.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-periphery
+#
+################################################################################
+
+LUA_PERIPHERY_VERSION_UPSTREAM = 1.0.4
+LUA_PERIPHERY_VERSION = $(LUA_PERIPHERY_VERSION_UPSTREAM)-1
+LUA_PERIPHERY_SUBDIR = lua-periphery
+LUA_PERIPHERY_LICENSE = MIT
+LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
-- 
2.2.2
