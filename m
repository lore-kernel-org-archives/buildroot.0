From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Mar 2021 21:48:42 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: add option for
 Marvell 8997 wifi cards
Message-ID: <20210320202557.8518A865CB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b0d2da558345c5b3383d8c4ed4885ce36f7f8fc4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 12 ++++++++++++
 package/linux-firmware/linux-firmware.mk | 12 ++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index ba3322fa18..4cf39ddbc1 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -304,6 +304,18 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIE8897
 	help
 	  Firmware files for the Marvell Wifi-Ex 8897 module on PCI-E.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIEUART8997
+	bool "Marvell Wifi-Ex 8997 PCI-E/UART
+	help
+	  Firmware files for the Marvell Wifi-Ex 8997 module on
+	  PCI-E/UART.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIEUSB8997
+	bool "Marvell Wifi-Ex 8997 PCI-E/USB"
+	help
+	  Firmware files for the Marvell Wifi-Ex 8997 module on
+	  PCI-E/USB.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U
 	bool "MediaTek MT7601U"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index edb0f40594..9adab67bf1 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -318,6 +318,18 @@ LINUX_FIRMWARE_FILES += mrvl/pcie8897_uapsta.bin
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
