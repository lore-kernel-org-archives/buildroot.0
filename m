From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 24 Sep 2017 17:20:25 +0200
Subject: [Buildroot] [git commit] lua-curl: new package
Message-ID: <20170924151731.8E53480FF3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8975698b92d7ecc6924a95853ef8602374a57618
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/Config.in              |  1 +
 package/lua-curl/Config.in     |  7 +++++++
 package/lua-curl/lua-curl.hash |  2 ++
 package/lua-curl/lua-curl.mk   | 14 ++++++++++++++
 4 files changed, 24 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 56eac65..8a75780 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -578,6 +578,7 @@ menu "Lua libraries/modules"
 	source "package/lua-coat/Config.in"
 	source "package/lua-coatpersistent/Config.in"
 	source "package/lua-csnappy/Config.in"
+	source "package/lua-curl/Config.in"
 	source "package/lua-ev/Config.in"
 	source "package/lua-flu/Config.in"
 	source "package/lua-iconv/Config.in"
diff --git a/package/lua-curl/Config.in b/package/lua-curl/Config.in
new file mode 100644
index 0000000..88cdaf1
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
index 0000000..e73810c
--- /dev/null
+++ b/package/lua-curl/lua-curl.hash
@@ -0,0 +1,2 @@
+# Locally calculated
+sha256 4cc6389bf5d4a868cc1e6017733b9b6306f2fc8b5083aa928d66399195697f34  lua-curl-0.3.7-1.src.rock
diff --git a/package/lua-curl/lua-curl.mk b/package/lua-curl/lua-curl.mk
new file mode 100644
index 0000000..9e4f262
--- /dev/null
+++ b/package/lua-curl/lua-curl.mk
@@ -0,0 +1,14 @@
+################################################################################
+#
+# lua-curl
+#
+################################################################################
+
+LUA_CURL_VERSION_UPSTREAM = 0.3.7
+LUA_CURL_VERSION = $(LUA_CURL_VERSION_UPSTREAM)-1
+LUA_CURL_SUBDIR = Lua-cURLv3-$(LUA_CURL_VERSION_UPSTREAM)
+LUA_CURL_LICENSE = MIT
+LUA_CURL_LICENSE_FILES = $(LUA_CURL_SUBDIR)/LICENSE
+LUA_CURL_DEPENDENCIES = libcurl
+
+$(eval $(luarocks-package))
