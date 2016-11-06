From: Fabio Estevam <festevam@gmail.com>
Date: Sun,  6 Nov 2016 20:43:27 -0200
Subject: [Buildroot] [PATCH] freescale: Create the
	board/freescale/common/imx/ directory
Message-ID: <1478472207-29799-1-git-send-email-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In order to have a better hierarchy for the genimage scripts used by
NXP mx25, mx51, mx53, mx6, mx7 SoCs, let's place them inside the
board/freescale/common/imx/ directory.

This helps in creating a more natural separation between the mxs scripts
that are placed inside the board/freescale/common/mxs/ directory.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 board/freescale/common/{ => imx}/genimage.cfg.template | 0
 board/freescale/common/{ => imx}/post-image.sh         | 2 +-
 board/freescale/imx25pdk/readme.txt                    | 2 +-
 board/freescale/imx51evk/readme.txt                    | 2 +-
 board/freescale/imx6sabre/readme.txt                   | 2 +-
 board/freescale/imx6ulevk/readme.txt                   | 2 +-
 board/freescale/imx7dsdb/readme.txt                    | 2 +-
 board/technexion/imx6ulpico/readme.txt                 | 2 +-
 configs/freescale_imx6dlsabreauto_defconfig            | 2 +-
 configs/freescale_imx6dlsabresd_defconfig              | 2 +-
 configs/freescale_imx6qsabreauto_defconfig             | 2 +-
 configs/freescale_imx6qsabresd_defconfig               | 2 +-
 configs/freescale_imx6sololiteevk_defconfig            | 2 +-
 configs/freescale_imx6sxsabresd_defconfig              | 2 +-
 configs/freescale_imx6ulevk_defconfig                  | 2 +-
 configs/freescale_imx7dsabresd_defconfig               | 2 +-
 configs/imx6ulpico_defconfig                           | 2 +-
 configs/mx25pdk_defconfig                              | 2 +-
 configs/mx51evk_defconfig                              | 2 +-
 configs/mx53loco_defconfig                             | 2 +-
 configs/warp7_defconfig                                | 2 +-
 configs/warpboard_defconfig                            | 2 +-
 22 files changed, 21 insertions(+), 21 deletions(-)
 rename board/freescale/common/{ => imx}/genimage.cfg.template (100%)
 rename board/freescale/common/{ => imx}/post-image.sh (94%)

diff --git a/board/freescale/common/genimage.cfg.template b/board/freescale/common/imx/genimage.cfg.template
similarity index 100%
rename from board/freescale/common/genimage.cfg.template
rename to board/freescale/common/imx/genimage.cfg.template
diff --git a/board/freescale/common/post-image.sh b/board/freescale/common/imx/post-image.sh
similarity index 94%
rename from board/freescale/common/post-image.sh
rename to board/freescale/common/imx/post-image.sh
index 7d48550..9e4da82 100755
--- a/board/freescale/common/post-image.sh
+++ b/board/freescale/common/imx/post-image.sh
@@ -35,7 +35,7 @@ main()
 	local GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
 	sed -e "s/%FILES%/${FILES}/" \
-		board/freescale/common/genimage.cfg.template > ${GENIMAGE_CFG}
+		board/freescale/common/imx/genimage.cfg.template > ${GENIMAGE_CFG}
 
 	rm -rf "${GENIMAGE_TMP}"
 
diff --git a/board/freescale/imx25pdk/readme.txt b/board/freescale/imx25pdk/readme.txt
index df7c617..1aece6c 100644
--- a/board/freescale/imx25pdk/readme.txt
+++ b/board/freescale/imx25pdk/readme.txt
@@ -40,7 +40,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/freescale/common/genimage.cfg.template.
+board/freescale/common/imx/genimage.cfg.template.
 
 Boot the i.MX25 PDK board
 =========================
diff --git a/board/freescale/imx51evk/readme.txt b/board/freescale/imx51evk/readme.txt
index bf739fd..d67a3fd 100644
--- a/board/freescale/imx51evk/readme.txt
+++ b/board/freescale/imx51evk/readme.txt
@@ -40,7 +40,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/freescale/common/genimage.cfg.template.
+board/freescale/common/imx/genimage.cfg.template.
 
 Boot the i.MX51 EVK board
 =========================
diff --git a/board/freescale/imx6sabre/readme.txt b/board/freescale/imx6sabre/readme.txt
index e409d8f..a1bd82f 100644
--- a/board/freescale/imx6sabre/readme.txt
+++ b/board/freescale/imx6sabre/readme.txt
@@ -71,7 +71,7 @@ command as root:
 *** WARNING! The script will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/freescale/common/genimage.cfg.template.
+board/freescale/common/imx/genimage.cfg.template.
 
 Boot the SABRE board
 ====================
diff --git a/board/freescale/imx6ulevk/readme.txt b/board/freescale/imx6ulevk/readme.txt
index 98de277..25b95fe 100644
--- a/board/freescale/imx6ulevk/readme.txt
+++ b/board/freescale/imx6ulevk/readme.txt
@@ -43,7 +43,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/freescale/common/genimage.cfg.template.
+board/freescale/common/imx/genimage.cfg.template.
 
 Boot the i.MX6UL EVK board
 =========================
