From: =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@freescale.com>
Date: Tue, 25 Nov 2014 17:12:23 +0100
Subject: [Buildroot] [PATCH v2] mx53loco_defconfig: switch to VFPv3(d32)
In-Reply-To: <20141019163952.19c7c080@free-electrons.com>
References: <20141019163952.19c7c080@free-electrons.com>
Message-ID: <1416931943-3504-1-git-send-email-vincent.stehle@freescale.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Switch to VFPv3(d32), as i.MX53 Cortex-A8 supports it (MVFR0 = 0x11110222).

While at it, switch to EABIHF.

Signed-off-by: Vincent Stehl? <vincent.stehle@freescale.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Cc: Peter Korsgaard <jacmet@sunsite.dk>

---


Hi,

This is v2 of an old patch for mx53loco (patchwork id 400549,
"mx53loco_defconfig: refresh").

It boots fine on an i.MX53 QSB on top of latest buildroot, commit
ccec35e342a38537fba746a483eec063b5151d3e.

Changes since v1:
~~~~~~~~~~~~~~~~~
- Do not force gcc version anymore.
- Change the title accordingly.
- Switch to EABIHF.


 configs/mx53loco_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 942dedf..6af42a7 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -1,12 +1,15 @@
 # Architecture
 BR2_arm=y
 BR2_cortex_a8=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_VFPV3=y
 
 # System
 BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="2.6.35"
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
+
 # Filesystem
 BR2_TARGET_ROOTFS_EXT2=y
 
-- 
2.1.3
