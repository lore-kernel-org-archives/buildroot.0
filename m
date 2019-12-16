From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 16 Dec 2019 22:11:08 +0100
Subject: [Buildroot] [git commit] configs/beaglebone: kernel builds needs
 host-openssl
Message-ID: <20191216210523.C2FC78B538@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=38912a61beb6ba9cc9d106e9544c6f8a4a5bee2d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:

514 scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
515  #include <openssl/bio.h>

Seen at:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/378314247

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
