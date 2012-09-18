From: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
Date: Tue, 18 Sep 2012 14:19:32 +0200
Subject: [Buildroot] [PATCH 2/2] ccid: new package
In-Reply-To: <1347970538-25087-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
References: <1347970538-25087-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
Message-ID: <1347970772-25135-1-git-send-email-waldemar.rymarkiewicz@tieto.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

PC/SC driver for USB CCID smart card readers.

http://pcsclite.alioth.debian.org/ccid.html

Signed-off-by: Waldemar Rymarkiewicz <waldemar.rymarkiewicz@tieto.com>
---
 package/Config.in      |    1 +
 package/ccid/Config.in |    7 +++++++
 package/ccid/ccid.mk   |   12 ++++++++++++
 3 files changed, 20 insertions(+)
 create mode 100644 package/ccid/Config.in
 create mode 100644 package/ccid/ccid.mk

diff --git a/package/Config.in b/package/Config.in
index dcc84b6..a0fb593 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -382,6 +382,7 @@ source "package/zxing/Config.in"
 endmenu
 
 menu "Hardware handling"
+source "package/ccid/Config.in"
 source "package/libaio/Config.in"
 source "package/libraw1394/Config.in"
 source "package/tslib/Config.in"
diff --git a/package/ccid/Config.in b/package/ccid/Config.in
new file mode 100644
index 0000000..b9bf0b2
--- /dev/null
+++ b/package/ccid/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_CCID
+	bool "ccid"
+	select BR2_PACKAGE_PCSC_LITE
+	help
+	  PC/SC driver for USB CCID smart card readers
+
+	  http://pcsclite.alioth.debian.org/ccid.html
diff --git a/package/ccid/ccid.mk b/package/ccid/ccid.mk
new file mode 100644
index 0000000..a79f5ca
--- /dev/null
+++ b/package/ccid/ccid.mk
@@ -0,0 +1,12 @@
+##########################################################
+#
+# CCID
+#
+# ########################################################
+CCID_VERSION = 1.4.7
+CCID_SOURCE = ccid-$(CCID_VERSION).tar.bz2
+CCID_SITE = https://alioth.debian.org/frs/download.php/3730
+CCID_INSTALL_STAGING = YES
+CCID_DEPENDENCIES = pcsc-lite libusb
+
+$(eval $(call autotools-package))
-- 
1.7.10
