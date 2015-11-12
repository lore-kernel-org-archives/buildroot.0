From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 12 Nov 2015 22:43:55 +0100
Subject: [Buildroot] [git commit branch/next] linux-firmware: menu entries
	for mwifiex blobs
Message-ID: <20151112214840.C158B81DFA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cb8db0b2d3f561ca7aba7b945118c525bfc9cb3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Firmware blobs for Marvell WiFi-Ex 8797, 8887, 8897 were already
there in linux-firmware tree but relevant options were not in Config.in.

Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/Config.in         |   30 +++++++++++++++++++++++++
 package/linux-firmware/linux-firmware.mk |   36 ++++++++++++++++++++++++++++++
 2 files changed, 66 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 2e4c205..32e9c6e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -159,6 +159,36 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787
 	help
 	  Firmware files for the Marvell Wifi-Ex 8787 module on SDIO.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797
+	bool "Marvell Wifi-Ex SD 8797"
+	help
+	  Firmware files for the Marvell Wifi-Ex 8797 module on SDIO.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8797
+	bool "Marvell Wifi-Ex USB 8797"
+	help
+	  Firmware files for the Marvell Wifi-Ex 8797 module on USB.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8887
+	bool "Marvell Wifi-Ex SD 8887"
+	help
+	  Firmware files for the Marvell Wifi-Ex 8887 module on SDIO.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8897
+	bool "Marvell Wifi-Ex SD 8897"
+	help
+	  Firmware files for the Marvell Wifi-Ex 8897 module on SDIO.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8897
+	bool "Marvell Wifi-Ex USB 8897"
+	help
+	  Firmware files for the Marvell Wifi-Ex 8897 module on USB.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIE8897
+	bool "Marvell Wifi-Ex PCI-E 8897"
+	help
+	  Firmware files for the Marvell Wifi-Ex 8897 module on PCI-E.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
 	bool "Ralink rt2501/rt61"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 768f3c4..d3efd65 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -129,6 +129,42 @@ LINUX_FIRMWARE_FILES += mrvl/sd8787_uapsta.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
 endif
 
+# sd8797
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8797),y)
+LINUX_FIRMWARE_FILES += mrvl/sd8797_uapsta.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
+# usb8797
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8797),y)
+LINUX_FIRMWARE_FILES += mrvl/usb8797_uapsta.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
+# sd8887
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8887),y)
+LINUX_FIRMWARE_FILES += mrvl/sd8887_uapsta.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
+# sd8897
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8897),y)
+LINUX_FIRMWARE_FILES += mrvl/sd8897_uapsta.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
+# usb8897
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_USB8897),y)
+LINUX_FIRMWARE_FILES += mrvl/usb8897_uapsta.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
+# pcie8897
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIE8897),y)
+LINUX_FIRMWARE_FILES += mrvl/pcie8897_uapsta.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
 # wl127x
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
 # wl1271-nvs.bin is a symlink to wl127x-nvs.bin
