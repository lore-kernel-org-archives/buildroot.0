From: Lubomir Rintel <lkundrak@v3.sk>
Date: Thu, 25 Jul 2019 10:05:52 +0200
Subject: [Buildroot] [PATCH 3/3] package/linux-firmware: add option to
 install Libertas USB thin firmware
In-Reply-To: <20190725080552.3135051-1-lkundrak@v3.sk>
References: <20190725080552.3135051-1-lkundrak@v3.sk>
Message-ID: <20190725080552.3135051-4-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the soft MAC version of the firmware, used by the libertas_tf driver.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index d29aad03ef..d969a58d0f 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -217,6 +217,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_OLPC
 	help
 	  Firmware files (OLPC mesh capable version) for the Marvell USB8388 module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB_THINFIRM
+	bool "Libertas USB Thin Firmware"
+	help
+	  Firmware files (soft MAC) for the Marvell USB modules
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787
 	bool "Marvell Wifi-Ex 8787 SDIO"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 44cabda971..2aee635286 100644
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
-- 
2.21.0
