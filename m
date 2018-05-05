From: Fabio Estevam <festevam@gmail.com>
Date: Sat,  5 May 2018 20:12:24 -0300
Subject: [Buildroot] [PATCH 3/3] configs/freescale_imx6ulevk: Remove target
In-Reply-To: <1525561944-1511-1-git-send-email-festevam@gmail.com>
References: <1525561944-1511-1-git-send-email-festevam@gmail.com>
Message-ID: <1525561944-1511-3-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently this target fails to build:

./scripts/dtc-version.sh: line 17: dtc: command not found
./scripts/dtc-version.sh: line 18: dtc: command not found
*** Your dtc is too old, please upgrade to dtc 1.4 or newer

Even though the fix for this build failure is easy, I prefer to
maintain only imx6ulevk_defconfig, which is a target for the
same board, but uses mainline kernel and U-Boot versions instead.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/66561695
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/freescale_imx6ulevk_defconfig | 36 -----------------------------------
 1 file changed, 36 deletions(-)
 delete mode 100644 configs/freescale_imx6ulevk_defconfig

diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
deleted file mode 100644
index 76ad101..0000000
--- a/configs/freescale_imx6ulevk_defconfig
+++ /dev/null
@@ -1,36 +0,0 @@
-# architecture
-BR2_arm=y
-BR2_cortex_a7=y
-
-# Linux headers same as kernel, a 4.9 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
-
-# system
-BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-
-# kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/linux-imx.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
-BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
-BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-14x14-evk"
-
-# bootloader
-BR2_TARGET_UBOOT=y
-BR2_TARGET_UBOOT_BOARDNAME="mx6ul_14x14_evk"
-BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://source.codeaurora.org/external/imx/uboot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_imx_4.9.x_1.0.0_ga"
-BR2_TARGET_UBOOT_FORMAT_IMX=y
-
-# required tools to create the microSD image
-BR2_PACKAGE_HOST_DOSFSTOOLS=y
-BR2_PACKAGE_HOST_GENIMAGE=y
-BR2_PACKAGE_HOST_MTOOLS=y
-
-# filesystem / image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
-BR2_TARGET_ROOTFS_EXT2=y
-BR2_TARGET_ROOTFS_EXT2_4=y
-- 
2.7.4
