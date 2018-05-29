From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Date: Tue, 29 May 2018 12:09:27 +0000
Subject: [Buildroot] [PATCH 2/2] configs/stm32f469: force usage of BINUTILS
 2.28.x
In-Reply-To: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
References: <1527595765-23055-1-git-send-email-christophe.priouzeau@st.com>
Message-ID: <1527595765-23055-2-git-send-email-christophe.priouzeau@st.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Due to runtime issue with the usage of BINUTILS 2.29.x,
we need to use the version 2.28.x

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 configs/stm32f469_disco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index 8b77d8c..e5cacaf 100644
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
-- 
2.7.4
