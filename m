From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 24 Sep 2014 10:15:25 +0200
Subject: [Buildroot] [git commit] nitrogen6x_defconfig: bump u-boot version
Message-ID: <20140924081603.3FD2C9D769@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ef9b4fb5c28bca14ce53d495e3af4e83023c1cc4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To the 2014.07 release. For furture details, see:

http://boundarydevices.com/u-boot-2014-07-release-mx6-boards/

Also update our 6x_upgrade script to the version from that page so the
entire SPI flash gets erased (otherwise it fails on big u-boot builds) and
document how to perform the upgrade.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>

u-boot fixup
---
 board/boundarydevices/nitrogen6x/6x_upgrade |  Bin 1744 -> 1465 bytes
 board/boundarydevices/nitrogen6x/readme.txt |    4 ++++
 configs/nitrogen6x_defconfig                |    2 +-
 3 files changed, 5 insertions(+), 1 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/6x_upgrade b/board/boundarydevices/nitrogen6x/6x_upgrade
index cd26b61..395f13f 100644
Binary files a/board/boundarydevices/nitrogen6x/6x_upgrade and b/board/boundarydevices/nitrogen6x/6x_upgrade differ
diff --git a/board/boundarydevices/nitrogen6x/readme.txt b/board/boundarydevices/nitrogen6x/readme.txt
index a9ded49..f01d9f0 100644
--- a/board/boundarydevices/nitrogen6x/readme.txt
+++ b/board/boundarydevices/nitrogen6x/readme.txt
@@ -7,3 +7,7 @@ To install, simply extract rootfs.ext2 to first partition of a uSD card:
 sudo dd if=output/images/rootfs.ext2 of=/dev/sdX1
 
 Where 'sdX1' is the device node of the uSD partition.
+
+To upgrade u-boot, cancel autoboot and type:
+
+run upgradeu
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index 5e5b91e..245d3d8 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -16,7 +16,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="nitrogen6q"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
-BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/63ae4a5/u-boot-63ae4a5.tar.gz"
+BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="http://github.com/boundarydevices/u-boot-imx6/tarball/f870252/u-boot-f870252.tar.gz"
 
 # kernel
 BR2_LINUX_KERNEL=y
