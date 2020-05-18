From: =?UTF-8?q?Rafa=C5=82=20Mi=C5=82ecki?= <zajec5@gmail.com>
Date: Mon, 18 May 2020 10:33:05 +0200
Subject: [Buildroot] [PATCH] package/linux-firmware: add options for
 Broadcom BCM4366
Message-ID: <20200518083305.21239-1-zajec5@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Rafa? Mi?ecki <rafal@milecki.pl>

There are two groups of chipsets in the BCM4366 family requiring two
different firmware files. Each is quite big (over 1 MiB) so use
separated options for them.

Signed-off-by: Rafa? Mi?ecki <rafal@milecki.pl>
---
Yann, Yegor: my previous e-mail didn't reach ML because I wasn't
subscribed thus I'm resending it.
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 12 ++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index eba58014b6..3746f6f463 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -128,6 +128,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
 	help
 	  Firmware files for the Broadcom bcm43xxx, SoftMAC and FullMAC.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_4366B1
+	bool "Broadcom 4366b1"
+	help
+	  Firmware file for the Broadcom 4366b1 FullMAC chip.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_4366C0
+	bool "Broadcom 4366c0"
+	help
+	  Firmware file for the Broadcom 4366c0 FullMAC chip.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_3160
 	bool "Intel iwlwifi 3160"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index cbad8d592a..a80eafaf14 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -546,6 +546,18 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_4366B1),y)
+LINUX_FIRMWARE_FILES += \
+	brcm/brcmfmac4366b-pcie.bin brcm/brcmfmac4366b-pcie.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
+endif
+
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_4366C0),y)
+LINUX_FIRMWARE_FILES += \
+	brcm/brcmfmac4366c-pcie.bin brcm/brcmfmac4366c-pcie.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
+endif
+
 # ql2xxx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_2XXX),y)
 LINUX_FIRMWARE_FILES += \
-- 
2.26.1
