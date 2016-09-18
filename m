From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 18 Sep 2016 16:50:55 +0200
Subject: [Buildroot] [git commit] linux-firmware: add option for Marvell
	usb8801 firmware
Message-ID: <20160918145110.E243681EFB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=55a86aa6367e66ce1d8f210ea42b544cf9269c53
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Stefan Nickl <Stefan.Nickl@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 79af71e..23738ce 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -171,6 +171,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8797
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
index d5a035e..8d8b7b2 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -147,6 +147,12 @@ LINUX_FIRMWARE_FILES += mrvl/usb8797_uapsta.bin
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
