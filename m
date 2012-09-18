From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
Date: Tue, 18 Sep 2012 14:15:37 +0200
Subject: [Buildroot] [PATCH 1/2] pcsc-lite: new package
Message-ID: <1347970538-25087-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Middleware to access a smart card using SCard API (PC/SC).

http://pcsclite.alioth.debian.org/

Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
---
 package/Config.in              |    1 +
 package/pcsc-lite/Config.in    |    6 ++++++
 package/pcsc-lite/pcsc-lite.mk |   13 +++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/pcsc-lite/Config.in
 create mode 100644 package/pcsc-lite/pcsc-lite.mk

diff --git a/package/Config.in b/package/Config.in
index a4e0b2c..dcc84b6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -395,6 +395,7 @@ source "package/libusb/Config.in"
 source "package/libusb-compat/Config.in"
 source "package/libv4l/Config.in"
 source "package/mtdev/Config.in"
+source "package/pcsc-lite/Config.in"
 endmenu
 
 menu "Javascript"
diff --git a/package/pcsc-lite/Config.in b/package/pcsc-lite/Config.in
new file mode 100644
index 0000000..7c26427
--- /dev/null
+++ b/package/pcsc-lite/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_PCSC_LITE
+	bool "pcsc-lite"
+	help
+	  Middleware to accesss smart card using SCard API (PC/SC).
+
+	  http://pcsclite.alioth.debian.org/
diff --git a/package/pcsc-lite/pcsc-lite.mk b/package/pcsc-lite/pcsc-lite.mk
new file mode 100644
index 0000000..eb807f0
--- /dev/null
+++ b/package/pcsc-lite/pcsc-lite.mk
@@ -0,0 +1,13 @@
+##########################################################
+#
+# PCSC-Lite
+#
+# ########################################################
+PCSC_LITE_VERSION = 1.8.6
+PCSC_LITE_SOURCE = pcsc-lite-$(PCSC_LITE_VERSION).tar.bz2
+PCSC_LITE_SITE = https://alioth.debian.org/frs/download.php/3757
+PCSC_LITE_INSTALL_STAGING = YES
+PCSC_LITE_CONF_OPT = --disable-libudev --enable-libusb
+PCSC_LITE_DEPENDENCIES = libusb
+
+$(eval $(call autotools-package))
-- 
1.7.10