diff --git a/board/freescale/imx7dsdb/readme.txt b/board/freescale/imx7dsdb/readme.txt
index 9aeeb16..c6030f6 100644
--- a/board/freescale/imx7dsdb/readme.txt
+++ b/board/freescale/imx7dsdb/readme.txt
@@ -40,7 +40,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/freescale/common/genimage.cfg.template.
+board/freescale/common/imx/genimage.cfg.template.
 
 Boot the i.MX7D SDB board
 =========================
diff --git a/board/technexion/imx6ulpico/readme.txt b/board/technexion/imx6ulpico/readme.txt
index a7c3a44..7eab3f6 100644
--- a/board/technexion/imx6ulpico/readme.txt
+++ b/board/technexion/imx6ulpico/readme.txt
@@ -46,7 +46,7 @@ command as root:
 *** WARNING! This will destroy all the card content. Use with care! ***
 
 For details about the medium image layout, see the definition in
-board/freescale/common/genimage.cfg.template.
+board/freescale/common/imx/genimage.cfg.template.
 
 Boot the i.MX6UL Pico board
 =========================
diff --git a/configs/freescale_imx6dlsabreauto_defconfig b/configs/freescale_imx6dlsabreauto_defconfig
index ed5f67c..1cf5fee 100644
--- a/configs/freescale_imx6dlsabreauto_defconfig
+++ b/configs/freescale_imx6dlsabreauto_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabreauto"
 
 # filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
diff --git a/configs/freescale_imx6dlsabresd_defconfig b/configs/freescale_imx6dlsabresd_defconfig
index 0cbe974..904f0a2 100644
--- a/configs/freescale_imx6dlsabresd_defconfig
+++ b/configs/freescale_imx6dlsabresd_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6dl-sabresd"
 
 # filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 
 # required tools to create the microSD image
diff --git a/configs/freescale_imx6qsabreauto_defconfig b/configs/freescale_imx6qsabreauto_defconfig
index 9ae2f81..64efd42 100644
--- a/configs/freescale_imx6qsabreauto_defconfig
+++ b/configs/freescale_imx6qsabreauto_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabreauto"
 
 # filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
diff --git a/configs/freescale_imx6qsabresd_defconfig b/configs/freescale_imx6qsabresd_defconfig
index 913a724..962c274 100644
--- a/configs/freescale_imx6qsabresd_defconfig
+++ b/configs/freescale_imx6qsabresd_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd"
 
 # filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
diff --git a/configs/freescale_imx6sololiteevk_defconfig b/configs/freescale_imx6sololiteevk_defconfig
index 79ebcb8..bf0b9e5 100644
--- a/configs/freescale_imx6sololiteevk_defconfig
+++ b/configs/freescale_imx6sololiteevk_defconfig
@@ -18,7 +18,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sl-evk"
 
 # filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 
 # required tools to create the microSD image
diff --git a/configs/freescale_imx6sxsabresd_defconfig b/configs/freescale_imx6sxsabresd_defconfig
index fed1a3e..9b5cdb8 100644
--- a/configs/freescale_imx6sxsabresd_defconfig
+++ b/configs/freescale_imx6sxsabresd_defconfig
@@ -21,7 +21,7 @@ BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6sx-sdb"
 
 # filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 
 # required tools to create the microSD image
diff --git a/configs/freescale_imx6ulevk_defconfig b/configs/freescale_imx6ulevk_defconfig
index d033b99..3c5a909 100644
--- a/configs/freescale_imx6ulevk_defconfig
+++ b/configs/freescale_imx6ulevk_defconfig
@@ -31,6 +31,6 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # filesystem / image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/freescale_imx7dsabresd_defconfig b/configs/freescale_imx7dsabresd_defconfig
index 4bedef1..97d3cde 100644
--- a/configs/freescale_imx7dsabresd_defconfig
+++ b/configs/freescale_imx7dsabresd_defconfig
@@ -33,4 +33,4 @@ BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
diff --git a/configs/imx6ulpico_defconfig b/configs/imx6ulpico_defconfig
index 71277d9..88604a6 100644
--- a/configs/imx6ulpico_defconfig
+++ b/configs/imx6ulpico_defconfig
@@ -45,6 +45,6 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # filesystem / image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
diff --git a/configs/mx25pdk_defconfig b/configs/mx25pdk_defconfig
index 645fe8a..65a6d12 100644
--- a/configs/mx25pdk_defconfig
+++ b/configs/mx25pdk_defconfig
@@ -14,7 +14,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
diff --git a/configs/mx51evk_defconfig b/configs/mx51evk_defconfig
index 1fca282..db82a36 100644
--- a/configs/mx51evk_defconfig
+++ b/configs/mx51evk_defconfig
@@ -14,7 +14,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 94ac818..7597ae9 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -14,7 +14,7 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
 
 # Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 31251f4..a55a504 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -38,7 +38,7 @@ BR2_PACKAGE_WPA_SUPPLICANT=y
 BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
 
 # Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
diff --git a/configs/warpboard_defconfig b/configs/warpboard_defconfig
index 5e9c051..531a878 100644
--- a/configs/warpboard_defconfig
+++ b/configs/warpboard_defconfig
@@ -42,7 +42,7 @@ BR2_PACKAGE_HOST_DFU_UTIL=y
 BR2_PACKAGE_HOST_IMX_USB_LOADER=y
 
 # Filesystem
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 
-- 
2.7.4
