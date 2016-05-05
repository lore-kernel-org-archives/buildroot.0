From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Thu,  5 May 2016 08:30:56 -0300
Subject: [Buildroot] [PATCH 1/2] configs/qemu: use zImage for sh4/sh4eb
	samples
Message-ID: <1462447857-29400-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The default for ARM was changed to uImage in 5c67cb1d, however the
sh4/sh4eb sample configs were updated to drop zImage in error, hence
end up building uImage which doesn't work with Qemu.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 configs/qemu_sh4_r2d_defconfig   | 1 +
 configs/qemu_sh4eb_r2d_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/qemu_sh4_r2d_defconfig b/configs/qemu_sh4_r2d_defconfig
index 57d5578..c7f4ec1 100644
--- a/configs/qemu_sh4_r2d_defconfig
+++ b/configs/qemu_sh4_r2d_defconfig
@@ -19,3 +19,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4-r2d/linux-4.5.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
diff --git a/configs/qemu_sh4eb_r2d_defconfig b/configs/qemu_sh4eb_r2d_defconfig
index d356434..06215c9 100644
--- a/configs/qemu_sh4eb_r2d_defconfig
+++ b/configs/qemu_sh4eb_r2d_defconfig
@@ -18,3 +18,4 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.5"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sh4eb-r2d/linux-4.5.config"
+BR2_LINUX_KERNEL_ZIMAGE=y
-- 
2.7.3
