From: Francois Perrad <fperrad@gmail.com>
Date: Thu,  7 Sep 2017 09:51:40 +0200
Subject: [Buildroot] [PATCH 2/2] lua-curl: new package
In-Reply-To: <20170907075140.20738-1-francois.perrad@gadz.org>
References: <20170907075140.20738-1-francois.perrad@gadz.org>
Message-ID: <20170907075140.20738-2-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in              |  1 +
 package/lua-curl/Config.in     |  7 +++++++
 package/lua-curl/lua-curl.hash |  2 ++
 package/lua-curl/lua-curl.mk   | 13 +++++++++++++
 4 files changed, 23 insertions(+)
 create mode 100644 package/lua-curl/Config.in
 create mode 100644 package/lua-curl/lua-curl.hash
 create mode 100644 package/lua-curl/lua-curl.mk

diff --git a/package/Config.in b/package/Config.in
index b826bdbc3..119beabab 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -574,6 +574,7 @@ menu "Lua libraries/modules"
 	source "package/lua-coat/Config.in"
 	source "package/lua-coatpersistent/Config.in"
 	source "package/lua-csnappy/Config.in"
+	source "package/lua-curl/Config.in"
 	source "package/lua-ev/Config.in"
 	source "package/lua-flu/Config.in"
 	source "package/lua-iconv/Config.in"
diff --git a/package/lua-curl/Config.in b/package/lua-curl/Config.in
new file mode 100644
index 000000000..88cdaf10c
--- /dev/null
+++ b/package/lua-curl/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LUA_CURL
+	bool "lua-curl"
+	select BR2_PACKAGE_LIBCURL
+	help
+	  Lua binding to libcurl.
+
+	  https://lua-curl.github.io/
diff --git a/package/lua-curl/lua-curl.hash b/package/lua-curl/lua-curl.hash
new file mode 100644
index 000000000..e73810ced
--- /dev/null
+++ b/package/lua-curl/lua-curl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4cc6389bf5d4a868cc1e6017733b9b6306f2fc8b5083aa928d66399195697f34  lua-curl-0.3.7-1.src.rock
diff --git a/package/lua-curl/lua-curl.mk b/package/lua-curl/lua-curl.mk
new file mode 100644
index 000000000..e5fa10a1e
--- /dev/null
+++ b/package/lua-curl/lua-curl.mk
@@ -0,0 +1,13 @@
+################################################################################
+#
+# lua-curl
+#
+################################################################################
+
+LUA_CURL_VERSION = 0.3.7-1
+LUA_CURL_SUBDIR = Lua-cURLv3-0.3.7
+LUA_CURL_LICENSE = MIT
+LUA_CURL_LICENSE_FILES = $(LUA_CURL_SUBDIR)/LICENSE
+LUA_CURL_DEPENDENCIES = libcurl
+
+$(eval $(luarocks-package))
-- 
2.11.0
