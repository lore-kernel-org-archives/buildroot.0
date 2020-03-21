From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 21 Mar 2020 15:27:17 +0100
Subject: [Buildroot] [git commit] board/stmicroelectronics/stm32f4xx: move
 post-build script into common directory
Message-ID: <20200321141448.0F28182B3A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=092b112f4814f8da0b788a7b982065a92a679482
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Let's clean up "boards/stmicroelectronics" directory a bit
to have everything in particular directories.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/stmicroelectronics/{ => common/stm32f4xx}/stm32-post-build.sh | 0
 configs/stm32f429_disco_defconfig                                   | 2 +-
 configs/stm32f469_disco_defconfig                                   | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32-post-build.sh b/board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
similarity index 100%
rename from board/stmicroelectronics/stm32-post-build.sh
rename to board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh
diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
index 5237e9adb5..2c0641a6c5 100644
--- a/configs/stm32f429_disco_defconfig
+++ b/configs/stm32f429_disco_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index 8b77d8c1a2..9760d51878 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.11"
