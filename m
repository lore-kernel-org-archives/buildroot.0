From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 14 Jul 2018 23:25:45 +0200
Subject: [Buildroot] [git commit] configs/asus_tinker_rk3288: use uboot
 2018.07
Message-ID: <20180714212137.4D55788485@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=112f7314ac9b7aaa33ee3d11e998371b992be165
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Using uboot version 2017.11 creates an sd card image which fails to
boot with the following error:

  Missing DTB
  ### ERROR ### Please RESET the board ###

Updating tinkerboard default configuration to use latest uboot release
2018.07 creates a sd card image which boot fine.

Signed-off-by: Yannis Damigos <ydamigos@iccs.gr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
