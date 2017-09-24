From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 09:59:27 +0200
Subject: [Buildroot] [PATCH 4/9] lua-valua: new package
In-Reply-To: <20170924075932.5990-1-francois.perrad@gadz.org>
References: <20170924075932.5990-1-francois.perrad@gadz.org>
Message-ID: <20170924075932.5990-4-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                |  1 +
 package/lua-valua/Config.in      |  9 +++++++++
 package/lua-valua/lua-valua.hash |  2 ++
 package/lua-valua/lua-valua.mk   | 13 +++++++++++++
 4 files changed, 25 insertions(+)
 create mode 100644 package/lua-valua/Config.in
 create mode 100644 package/lua-valua/lua-valua.hash
 create mode 100644 package/lua-valua/lua-valua.mk

diff --git a/package/Config.in b/package/Config.in
index 767614c7d..827ab489f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -598,6 +598,7 @@ menu "Lua libraries/modules"
 	source "package/luasec/Config.in"
 	source "package/luasocket/Config.in"
 	source "package/luasql-sqlite3/Config.in"
+	source "package/lua-valua/Config.in"
 	source "package/lunit/Config.in"
 	source "package/lutok/Config.in"
 	source "package/luv/Config.in"
diff --git a/package/lua-valua/Config.in b/package/lua-valua/Config.in
new file mode 100644
index 000000000..412bb16d8
--- /dev/null
+++ b/package/lua-valua/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_LUA_VALUA
+	bool "lua-valua"
+	help
+	  This module provides tools for validating values, very useful
+	  in forms, but also usable elsewhere. It works in appended chains.
+	  Create a new validation object and start chaining your test
+	  functions.
+
+	  https://github.com/sailorproject/valua
diff --git a/package/lua-valua/lua-valua.hash b/package/lua-valua/lua-valua.hash
new file mode 100644
index 000000000..92ea61311
--- /dev/null
+++ b/package/lua-valua/lua-valua.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 bff39692fd2ac3590fd814aa1b1ca33e5d5971092955309aa8424b02b88ce1a3  valua-0.3-1.src.rock
diff --git a/package/lua-valua/lua-valua.mk b/package/lua-valua/lua-valua.mk
new file mode 100644
index 000000000..8cb0bf526
--- /dev/null
+++ b/package/lua-valua/lua-valua.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-valua
+#
+################################################################################
+
+LUA_VALUA_VERSION = 0.3-1
+LUA_VALUA_NAME_UPSTREAM = valua
+LUA_VALUA_SUBDIR = valua
+LUA_VALUA_LICENSE = MIT
+LUA_VALUA_LICENSE_FILES = $(LUA_VALUA_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
-- 
2.11.0
