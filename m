From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 21 Apr 2010 16:02:29 +0200
Subject: [Buildroot] [git commit master] usbutils need libusb-compat
Message-ID: <20100421140604.067D98DC92@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=ab0a176febabb9762ee0c9c04eac1ed45cb74947
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Paulius Zaleckas <paulius.zaleckas@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
-- 
1.6.3.3
