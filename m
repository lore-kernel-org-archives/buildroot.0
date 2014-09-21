From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 21 Sep 2014 19:49:27 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: install firmware
	files for rtlwifi rtl8723be
Message-ID: <20140921175639.A2ED99D6FF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0b785c09766258403dc67e3cd516278e844cfb2a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/linux-firmware/Config.in         |    2 +-
 package/linux-firmware/linux-firmware.mk |    2 +-
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
 
