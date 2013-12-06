From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 6 Dec 2013 22:20:31 +0100
Subject: [Buildroot] [git commit] board/raspberrypi: bump to use Linux 3.10
Message-ID: <20131206212919.E74EB9BF53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a4870b9072dc74d830e5c2203defd5a968380417
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The new 'stable' branch of the Raspberry Pi kernel is now based
on the Linux 3.10 branch (currently 3.10.22), so bump both the
kernel version for the toolchain headers, and for the target.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/raspberrypi_defconfig |    6 +++---
 1 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index da877fb..4df0f4b 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -10,14 +10,14 @@ BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_USERLAND=y
 BR2_PACKAGE_LIBCOFI=y
 
-# Lock to 3.6 headers as the RPi kernel is based off the 3.6 branch
+# Lock to 3.10 headers as the RPi kernel is based off the 3.10 branch
 BR2_KERNEL_HEADERS_VERSION=y
-BR2_DEFAULT_KERNEL_VERSION="3.6.11"
+BR2_DEFAULT_KERNEL_VERSION="3.10.22"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://github.com/raspberrypi/linux.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="1587f77"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="5ebf1db80e2c03e92d570605b53f91a06112574f"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi_quick"
 BR2_LINUX_KERNEL_ZIMAGE=y
