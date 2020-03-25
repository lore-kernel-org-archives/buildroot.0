From: Julien Olivain <julien.olivain@oss.nxp.com>
Date: Wed, 25 Mar 2020 10:50:04 +0100
Subject: [Buildroot] [PATCH 1/2] configs/freescale_imx7dsabresd: kernel
 build needs host-openssl
Message-ID: <20200325095005.872113-1-julien.olivain@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the recent bump of the kernel to 4.19, the kernel configuration
now needs host-openssl to build.

Fixes:
scripts/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory
   21 | #include <openssl/bio.h>

Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>
---
 configs/freescale_imx7dsabresd_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx7dsabresd_defconfig b/configs/freescale_imx7dsabresd_defconfig
index 86009c1c21..7c5fc0cb64 100644
--- a/configs/freescale_imx7dsabresd_defconfig
+++ b/configs/freescale_imx7dsabresd_defconfig
@@ -16,6 +16,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7d-sdb"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # filesystem
 BR2_TARGET_ROOTFS_EXT2=y
-- 
2.25.1
