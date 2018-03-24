From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 24 Mar 2018 15:26:02 +0100
Subject: [Buildroot] [PATCH] configs/freescale_p1025twr: needs host-openssl
 for the Linux kernel build
Message-ID: <20180324142602.10995-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/59015355

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/freescale_p1025twr_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_p1025twr_defconfig b/configs/freescale_p1025twr_defconfig
index f7cc50f093..13ec517fbd 100644
--- a/configs/freescale_p1025twr_defconfig
+++ b/configs/freescale_p1025twr_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15.7"
 BR2_LINUX_KERNEL_DEFCONFIG="mpc85xx_smp"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="fsl/p1025twr"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # Filesystem
 BR2_TARGET_ROOTFS_CPIO=y
-- 
2.14.3
