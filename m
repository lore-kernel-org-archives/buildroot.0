From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Oct 2020 14:29:40 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add options for
 Broadcom BCM4366
Message-ID: <20201017121825.2A7E7835CF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ca6e3f4b900a2cca605d44cffcc463db432ac0ac
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There are two groups of chipsets in the BCM4366 family requiring two
different firmware files. Each is quite big (over 1 MiB) so use
separated options for them.

Signed-off-by: Rafa?? Mi??ecki <rafal@milecki.pl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-firmware/Config.in         | 10 ++++++++++
 package/linux-firmware/linux-firmware.mk | 14 ++++++++++++++
 2 files changed, 24 insertions(+)

diff --git a/package/linux-firmware/Config.in b/package/linux-firmware/Config.in
index fbf374fa85..1f0111f957 100644
--- a/package/linux-firmware/Config.in
+++ b/package/linux-firmware/Config.in
@@ -128,6 +128,16 @@ config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX
 	help
 	  Firmware files for the Broadcom bcm43xxx, SoftMAC and FullMAC.
 
+config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366B1
+	bool "Broadcom 4366b1"
+	help
+	  Firmware file for the Broadcom 4366b1 FullMAC chip.
+
+config BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366C0
+	bool "Broadcom 4366c0"
+	help
+	  Firmware file for the Broadcom 4366c0 FullMAC chip.
+
 config BR2_PACKAGE_LINUX_FIRMWARE_IWLWIFI_22260
 	bool "Intel iwlwifi 22260"
 	help
diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 2af8d09f40..8a44129102 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -551,6 +551,20 @@ LINUX_FIRMWARE_FILES += \
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
+# brcm4366b1
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366B1),y)
+LINUX_FIRMWARE_FILES += \
+	brcm/brcmfmac4366b-pcie.bin brcm/brcmfmac4366b-pcie.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
+endif
+
+# brcm4366c0
+ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366C0),y)
+LINUX_FIRMWARE_FILES += \
+	brcm/brcmfmac4366c-pcie.bin brcm/brcmfmac4366c-pcie.bin
+LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
+endif
+
 # ql2xxx
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_QLOGIC_2XXX),y)
 LINUX_FIRMWARE_FILES += \
