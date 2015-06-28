From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 29 Jun 2015 00:25:18 +0200
Subject: [Buildroot] [PATCH 09/11] config/raspberrypi: remove non-DT
	defconfig
In-Reply-To: <cover.1435529863.git.yann.morin.1998@free.fr>
References: <cover.1435529863.git.yann.morin.1998@free.fr>
Message-ID: <8c7ffa70a95624f40bf62a6866d2e4d69c1bfbcc.1435529863.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The RPi is slowly but surely dropping support for booting without a DTB,
so just ditch our old defconfig now that we have up-to-date DT-enabled
defconfigs for all RPi models (save for the compute module).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
---
 configs/raspberrypi_defconfig | 21 ---------------------
 1 file changed, 21 deletions(-)
 delete mode 100644 configs/raspberrypi_defconfig

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
deleted file mode 100644
index f9b8a1c..0000000
--- a/configs/raspberrypi_defconfig
+++ /dev/null
@@ -1,21 +0,0 @@
-BR2_arm=y
-BR2_arm1176jzf_s=y
-
-BR2_TOOLCHAIN_BUILDROOT_CXX=y
-
-BR2_TARGET_GENERIC_GETTY_PORT="tty1"
-
-BR2_PACKAGE_RPI_FIRMWARE=y
-
-# Lock to 3.12 headers as the RPi kernel is based off the 3.12 branch
-BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.28"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
-
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="c256eb9968c8997dce47350d2075e42f1b3991d3"
-BR2_LINUX_KERNEL_USE_DEFCONFIG=y
-BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
-BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.9.1
