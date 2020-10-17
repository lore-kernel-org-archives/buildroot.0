From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 17 Oct 2020 18:13:25 +0200
Subject: [Buildroot] [git commit] package/linux-firmware: add rpi settings
 files
Message-ID: <20201017160908.DEF3F81544@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=f76cbc2d48751a89116cc9f44c7643995bb0dc29
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The brcmfmac drivers now load settings files for BCM434xx devices and
fail if they're missing on the Raspberry Pi:

brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt failed with error -2

This commit copies the missing settings files over to the firmware
directory with the other files.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-firmware/linux-firmware.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 8a44129102..e2a6ebcbf1 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -547,7 +547,10 @@ LINUX_FIRMWARE_FILES += \
 	brcm/brcmfmac43362-sdio.bin brcm/brcmfmac43430-sdio.bin \
 	brcm/brcmfmac43430a0-sdio.bin brcm/brcmfmac43455-sdio.bin \
 	brcm/brcmfmac43569.bin brcm/brcmfmac43570-pcie.bin \
-	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin
+	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin \
+	brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt \
+	brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt \
+	brcm/brcmfmac43455-sdio.raspberrypi,4-model-b.txt
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
