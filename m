From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Thu, 4 Aug 2011 21:22:19 +0200
Subject: [Buildroot] [git commit] udev: bump to 173
Message-ID: <20110804192913.333418B73C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=db185234b4ce7687868ac662fc2a14098f90dcf8
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/udev/udev.mk |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/udev/udev.mk b/package/udev/udev.mk
index 6d87ad3..567bbfb 100644
--- a/package/udev/udev.mk
+++ b/package/udev/udev.mk
@@ -3,7 +3,7 @@
 # udev
 #
 #############################################################
-UDEV_VERSION = 172
+UDEV_VERSION = 173
 UDEV_SOURCE = udev-$(UDEV_VERSION).tar.bz2
 UDEV_SITE = $(BR2_KERNEL_MIRROR)/linux/utils/kernel/hotplug/
 
@@ -19,11 +19,11 @@ ifeq ($(BR2_PACKAGE_UDEV_ALL_EXTRAS),y)
 UDEV_DEPENDENCIES += libusb libusb-compat acl usbutils hwdata libglib2
 UDEV_CONF_OPT +=							\
 	--with-pci-ids-path=$(TARGET_DIR)/usr/share/hwdata/pci.ids	\
-	--with-usb-ids-path=$(TARGET_DIR)/usr/share/hwdata/usb.ids
+	--with-usb-ids-path=$(TARGET_DIR)/usr/share/hwdata/usb.ids	\
+	--enable-udev_acl
 else
 UDEV_CONF_OPT +=		\
 	--disable-hwdb		\
-	--disable-udev_acl	\
 	--disable-gudev
 endif
 
-- 
1.7.3.4
