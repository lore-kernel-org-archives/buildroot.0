From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon, 30 Jul 2012 14:32:49 +0200
Subject: [Buildroot] [PATCH 6/6] Update s6lx9 microblaze default
	configuration
In-Reply-To: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1343651569-6450-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1343651569-6450-7-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 configs/s6lx9_microboard_defconfig |   12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/configs/s6lx9_microboard_defconfig b/configs/s6lx9_microboard_defconfig
index 5011766..7fd809d 100644
--- a/configs/s6lx9_microboard_defconfig
+++ b/configs/s6lx9_microboard_defconfig
@@ -1,17 +1,9 @@
-BR2_microblaze=y
 BR2_microblazeel=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_XILINX_MICROBLAZEEL_V2=y
-BR2_TOOLCHAIN_EXTERNAL_DOWNLOAD=y
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_PREFIX="microblazeel-unknown-linux-gnu"
-BR2_TOOLCHAIN_EXTERNAL_CUSTOM_GLIBC=y
-BR2_TOOLCHAIN_EXTERNAL_CXX=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/avnet/s6lx9_microboard/lx9_mmu_defconfig"
-BR2_LINUX_KERNEL_DTS_FILE="board/avnet/s6lx9_microboard/lx9_mmu.dts"
-BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
-BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="simpleImage.lx9_mmu"
+BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
+BR2_LINUX_KERNEL_CUSTOM_DTS_PATH="board/avnet/s6lx9_microboard/lx9_mmu.dts"
-- 
1.7.9.5
