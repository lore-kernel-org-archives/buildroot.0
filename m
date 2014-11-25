From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Tue, 25 Nov 2014 19:35:36 +0100
Subject: [Buildroot] [PATCH v3] mx53loco_defconfig: switch to VFPv3(d32)
In-Reply-To: <20141125183017.31cb5e67@free-electrons.com>
References: <20141125183017.31cb5e67@free-electrons.com>
Message-ID: <1416940536-3642-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to VFPv3(d32), as i.MX53 Cortex-A8 supports it (MVFR0 = 0x11110222).

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@sunsite.dk>
Cc: Eric B?nard <eric@eukrea.com>

---


Here is v3; sorry for the noise.

Changes since v2:
~~~~~~~~~~~~~~~~~
- Switch back to EABI.

Changes since v1:
~~~~~~~~~~~~~~~~~
- Do not force gcc version anymore.
- Change the title accordingly.
- Switch to EABIHF.


 configs/mx53loco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 942dedf..d2a2b66 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -1,6 +1,7 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a8=y
+BR2_ARM_FPU_VFPV3=y
 
 # System
 BR2_KERNEL_HEADERS_VERSION=y
-- 
2.1.3
