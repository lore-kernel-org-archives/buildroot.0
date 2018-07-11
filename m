From: Yannis Damigos <ydamigos@iccs.gr>
Date: Wed, 11 Jul 2018 15:38:29 +0300
Subject: [Buildroot] [PATCH] configs: Use uboot 2018.07 in
 asus_tinker_rk3288 config
Message-ID: <20180711123829.29277-1-ydamigos@iccs.gr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Using uboot version 2017.11 creates an sd card image which fails to
boot with the following error:

  Missing DTB
  ### ERROR ### Please RESET the board ###

Updating tinkerboard default configuration to use latest uboot
release 2018.07 creates a sd card image which boot fine.

Signed-off-by: Yannis Damigos <ydamigos@iccs.gr>
---
 configs/asus_tinker_rk3288_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index 22e9bcd817..a0df3de8a1 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -10,7 +10,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_12=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.07"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="tinker-rk3288"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.18.0
