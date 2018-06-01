From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jun 2018 16:40:11 +0200
Subject: [Buildroot] [git commit] Revert "configs/stm32f429: force usage of
 binutils 2.28.x"
Message-ID: <20180601144051.3B0D37FF2B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=371b45fe4aaf8ba5ad46223d947cf7f9b851785f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit cbe43fd417d77f846f1ca47cdacd51a73be1aaec.

Now that the binutils default has been changed for ARMv7M, this is no longer
needed.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/stm32f429_disco_defconfig | 1 -
 linux/Config.in                   | 2 +-
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
index fc167d0270..5237e9adb5 100644
--- a/configs/stm32f429_disco_defconfig
+++ b/configs/stm32f429_disco_defconfig
@@ -2,7 +2,6 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
-BR2_BINUTILS_VERSION_2_28_X=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
diff --git a/linux/Config.in b/linux/Config.in
index b5957b61d3..bffb52fd18 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -8,7 +8,7 @@ config BR2_LINUX_KERNEL
 
 if BR2_LINUX_KERNEL
 
-comment "Linux kernel will not boot with binutils >= 2.29"
+comment "Linux kernel may fail to boot with binutils >= 2.29"
 	depends on BR2_ARM_CPU_ARMV7M
 	depends on !BR2_BINUTILS_VERSION_2_28_X
 
