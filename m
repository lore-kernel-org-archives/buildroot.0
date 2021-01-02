From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 2 Jan 2021 11:31:58 +0100
Subject: [Buildroot] [git commit] package/jszip: new package
Message-ID: <20210102101427.B54EB834E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e879e007c6da9022d4bb47a1f4139d91b2ca6440
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Joeri Barbarien <joeri.barbarien@nokia.com>
Signed-off-by: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS               |  1 +
 package/Config.in        |  1 +
 package/jszip/Config.in  |  7 +++++++
 package/jszip/jszip.hash |  3 +++
 package/jszip/jszip.mk   | 17 +++++++++++++++++
 5 files changed, 29 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index f02011cd49..6ff5a31a1d 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2515,6 +2515,7 @@ N:	Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
 F:	docs/manual/
 F:	package/cereal/
 F:	package/chartjs/
+F:	package/jszip/
 F:	package/libtelnet/
 F:	package/opkg-utils/
 F:	package/perl-convert-asn1/
diff --git a/package/Config.in b/package/Config.in
index 4690c54a66..9e8f354d1b 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1597,6 +1597,7 @@ endmenu
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
index 0000000000..13a2076ade
--- /dev/null
+++ b/package/jszip/jszip.hash
@@ -0,0 +1,3 @@
+# Locally computed:
+sha256	e5343decfb781b15c54c0df9ddedd6c8518c800a4667a0a95741c694a4f38d34  jszip-3.2.2.tar.gz
+sha256	14450c78405ad2a2173e25740b56406556779149df9c4c83523a8c63d0686210  LICENSE.markdown
diff --git a/package/jszip/jszip.mk b/package/jszip/jszip.mk
new file mode 100644
index 0000000000..04bd0a7b34
--- /dev/null
+++ b/package/jszip/jszip.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# jszip
+#
+################################################################################
+
+JSZIP_VERSION = 3.2.2
+JSZIP_SITE = $(call github,Stuk,jszip,v$(JSZIP_VERSION))
+JSZIP_LICENSE = MIT or GPL-3.0
+JSZIP_LICENSE_FILES = LICENSE.markdown
+
+define JSZIP_INSTALL_TARGET_CMDS
+	$(INSTALL) -m 0644 -D $(@D)/dist/jszip.min.js \
+		$(TARGET_DIR)/var/www/jszip/js/jszip.min.js
+endef
+
+$(eval $(generic-package))
