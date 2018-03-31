From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 31 Mar 2018 23:05:19 +0200
Subject: [Buildroot] [git commit] package/freescale-imx: Remove imx6s from
 has_vpu list
Message-ID: <20180331210802.07A4180250@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e42a65bdcd76018dbe2d4fd4459a7ca216e99e32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to imx-vpu-5.4.37/Makefile, line 6:

	INCLUDE_LIST:= IMX27ADS IMX51 IMX53 IMX6Q

imx6s is not supported by the imx-vpu package. Its install target,
guarded by

	ifeq ($(PLATFORM), $(findstring $(PLATFORM), $(INCLUDE_LIST)))

does nothing, causing a build error later on in the imx-vpuwrap package

checking for vpu_lib.h... no
configure: error: lib_vpu is required, consider installing imx-lib

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index b5e5ab23dc..e33a90d912 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -60,8 +60,7 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 	bool
