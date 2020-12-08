From: Thomas De Schampheleire <patrickdepinguin@gmail.com>
Date: Tue,  8 Dec 2020 19:05:24 +0100
Subject: [Buildroot] [PATCH 1/5] package/jszip: new package
Message-ID: <20201208180529.9152-1-patrickdepinguin@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Joeri Barbarien <joeri.barbarien@nokia.com>

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/jszip/Config.in  |  7 +++++++
 package/jszip/jszip.hash |  3 +++
 package/jszip/jszip.mk   | 17 +++++++++++++++++
 5 files changed, 29 insertions(+)
 create mode 100644 package/jszip/Config.in
 create mode 100644 package/jszip/jszip.hash
 create mode 100644 package/jszip/jszip.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 9ab1e125f4..5cb272e7ae 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2503,6 +2503,7 @@ N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
 F:	package/cereal/
 F:	package/chartjs/
+F:	package/jszip/
 F:	package/libtelnet/
 F:	package/opkg-utils/
 F:	package/perl-convert-asn1/
diff --git a/package/Config.in b/package/Config.in
index 016a99ed1a..5fb6eaeccf 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1586,6 +1586,7 @@ endmenu
 endif
 	source "package/jsmin/Config.in"
 	source "package/json-javascript/Config.in"
+	source "package/jszip/Config.in"
 	source "package/openlayers/Config.in"
 	source "package/spidermonkey/Config.in"
 	source "package/vuejs/Config.in"
diff --git a/package/jszip/Config.in b/package/jszip/Config.in
new file mode 100644
index 0000000000..455891ab12
--- /dev/null
+++ b/package/jszip/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_JSZIP
+	bool "jszip"
+	help
+	  JSZip is a javascript library for creating, reading and
+	  editing .zip files, with a lovely and simple API.
+
+	  https://stuk.github.io/jszip
diff --git a/package/jszip/jszip.hash b/package/jszip/jszip.hash
new file mode 100644
index 0000000000..13a7765ed9
--- /dev/null
+++ b/package/jszip/jszip.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	e5343decfb781b15c54c0df9ddedd6c8518c800a4667a0a95741c694a4f38d34  jszip-v3.2.2.tar.gz
+sha256	14450c78405ad2a2173e25740b56406556779149df9c4c83523a8c63d0686210  LICENSE.markdown
diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
new file mode 100644
index 0000000000..0e20f4c40e
--- /dev/null
+++ b/package/jszip/jszip.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# jszip
+#
+################################################################################
+
+JSZIP_VERSION = v3.2.2
+JSZIP_SITE = $(call github,Stuk,jszip,$(JSZIP_VERSION))
+JSZIP_LICENSE = MIT
+JSZIP_LICENSE_FILES = LICENSE.markdown
+
+define JSZIP_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/dist/jszip.min.js \
+		$(TARGET_DIR)/var/www/jszip/js/jszip.min.js
+endef
+
+$(eval $(generic-package))
-- 
2.26.2
