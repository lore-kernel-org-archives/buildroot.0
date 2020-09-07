From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 7 Sep 2020 22:48:10 +0200
Subject: [Buildroot] [git commit] config/odroidc2: fix uboot version
Message-ID: <20200907204122.A886688662@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ac747204685552bce0efe1d4227f13dc70d53458
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The custom UBoot version was not correctly specified, causing the latest
one to be selected instead:

    /home/ymorin/dev/buildroot/buildroot/configs/odroidc2_defconfig:25:warning:
    symbol value '"2020.07"' invalid for BR2_TARGET_UBOOT_CUSTOM_VERSION

Fixes:
    https://gitlab.com/ymorin/buildroot/-/jobs/723411844

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/odroidc2_defconfig | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index bb85431891..c15df8f252 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -22,7 +22,8 @@ BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_LEGACY=y
 BR2_TARGET_UBOOT_BOARDNAME="odroid-c2"
-BR2_TARGET_UBOOT_CUSTOM_VERSION="2020.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.07"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_BOOT_SCRIPT=y
 BR2_TARGET_UBOOT_BOOT_SCRIPT_SOURCE="board/hardkernel/odroidc2/boot.cmd"
