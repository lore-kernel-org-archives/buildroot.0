From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon,  6 Dec 2010 16:45:08 -0300
Subject: [Buildroot] [PATCH] usbutils: bump to version 0.91
Message-ID: <1291664708-28035-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usbutils/Config.in   |    4 ++++
 package/usbutils/usbutils.mk |    2 +-
 2 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 4273252..0aabc4a 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,5 +1,9 @@
+comment "usbutils requires a toolchain with PROGRAM_INVOCATION support"
+	depends on !BR2_PROGRAM_INVOCATION
+
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
+	depends on BR2_PROGRAM_INVOCATION
 	select BR2_PACKAGE_LIBUSB
 	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 508ca0d..46c889e 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 0.90
+USBUTILS_VERSION = 0.91
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkg-config libusb-compat
 
-- 
1.7.2.2
