From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 19 Sep 2014 23:15:04 +0200
Subject: [Buildroot] [PATCH 14/14] package/linux-firmware: add option for
	Realtek rtl88xx firmware
In-Reply-To: <cover.1411161197.git.yann.morin.1998@free.fr>
References: <cover.1411161197.git.yann.morin.1998@free.fr>
Message-ID: <e47fcd863c3ddb704e0f7e7e7a9d691c54c79b73.1411161197.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 7 +++++++
 2 files changed, 12 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 29d31b1..cd35dcc 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -154,6 +154,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX
 	help
 	  Realtek 8712/8723/8723be
 
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX
+	bool "Realtek 88xx"
+	help
+	  Realtek rtl8821ae
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127x"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 54adb87..4303985 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -52,6 +52,13 @@ LINUX_FIRMWARE_FILES += rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin	\
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
+# rtl88xx
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX),y)
+LINUX_FIRMWARE_FILES += rtlwifi/rtl8821aefw.bin \
+			rtlwifi/rtl8821aefw_wowlan.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
+endif
+
 # ar7010
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_7010),y)
 LINUX_FIRMWARE_FILES += ar7010.fw ar7010_1_1.fw htc_7010.fw
-- 
1.9.1
