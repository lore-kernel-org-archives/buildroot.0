From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 16 Mar 2014 16:25:25 +0100
Subject: [Buildroot] [PATCH 3/3] configs/raspberrypi: bump kernel version
In-Reply-To: <cover.1394983430.git.yann.morin.1998@free.fr>
References: <cover.1394983430.git.yann.morin.1998@free.fr>
Message-ID: <5e7e25d2a1638a19595137e49dd92ea43cfb2b43.1394983430.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

Bump from rpi-3.10.32 to rpi-3.10.33:
  - added support for extra GPIOs or Rev.2 boards (at last! ;-) )
  - v4l2 fixes for high FPS
  - audio fixes

Bump the kernel headers used for the toolchain at the same time (as
spotted by Cyrille.)

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Cyrille DERORY <cyrille.derory@derory.fr>
---
 configs/raspberrypi_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index dec1ce0..a7a38a8 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -10,13 +10,13 @@ BR2_PACKAGE_RPI_FIRMWARE=y
 
 # Lock to 3.10 headers as the RPi kernel is based off the 3.10 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.25"
+BR2_DEFAULT_KERNEL_VERSION="3.10.33"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="6ae359079d931d584c00492a7ea1d2538173b9b2"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="3bff11d4d4b8dc28cb9ce81449c989466ba27198"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.8.3.2
