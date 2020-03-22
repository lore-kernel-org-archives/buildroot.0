From: =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>
Date: Sun, 22 Mar 2020 19:14:16 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: Add an option for
 Realtek rtw88 firmwares
Message-ID: <20200322181416.18844-1-peron.clem@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Linux-firmware repo have dedicated firmware images supported
by Realtek's wireless driver rtw88.

Add an option to install them.

Signed-off-by: Cl?ment P?ron <peron.clem@gmail.com>
---
 package/linux-firmware/Config.in         | 6 ++++++
 package/linux-firmware/linux-firmware.mk | 9 +++++++++
 2 files changed, 15 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 4768ea677272..fa741f540781 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -318,6 +318,12 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX
 	help
 	  Realtek rtl8821ae
 
+config BR2_PACKAGE_LINUX_FIRMWARE_RTW88
+	bool "Realtek rtw88"
+	help
+	  Firmware images supported by Realtek's wireless
+	  driver rtw88.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_REDPINE_RS9113
 	bool "Redpine rs9113"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index aec76d54b98b..b90585daee4c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -112,6 +112,15 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
+# rtw88
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTW88),y)
+LINUX_FIRMWARE_FILES += \
+	rtw88/rtw8723d_fw.bin \
+	rtw88/rtw8822b_fw.bin \
+	rtw88/rtw8822c_fw.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+endif
+
 # ar3011
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_AR3011),y)
 LINUX_FIRMWARE_FILES += ath3k-1.fw
-- 
2.20.1
