From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Wed, 7 Oct 2020 21:27:17 +0200
Subject: [Buildroot] [git commit] defconfigs: use
 BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_
Message-ID: <20201007191800.0437186B2C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b4ad2183018b782d1beecf0eae89b33ab4b60eec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For defconfigs that create a boot envimage, add the host package
uboot-tools and update the script variable names.

Add BR2_PACKAGE_HOST_UBOOT_TOOLS=y just before the existing
BR2_TARGET_UBOOT_ENVIMAGE option. Note that for the defconfigs that are
not manually formatted (i.e. just the result of 'make savedefconfig'),
this puts them in the wrong place. However, it's easier this way, and
it's more consistent in general to have the definition of the envimage
close to BR2_TARGET_UBOOT itself.

Related to 78559d699ae4b5c22ae77cfb7994560e0267be96

Cc: Arnout Vandecappelle <arnout@mind.be>
Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 configs/at91sam9x5ek_mmc_defconfig     | 7 ++++---
 configs/at91sam9x5ek_mmc_dev_defconfig | 7 ++++---
 configs/ci20_defconfig                 | 7 ++++---
 configs/snps_archs38_hsdk_defconfig    | 7 ++++---
 configs/socrates_cyclone5_defconfig    | 7 ++++---
 5 files changed, 20 insertions(+), 15 deletions(-)

diff --git a/configs/at91sam9x5ek_mmc_defconfig b/configs/at91sam9x5ek_mmc_defconfig
index 633ca8e1cc..63a537bd9c 100644
--- a/configs/at91sam9x5ek_mmc_defconfig
+++ b/configs/at91sam9x5ek_mmc_defconfig
@@ -35,9 +35,10 @@ BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.1"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9x5ek_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_ENVIMAGE=y
-BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/atmel/at91sam9x5ek_mmc/uboot-env.txt"
-BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x4000"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/atmel/at91sam9x5ek_mmc/uboot-env.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x4000"
 
 # Host packages
 # Needed to generate the SD card image
diff --git a/configs/at91sam9x5ek_mmc_dev_defconfig b/configs/at91sam9x5ek_mmc_dev_defconfig
index e8246c8d50..698cb9230a 100644
--- a/configs/at91sam9x5ek_mmc_dev_defconfig
+++ b/configs/at91sam9x5ek_mmc_dev_defconfig
@@ -95,9 +95,10 @@ BR2_TARGET_UBOOT_CUSTOM_REPO_URL="https://github.com/linux4sam/u-boot-at91.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="linux4sam_6.1"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="at91sam9x5ek_mmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
-BR2_TARGET_UBOOT_ENVIMAGE=y
-BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/atmel/at91sam9x5ek_mmc/uboot-env.txt"
-BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x4000"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/atmel/at91sam9x5ek_mmc/uboot-env.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x4000"
 
 # Host packages
 # Needed to generate the SD card image
diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 076f21bdfe..09eddc4e68 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -28,9 +28,10 @@ BR2_TARGET_UBOOT_BOARD_DEFCONFIG="ci20_mmc"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
-BR2_TARGET_UBOOT_ENVIMAGE=y
-BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/ci20/uboot-env.txt"
-BR2_TARGET_UBOOT_ENVIMAGE_SIZE="32768"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/ci20/uboot-env.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="32768"
 
 # host
 BR2_PACKAGE_HOST_GENIMAGE=y
diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index af7cba6c2e..9a9d57b325 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -35,6 +35,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="hsdk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_ELF=y
-BR2_TARGET_UBOOT_ENVIMAGE=y
-BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/synopsys/hsdk/uboot.env.txt"
-BR2_TARGET_UBOOT_ENVIMAGE_SIZE="0x4000"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/synopsys/hsdk/uboot.env.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="0x4000"
diff --git a/configs/socrates_cyclone5_defconfig b/configs/socrates_cyclone5_defconfig
index 4c659263df..6ecbf05d8c 100644
--- a/configs/socrates_cyclone5_defconfig
+++ b/configs/socrates_cyclone5_defconfig
@@ -23,9 +23,10 @@ BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_ALTERA_SOCFPGA_IMAGE_CRC=y
-BR2_TARGET_UBOOT_ENVIMAGE=y
-BR2_TARGET_UBOOT_ENVIMAGE_SOURCE="board/altera/socrates_cyclone5/boot-env.txt"
-BR2_TARGET_UBOOT_ENVIMAGE_SIZE="8192"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SOURCE="board/altera/socrates_cyclone5/boot-env.txt"
+BR2_PACKAGE_HOST_UBOOT_TOOLS_ENVIMAGE_SIZE="8192"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
