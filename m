From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 18 Jan 2014 19:40:19 +0100
Subject: [Buildroot] [PATCH 5/5] package/linux-firmware: add iwlwifi 3160
	and 7260 firmware files
In-Reply-To: <cover.1390070341.git.yann.morin.1998@free.fr>
References: <cover.1390070341.git.yann.morin.1998@free.fr>
Message-ID: <d9e2eb7b202d55062f34e785e593866b0cd70c44.1390070341.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/linux-firmware/Config.in         | 12 ++++++++++++
 package/linux-firmware/linux-firmware.mk | 10 ++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index 861d967..0a37a7e 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -30,12 +30,24 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX
 	help
 	  Firmware files for the Broadcom BRCM bcm43xx
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160
+	bool "Intel iwlwifi 3160"
+	help
+	  Firmware files for the Intel Wifi 3160 devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_5000
 	bool "Intel iwlwifi 5000"
 	help
 	  Firmware files for the Intel Wifi 5000 devices supported by
 	  the iwlwifi kernel driver.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260
+	bool "Intel iwlwifi 7260"
+	help
+	  Firmware files for the Intel Wifi 7260 devices supported by
+	  the iwlwifi kernel driver.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_LIBERTAS_SD8686_V8
 	bool "Libertas SD 8686 v8"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index bd37f67..c4e7857 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -126,6 +126,11 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.ti-connectivity
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160),y)
+LINUX_FIRMWARE_FILES += iwlwifi-3160-7.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 # iwlwifi 5000. Multiple files are available (iwlwifi-5000-1.ucode,
 # iwlwifi-5000-2.ucode, iwlwifi-5000-5.ucode), corresponding to
 # different versions of the firmware API. For now, we only install the
@@ -135,6 +140,11 @@ LINUX_FIRMWARE_FILES += iwlwifi-5000-5.ucode
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_7260),y)
+LINUX_FIRMWARE_FILES += iwlwifi-7260-7.ucode
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.iwlwifi_firmware
+endif
+
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BNX2X),y)
 LINUX_FIRMWARE_FILES += \
 	bnx2x/bnx2x-e1-7.8.17.0.fw \
-- 
1.8.1.2
