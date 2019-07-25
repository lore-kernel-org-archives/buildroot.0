From: Lubomir Rintel <lkundrak@v3.sk>
Date: Thu, 25 Jul 2019 10:05:50 +0200
Subject: [Buildroot] [PATCH 1/3] package/linux-firmware: add option to
 install Libertas 8388 firmware
In-Reply-To: <20190725080552.3135051-1-lkundrak@v3.sk>
References: <20190725080552.3135051-1-lkundrak@v3.sk>
Message-ID: <20190725080552.3135051-2-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Version 9 only. There's also version 5, but that probably is only for
very very old kernels.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
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
index 500050f284..1828887fc6 100644
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
-- 
2.21.0
