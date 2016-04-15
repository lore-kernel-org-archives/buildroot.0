From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 15 Apr 2016 11:48:43 +0200
Subject: [Buildroot] [git commit] s6lx9_microboard_defconfig: lock kernel
	version
Message-ID: <20160415095135.4598B8011C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7760b947c67e260f54c171bf14329d7e0bcd8d02
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes https://travis-ci.org/buildroot/buildroot-defconfig-testing/jobs/123187960

The defconfig broke after we moved the default kernel version to 4.5.x. Fix
it by locking the kernel version in the defconfig.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/s6lx9_microboard_defconfig | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/configs/s6lx9_microboard_defconfig b/configs/s6lx9_microboard_defconfig
index 06a3ed3..f77c80b 100644
--- a/configs/s6lx9_microboard_defconfig
+++ b/configs/s6lx9_microboard_defconfig
@@ -6,6 +6,8 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttyUL0"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.4.7"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/avnet/s6lx9_microboard/lx9_mmu_defconfig"
 BR2_LINUX_KERNEL_USE_CUSTOM_DTS=y
