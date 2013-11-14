From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 14 Nov 2013 12:24:59 +0100
Subject: [Buildroot] [git commit] qemu/arm-versatile: roll back to 3.11.x
	kernel series
Message-ID: <20131114112825.640129BC7B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=58b82e5c40eb5db3a3ac03f6d4b83fd600d24be2
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As pointed by Thomas P. kernel 3.12 oopses when loading/using the
emulated network.
Seems 3.12 broke versatile for qemu like in the past, only in a more
subtle way this time that escaped my automated qemu builds/tests.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{linux-3.12.config => linux-3.11.config}       |    0
 configs/qemu_arm_versatile_defconfig               |    8 ++++----
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/board/qemu/arm-versatile/linux-3.12.config b/board/qemu/arm-versatile/linux-3.11.config
similarity index 100%
rename from board/qemu/arm-versatile/linux-3.12.config
rename to board/qemu/arm-versatile/linux-3.11.config
diff --git a/configs/qemu_arm_versatile_defconfig b/configs/qemu_arm_versatile_defconfig
index 88df6c8..1c66696 100644
--- a/configs/qemu_arm_versatile_defconfig
+++ b/configs/qemu_arm_versatile_defconfig
@@ -10,14 +10,14 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
-# Lock to 3.12 headers to avoid breaking with newer kernels
+# Lock to 3.11 headers to avoid breaking with newer kernels
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12"
+BR2_DEFAULT_KERNEL_VERSION="3.11.8"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.11.8"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.12.config"
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/arm-versatile/linux-3.11.config"
 BR2_LINUX_KERNEL_ZIMAGE=y
