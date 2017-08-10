From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Thu, 10 Aug 2017 23:59:29 +0200
Subject: [Buildroot] [PATCH] nanopi_m1{,
	_plus}_defconfig: U-Boot needs pylibfdt
Message-ID: <20170810215929.13430-1-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

nanopi_m1 and nanopi_m1_plus are sunxi boards that need pylibfdt in
U-Boot.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873655
https://gitlab.com/buildroot.org/buildroot/-/jobs/27873656

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Cc: Peter Korsgaard <peter@korsgaard.com>
Cc: Chakra Divi <2chakrass@gmail.com>
---
Apparently this was only tested on a host that had pylibfdt installed?

Note that nanopi_neo will also need to be updated if its U-Boot version
gets bumped.
---
 configs/nanopi_m1_defconfig      | 1 +
 configs/nanopi_m1_plus_defconfig | 1 +
 2 files changed, 2 insertions(+)

diff --git a/configs/nanopi_m1_defconfig b/configs/nanopi_m1_defconfig
index 23a5e60207..323015ee68 100644
--- a/configs/nanopi_m1_defconfig
+++ b/configs/nanopi_m1_defconfig
@@ -17,6 +17,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 
diff --git a/configs/nanopi_m1_plus_defconfig b/configs/nanopi_m1_plus_defconfig
index a1ae00e445..da707fd5fa 100644
--- a/configs/nanopi_m1_plus_defconfig
+++ b/configs/nanopi_m1_plus_defconfig
@@ -17,6 +17,7 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="nanopi_m1_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
 BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
 
-- 
2.13.3
