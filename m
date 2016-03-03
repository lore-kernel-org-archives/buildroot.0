From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 3 Mar 2016 17:42:14 +0100
Subject: [Buildroot] [git commit] board/boundarydevices: rename folder and
	update readme
Message-ID: <20160303164338.3851F7FCE4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=85721034ae475e72144209f4dbc50be3567f7a32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It didn't make sense to keep the U-Boot scripts and post build/image
scripts under the nitrogen6x folder since they apply for all our
platforms.

Also update the readme.txt to make it clearer which defconfig should
be used depending on the platform targeted.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../{nitrogen6x => common}/6x_bootscript.txt       |  0
 .../{nitrogen6x => common}/6x_upgrade.txt          |  0
 .../{nitrogen6x => common}/genimage.cfg            |  0
 .../{nitrogen6x => common}/post-build.sh           |  0
 .../{nitrogen6x => common}/post-image.sh           |  0
 board/boundarydevices/common/readme.txt            | 30 ++++++++++++++++++++++
 board/boundarydevices/nitrogen6x/readme.txt        | 13 ----------
 configs/nitrogen6sx_defconfig                      |  4 +--
 configs/nitrogen6x_defconfig                       |  4 +--
 configs/nitrogen7_defconfig                        |  4 +--
 10 files changed, 36 insertions(+), 19 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/6x_bootscript.txt b/board/boundarydevices/common/6x_bootscript.txt
similarity index 100%
rename from board/boundarydevices/nitrogen6x/6x_bootscript.txt
rename to board/boundarydevices/common/6x_bootscript.txt
diff --git a/board/boundarydevices/nitrogen6x/6x_upgrade.txt b/board/boundarydevices/common/6x_upgrade.txt
similarity index 100%
rename from board/boundarydevices/nitrogen6x/6x_upgrade.txt
rename to board/boundarydevices/common/6x_upgrade.txt
diff --git a/board/boundarydevices/nitrogen6x/genimage.cfg b/board/boundarydevices/common/genimage.cfg
similarity index 100%
rename from board/boundarydevices/nitrogen6x/genimage.cfg
rename to board/boundarydevices/common/genimage.cfg
diff --git a/board/boundarydevices/nitrogen6x/post-build.sh b/board/boundarydevices/common/post-build.sh
similarity index 100%
rename from board/boundarydevices/nitrogen6x/post-build.sh
rename to board/boundarydevices/common/post-build.sh
diff --git a/board/boundarydevices/nitrogen6x/post-image.sh b/board/boundarydevices/common/post-image.sh
similarity index 100%
rename from board/boundarydevices/nitrogen6x/post-image.sh
rename to board/boundarydevices/common/post-image.sh
diff --git a/board/boundarydevices/common/readme.txt b/board/boundarydevices/common/readme.txt
new file mode 100644
index 0000000..0625dee
--- /dev/null
+++ b/board/boundarydevices/common/readme.txt
@@ -0,0 +1,30 @@
+Buildroot for Boundary Devices platforms:
+
+https://boundarydevices.com/product-category/popular-sbc-and-som-modules/
+
+Here is the list of targeted platforms per defconfig:
+
+- nitrogen6x_defconfig
+  - BD-SL-i.MX6 (SABRE-Lite)
+  - Nitrogen6X
+  - Nitrogen6_Lite
+  - Nitrogen6_MAX
+  - Nitrogen6_VM
+  - Nitrogen6_SOM
+  - Nitrogen6_SOMv2
+
+- nitrogen6sx_defconfig
+  - Nitrogen6_SoloX
+
+- nitrogen7_defconfig
+  - Nitrogen7
+
+To install, simply copy the image to a uSD card:
+
+$ sudo dd if=output/images/sdcard.img of=/dev/sdX
+
+Where 'sdX' is the device node of the uSD partition.
+
+To upgrade u-boot, cancel autoboot and type:
+
+> run upgradeu
diff --git a/board/boundarydevices/nitrogen6x/readme.txt b/board/boundarydevices/nitrogen6x/readme.txt
deleted file mode 100644
index 6c723f1..0000000
--- a/board/boundarydevices/nitrogen6x/readme.txt
+++ /dev/null
@@ -1,13 +0,0 @@
-Buildroot for Boundary Devices Nitrogen6X:
-
-http://boundarydevices.com/products/nitrogen6x-board-imx6-arm-cortex-a9-sbc/
-
-To install, simply copy the image to a uSD card:
-
-sudo dd if=output/images/sdcard.img of=/dev/sdX
-
-Where 'sdX' is the device node of the uSD partition.
-
-To upgrade u-boot, cancel autoboot and type:
-
-run upgradeu
diff --git a/configs/nitrogen6sx_defconfig b/configs/nitrogen6sx_defconfig
index e69fafc..fcc74c9 100644
--- a/configs/nitrogen6sx_defconfig
+++ b/configs/nitrogen6sx_defconfig
@@ -5,8 +5,8 @@ BR2_cortex_a9=y
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/nitrogen6x/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
diff --git a/configs/nitrogen6x_defconfig b/configs/nitrogen6x_defconfig
index d8da188..7b95988 100644
--- a/configs/nitrogen6x_defconfig
+++ b/configs/nitrogen6x_defconfig
@@ -5,8 +5,8 @@ BR2_cortex_a9=y
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/nitrogen6x/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
diff --git a/configs/nitrogen7_defconfig b/configs/nitrogen7_defconfig
index 91529e8..d8c3975 100644
--- a/configs/nitrogen7_defconfig
+++ b/configs/nitrogen7_defconfig
@@ -5,8 +5,8 @@ BR2_cortex_a7=y
 # system
 BR2_TARGET_GENERIC_GETTY=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/nitrogen6x/post-build.sh"
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/nitrogen6x/post-image.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/boundarydevices/common/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/boundarydevices/common/post-image.sh"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 
