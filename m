From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 20 Sep 2014 22:55:02 +0200
Subject: [Buildroot] [PATCH 04/15 v2] package/linux-firmware: install
	firmware files for rtlwifi rtl8723be
In-Reply-To: <cover.1411246411.git.yann.morin.1998@free.fr>
References: <cover.1411246411.git.yann.morin.1998@free.fr>
Message-ID: <3d7db906bf2258001d9394fd41a439292d52d0e2.1411246411.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 2 +-
 package/linux-firmware/linux-firmware.mk | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 3f94205..b909d2b 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -124,7 +124,7 @@ config BR2_PACKAGE_LINUX_FIRMWARE_RTL_81XX
 config BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX
 	bool "Realtek 87xx"
 	help
-	  Realtek 8712/8723
+	  Realtek 8712/8723/8723be
 
 config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL127X
 	bool "TI wl127X"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 32ed3b2..9334177 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -42,7 +42,7 @@ endif
 # rtl87xx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_RTL_87XX),y)
 LINUX_FIRMWARE_FILES += rtlwifi/rtl8712u.bin rtlwifi/rtl8723fw.bin	\
-	rtlwifi/rtl8723fw_B.bin
+	rtlwifi/rtl8723fw_B.bin rtlwifi/rtl8723befw.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.rtlwifi_firmware.txt
 endif
 
-- 
1.9.1
