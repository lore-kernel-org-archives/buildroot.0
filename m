From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 30 Jun 2015 14:30:45 +0200
Subject: [Buildroot] [git commit] config/raspberrypi: remove non-DT defconfig
Message-ID: <20150630123122.B980781796@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8f49a5069ab541ce8ec43765fe7e7b99d7ad8438
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The RPi is slowly but surely dropping support for booting without a DTB,
so just ditch our old defconfig now that we have up-to-date DT-enabled
defconfigs for all RPi models (save for the compute module).

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Floris Bos <bos@je-eigen-domein.nl>
Cc: Pascal de Bruijn <pmjdebruijn@pcode.nl>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 configs/raspberrypi_defconfig |   21 ---------------------
 1 files changed, 0 insertions(+), 21 deletions(-)

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
