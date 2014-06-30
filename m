From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Jun 2014 23:52:14 +0200
Subject: [Buildroot] [PATCH 14/14] defconfig/wandboard: update kernel +
	bootlaoder
In-Reply-To: <cover.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <cf148e58a53cf0c55c12e211c4367363bdf1dc0f.1404164261.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

A newer kernel is needed, so we are aligned with what the Freescale
userland (imx-lib + imx=vpu) supports.

Also, update U-Boot to use the mainline repository, since:
  - the u-boot-imx tree is a developper's tree
  - it is not advertised on the U-Boot git home (http://git.denx.de/)
  - the wandboard in mainline is fully supported
  - there is no changeset relevant to the wandboard in the u-boot-imx
    tree

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
---
 configs/wandboard_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 996a70a..6bf436e 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -7,8 +7,8 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="wandboard_dl"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot-imx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="326ea986ac150acdc7656d57fca647db80b50158"
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="http://git.denx.de/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2014.07-rc3"
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot.imx"
 BR2_TARGET_UBOOT_ENVIMAGE=y
@@ -16,7 +16,7 @@ BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/wandboard/uboot-env.txt"
 BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x2000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
-BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://repo.or.cz/wandboard.git"
-BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="86429847b5152f040f190015faedcac49b243328"
+BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/wandboard-org/linux"
+BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="9d567e4f285e80bc332e79f0636259bc05a4ee3b"
 BR2_LINUX_KERNEL_DEFCONFIG="wandboard"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
1.9.1
