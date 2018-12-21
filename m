From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 21 Dec 2018 14:58:28 +0100
Subject: [Buildroot] [git commit] configs/imx6slevk: Bump U-Boot version
Message-ID: <20181221135449.5BCF7827F3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1fc75dfbde9aa6fbe018fded79af4c17bb6fb523
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

U-Boot 2017.11 has the following build issue:

  MKIMAGE u-boot-dtb.imx
Error: No BOOT_FROM tag in board/freescale/mx6slevk/imximage.cfg.cfgtmp
arch/arm/mach-imx/Makefile:86: recipe for target 'u-boot-dtb.imx' failed
make[2]: *** [u-boot-dtb.imx] Error 1
Makefile:907: recipe for target 'u-boot-dtb.imx' failed
make[1]: *** [u-boot-dtb.imx] Error 2
make[1]: *** Waiting for unfinished jobs....

This issue has been fixed by commit  f916757300c1  ("imx: Create
distinct pre-processed mkimage config files"), which landed in
U-Boot 2018.05.

Bump the U-Boot version to fix this build error.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/136980040

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 configs/imx6slevk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx6slevk_defconfig b/configs/imx6slevk_defconfig
index be4b42e88e..90a02964e7 100644
--- a/configs/imx6slevk_defconfig
+++ b/configs/imx6slevk_defconfig
@@ -11,7 +11,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6slevk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.11"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
