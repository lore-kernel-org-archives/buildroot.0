From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 23:12:34 +0200
Subject: [Buildroot] [git commit] configs: bump kernel used for the RPi
Message-ID: <20140601211459.EE90E9CA1E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=6a40596ed079befe5b76dbaf95b96b360704799a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The rpi-3.12.y branch has now been merged with the 3.12.20 upstream,
and contains some fixes for FIQ, v4l2, i2c, USB, and 1-wire GPIOs.

Bump kernel headers used for the toolchain at the same time.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi_defconfig |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index d0c5813..7727533 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -10,13 +10,13 @@ BR2_PACKAGE_RPI_FIRMWARE=y
 
 # Lock to 3.12 headers as the RPi kernel is based off the 3.12 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.12.18"
+BR2_DEFAULT_KERNEL_VERSION="3.12.20"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_12=y
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="b09a27249d61475e4423607f7632a5aa6e7b3a53"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="a25152fdfbfd3b4330da16fc3aeb6b1ef8843805"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
