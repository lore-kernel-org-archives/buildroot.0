From: Julien Olivain <julien.olivain@oss.nxp.com>
Date: Wed, 25 Mar 2020 10:50:05 +0100
Subject: [Buildroot] [PATCH 2/2] configs/freescale_imx6ullevk: kernel build
 needs host-openssl
In-Reply-To: <20200325095005.872113-1-julien.olivain@oss.nxp.com>
References: <20200325095005.872113-1-julien.olivain@oss.nxp.com>
Message-ID: <20200325095005.872113-2-julien.olivain@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

With the kernel to 4.19, the kernel configuration needs host-openssl
to build.

Fixes:
scripts/extract-cert.c:21:10: fatal error: openssl/bio.h: No such file or directory
   21 | #include <openssl/bio.h>

Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>
---
 configs/freescale_imx6ullevk_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/freescale_imx6ullevk_defconfig b/configs/freescale_imx6ullevk_defconfig
index 2d73389055..aaf8ad8a93 100644
--- a/configs/freescale_imx6ullevk_defconfig
+++ b/configs/freescale_imx6ullevk_defconfig
@@ -10,6 +10,7 @@ BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.19.35_1.1.0"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ull-14x14-evk"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-- 
2.25.1
