From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 22:55:03 +0200
Subject: [Buildroot] [PATCH 05/15 v2] package/linux-firmware: add option for
	Realtek rtl88xx firmware
In-Reply-To: <cover.1411246411.git.yann.morin.1998@free.fr>
References: <cover.1411246411.git.yann.morin.1998@free.fr>
Message-ID: <ab3b9dab7477a5a16cc000b633ea50c7565d6c15.1411246411.git.yann.morin.1998@free.fr>
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
index b909d2b..f1670e8 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -126,6 +126,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX
 	help
 	  Realtek 8712/8723/8723be
 
+config BR2_PACKAGE_LINUX_FIRMWARE_RTL_88XX
+	bool "Realtek 88xx"
+	help
+	  Realtek rtl8821ae
+
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127X"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9334177..c0641b9 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -46,6 +46,13 @@ LINUX_FIRMWARE_FILES += rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin	\
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
