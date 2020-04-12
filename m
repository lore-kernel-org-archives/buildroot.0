From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 12 Apr 2020 14:27:23 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: Add Wilocity 6210
 11ad firmware
Message-ID: <20200412121910.BEC738E65C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b522710337b81312f018c2eb122a87941fc685a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 5 +++++
 package/linux-firmware/linux-firmware.mk | 5 +++++
 2 files changed, 10 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index a2b41ccc5b..eba58014b6 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -340,6 +340,11 @@ config BR2_PACKAGE_LINUX_FIRMWARE_TI_WL18XX
 	help
 	  Firmware files for WLAN and Bluetooth modules wl18xx
 
+config BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WIL6210
+	bool "Qualcomm Atheros wil6210"
+	help
+	  Firmware files for Qualcomm Atheros 11ad family of chips
+
 endmenu
 
 menu "Ethernet firmware"
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index ba24f61c10..cbad8d592a 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -366,6 +366,11 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QUALCOMM_WIL6210),y)
+LINUX_FIRMWARE_FILES += wil6210.*
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENSE.QualcommAtheros_ath10k
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
 LINUX_FIRMWARE_FILES += iwlwifi-3160-*.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
