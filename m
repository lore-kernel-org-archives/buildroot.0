From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 21 Feb 2017 16:10:22 +0100
Subject: [Buildroot] [git commit] nexbox_a95x_defconfig: bump kernel to
	final 4.10
Message-ID: <20170301170423.99A937FBDB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a17be324e53fc596aec4dea079972ae004cf5d32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

And use same version for header headers as well.

[Peter: explicitly set BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10 as pointed
	out by Thomas]
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/nexbox_a95x_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/nexbox_a95x_defconfig b/configs/nexbox_a95x_defconfig
index 906a22b..375b4d3 100644
--- a/configs/nexbox_a95x_defconfig
+++ b/configs/nexbox_a95x_defconfig
@@ -1,13 +1,13 @@
 BR2_aarch64=y
 BR2_cortex_a53=y
-BR2_KERNEL_HEADERS_4_9=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_10=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/nexbox/a95x/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/nexbox/a95x/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10-rc8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.10"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxbb-nexbox-a95x amlogic/meson-gxl-nexbox-a95x"
