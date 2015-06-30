From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:53:07 +0200
Subject: [Buildroot] [git commit] configs: add defconfig for Atmel sama5d3xek
Message-ID: <20150630130116.D09B87FC98@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef85f464323cdc03f0753e5e3a33a2df3fa20d9e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This supports:
 - sama5d31ek
 - sama5d33ek
 - sama5d34ek
 - sama5d35ek
 - sama5d36ek

with or without the PDA4 or PDA7 screens.

Signed-off-by: Alexandre Belloni <alexandre.belloni@free-electrons.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/atmel_sama5d3xek_defconfig |   29 +++++++++++++++++++++++++++++
 1 files changed, 29 insertions(+), 0 deletions(-)

diff --git a/configs/atmel_sama5d3xek_defconfig b/configs/atmel_sama5d3xek_defconfig
new file mode 100644
index 0000000..cc34bf9
--- /dev/null
+++ b/configs/atmel_sama5d3xek_defconfig
@@ -0,0 +1,29 @@
+BR2_arm=y
+BR2_cortex_a5=y
+BR2_ARM_EABIHF=y
+BR2_ARM_FPU_VFPV4D16=y
+BR2_ARM_INSTRUCTIONS_THUMB2=y
+BR2_KERNEL_HEADERS_VERSION=y
+BR2_DEFAULT_KERNEL_VERSION="3.18"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_GIT=y
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/linux4sam/linux-at91.git"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="03329ca4cf6b94acc5c65b59b2d1f90fdeee0887"
+BR2_LINUX_KERNEL_DEFCONFIG="sama5"
+BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sama5d31ek sama5d31ek_pda4 sama5d31ek_pda7 sama5d31ek_revc sama5d31ek_revc_pda4 sama5d31ek_revc_pda7 sama5d33ek sama5d33ek_pda4 sama5d33ek_pda7 sama5d33ek_revc sama5d33ek_revc_pda4 sama5d33ek_revc_pda7 sama5d34ek sama5d34ek_pda4 sama5d34ek_pda7 sama5d34ek_revc sama5d34ek_revc_pda4 sama5d34ek_revc_pda7 sama5d35ek sama5d35ek_revc sama5d36ek sama5d36ek_pda4 sama5d36ek_pda7 sama5d36ek_revc sama5d36ek_revc_pda4 sama5d36ek_revc_pda7"
+BR2_TARGET_ROOTFS_UBIFS=y
+BR2_TARGET_ROOTFS_UBIFS_LEBSIZE=0x1f000
+BR2_TARGET_ROOTFS_UBI=y
+BR2_TARGET_ROOTFS_UBI_SUBSIZE=2048
+BR2_TARGET_AT91BOOTSTRAP3=y
+BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="sama5d3xeknf_uboot"
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BOARDNAME="sama5d3xek_nandflash"
+BR2_TARGET_UBOOT_CUSTOM_GIT=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/linux4sam/u-boot-at91.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="677f3c2340b72131beebace8e96cac17b9569887"
+BR2_TARGET_UBOOT_SPL=y
+BR2_PACKAGE_HOST_SAM_BA=y
