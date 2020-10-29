From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 29 Oct 2020 15:29:48 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/linux-firmware:
 add rpi settings files
Message-ID: <20201029142310.7EC5783F07@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=0a48766018f194a1bb68a6a1fd8868c497d87938
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

The brcmfmac drivers now load settings files for BCM434xx devices and
fail if they're missing on the Raspberry Pi:

brcmfmac mmc1:0001:1: Direct firmware load for brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt failed with error -2

This commit copies the missing settings files over to the firmware
directory with the other files.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit f76cbc2d48751a89116cc9f44c7643995bb0dc29)
[Peter: drop unavailable rpi4 file]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 9d86ce57b2..0a024ae4e5 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -537,7 +537,9 @@ LINUX_FIRMWARE_FILES += \
 	brcm/brcmfmac43362-sdio.bin brcm/brcmfmac43430-sdio.bin \
 	brcm/brcmfmac43430a0-sdio.bin brcm/brcmfmac43455-sdio.bin \
 	brcm/brcmfmac43569.bin brcm/brcmfmac43570-pcie.bin \
-	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin
+	brcm/brcmfmac43602-pcie.ap.bin brcm/brcmfmac43602-pcie.bin \
+	brcm/brcmfmac43430-sdio.raspberrypi,3-model-b.txt \
+	brcm/brcmfmac43455-sdio.raspberrypi,3-model-b-plus.txt
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.broadcom_bcm43xx
 endif
 
