From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 09:46:30 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add option to
 install Libertas 8388 OLPC firmware
Message-ID: <20190728074627.0AE5282B3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=078e1b0f0eb7c5f5181cc6fde8c8a5350b82038a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This is the OLPC version used by the usb8xxx driver, preferrably to the
v9 firmware. This implements the OLPC-specific meshing protocol and acts
as a mesh point even in machine suspend.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 9370e30d08..8d83dd3437 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -212,6 +212,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_V9
 	help
 	  Firmware files (version 9) for the Marvell USB8388 module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_OLPC
+	bool "Libertas USB 8388 OLPC"
+	help
+	  Firmware files (OLPC mesh capable version) for the Marvell
+	  USB8388 module.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787
 	bool "Marvell Wifi-Ex 8787 SDIO"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6dbfbf1b4c..67820728b7 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -195,6 +195,12 @@ LINUX_FIRMWARE_FILES += libertas/usb8388_v9.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
 endif
 
+# usb8388 olpc
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_OLPC),y)
+LINUX_FIRMWARE_FILES += libertas/usb8388_olpc.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
 # sd8787
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787),y)
 LINUX_FIRMWARE_FILES += mrvl/sd8787_uapsta.bin
