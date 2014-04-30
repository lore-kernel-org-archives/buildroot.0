From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 30 Apr 2014 09:12:29 +0200
Subject: [Buildroot] [git commit] configs: bump raspberrypi_defconfig to use
	latest rpi-3.12.y
Message-ID: <20140430071330.B9A4B9BA81@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8b091e1dbd84b17c9274cfd79d089cc09dc0ee25
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Raspberry Pi people are now considering there stable version to
be based on the 3.12.series:
    http://www.raspberrypi.org/forums/viewtopic.php?f=29&t=75895

    > The 3.12 kernel tree has long term support and we are moving to it.

Bump the Raspberry Pi defconfig to use the latest stable version of
the rpi-3.12.y branch, based on linux-3.12.18.

Bump the kernel headers at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi_defconfig |    8 ++++----
 1 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index b7fe8c0..61e23c0 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -8,15 +8,15 @@ BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 
-# Lock to 3.10 headers as the RPi kernel is based off the 3.10 branch
+# Lock to 3.12 headers as the RPi kernel is based off the 3.12 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.10.36"
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_10=y
+BR2_DEFAULT_KERNEL_VERSION="3.12.18"
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="7193cfe22b63ae92d1f7e955c2276adbdafd28e0"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="746069c0ac473cfb4fd70415149b4cfdea193119"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
