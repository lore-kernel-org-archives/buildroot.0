From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Nov 2016 22:43:31 +0100
Subject: [Buildroot] [git commit] configs: atmel: at91sam9x5ek: bump to
	linux4sam_5.5
Message-ID: <20161103214339.425DB7FDB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8f97c8b9c9ce4f74cb7f4e0002c6dd11a6a55ad7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Bump at91bootstrap to v3.8.7, U-Boot to linux4sam_5.5, Linux to
linux4sam_5.5 (based on v4.4.x).

Signed-off-by: Ludovic Desroches <ludovic.desroches@atmel.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/at91sam9x5ek_defconfig | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/configs/at91sam9x5ek_defconfig b/configs/at91sam9x5ek_defconfig
index 79031b6..69f9e75 100644
--- a/configs/at91sam9x5ek_defconfig
+++ b/configs/at91sam9x5ek_defconfig
@@ -1,11 +1,11 @@
 BR2_arm=y
 BR2_arm926t=y
-# Linux headers same as kernel, a 3.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+# Linux headers same as kernel, a 4.4 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="linux4sam_5.5"
 BR2_LINUX_KERNEL_DEFCONFIG="at91_dt"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="at91sam9g15ek at91sam9g25ek at91sam9g35ek at91sam9x25ek at91sam9x35ek"
@@ -14,10 +14,14 @@ BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
 BR2_TARGET_ROOTFS_UBI=y
 BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
 BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_GIT=y
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_URL="https://github.com/linux4sam/at91bootstrap.git"
+BR2_TARGET_AT91BOOTSTRAP3_CUSTOM_REPO_VERSION="v3.8.7"
 BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="at91sam9x5eknf_uboot"
 BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="at91sam9x5ek_nandflash"
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_5.5"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9x5ek_nandflash"
 BR2_PACKAGE_HOST_SAM_BA=y
