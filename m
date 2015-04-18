From: Frank Hunleth <fhunleth@troodon-software.com>
Date: Sat, 18 Apr 2015 16:27:44 -0400
Subject: [Buildroot] [PATCH v2 3/3] altera: update use of
	BR2_TARGET_UBOOT_PATCH_DIR
In-Reply-To: <1429388864-15377-1-git-send-email-fhunleth@troodon-software.com>
References: <1429388864-15377-1-git-send-email-fhunleth@troodon-software.com>
Message-ID: <1429388864-15377-3-git-send-email-fhunleth@troodon-software.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use BR2_TARGET_UBOOT_PATCH now that BR2_TARGET_UBOOT_PATCH_DIR is
deprecated.

Signed-off-by: Frank Hunleth <fhunleth@troodon-software.com>
---
Changes v1 -> v2:
  - After switch to linux.mk style, patch directories are supported
    again
  - Actually tested this patch this time. It works - at least the
    patch applies and the altera_sockit configuration builds.

 configs/altera_sockit_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
index d27b96b..888fccf 100644
--- a/configs/altera_sockit_defconfig
+++ b/configs/altera_sockit_defconfig
@@ -31,7 +31,7 @@ BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.rocketboards.org/u-boot-socfpga.git"
 BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_acds13.0sp1"
-BR2_TARGET_UBOOT_CUSTOM_PATCH_DIR="board/altera/sockit"
+BR2_TARGET_UBOOT_PATCH="board/altera/sockit"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
--
1.9.1
