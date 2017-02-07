From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 7 Feb 2017 12:32:03 +0100
Subject: [Buildroot] [git commit] configs/qemu_nios2: add custom kernel
	headers version
Message-ID: <20170207113401.C408B82133@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=81555a4984b8fe14dd8e00895c913630400aa17a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

When this qemu nios2 defconfig has been added, the insternal toolchain
used for testing was build with Linux kernel headers 4.9, so
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9 was missing in the defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/qemu_nios2_10m50_defconfig | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/configs/qemu_nios2_10m50_defconfig b/configs/qemu_nios2_10m50_defconfig
index a04a156..345a6e5 100644
--- a/configs/qemu_nios2_10m50_defconfig
+++ b/configs/qemu_nios2_10m50_defconfig
@@ -5,3 +5,6 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.9.6"
 BR2_LINUX_KERNEL_DEFCONFIG="10m50"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/qemu/nios2-10m50/linux-4.9.fragment"
 BR2_TARGET_ROOTFS_INITRAMFS=y
+
+# Linux headers same as kernel, a 4.9 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
