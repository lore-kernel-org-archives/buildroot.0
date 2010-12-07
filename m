From: heiko at zuerker.org <heiko@zuerker.org>
Date: Tue,  7 Dec 2010 10:53:43 -0600
Subject: [Buildroot] [PATCH] install usbutils into staging to make newer
	udev versions happy
Message-ID: <99428afcc57c6948b9a0e533bd3e5378ad0f4ff0.1291740814.git.smiley73@users.sourceforge.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Heiko Zuerker <smiley73@users.sourceforge.net>


Signed-off-by: Heiko Zuerker <smiley73@users.sourceforge.net>
---
 package/usbutils/usbutils.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/usbutils/usbutils.mk b/package/usbutils/usbutils.mk
index 508ca0d..b2f158b 100644
--- a/package/usbutils/usbutils.mk
+++ b/package/usbutils/usbutils.mk
@@ -7,6 +7,7 @@
 USBUTILS_VERSION = 0.90
 USBUTILS_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/usb/usbutils
 USBUTILS_DEPENDENCIES = host-pkg-config libusb-compat
+USBUTILS_INSTALL_STAGING=YES
 
 ifeq ($(BR2_PACKAGE_USBUTILS_ZLIB),y)
 	USBUTILS_DEPENDENCIES += zlib
-- 
1.7.3.2
