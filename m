From: Bartosz Bilas <b.bilas@grinn-global.com>
Date: Sat, 21 Mar 2020 14:32:22 +0100
Subject: [Buildroot] [PATCH 6/6] board/stmicroelectronics/stm32f4xx: move
 post-build script into common directory
In-Reply-To: <20200321133222.1393674-1-b.bilas@grinn-global.com>
References: <20200321133222.1393674-1-b.bilas@grinn-global.com>
Message-ID: <20200321133222.1393674-6-b.bilas@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Let's clean up "boards/stmicroelectronics" directory a bit
to have everything in particular directories.

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
---
 .../{ => common/stm32f4xx}/stm32-post-build.sh                  | 0
 configs/stm32f429_disco_defconfig                               | 2 +-
 configs/stm32f469_disco_defconfig                               | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename board/stmicroelectronics/{ => common/stm32f4xx}/stm32-post-build.sh (100%)

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
-- 
2.25.2
