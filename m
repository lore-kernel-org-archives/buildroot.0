From: Yegor Yefremov <yegor_sub1@visionsystems.de>
Date: Tue, 02 Aug 2011 10:00:16 +0200
Subject: [Buildroot] [PATCH] udev: bump to 173
Message-ID: <4E37AE90.2080008@visionsystems.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/udev/udev.mk |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

Index: b/package/udev/udev.mk
===================================================================
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
 
@@ -19,11 +19,11 @@
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
 
