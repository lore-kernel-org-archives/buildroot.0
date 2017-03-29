From: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
Date: Wed, 29 Mar 2017 10:51:20 -0400
Subject: [Buildroot] [RFC 4/4] board/acmesystems/aria-g25: set
	BR2_GENIMAGE_CFG_FILES
In-Reply-To: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
References: <20170329145120.11863-1-etienne.phelip@savoirfairelinux.com>
Message-ID: <20170329145120.11863-5-etienne.phelip@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use the new BR2_GENIMAGE_CFG_FILES Kconfig symbol to reduce
boilerplate and use the generic genimage wrapper.

Signed-off-by: Etienne Phelip <etienne.phelip@savoirfairelinux.com>
---
 board/acmesystems/aria-g25/post-image.sh     | 14 --------------
 configs/acmesystems_aria_g25_128mb_defconfig |  2 +-
 configs/acmesystems_aria_g25_256mb_defconfig |  2 +-
 3 files changed, 2 insertions(+), 16 deletions(-)
 delete mode 100755 board/acmesystems/aria-g25/post-image.sh

diff --git a/board/acmesystems/aria-g25/post-image.sh b/board/acmesystems/aria-g25/post-image.sh
deleted file mode 100755
index 2846f56..0000000
--- a/board/acmesystems/aria-g25/post-image.sh
+++ /dev/null
@@ -1,14 +0,0 @@
-#!/bin/sh
-
-BOARD_DIR="$(dirname $0)"
-GENIMAGE_CFG="${BOARD_DIR}/genimage.cfg"
-GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
-
-rm -rf "${GENIMAGE_TMP}"
-
-genimage  \
-	--rootpath "${TARGET_DIR}"     \
-	--tmppath "${GENIMAGE_TMP}"    \
-	--inputpath "${BINARIES_DIR}"  \
-	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
diff --git a/configs/acmesystems_aria_g25_128mb_defconfig b/configs/acmesystems_aria_g25_128mb_defconfig
index 0ec210f..23bb8b9 100644
--- a/configs/acmesystems_aria_g25_128mb_defconfig
+++ b/configs/acmesystems_aria_g25_128mb_defconfig
@@ -8,7 +8,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/aria-g25/post-image.sh"
 
 # Kernel configuration
 BR2_LINUX_KERNEL=y
@@ -34,3 +33,4 @@ BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-128m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GENIMAGE_CFG_FILES="board/acmesystems/aria-g25/genimage.cfg"
diff --git a/configs/acmesystems_aria_g25_256mb_defconfig b/configs/acmesystems_aria_g25_256mb_defconfig
index a480287..9b44bbe 100644
--- a/configs/acmesystems_aria_g25_256mb_defconfig
+++ b/configs/acmesystems_aria_g25_256mb_defconfig
@@ -8,7 +8,6 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_7=y
 BR2_TARGET_GENERIC_ISSUE="Welcome to Aria-G25 Buildroot"
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_115200=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/acmesystems/aria-g25/post-image.sh"
 
 # Kernel configuration
 BR2_LINUX_KERNEL=y
@@ -34,3 +33,4 @@ BR2_TARGET_AT91BOOTSTRAP3_DEFCONFIG="aria-256m"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
+BR2_GENIMAGE_CFG_FILES="board/acmesystems/aria-g25/genimage.cfg"
-- 
2.9.3
