From: Peter Seiderer <ps.report@gmx.net>
Date: Tue,  6 Jul 2021 16:11:31 +0200
Subject: [Buildroot] [PATCH v1 1/2] package/linux-firmware: remove
 duplicated entries for brcmfmac4366b-pcie.bin and brcmfmac4366c-pcie.bin
Message-ID: <20210706141132.18307-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove duplicated entries for brcmfmac4366b-pcie.bin and
brcmfmac4366c-pcie.bin (present since addition with
commit ca6e3f4b900a2cca605d44cffcc463db432ac0ac)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/linux-firmware/linux-firmware.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9adab67bf1..a621619624 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -618,15 +618,13 @@ endif
 
 # brcm4366b1
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366B1),y)
-LINUX_FIRMWARE_FILES += \
-	brcm/brcmfmac4366b-pcie.bin brcm/brcmfmac4366b-pcie.bin
+LINUX_FIRMWARE_FILES += brcm/brcmfmac4366b-pcie.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
 # brcm4366c0
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM4366C0),y)
-LINUX_FIRMWARE_FILES += \
-	brcm/brcmfmac4366c-pcie.bin brcm/brcmfmac4366c-pcie.bin
+LINUX_FIRMWARE_FILES += brcm/brcmfmac4366c-pcie.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
-- 
2.32.0
