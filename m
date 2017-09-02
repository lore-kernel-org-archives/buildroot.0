From: Francois Perrad <fperrad@gmail.com>
Date: Sat,  2 Sep 2017 18:56:41 +0200
Subject: [Buildroot] [PATCH 11/12] wsapi-xavante: new package
In-Reply-To: <20170902165642.22943-1-francois.perrad@gadz.org>
References: <20170902165642.22943-1-francois.perrad@gadz.org>
Message-ID: <20170902165642.22943-11-francois.perrad@gadz.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/Config.in                        |  1 +
 package/wsapi-xavante/Config.in          | 13 +++++++++++++
 package/wsapi-xavante/wsapi-xavante.hash |  2 ++
 package/wsapi-xavante/wsapi-xavante.mk   | 12 ++++++++++++
 4 files changed, 28 insertions(+)
 create mode 100644 package/wsapi-xavante/Config.in
 create mode 100644 package/wsapi-xavante/wsapi-xavante.hash
 create mode 100644 package/wsapi-xavante/wsapi-xavante.mk

diff --git a/package/Config.in b/package/Config.in
index ba101dba4..5d7ec7f26 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -605,6 +605,7 @@ menu "Lua libraries/modules"
 	source "package/rings/Config.in"
 	source "package/turbolua/Config.in"
 	source "package/wsapi/Config.in"
+	source "package/wsapi-xavante/Config.in"
 	source "package/xavante/Config.in"
 endmenu
 endif
diff --git a/package/wsapi-xavante/Config.in b/package/wsapi-xavante/Config.in
new file mode 100644
index 000000000..70c725413
--- /dev/null
+++ b/package/wsapi-xavante/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_WSAPI_XAVANTE
+	bool "wsapi-xavante"
+	# Runtime dependency only
+	select BR2_PACKAGE_COXPCALL
+	select BR2_PACKAGE_RINGS
+	select BR2_PACKAGE_WSAPI
+	select BR2_PACKAGE_XAVANTE
+	help
+	  WSAPI is an API that abstracts the web server from Lua web
+	  applications. This is the rock that contains the Xavante adapter
+	  and launcher.
+
+	  http://keplerproject.github.com/wsapi/
diff --git a/package/wsapi-xavante/wsapi-xavante.hash b/package/wsapi-xavante/wsapi-xavante.hash
new file mode 100644
index 000000000..9e8132df5
--- /dev/null
+++ b/package/wsapi-xavante/wsapi-xavante.hash
@@ -0,0 +1,2 @@
+# locally computed hash
+sha256 b30b171e3d4d6fd7e129f14576e1cfc5adf00c0780ef8350f2f9e6f1d4259346  wsapi-xavante-1.6.1-1.src.rock
diff --git a/package/wsapi-xavante/wsapi-xavante.mk b/package/wsapi-xavante/wsapi-xavante.mk
new file mode 100644
index 000000000..937d2048a
--- /dev/null
+++ b/package/wsapi-xavante/wsapi-xavante.mk
@@ -0,0 +1,12 @@
+################################################################################
+#
+# wsapi-xavante
+#
+################################################################################
+
+WSAPI_XAVANTE_VERSION_MAJOR = 1.6.1
+WSAPI_XAVANTE_VERSION = $(WSAPI_XAVANTE_VERSION_MAJOR)-1
+WSAPI_XAVANTE_SUBDIR = wsapi-$(WSAPI_XAVANTE_VERSION_MAJOR)
+WSAPI_XAVANTE_LICENSE = MIT
+
+$(eval $(luarocks-package))
-- 
2.11.0
