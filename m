From: Lubomir Rintel <lkundrak@v3.sk>
Date: Thu, 25 Jul 2019 10:05:51 +0200
Subject: [Buildroot] [PATCH 2/3] package/linux-firmware: add option to
 install Libertas 8388 OLPC firmware
In-Reply-To: <20190725080552.3135051-1-lkundrak@v3.sk>
References: <20190725080552.3135051-1-lkundrak@v3.sk>
Message-ID: <20190725080552.3135051-3-lkundrak@v3.sk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the OLPC version used by the usb8xxx driver, preferrably to the
v9 firmware. This implements the OLPC-specific meshing protocol and acts
as a mesh point even in machine suspend.

Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 9370e30d08..d29aad03ef 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -212,6 +212,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_V9
 	help
 	  Firmware files (version 9) for the Marvell USB8388 module
 
+config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_USB8388_OLPC
+	bool "Libertas USB 8388 OLPC"
+	help
+	  Firmware files (OLPC mesh capable version) for the Marvell USB8388 module
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_SD8787
 	bool "Marvell Wifi-Ex 8787 SDIO"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 1828887fc6..44cabda971 100644
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
-- 
2.21.0
