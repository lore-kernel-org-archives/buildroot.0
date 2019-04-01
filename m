From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 1 Apr 2019 22:35:30 +0200
Subject: [Buildroot] [git commit] configs/engicam_imx6ul_isiot: fix use of
 incorrect uboot defconfig file
Message-ID: <20190401203324.0365F8125F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=93db2a9149d85786f216c9136ec66f99bbc5a851
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

In u-boot v2018.03 release, configs/imx6ul_isiot_mmc_defconfig was
removed and afterwards both emmc and mmc use the same
imx6ul_isiot_emmc_defconfig file so fix the same.

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 configs/engicam_imx6ul_isiot_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/engicam_imx6ul_isiot_defconfig b/configs/engicam_imx6ul_isiot_defconfig
index 0fe499732b..9ba11361e7 100644
--- a/configs/engicam_imx6ul_isiot_defconfig
+++ b/configs/engicam_imx6ul_isiot_defconfig
@@ -15,7 +15,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.07-rc1"
-BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ul_isiot_mmc"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="imx6ul_isiot_emmc"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
