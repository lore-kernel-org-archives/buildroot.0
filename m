From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 30 Mar 2020 17:31:41 +0300
Subject: [Buildroot] [PATCH] package/linux-firmware: Add Wilocity 6210 11ad
 firmware
Message-ID: <6c1b188c2a00e62ee950fd9987acfc0121afd39f.1585578701.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index fb884842d66b..914b514f80bd 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -345,6 +345,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX
 	help
 	  Firmware files for WLAN and Bluetooth modules wl18xx
 
+config BR2_PACKAGE_LINUX_FIRMWARE_WILOCITY_WIL6210
+	bool "Wilocity 6210"
+	help
+	  Firmware files for Qualcomm Atheros 11ad family of chips
+
 endmenu
 
 menu "Ethernet firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 21300ddc72de..e553a2a06383 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -373,6 +373,11 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_WILOCITY_WIL6210),y)
+LINUX_FIRMWARE_FILES += wil6210.*
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
 LINUX_FIRMWARE_FILES += iwlwifi-3160-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
-- 
2.25.1
