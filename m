From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Fri, 17 Oct 2014 17:05:08 +0200
Subject: [Buildroot] [PATCH] mx53loco_defconfig: refresh
Message-ID: <1413558308-30081-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Force gcc to version 4.5, as versions 4.7 and 4.8 break the boot.

Switch to VFPv3(d32), as i.MX53 Cortex-A8 supports it (MVFR0 = 0x11110222).

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@sunsite.dk>
---
 configs/mx53loco_defconfig | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 8b12238..f0d13bb 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -1,7 +1,11 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a8=y
-BR2_ARM_FPU_VFPV3D16=y
+BR2_ARM_FPU_VFPV3=y
+
+# toolchain
+# Use gcc 4.5, as gcc 4.7 & 4.8 break the boot.
+BR2_GCC_VERSION_4_5_X=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-- 
2.1.1
