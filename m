From: stefan.nickl at gmail.com <stefan.nickl@gmail.com>
Date: Sun, 18 Sep 2016 10:00:41 +0200
Subject: [Buildroot] [PATCH] linux-firmware: Add switch for marvell usb8801
Message-ID: <1474185641-22843-1-git-send-email-Stefan.Nickl@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: snickl <snickl>

Hi,
    
unfortunately my ppp/musl endeavors were forestalled by some Makefile
weirdness. In the meantime, here is adding an option for the Marvell
8801 WIFI USB firmware.

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>

---

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index f56f31d..b9f7c85 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -161,6 +161,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8797
 	help
 	  Firmware files for the Marvell Wifi-Ex 8797 module on USB.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8801
+	bool "Marvell Wifi-Ex 8801 USB"
+	help
+	  Firmware files for the Marvell Wifi-Ex 8801 module on USB.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8887
 	bool "Marvell Wifi-Ex 8887 SDIO"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 1401848..3bbd7c0 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -141,6 +141,12 @@ LINUX_FIRMWARE_FILES += mrvl/usb8797_uapsta.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
 endif
 
+# usb8801
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8801),y)
+LINUX_FIRMWARE_FILES += mrvl/usb8801_uapsta.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
 # sd8887
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8887),y)
 LINUX_FIRMWARE_FILES += mrvl/sd8887_uapsta.bin
-- 
2.7.4
