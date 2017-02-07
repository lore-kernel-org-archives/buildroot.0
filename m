From: Romain Naour <romain.naour@gmail.com>
Date: Tue,  7 Feb 2017 10:34:09 +0100
Subject: [Buildroot] [PATCH] configs/qemu_nios2: add custom kernel headers
	version
Message-ID: <20170207093409.3475-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When this qemu nios2 defconfig has been added, the insternal toolchain
used for testing was build with Linux kernel headers 4.9, so
BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9 was missing in the defconfig.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
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
-- 
2.9.3
