From: Shyam Saini <shyam.saini@amarulasolutions.com>
Date: Mon,  1 Apr 2019 18:02:58 +0530
Subject: [Buildroot] [PATCH 2/3] configs: engicam_imx6ul_isiot: Fix use of
 incorrect uboot defconfig file
In-Reply-To: <20190401123259.19595-1-shyam.saini@amarulasolutions.com>
References: <20190401123259.19595-1-shyam.saini@amarulasolutions.com>
Message-ID: <20190401123259.19595-2-shyam.saini@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

In u-boot v2018.03 release, configs/imx6ul_isiot_mmc_defconfig was removed
and afterwards both emmc and mmc use the same imx6ul_isiot_emmc_defconfig
file so fix the same.

Signed-off-by: Shyam Saini <shyam.saini@amarulasolutions.com>
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
-- 
2.11.0
