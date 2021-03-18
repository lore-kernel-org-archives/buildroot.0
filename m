From: Peter Seiderer <ps.report@gmx.net>
Date: Thu, 18 Mar 2021 20:55:41 +0100
Subject: [Buildroot] [PATCH v1] package/linux-firmware: add option for
 Marvell 8997 wifi cards
Message-ID: <20210318195541.20647-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index a41310ff2a..3978782a7e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -294,6 +294,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIE8897
 	help
 	  Firmware files for the Marvell Wifi-Ex 8897 module on PCI-E.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIEUART8997
+	bool "Marvell Wifi-Ex 8997 PCI-E/UART
+	help
+	  Firmware files for the Marvell Wifi-Ex 8997 module on PCI-E/UART.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIEUSB8997
+	bool "Marvell Wifi-Ex 8997 PCI-E/USB"
+	help
+	  Firmware files for the Marvell Wifi-Ex 8997 module on PCI-E/USB.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U
 	bool "MediaTek MT7601U"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6652758c87..f211cfc68b 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -297,6 +297,18 @@ LINUX_FIRMWARE_FILES += mrvl/pcie8897_uapsta.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
 endif
 
+# pcieuart8997
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIEUART8997),y)
+LINUX_FIRMWARE_FILES += mrvl/pcieuart8997_combo_v4.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
+# pcieusb8997
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIEUSB8997),y)
+LINUX_FIRMWARE_FILES += mrvl/pcieusb8997_combo_v4.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
+endif
+
 # MT7601
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U),y)
 LINUX_FIRMWARE_FILES += mt7601u.bin
-- 
2.30.2
