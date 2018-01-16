From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 16 Jan 2018 09:21:14 +0100
Subject: [Buildroot] [git commit] linux-firmware: install missing firmware
 files for rtlwifi
Message-ID: <20180116082259.0E0C4837D0@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e58682967fd845d877cd60403f423183690810be
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

All the rtlwifi firmware files were not installed, so added the
missing ones.

Signed-off-by: Romain Reignier <rom.reignier@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 15 ++++++++++++---
 1 file changed, 12 insertions(+), 3 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9515f5e..3f7b79f 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -70,7 +70,9 @@ LINUX_FIRMWARE_FILES += \
 	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin \
 	rtlwifi/rtl8188efw.bin rtlwifi/rtl8188eufw.bin \
 	rtlwifi/rtl8192cufw_A.bin \
-	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin
+	rtlwifi/rtl8192cufw_B.bin rtlwifi/rtl8192cufw_TMSC.bin \
+	rtlwifi/rtl8192eefw.bin rtlwifi/rtl8192eu_ap_wowlan.bin \
+	rtlwifi/rtl8192eu_nic.bin rtlwifi/rtl8192eu_wowlan.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
@@ -78,7 +80,13 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX),y)
 LINUX_FIRMWARE_FILES += \
 	rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin \
-	rtlwifi/rtl8723fw_B.bin rtlwifi/rtl8723befw.bin
+	rtlwifi/rtl8723fw_B.bin rtlwifi/rtl8723befw.bin \
+	rtlwifi/rtl8723aufw_A.bin rtlwifi/rtl8723aufw_B.bin \
+	rtlwifi/rtl8723aufw_B_NoBT.bin rtlwifi/rtl8723befw.bin \
+	rtlwifi/rtl8723bs_ap_wowlan.bin rtlwifi/rtl8723bs_bt.bin \
+	rtlwifi/rtl8723bs_nic.bin rtlwifi/rtl8723bs_wowlan.bin \
+	rtlwifi/rtl8723bu_ap_wowlan.bin rtlwifi/rtl8723bu_nic.bin \
+	rtlwifi/rtl8723bu_wowlan.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
@@ -86,7 +94,8 @@ endif
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX),y)
 LINUX_FIRMWARE_FILES += \
 	rtlwifi/rtl8821aefw.bin \
-	rtlwifi/rtl8821aefw_wowlan.bin
+	rtlwifi/rtl8821aefw_wowlan.bin \
+	rtlwifi/rtl8821aefw_29.bin rtlwifi/rtl8822befw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
