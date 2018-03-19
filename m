From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 19 Mar 2018 13:25:00 +0100
Subject: [Buildroot] [git commit] linux-firmware: add QCA6174 multi-board
 firmware
Message-ID: <20180319122537.8159C837C8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3aeb295ab88fd8be6c1c03b1b1087f0768f4d124
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The board-2.bin file is a new format that support multiple board files.
This file is required for for recent QCA6174 modules.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-firmware/linux-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index a6fd8ebba4..3f710a2f09 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -146,6 +146,7 @@ endif
 # ath10k-qca6174
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_ATHEROS_10K_QCA6174),y)
 LINUX_FIRMWARE_FILES += ath10k/QCA6174/hw3.0/board.bin \
+			ath10k/QCA6174/hw3.0/board-2.bin \
 			ath10k/QCA6174/hw3.0/firmware-4.bin \
 			ath10k/QCA6174/hw3.0/firmware-6.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.atheros_firmware
