From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 23 Feb 2019 09:53:50 +0100
Subject: [Buildroot] [git commit] configs/imx23evk: Bump the U-Boot version
Message-ID: <20190223085224.9262E8B6E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d76dce1f43ac06579d386eb77b35c461e12d981f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
