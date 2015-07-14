From: Jan Viktorin <viktorin@rehivetech.com>
Date: Tue, 14 Jul 2015 17:14:46 +0200
Subject: [Buildroot] [PATCH v4 5/7] zedboard: Generate BOOT.BIN automatically
In-Reply-To: <20150714171214.706e9e4d@pcviktorin.fit.vutbr.cz>
Message-ID: <20150714171446.47eba280@pcviktorin.fit.vutbr.cz>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The U-Boot v2015.07 builds working SPL without a manual
intervention. The BOOT.BIN is generated from the standard
SPL so no BR2_TARGET_UBOOT_SPL_NAME redefinition is needed.
The SPL requires the u-boot-dtb.img file to boot properly.

Signed-off-by: Jan Viktorin <viktorin@rehivetech.com>
---
 configs/zedboard_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/zedboard_defconfig b/configs/zedboard_defconfig
index 76688e9..cd6436c 100644
--- a/configs/zedboard_defconfig
+++ b/configs/zedboard_defconfig
@@ -19,8 +19,8 @@ BR2_TARGET_ROOTFS_CPIO_UIMAGE=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="zynq_zed"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
-BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://github.com/Xilinx/u-boot-xlnx.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="xilinx-v2014.1"
-BR2_TARGET_UBOOT_FORMAT_IMG=y
+BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.denx.de/u-boot.git"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="v2015.07-rc2"
+BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="boot.bin"
+BR2_TARGET_UBOOT_ZYNQ_IMAGE=y
-- 
2.4.5




-- 
   Jan Viktorin                  E-mail: Viktorin at RehiveTech.com
   System Architect              Web:    www.RehiveTech.com
   RehiveTech                    Phone:  +420 606 201 868
   Brno, Czech Republic
