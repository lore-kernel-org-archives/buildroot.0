From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Fri, 28 Dec 2018 08:37:30 +0800
Subject: [Buildroot] [PATCH 1/3] package/lua-debug: new package
Message-ID: <1545957452-9451-1-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                |  1 +
 package/lua-debug/Config.in      |  7 +++++++
 package/lua-debug/lua-debug.hash |  2 ++
 package/lua-debug/lua-debug.mk   | 16 ++++++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/lua-debug/Config.in
 create mode 100644 package/lua-debug/lua-debug.hash
 create mode 100644 package/lua-debug/lua-debug.mk

diff --git a/package/Config.in b/package/Config.in
index c3e0691..324830d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -613,6 +613,7 @@ menu "Lua libraries/modules"
 	source "package/lua-csnappy/Config.in"
 	source "package/lua-curl/Config.in"
 	source "package/lua-datafile/Config.in"
+	source "package/lua-debug/Config.in"
 	source "package/lua-ev/Config.in"
 	source "package/lua-fifo/Config.in"
 	source "package/lua-flu/Config.in"
diff --git a/package/lua-debug/Config.in b/package/lua-debug/Config.in
new file mode 100644
index 0000000..4d9f368
--- /dev/null
+++ b/package/lua-debug/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_DEBUG
+	bool "lua-debug"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	help
+	  Manage an overall debug state, and associated hint substates.
+
+	  http://lua-stdlib.github.io/_debug
diff --git a/package/lua-debug/lua-debug.hash b/package/lua-debug/lua-debug.hash
new file mode 100644
index 0000000..2c48711
--- /dev/null
+++ b/package/lua-debug/lua-debug.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 7f6b84283d4b78dafee17e7765dd5f1f8e75c3314169977f4dda0e7873616ce2  std._debug-1.0.1-1.src.rock
diff --git a/package/lua-debug/lua-debug.mk b/package/lua-debug/lua-debug.mk
new file mode 100644
index 0000000..e18bef7
--- /dev/null
+++ b/package/lua-debug/lua-debug.mk
@@ -0,0 +1,16 @@
+################################################################################
+#
+# lua-debug
+#
+################################################################################
+
+LUA_DEBUG_VERSION_UPSTREAM = 1.0.1
+LUA_DEBUG_VERSION = $(LUA_DEBUG_VERSION_UPSTREAM)-1
+LUA_DEBUG_NAME_UPSTREAM = std._debug
+LUA_DEBUG_SUBDIR = _debug-$(LUA_DEBUG_VERSION_UPSTREAM)
+LUA_DEBUG_ROCKSPEC = $(LUA_DEBUG_NAME_UPSTREAM)-$(LUA_DEBUG_VERSION).rockspec
+LUA_DEBUG_SOURCE = $(LUA_DEBUG_NAME_UPSTREAM)-$(LUA_DEBUG_VERSION).src.rock
+LUA_DEBUG_LICENSE = MIT
+LUA_DEBUG_LICENSE_FILES = LICENSE.md
+
+$(eval $(luarocks-package))
-- 
2.7.4
