From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  4 Aug 2014 21:46:38 +0200
Subject: [Buildroot] [PATCH 1/1] configs: bump kernel used for the RPi
Message-ID: <1407181598-15423-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The rpi-3.12.y branch has now been merged with the 3.12.26 upstream.

Bump kernel headers used for the toolchain at the same time.

Fixes
http://jenkins.free-electrons.com/job/buildroot/config=raspberrypi_defconfig/320/console

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 configs/raspberrypi_defconfig |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index c12d473..0a32fd3 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -10,13 +10,13 @@ BR2_PACKAGE_RPI_FIRMWARE=y
 
 # Lock to 3.12 headers as the RPi kernel is based off the 3.12 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.25"
+BR2_DEFAULT_KERNEL_VERSION="3.12.26"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="0b8e8118dd2c9440bb7a2da1a19e15e324d3c09b"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="353043394c99ed37a4075da228af64468fdf6c06"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
-- 
1.7.10.4
