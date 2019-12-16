From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 16 Dec 2019 11:05:48 +0100
Subject: [Buildroot] [PATCH] configs/beaglebone: kernel builds needs
 host-openssl
Message-ID: <20191216100548.1752628-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:

514 scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
515  #include <openssl/bio.h>

Seen at:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314247

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/beaglebone_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/beaglebone_defconfig b/configs/beaglebone_defconfig
index f8b7cc66ab..5d6b680d29 100644
--- a/configs/beaglebone_defconfig
+++ b/configs/beaglebone_defconfig
@@ -11,6 +11,7 @@ BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,beagleboard,linux,4.19.7
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="am335x-evm am335x-bone am335x-boneblack am335x-bonegreen am335x-evmsk am335x-boneblue"
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
-- 
2.23.0
