From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 9 Apr 2018 22:08:09 +0200
Subject: [Buildroot] [git commit] freescale-imx: add config option for i.MX8M
Message-ID: <20180409200846.B4EEA88284@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6cc9a5c234902bef75d010ceed7dff5d16602648
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/freescale-imx/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index e33a90d912..d7f260dd7a 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -1,6 +1,6 @@
 menuconfig BR2_PACKAGE_FREESCALE_IMX
 	bool "Freescale i.MX libraries"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	help
 	  Those packages provide hardware acceleration for GPU or VPU,
 	  hardware optimization or some hardware tools for Freescale
@@ -40,6 +40,8 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 	bool "imx7d/imx7ulp"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+	bool "imx8m"
 endchoice
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
@@ -54,6 +56,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX6S" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S
 	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 	default "IMX7" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
+	default "IMX8" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	bool
