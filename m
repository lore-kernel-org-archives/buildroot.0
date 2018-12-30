From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 30 Dec 2018 14:48:33 +0100
Subject: [Buildroot] [git commit] package/lua-std-debug: new package
Message-ID: <20181230134409.8803C838D8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3f86a178ae6a52e93d13a696d3bee9b8f5cdf9b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
Acked-by: Francois Perrad <francois.perrad@gadz.org>
[Thomas:
 - drop unneeded dependency in Config.in file
 - add entry in DEVELOPERS file
 - fix location of license file
 - add hash for license file.]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                               |  1 +
 package/Config.in                        |  1 +
 package/lua-std-debug/Config.in          |  7 +++++++
 package/lua-std-debug/lua-std-debug.hash |  3 +++
 package/lua-std-debug/lua-std-debug.mk   | 16 ++++++++++++++++
 5 files changed, 28 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2d58ea9014..e62a445859 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1000,6 +1000,7 @@ F:	configs/pine64_defconfig
 F:	configs/pine64_sopine_defconfig
 
 N:	James Hilliard <james.hilliard1@gmail.com>
+F:	package/lua-std-debug/
 F:	package/python-aiodns/
 F:	package/python-aiohttp/
 F:	package/python-aiohttp-jinja2/
diff --git a/package/Config.in b/package/Config.in
index c3e069134e..f33aaf91e9 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -624,6 +624,7 @@ menu "Lua libraries/modules"
 	source "package/lua-msgpack-native/Config.in"
 	source "package/lua-periphery/Config.in"
 	source "package/lua-sdl2/Config.in"
+	source "package/lua-std-debug/Config.in"
 	source "package/lua-stdlib/Config.in"
 	source "package/lua-testmore/Config.in"
 	source "package/lua-utf8/Config.in"
diff --git a/package/lua-std-debug/Config.in b/package/lua-std-debug/Config.in
new file mode 100644
index 0000000000..948f2427d3
--- /dev/null
+++ b/package/lua-std-debug/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_STD_DEBUG
+	bool "lua-std-debug"
+	help
+	  Manage an overall debug state, and associated hint
+	  substates.
+
+	  http://lua-stdlib.github.io/_debug
diff --git a/package/lua-std-debug/lua-std-debug.hash b/package/lua-std-debug/lua-std-debug.hash
new file mode 100644
index 0000000000..3e94b40a9c
--- /dev/null
+++ b/package/lua-std-debug/lua-std-debug.hash
@@ -0,0 +1,3 @@
+# Locally calculated
+sha256 7f6b84283d4b78dafee17e7765dd5f1f8e75c3314169977f4dda0e7873616ce2  std._debug-1.0.1-1.src.rock
+sha256 034abdbbe9a13899c813509776d1e04af81bc58c2982b704c8b3663549504a31  _debug-1.0.1/LICENSE.md
diff --git a/package/lua-std-debug/lua-std-debug.mk b/package/lua-std-debug/lua-std-debug.mk
new file mode 100644
index 0000000000..e044d6cb4b
--- /dev/null
+++ b/package/lua-std-debug/lua-std-debug.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# lua-std-debug
+#
+################################################################################
+
+LUA_STD_DEBUG_VERSION_UPSTREAM = 1.0.1
+LUA_STD_DEBUG_VERSION = $(LUA_STD_DEBUG_VERSION_UPSTREAM)-1
+LUA_STD_DEBUG_NAME_UPSTREAM = std._debug
+LUA_STD_DEBUG_SUBDIR = _debug-$(LUA_STD_DEBUG_VERSION_UPSTREAM)
+LUA_STD_DEBUG_ROCKSPEC = $(LUA_STD_DEBUG_NAME_UPSTREAM)-$(LUA_STD_DEBUG_VERSION).rockspec
+LUA_STD_DEBUG_SOURCE = $(LUA_STD_DEBUG_NAME_UPSTREAM)-$(LUA_STD_DEBUG_VERSION).src.rock
+LUA_STD_DEBUG_LICENSE = MIT
+LUA_STD_DEBUG_LICENSE_FILES = $(LUA_STD_DEBUG_SUBDIR)/LICENSE.md
+
+$(eval $(luarocks-package))
