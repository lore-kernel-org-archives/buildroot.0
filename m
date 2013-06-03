From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 3 Jun 2013 23:00:46 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: bump version for
	new firmware
Message-ID: <20130603211155.65BC99A1FC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3e650b8861542ba613bddad3d9b51d456bdeadc9
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump version to get a few new firmware files for some WiFi adapters.

In the rtl81xx familly, it's hard to differentiate each members: I have
a USB stick that identifies itself as TRL8188CUS, but is handled by the
rtl8192ce driver. So I moved all of rtl81xx firmwares under the same
option to avoid confusion.

It will be the responsibility of the user to eventually get rid of
unwanted firmware files in a post-build script, if needed.

Ditto for rtl87xx.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/linux-firmware/Config.in         |   12 ++++++------
 package/linux-firmware/linux-firmware.mk |   15 +++++++++------
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 9998f22..d9bb095 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -61,15 +61,15 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX
 	help
 	  Ralink rt27xx/rt28xx/rt30xx
 
-config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192
-	bool "Realtek 8192"
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX
+	bool "Realtek 81xx"
 	help
-	  Realtek 8192
+	  Realtek 8188/8192
 
-config BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712
-	bool "Realtek 8712"
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX
+	bool "Realtek 87xx"
 	help
-	  Realtek 8712
+	  Realtek 8712/8723
 
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127X"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 0cb08b4..0ba2b82 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -4,7 +4,7 @@
 #
 #############################################################
 
-LINUX_FIRMWARE_VERSION = 65a5163b8bb77bd7759efa3ca780867fcaed89b0
+LINUX_FIRMWARE_VERSION = 07ea598af5b9dde3acdf279846b062fa1b2987b8
 LINUX_FIRMWARE_SITE = http://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
 LINUX_FIRMWARE_SITE_METHOD = git
 
@@ -22,16 +22,19 @@ LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT2XX) += \
 	rt2860.bin rt2870.bin rt3070.bin rt3071.bin rt3090.bin 	\
 	LICENCE.ralink-firmware.txt
 
-# rtl8192
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8192) += \
+# rtl81xx
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX) += \
 	rtlwifi/rtl8192cfw.bin rtlwifi/rtl8192cfwU.bin 		\
 	rtlwifi/rtl8192cfwU_B.bin rtlwifi/rtl8192cufw.bin	\
 	rtlwifi/rtl8192defw.bin rtlwifi/rtl8192sefw.bin		\
+	rtlwifi/rtl8188efw.bin					\
 	LICENCE.rtlwifi_firmware.txt
 
-# rtl8712
-LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RTL_8712) += \
-	rtlwifi/rtl8712u.bin LICENCE.rtlwifi_firmware.txt
+# rtl87xx
+LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX) += \
+	rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin		\
+	rtlwifi/rtl8723fw_B.bin					\
+	LICENCE.rtlwifi_firmware.txt
 
 # ar7010
 LINUX_FIRMWARE_FILES_$(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010) += \
