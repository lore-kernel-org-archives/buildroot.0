From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 22:23:19 +0200
Subject: [Buildroot] [git commit] lua-resty-http: new package
Message-ID: <20170504202355.59D7A826D5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e88995f065986dc56ce5a7c222f7a9f6cbff2b94
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Semyon Kolganov <semenak94@mail.ru>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 DEVELOPERS                                 |  1 +
 package/Config.in                          |  1 +
 package/lua-resty-http/Config.in           |  6 ++++++
 package/lua-resty-http/lua-resty-http.hash |  2 ++
 package/lua-resty-http/lua-resty-http.mk   | 12 ++++++++++++
 5 files changed, 22 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index d28e6fb..8fbb69a 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1434,6 +1434,7 @@ F:	package/yaml-cpp/
 N:	Semyon Kolganov <semenak94@mail.ru>
 F:	package/fmt/
 F:	package/libbson/
+F:	package/lua-resty-http/
 F:	package/mpir/
 
 N:	Sergio Prado <sergio.prado@e-labworks.com>
diff --git a/package/Config.in b/package/Config.in
index 47ad2c2..1af8150 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -571,6 +571,7 @@ menu "Lua libraries/modules"
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
index 0000000..927fdae
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
+LUA_RESTY_HTTP_LICENSE = BSD-2-Clause
+LUA_RESTY_HTTP_LICENSE_FILES = LICENSE
+
+$(eval $(luarocks-package))
