From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Tue, 26 Apr 2011 11:56:50 -0300
Subject: [Buildroot] [PATCH 3/4] usbutils: bump to version 002
In-Reply-To: <1303829811-13344-1-git-send-email-gustavo@zacarias.com.ar>
References: <1303829811-13344-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1303829811-13344-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Bump to version 002, no longer needs libusb-compat

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/usbutils/Config.in   |    1 -
 package/usbutils/usbutils.mk |    4 ++--
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 0aabc4a..fbd712b 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
 	depends on BR2_PROGRAM_INVOCATION
 	select BR2_PACKAGE_LIBUSB
-	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  USB enumeration utilities
 
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 46c889e..bd50a5f 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -4,9 +4,9 @@
 #
 #############################################################
 
-USBUTILS_VERSION = 0.91
+USBUTILS_VERSION = 002
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
-USBUTILS_DEPENDENCIES = host-pkg-config libusb-compat
+USBUTILS_DEPENDENCIES = host-pkg-config libusb
 
 ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 	USBUTILS_DEPENDENCIES += zlib
-- 
1.7.3.4
