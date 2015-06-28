From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 00:25:17 +0200
Subject: [Buildroot] [PATCH 08/11] configs/raspberrypi2: update our defconfig
In-Reply-To: <cover.1435529863.git.yann.morin.1998@free.fr>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
Message-ID: <f92c656c9b3b4ffd32c27895bce5ee9e0ddfc1de.1435529863.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update to the latest stable kernel version (4.0.y); build an in-tree DTB.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 configs/raspberrypi2_defconfig | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 5859749..d3fe328 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -7,16 +7,22 @@ BR2_TOOLCHAIN_BUILDROOT_CXX=y
 
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
-# Lock to 3.18 headers as the RPi2 kernel is based off the 3.18 branch
+# Lock to 4.0 headers as the RPi kernel stable tree is
+# based off the 4.0 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.18"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_18=y
+BR2_DEFAULT_KERNEL_VERSION="4.0.6"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_0=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="2747cc0bde4ca441691260fae1e34c9ef954ccae"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9ef19eae373337b18759152fd9ca94788c8fe11c"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
-BR2_LINUX_KERNEL_ZIMAGE=y
+BR2_LINUX_KERNEL_ZIMAGE=yo
+
+# Build the DTB from the kernel sources
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+# BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
-- 
1.9.1
