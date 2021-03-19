From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Mar 2021 21:15:09 +0100
Subject: [Buildroot] [git commit] package/linux-firmware: add
 RTL87XX/RTL88XX Bluetooth firmware
Message-ID: <20210319200711.5060982211@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7ba4ad4623d5bae08318d80a98d2be810d7e016c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add firmware files for Realtek 87XX and 88XX Bluetooth chipsets. Those
are supported by the upstream Realtek Bluetooth driver CONFIG_BT_RTL.

Signed-off-by: Stefan Agner <stefan@agner.ch>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 21 +++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index a41310ff2a..ba3322fa18 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -79,6 +79,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_AR3012_USB
 	help
 	  Firmware files for Atheros bluetooth chipset AR3012 on USB.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT
+	bool "Realtek 87xx Bluetooth"
+	help
+	  Realtek 8723a/8723b/8723bs/8723d/8723ds/8761a
+
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT
+	bool "Realtek 88xx Bluetooth"
+	help
+	  Realtek 8821a/8821c/8822b/8822cs/8822cu/8852au
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_CC2560
 	bool "TI CC2560"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 6652758c87..edb0f40594 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -65,6 +65,27 @@ LINUX_FIRMWARE_FILES += qca/rampatch_usb_00000302.bin qca/nvm_usb_00000302.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.qcom
 endif
 
+# Realtek 87xx Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX_BT),y)
+LINUX_FIRMWARE_FILES += \
+	rtl_bt/rtl8723a_fw.bin rtl_bt/rtl8723b_fw.bin \
+	rtl_bt/rtl8723bs_config-OBDA8723.bin \
+	rtl_bt/rtl8723bs_fw.bin rtl_bt/rtl8723d_config.bin \
+	rtl_bt/rtl8723d_fw.bin rtl_bt/rtl8761a_fw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+endif
+
+# Realtek 88xx Bluetooth
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX_BT),y)
+LINUX_FIRMWARE_FILES += \
+	rtl_bt/rtl8812ae_fw.bin rtl_bt/rtl8821a_fw.bin \
+	rtl_bt/rtl8821c_config.bin rtl_bt/rtl8821c_fw.bin \
+	rtl_bt/rtl8822b_config.bin rtl_bt/rtl8822b_fw.bin \
+	rtl_bt/rtl8822cs_config.bin rtl_bt/rtl8822cs_fw.bin \
+	rtl_bt/rtl8822cu_config.bin rtl_bt/rtl8822cu_fw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+endif
+
 # rt2501/rt61
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RALINK_RT61),y)
 LINUX_FIRMWARE_FILES += rt2561.bin rt2561s.bin rt2661.bin
