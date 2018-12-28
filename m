From: james.hilliard1 at gmail.com <james.hilliard1@gmail.com>
Date: Fri, 28 Dec 2018 08:37:31 +0800
Subject: [Buildroot] [PATCH 2/3] package/lua-normalize: new package
In-Reply-To: <1545957452-9451-1-git-send-email-james.hilliard1@gmail.com>
References: <1545957452-9451-1-git-send-email-james.hilliard1@gmail.com>
Message-ID: <1545957452-9451-2-git-send-email-james.hilliard1@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: James Hilliard <james.hilliard1@gmail.com>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/Config.in                        |  1 +
 package/lua-normalize/Config.in          | 13 +++++++++++++
 package/lua-normalize/lua-normalize.hash |  2 ++
 package/lua-normalize/lua-normalize.mk   | 14 ++++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/lua-normalize/Config.in
 create mode 100644 package/lua-normalize/lua-normalize.hash
 create mode 100644 package/lua-normalize/lua-normalize.mk

diff --git a/package/Config.in b/package/Config.in
index 324830d..8d57086 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -623,6 +623,7 @@ menu "Lua libraries/modules"
 	source "package/lua-markdown/Config.in"
 	source "package/lua-messagepack/Config.in"
 	source "package/lua-msgpack-native/Config.in"
+	source "package/lua-normalize/Config.in"
 	source "package/lua-periphery/Config.in"
 	source "package/lua-sdl2/Config.in"
 	source "package/lua-stdlib/Config.in"
diff --git a/package/lua-normalize/Config.in b/package/lua-normalize/Config.in
new file mode 100644
index 0000000..d894d71
--- /dev/null
+++ b/package/lua-normalize/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LUA_NORMALIZE
+	bool "lua-normalize"
+	depends on BR2_PACKAGE_HAS_LUAINTERPRETER
+	select BR2_PACKAGE_LUA_DEBUG # runtime
+	help
+	  This module can inject deterministic versions of core Lua
+	  functions that do not behave identically across all supported Lua
+	  implementations into your module's lexical environment.   Each
+	  function is as thin and fast a version as is possible in each Lua
+	  implementation, evaluating to the Lua C implementation with no
+	  overhead when semantics allow.
+
+	  https://lua-stdlib.github.io/normalize
diff --git a/package/lua-normalize/lua-normalize.hash b/package/lua-normalize/lua-normalize.hash
new file mode 100644
index 0000000..831528d
--- /dev/null
+++ b/package/lua-normalize/lua-normalize.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 50baac6fbcbc6bbe72b63ce0871ec36176d75c04dccc6e368590ba6ef107c67a  std.normalize-2.0.2-1.src.rock
diff --git a/package/lua-normalize/lua-normalize.mk b/package/lua-normalize/lua-normalize.mk
new file mode 100644
index 0000000..7ef9aa6
--- /dev/null
+++ b/package/lua-normalize/lua-normalize.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-normalize
+#
+################################################################################
+
+LUA_NORMALIZE_VERSION_UPSTREAM = 2.0.2
+LUA_NORMALIZE_VERSION = $(LUA_NORMALIZE_VERSION_UPSTREAM)-1
+LUA_NORMALIZE_NAME_UPSTREAM = std.normalize
+LUA_NORMALIZE_SUBDIR = normalize-$(LUA_NORMALIZE_VERSION_UPSTREAM)
+LUA_NORMALIZE_LICENSE = MIT
+LUA_NORMALIZE_LICENSE_FILES = LICENSE.md
+
+$(eval $(luarocks-package))
-- 
2.7.4
