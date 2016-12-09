From: Tal Shorer <tal.shorer@gmail.com>
Date: Fri,  9 Dec 2016 10:37:51 +0200
Subject: [Buildroot] [PATCH] usbip: add a new package
Message-ID: <1481272671-6491-1-git-send-email-tal.shorer@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add usbip tools (usbip, usbipd) from the running linux source

Signed-off-by: Tal Shorer <tal.shorer@gmail.com>
---
 package/Config.in       |  1 +
 package/usbip/Config.in |  9 +++++++++
 package/usbip/usbip.mk  | 18 ++++++++++++++++++
 3 files changed, 28 insertions(+)
 create mode 100644 package/usbip/Config.in
 create mode 100644 package/usbip/usbip.mk

diff --git a/package/Config.in b/package/Config.in
index 9ed296f..8d8f410 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -476,6 +476,7 @@ endmenu
 	source "package/usb_modeswitch/Config.in"
 	source "package/usb_modeswitch_data/Config.in"
 	source "package/usbmount/Config.in"
+	source "package/usbip/Config.in"
 	source "package/usbutils/Config.in"
 	source "package/w_scan/Config.in"
 	source "package/wf111/Config.in"
diff --git a/package/usbip/Config.in b/package/usbip/Config.in
new file mode 100644
index 0000000..580c917
--- /dev/null
+++ b/package/usbip/Config.in
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_USBIP
+	bool "usbip"
+	depends on !BR2_STATIC_LIBS
+	help
+	  epic stuff
+
+if BR2_PACKAGE_USBIP
+
+endif
diff --git a/package/usbip/usbip.mk b/package/usbip/usbip.mk
new file mode 100644
index 0000000..e6bd7f7
--- /dev/null
+++ b/package/usbip/usbip.mk
@@ -0,0 +1,18 @@
+################################################################################
+#
+# usbib
+#
+################################################################################
+
+USBIP_SITE = $(LINUX_DIR)/tools/usb/usbip
+USBIP_SITE_METHOD = local
+USBIP_LICENSE = GPLv2+
+USBIP_LICENSE_FILES = COPYING
+USBIP_INSTALL_STAGING = YES
+USBIP_DEPENDENCIES = linux
+
+USBIP_AUTORECONF = YES
+
+USBIP_DEPENDENCIES += host-automake host-autoconf host-libtool
+
+$(eval $(autotools-package))
-- 
2.7.4
