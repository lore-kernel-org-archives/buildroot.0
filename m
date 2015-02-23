From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 23 Feb 2015 12:33:09 +0100
Subject: [Buildroot] [git commit] lua-periphery: new package
Message-ID: <20150302222723.024468177D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c50b3ea11d572895abf42efee79e8647cd3c42b5
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Vanya Sergeev <vsergeev@gmail.com>
[ThomasDS: rewrap package/lua-periphery/Config.in]
Signed-off-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
Tested-by: Thomas De Schampheleire <thomas.de.schampheleire@gmail.com>
(compile-tested on x86/glibc armel/uclibc)
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                      |    1 +
 package/lua-periphery/Config.in        |    8 ++++++++
 package/lua-periphery/lua-periphery.mk |   13 +++++++++++++
 3 files changed, 22 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 09d49d9..2f90830 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -446,6 +446,7 @@ menu "Lua libraries/modules"
 	source "package/lua-ev/Config.in"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
+	source "package/lua-periphery/Config.in"
 	source "package/lua-testmore/Config.in"
 	source "package/luabitop/Config.in"
 	source "package/luacrypto/Config.in"
diff --git a/package/lua-periphery/Config.in b/package/lua-periphery/Config.in
new file mode 100644
index 0000000..de5a716
--- /dev/null
+++ b/package/lua-periphery/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_LUA_PERIPHERY
+	bool "lua-periphery"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  A library for GPIO, SPI, I2C, MMIO, and Serial peripheral I/O
+	  interface access in userspace Linux with Lua.
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
