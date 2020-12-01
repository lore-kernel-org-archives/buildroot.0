From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 1 Dec 2020 22:41:08 +0100
Subject: [Buildroot] [git commit branch/next] package/linux-firmware:
 install Ath10k QCA9377 sdio firmware
Message-ID: <20201201212610.839F581444@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fe0f3f08dacf0981e15f6a6f86855164e2f1aff4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

linux-firmware version 20201022 introduced a new sdio firmware for
QCA9377 sdio devices. Install it when support is selected.

Signed-off-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/linux-firmware/linux-firmware.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index dc7f392800..c0ca98c45c 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -193,7 +193,8 @@ ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA9377),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA9377/hw1.0/board-2.bin \
 			ath10k/QCA9377/hw1.0/board.bin \
 			ath10k/QCA9377/hw1.0/firmware-5.bin \
-			ath10k/QCA9377/hw1.0/firmware-6.bin
+			ath10k/QCA9377/hw1.0/firmware-6.bin \
+			ath10k/QCA9377/hw1.0/firmware-sdio-5.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
 endif
 
