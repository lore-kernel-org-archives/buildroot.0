From: Francois Perrad <fperrad@gmail.com>
Date: Sun, 24 Sep 2017 09:59:28 +0200
Subject: [Buildroot] [PATCH 5/9] lua-sailor: new package
In-Reply-To: <20170924075932.5990-1-francois.perrad@gadz.org>
References: <20170924075932.5990-1-francois.perrad@gadz.org>
Message-ID: <20170924075932.5990-5-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                  |  1 +
 package/lua-sailor/Config.in       | 14 ++++++++++++++
 package/lua-sailor/lua-sailor.hash |  2 ++
 package/lua-sailor/lua-sailor.mk   | 13 +++++++++++++
 4 files changed, 30 insertions(+)
 create mode 100644 package/lua-sailor/Config.in
 create mode 100644 package/lua-sailor/lua-sailor.hash
 create mode 100644 package/lua-sailor/lua-sailor.mk

diff --git a/package/Config.in b/package/Config.in
index 827ab489f..f9a9d476f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -595,6 +595,7 @@ menu "Lua libraries/modules"
 	source "package/luaossl/Config.in"
 	source "package/luaposix/Config.in"
 	source "package/lua-resty-http/Config.in"
+	source "package/lua-sailor/Config.in"
 	source "package/luasec/Config.in"
 	source "package/luasocket/Config.in"
 	source "package/luasql-sqlite3/Config.in"
diff --git a/package/lua-sailor/Config.in b/package/lua-sailor/Config.in
new file mode 100644
index 000000000..dc5a05f9f
--- /dev/null
+++ b/package/lua-sailor/Config.in
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_LUA_SAILOR
+	bool "lua-sailor"
+	# These are runtime dependencies
+	select BR2_PACKAGE_CGILUA
+	select BR2_PACKAGE_LBASE64
+	select BR2_PACKAGE_LUAFILESYSTEM
+	select BR2_PACKAGE_LUA_DATAFILE
+	select BR2_PACKAGE_LUA_VALUA
+	select BR2_PACKAGE_XAVANTE
+	select BR2_PACKAGE_WSAPI_XAVANTE
+	help
+	  Sailor is a web framework written in Lua that follows the MVC design pattern.
+
+	  http://sailorproject.org/
diff --git a/package/lua-sailor/lua-sailor.hash b/package/lua-sailor/lua-sailor.hash
new file mode 100644
index 000000000..f4c42cccc
--- /dev/null
+++ b/package/lua-sailor/lua-sailor.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4f7f43a7cf6c62712a521ebaf5f53aaf230039c7fb06480ae168c3aa036120bf  sailor-0.5-4.src.rock
diff --git a/package/lua-sailor/lua-sailor.mk b/package/lua-sailor/lua-sailor.mk
new file mode 100644
index 000000000..17fbd7c61
--- /dev/null
+++ b/package/lua-sailor/lua-sailor.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-sailor
+#
+################################################################################
+
+LUA_SAILOR_VERSION = 0.5-4
+LUA_SAILOR_NAME_UPSTREAM = sailor
+LUA_SAILOR_SUBDIR = sailor
+LUA_SAILOR_LICENSE = MIT
+LUA_SAILOR_LICENSE_FILES = $(LUA_SAILOR_SUBDIR)/LICENSE
+
+$(eval $(luarocks-package))
-- 
2.11.0
