From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 17:49:49 +0200
Subject: [Buildroot] [git commit] configs/stm32f429: force usage of binutils
 2.28.x
Message-ID: <20180529155020.9EA4E8287C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=cbe43fd417d77f846f1ca47cdacd51a73be1aaec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #11051

Due to runtime issue with the usage of binutils 2.29.x, we need to use the
version 2.28.x

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
Acked-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/stm32f429_disco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32f429_disco_defconfig b/configs/stm32f429_disco_defconfig
index 5237e9adb5..fc167d0270 100644
--- a/configs/stm32f429_disco_defconfig
+++ b/configs/stm32f429_disco_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f429-disco/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+BR2_BINUTILS_VERSION_2_28_X=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
