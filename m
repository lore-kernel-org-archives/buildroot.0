From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 09:46:37 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add option to
 install Libertas USB thin firmware
Message-ID: <20190728074627.1808382884@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a98e39d06cd136e0e2aeef816ebc020601b30a03
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the soft MAC version of the firmware, used by the libertas_tf driver.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 8d83dd3437..f2658a97da 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -218,6 +218,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_OLPC
 	  Firmware files (OLPC mesh capable version) for the Marvell
 	  USB8388 module.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB_THINFIRM
+	bool "Libertas USB Thin Firmware"
+	help
+	  Firmware files (soft MAC) for the Marvell USB modules
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787
 	bool "Marvell Wifi-Ex 8787 SDIO"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 67820728b7..479a4d5635 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -201,6 +201,12 @@ LINUX_FIRMWARE_FILES += libertas/usb8388_olpc.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
 endif
 
+# lbtf usb
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB_THINFIRM),y)
+LINUX_FIRMWARE_FILES += lbtf_usb.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
 # sd8787
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787),y)
 LINUX_FIRMWARE_FILES += mrvl/sd8787_uapsta.bin
