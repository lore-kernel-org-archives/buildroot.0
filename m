From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 28 Jul 2019 09:45:29 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add option to
 install Libertas 8388 firmware
Message-ID: <20190728074626.EDC8182B3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7bab17506656efc1191f8ad786bd7bf37b3050e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Version 9 only. There's also version 5, but that probably is only for
very very old kernels.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 2feec503f4..9370e30d08 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -207,6 +207,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8688
 	help
 	  Firmware files for the Marvell SD8688 module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_V9
+	bool "Libertas USB 8388 v9"
+	help
+	  Firmware files (version 9) for the Marvell USB8388 module
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787
 	bool "Marvell Wifi-Ex 8787 SDIO"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 1da323826c..6dbfbf1b4c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -189,6 +189,12 @@ LINUX_FIRMWARE_FILES += mrvl/sd8688.bin mrvl/sd8688_helper.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
 endif
 
+# usb8388 v9
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_V9),y)
+LINUX_FIRMWARE_FILES += libertas/usb8388_v9.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
 # sd8787
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787),y)
 LINUX_FIRMWARE_FILES += mrvl/sd8787_uapsta.bin
