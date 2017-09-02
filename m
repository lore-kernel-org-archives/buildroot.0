From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  2 Sep 2017 18:56:42 +0200
Subject: [Buildroot] [PATCH 12/12] wsapi-fcgi: new package
In-Reply-To: <20170902165642.22943-1-francois.perrad@gadz.org>
References: <20170902165642.22943-1-francois.perrad@gadz.org>
Message-ID: <20170902165642.22943-12-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                  |  1 +
 package/wsapi-fcgi/Config.in       | 11 +++++++++++
 package/wsapi-fcgi/wsapi-fcgi.hash |  2 ++
 package/wsapi-fcgi/wsapi-fcgi.mk   | 12 ++++++++++++
 4 files changed, 26 insertions(+)
 create mode 100644 package/wsapi-fcgi/Config.in
 create mode 100644 package/wsapi-fcgi/wsapi-fcgi.hash
 create mode 100644 package/wsapi-fcgi/wsapi-fcgi.mk

diff --git a/package/Config.in b/package/Config.in
index 5d7ec7f26..b826bdbc3 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -605,6 +605,7 @@ menu "Lua libraries/modules"
 	source "package/rings/Config.in"
 	source "package/turbolua/Config.in"
 	source "package/wsapi/Config.in"
+	source "package/wsapi-fcgi/Config.in"
 	source "package/wsapi-xavante/Config.in"
 	source "package/xavante/Config.in"
 endmenu
diff --git a/package/wsapi-fcgi/Config.in b/package/wsapi-fcgi/Config.in
new file mode 100644
index 000000000..634903836
--- /dev/null
+++ b/package/wsapi-fcgi/Config.in
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_WSAPI_FCGI
+	bool "wsapi-fcgi"
+	depends on BR2_USE_MMU # fork()
+	select BR2_PACKAGE_LIBFCGI
+	# Runtime dependency only
+	select BR2_PACKAGE_WSAPI
+	help
+	  WSAPI is an API that abstracts the web server from Lua web
+	  applications. This is the rock that contains the FCGI module lfcgi.
+
+	  http://keplerproject.github.com/wsapi/
diff --git a/package/wsapi-fcgi/wsapi-fcgi.hash b/package/wsapi-fcgi/wsapi-fcgi.hash
new file mode 100644
index 000000000..f82ce9cfc
--- /dev/null
+++ b/package/wsapi-fcgi/wsapi-fcgi.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 73dc200889bc185953cd3a7c5350c998c090f901fcd10771273b7a63a3ffcdcf  wsapi-fcgi-1.6.1-1.src.rock
diff --git a/package/wsapi-fcgi/wsapi-fcgi.mk b/package/wsapi-fcgi/wsapi-fcgi.mk
new file mode 100644
index 000000000..88daade5a
--- /dev/null
+++ b/package/wsapi-fcgi/wsapi-fcgi.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# wsapi-fcgi
+#
+################################################################################
+
+WSAPI_FCGI_VERSION_MAJOR = 1.6.1
+WSAPI_FCGI_VERSION = $(WSAPI_FCGI_VERSION_MAJOR)-1
+WSAPI_FCGI_SUBDIR = wsapi-$(WSAPI_FCGI_VERSION_MAJOR)
+WSAPI_FCGI_DEPENDENCIES = libfcgi
+
+$(eval $(luarocks-package))
-- 
2.11.0
