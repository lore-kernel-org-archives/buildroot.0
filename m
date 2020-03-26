From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 22:25:43 +0100
Subject: [Buildroot] [git commit] configs/freescale_imx7dsabresd: kernel
 build needs host-openssl
Message-ID: <20200326211425.4C3028834A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c8ec87190804f00ddd646bc9bd3db01528f352a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

With the recent bump of the kernel to 4.19, the kernel configuration
now needs host-openssl to build.

Fixes:
scripts/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory
   21 | #include <openssl/bio.h>

Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
