From: Semyon Kolganov <semenak94@mail.ru>
Date: Tue, 25 Apr 2017 21:10:58 +0300
Subject: [Buildroot] [PATCH] lua-resty-http: new package
In-Reply-To: <lua-resty-http: new package>
References: <lua-resty-http: new package>
Message-ID: <1493143858-7001-1-git-send-email-semenak94@mail.ru>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/lua-resty-http/Config.in           |  6 ++++++
 package/lua-resty-http/lua-resty-http.hash |  2 ++
 package/lua-resty-http/lua-resty-http.mk   | 12 ++++++++++++
 5 files changed, 22 insertions(+)
 create mode 100644 package/lua-resty-http/Config.in
 create mode 100644 package/lua-resty-http/lua-resty-http.hash
 create mode 100644 package/lua-resty-http/lua-resty-http.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 123a8f9..1bcf2da 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1423,6 +1423,7 @@ F:	package/yaml-cpp/
 N:	Semyon Kolganov <semenak94@mail.ru>
 F:	package/fmt/
 F:	package/libbson/
+F:	package/lua-resty-http/
 F:	package/mpir/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
diff --git a/package/Config.in b/package/Config.in
index 4eaa95b..1fdf186 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -570,6 +570,7 @@ menu "Lua libraries/modules"
 	source "package/luajson/Config.in"
 	source "package/lualogging/Config.in"
 	source "package/luaposix/Config.in"
+	source "package/lua-resty-http/Config.in"
 	source "package/luasec/Config.in"
 	source "package/luasocket/Config.in"
 	source "package/luasql-sqlite3/Config.in"
diff --git a/package/lua-resty-http/Config.in b/package/lua-resty-http/Config.in
new file mode 100644
index 0000000..4697c90
--- /dev/null
+++ b/package/lua-resty-http/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_LUA_RESTY_HTTP
+	bool "lua-resty-http"
+	help
+	  Lua HTTP client cosocket driver for OpenResty / ngx_lua.
+
+	  http://github.com/pintsized/lua-resty-http
diff --git a/package/lua-resty-http/lua-resty-http.hash b/package/lua-resty-http/lua-resty-http.hash
new file mode 100644
index 0000000..02c5659
--- /dev/null
+++ b/package/lua-resty-http/lua-resty-http.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256	3d30dd5a273438e39741fcf87ae5e147d8700bd8faa7dfe9916ea425f9c716f7  lua-resty-http-0.10-0.src.rock
diff --git a/package/lua-resty-http/lua-resty-http.mk b/package/lua-resty-http/lua-resty-http.mk
new file mode 100644
index 0000000..2b6b8e6
--- /dev/null
+++ b/package/lua-resty-http/lua-resty-http.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# lua-resty-http
+#
+################################################################################
+
+LUA_RESTY_HTTP_VERSION = 0.10-0
+LUA_RESTY_HTTP_SUBDIR = lua-resty-http
+LUA_RESTY_HTTP_LICENSE = BSD 2-clause
+LUA_RESTY_HTTP_LICENSE_FILES = LICENSE
+
+$(eval $(luarocks-package))
-- 
2.7.4
