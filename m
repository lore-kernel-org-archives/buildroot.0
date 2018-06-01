From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 1 Jun 2018 16:41:01 +0200
Subject: [Buildroot] [git commit] Revert "configs/stm32f469: force usage of
 binutils 2.28.x"
Message-ID: <20180601144051.43EA3803EC@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=714d9e61c9c11d37471eedb88736ba75c6056a1d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 12049cc8b8972a9d0f1e27f1382cc5752d45312f.

Now that the binutils default has been changed for ARMv7M, this is no longer
needed.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/stm32f469_disco_defconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index e5cacafb46..8b77d8c1a2 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -2,7 +2,6 @@ BR2_arm=y
 BR2_cortex_m4=y
 BR2_GLOBAL_PATCH_DIR="board/stmicroelectronics/stm32f469-disco/patches"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_11=y
-BR2_BINUTILS_VERSION_2_28_X=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
