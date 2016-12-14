From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 14 Dec 2016 17:12:12 +0100
Subject: [Buildroot] [git commit] configs/mx6: Select NEON and VFP related
	options
Message-ID: <20161214161406.8C64F81E42@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c9df2b3e5bc73f9587602b119d325b88c4498112
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

MX6 has a Cortex-A9 core, which supports NEON and VFP.

Add support for them.

Suggested-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/freescale_imx6dlsabreauto_defconfig | 3 +++
 configs/freescale_imx6dlsabresd_defconfig   | 3 +++
 configs/freescale_imx6qsabreauto_defconfig  | 3 +++
 configs/freescale_imx6qsabresd_defconfig    | 3 +++
 configs/freescale_imx6sololiteevk_defconfig | 3 +++
 configs/freescale_imx6sxsabresd_defconfig   | 3 +++
 configs/mx6cubox_defconfig                  | 3 +++
 configs/mx6sx_udoo_neo_defconfig            | 3 +++
 configs/mx6udoo_defconfig                   | 3 +++
 configs/riotboard_defconfig                 | 2 ++
 configs/wandboard_defconfig                 | 3 +++
 configs/warpboard_defconfig                 | 3 +++
 12 files changed, 35 insertions(+)

diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index 1cf5fee..c946988 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 904f0a2..18cef00 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 64efd42..9e8e007 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 962c274..824e128 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index bf0b9e5..0e81b2b 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
 # Linux headers same as kernel, a 4.1 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index 9b5cdb8..4a40c26 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
 # patches
 BR2_GLOBAL_PATCH_DIR="board/freescale/imx6sabre/patches"
diff --git a/configs/mx6cubox_defconfig b/configs/mx6cubox_defconfig
index b288ed7..9ce496d 100644
--- a/configs/mx6cubox_defconfig
+++ b/configs/mx6cubox_defconfig
@@ -1,5 +1,8 @@
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 # Linux headers same as kernel, a 4.7 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
diff --git a/configs/mx6sx_udoo_neo_defconfig b/configs/mx6sx_udoo_neo_defconfig
index aecb520..1de19c0 100644
--- a/configs/mx6sx_udoo_neo_defconfig
+++ b/configs/mx6sx_udoo_neo_defconfig
@@ -1,5 +1,8 @@
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 # Linux headers same as kernel, a 4.9 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_9=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/neo/post-build.sh"
diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 394580b..bf2a596 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -1,5 +1,8 @@
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 # Linux headers same as kernel, a 4.8 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_8=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
diff --git a/configs/riotboard_defconfig b/configs/riotboard_defconfig
index d486e1e..c228105 100644
--- a/configs/riotboard_defconfig
+++ b/configs/riotboard_defconfig
@@ -1,7 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
 # system
 BR2_TARGET_GENERIC_GETTY=y
diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 7b075e4..caa4c51 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -1,5 +1,8 @@
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 # Linux headers same as kernel, a 4.7 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 531a878..71d777f 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -1,6 +1,9 @@
 # architecture
 BR2_arm=y
 BR2_cortex_a9=y
+BR2_ARM_ENABLE_NEON=y
+BR2_ARM_ENABLE_VFP=y
+BR2_ARM_FPU_VFPV3=y
 
 # Linux headers same as kernel, a 4.4 series
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_4=y
