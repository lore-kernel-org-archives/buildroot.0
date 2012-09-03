From: yegorslists at googlemail.com <yegorslists@googlemail.com>
Date: Mon,  3 Sep 2012 10:37:46 +0200
Subject: [Buildroot] [PATCH 2/2] linux-firmware: add Realtek firmware
In-Reply-To: <1346661466-24431-1-git-send-email-yegorslists@googlemail.com>
References: <1346661466-24431-1-git-send-email-yegorslists@googlemail.com>
Message-ID: <1346661466-24431-2-git-send-email-yegorslists@googlemail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Yegor Yefremov <yegorslists@googlemail.com>

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/linux-firmware/Config.in         |   14 ++++++++++++++
 package/linux-firmware/linux-firmware.mk |   11 +++++++++++
 2 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 5166800..c494f0f 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -41,6 +41,20 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX
 
 endmenu
 
+menu "Realtek"
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192
+	bool "Realtek 8192"
+	help
+	  Realtek 8192
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
+	bool "Realtek 8712"
+	help
+	  Realtek 8712
+
+endmenu
+
 menu "Texas Instruments"
 
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index c71dc15..28c551f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -21,6 +21,17 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX) += \
 	rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin 	\
 	LICENCE.ralink-firmware.txt
 
+# rtl8192
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192) += \
+	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin 		\
+	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin	\
+	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin		\
+	LICENCE.rtlwifi_firmware.txt
+
+# rtl8712
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712) += \
+	rtlwifi/rtl8712u.bin LICENCE.rtlwifi_firmware.txt
+
 # ar7010
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010) += \
 	LICENCE.atheros_firmware ar7010.fw ar7010_1_1.fw htc_7010.fw
-- 
1.7.7
