From: Baruch Siach <baruch@tkos.co.il>
Date: Mon, 19 Mar 2018 12:44:04 +0200
Subject: [Buildroot] [PATCH 1/2] linux-firmware: add QCA6174 multi-board
 firmware
Message-ID: <ec8f202185187ea813316c7e6960f64bde714fdb.1521456245.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The board-2.bin file is a new format that support multiple board files.
This file is required for for recent QCA6174 modules.

Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 package/linux-firmware/linux-firmware.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index a6fd8ebba485..3f710a2f0935 100644
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
-- 
2.16.2
