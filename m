From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 29 May 2018 17:50:33 +0200
Subject: [Buildroot] [git commit] configs/stm32f469: force usage of binutils
 2.28.x
Message-ID: <20180529155020.AAFFA8287C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=12049cc8b8972a9d0f1e27f1382cc5752d45312f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #11051

Due to runtime issue with the usage of binutils 2.29.x, we need to use the
version 2.28.x

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
Acked-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/stm32f469_disco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index 8b77d8c1a2..e5cacafb46 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -2,6 +2,7 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
+BR2_BINUTILS_VERSION_2_28_X=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
