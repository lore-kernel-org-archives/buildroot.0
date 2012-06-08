From: spdawson at gmail.com <spdawson@gmail.com>
Date: Fri,  8 Jun 2012 14:37:25 +0100
Subject: [Buildroot] [PATCH] libfreefare: new package
Message-ID: <1339162645-25335-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                  |    1 +
 package/libfreefare/Config.in      |    7 +++++++
 package/libfreefare/libfreefare.mk |   10 ++++++++++
 3 files changed, 18 insertions(+)
 create mode 100644 package/libfreefare/Config.in
 create mode 100644 package/libfreefare/libfreefare.mk

diff --git a/package/Config.in b/package/Config.in
index 2b69c57..039bfce 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -362,6 +362,7 @@ menu "Hardware handling"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
+source "package/libfreefare/Config.in"
 source "package/libftdi/Config.in"
 source "package/libhid/Config.in"
 source "package/libiqrf/Config.in"
diff --git a/package/libfreefare/Config.in b/package/libfreefare/Config.in
new file mode 100644
index 0000000..2e11f7e
--- /dev/null
+++ b/package/libfreefare/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_LIBFREEFARE
+	bool "libfreefare"
+	select BR2_PACKAGE_LIBNFC
+	help
+	  Library for high level manipulation of MIFARE cards.
+
+	  http://code.google.com/p/nfc-tools/wiki/libfreefare
diff --git a/package/libfreefare/libfreefare.mk b/package/libfreefare/libfreefare.mk
new file mode 100644
index 0000000..0499999
--- /dev/null
+++ b/package/libfreefare/libfreefare.mk
@@ -0,0 +1,10 @@
+#############################################################
+#
+# libfreefare
+#
+#############################################################
+LIBFREEFARE_VERSION = 0.3.2
+LIBFREEFARE_SITE = http://nfc-tools.googlecode.com/files
+LIBFREEFARE_DEPENDENCIES = libnfc
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.9.5
