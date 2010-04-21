From: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Date: Wed, 21 Apr 2010 16:43:59 +0300
Subject: [Buildroot] [RESEND PATCH] usbutils need libusb-compat
Message-ID: <20100421134358.27171.13601.stgit@pauliusz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
---

 package/usbutils/Config.in   |    2 +-
 package/usbutils/usbutils.mk |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/usbutils/Config.in b/package/usbutils/Config.in
index 23004d9..6e54352 100644
--- a/package/usbutils/Config.in
+++ b/package/usbutils/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_USBUTILS
 	bool "usbutils"
-	select BR2_PACKAGE_LIBUSB
+	select BR2_PACKAGE_LIBUSB_COMPAT
 	help
 	  USB enumeration utilities
 
diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index ef01403..880a2c8 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -6,7 +6,7 @@
 
 USBUTILS_VERSION = 0.86
 USBUTILS_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/linux-usb/
-USBUTILS_DEPENDENCIES = host-pkg-config
+USBUTILS_DEPENDENCIES = host-pkg-config libusb-compat
 
 ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 	USBUTILS_DEPENDENCIES += zlib
