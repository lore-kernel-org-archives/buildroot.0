From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 22 Feb 2019 22:25:57 +0100
Subject: [Buildroot] [git commit] configs/rock64: Linux needs host OpenSSL
Message-ID: <20190222212446.E8D0C8D565@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3e4b32691bc558f253618b7a2f41f6fce4bcbed6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Linux configuration used in the rock64_defconfig requires
host-openssl to be built, otherwise the build fails with:

scripts/extract-cert.c:21:25: fatal error: openssl/bio.h: No such file or directory
 #include <openssl/bio.h>

So let's enable BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/165766161

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/rock64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/rock64_defconfig b/configs/rock64_defconfig
index 50ffc0474f..30bf12c061 100644
--- a/configs/rock64_defconfig
+++ b/configs/rock64_defconfig
@@ -12,6 +12,7 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="rockchip/rk3328-rock64"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
