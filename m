From: Maxime Ripard <maxime.ripard@free-electrons.com>
Date: Mon,  6 May 2013 12:14:56 +0200
Subject: [Buildroot] [PATCH 2/3] pandaboard: Fix defconfig build
In-Reply-To: <1367835297-6560-1-git-send-email-maxime.ripard@free-electrons.com>
References: <1367835297-6560-1-git-send-email-maxime.ripard@free-electrons.com>
Message-ID: <1367835297-6560-3-git-send-email-maxime.ripard@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 75b7dc68 ("linux: default to 3.9, remove 3.8") made 3.9 the
default kernel version.

The omap kernel switched to multiplatform kernel during the 3.9 kernel
development cycle. Obviously, the uImage generation doesn't work anymore
with multiplatform kernels, since you have to provide the kernel load
address, resulting in a build error.

Lock down the kernel version to 3.8 to keep the old behaviour until
someone submits a patch to switch to multiplatform kernel.

Signed-off-by: Maxime Ripard <maxime.ripard@free-electrons.com>
---
 configs/pandaboard_defconfig | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/configs/pandaboard_defconfig b/configs/pandaboard_defconfig
index 9496b7f..95cfdd6 100644
--- a/configs/pandaboard_defconfig
+++ b/configs/pandaboard_defconfig
@@ -11,8 +11,13 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_DEVTMPFS=y
 BR2_TARGET_ROOTFS_EXT2=y
 # BR2_TARGET_ROOTFS_TAR is not set
 
+# Lock to 3.8 headers to avoid breaking with newer kernels
+BR2_KERNEL_HEADERS_3_8=y
+
 # Kernel
 BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="3.8.11"
 BR2_LINUX_KERNEL_DEFCONFIG="omap2plus"
 
 # GCC
-- 
1.8.1.2
