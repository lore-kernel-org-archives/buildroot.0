From: Fabio Estevam <festevam@gmail.com>
Date: Fri, 22 Feb 2019 21:28:43 -0300
Subject: [Buildroot] [PATCH] configs/imx23evk: Bump the U-Boot version
Message-ID: <20190223002843.16473-1-festevam@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Thomas Petazzoni reports:

"The imx23evk_defconfig no longer builds:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/158295124

This is due to the bump of OpenSSL to 1.1.x. This issue seems to have
been fixed in U-Boot commit 7bae13b7579a6bc42330427496330fe2a29cbd56,
which is part of U-Boot since 2017.01, but the defconfig is using
2016.09."

Bump to the U-Boot 2019.01 to fix this problem.

Fixes:  https://gitlab.com/buildroot.org/buildroot/-/jobs/158295124

Reported-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx23evk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/imx23evk_defconfig b/configs/imx23evk_defconfig
index fe0744036d..87610d1b72 100644
--- a/configs/imx23evk_defconfig
+++ b/configs/imx23evk_defconfig
@@ -20,7 +20,7 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx23-evk"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx23evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.01"
 BR2_TARGET_UBOOT_FORMAT_SD=y
 
 # Filesystem
-- 
2.17.1
