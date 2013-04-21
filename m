From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 21 Apr 2013 23:18:43 +0200
Subject: [Buildroot] [git commit] qemu/arm-versatile: update to use kernel
	3.8.8
Message-ID: <20130421212043.9195A9B782@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=832a61cc47f4fd0923086abb0892cba303924bf3
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The IRQ mapping failures have been fixed in 3.8.8 so update it to the
latest kernel series.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 .../{linux-3.7.config => linux-3.8.config}         |    0
 configs/qemu_arm_versatile_defconfig               |    6 +++---
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/qemu/arm-versatile/linux-3.7.config b/board/qemu/arm-versatile/linux-3.8.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.7.config
rename to board/qemu/arm-versatile/linux-3.8.config
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index ff264c7..db18d5b 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -11,12 +11,12 @@ BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
 # Lock to 3.7 headers to avoid breaking with newer kernels
-BR2_KERNEL_HEADERS_3_7=y
+BR2_KERNEL_HEADERS_3_8=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.7.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.7.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.8.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
