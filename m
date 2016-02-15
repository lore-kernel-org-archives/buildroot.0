From: Matt Weber <matt@thewebers.ws>
Date: Mon, 15 Feb 2016 04:27:28 +0000
Subject: [Buildroot] [PATCH 1/1] linux-firmware: add support for MT7601u
Message-ID: <1455510448-28443-1-git-send-email-matt@thewebers.ws>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

MT7601u is a MediaTek Wifi 802.11n dongle
(New chipset from the combined ralink/mediaTek company)

Signed-off-by: Matt Weber <matt@thewebers.ws>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 6 ++++++
 2 files changed, 11 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index d838986..97d64ca 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -189,6 +189,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_MWIFIEX_PCIE8897
 	help
 	  Firmware files for the Marvell Wifi-Ex 8897 module on PCI-E.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U
+	bool "MediaTek MT7601U"
+	help
+	  MediaTek MT7601U
+
 config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61
 	bool "Ralink rt2501/rt61"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 083a381..4667c4c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -165,6 +165,12 @@ LINUX_FIRMWARE_FILES += mrvl/pcie8897_uapsta.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.Marvell
 endif
 
+# MT7601
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_MEDIATEK_MT7601U),y)
+LINUX_FIRMWARE_FILES += mt7601u.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ralink_a_mediatek_company_firmware
+endif
+
 # wl127x
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X),y)
 # wl1271-nvs.bin is a symlink to wl127x-nvs.bin
-- 
1.9.1
