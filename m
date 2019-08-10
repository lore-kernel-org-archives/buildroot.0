From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 10 Aug 2019 14:40:06 +0200
Subject: [Buildroot] [git commit] configs/pandaboard: needs host-openssl
Message-ID: <20190810123733.936288CA74@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ef0e8153e18cb8fcc28a321ea8b45bc12f101db0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The kernel configuration used by the pandaboard_defconfig needs
host-openssl, otherwise it fails to build with:

  scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/269139222

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/pandaboard_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 188eb1bc4f..bb4dd28783 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="omap4-panda-es omap4-panda omap4-panda-a4"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 # BR2_TARGET_ROOTFS_TAR is not set
