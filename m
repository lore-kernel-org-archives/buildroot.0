From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 15 Jan 2018 21:43:36 +0100
Subject: [Buildroot] [PATCH] package/linux-firmware: install older versions
 for gcgb4 firmware
Message-ID: <20180115204336.29051-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Supposedly, older kernels could require that an older firmware be used,
so leave to the user the opportunity to choose the one they require.

Simplify the pattern as suggested by Peter. Thanks!

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/linux-firmware/linux-firmware.mk | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/linux-firmware/linux-firmware.mk b/package/linux-firmware/linux-firmware.mk
index 45483a31b8..9515f5e291 100644
--- a/package/linux-firmware/linux-firmware.mk
+++ b/package/linux-firmware/linux-firmware.mk
@@ -337,14 +337,12 @@ LINUX_FIRMWARE_FILES += bnx2x/*
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T4),y)
-# cxgb4/t4fw.bin is a symlink to cxgb4/t4fw-1.16.63.0.bin
-LINUX_FIRMWARE_FILES += cxgb4/t4fw-1.16.63.0.bin cxgb4/t4fw.bin
+LINUX_FIRMWARE_FILES += cxgb4/t4fw*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
 ifeq ($(BR2_PACKAGE_LINUX_FIRMWARE_CXGB4_T5),y)
-# cxgb4/t5fw.bin is a symlink to cxgb4/t5fw-1.16.63.0.bin
-LINUX_FIRMWARE_FILES += cxgb4/t5fw-1.16.63.0.bin cxgb4/t5fw.bin
+LINUX_FIRMWARE_FILES += cxgb4/t5fw*.bin
 LINUX_FIRMWARE_ALL_LICENSE_FILES += LICENCE.chelsio_firmware
 endif
 
-- 
2.14.1
