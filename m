From: Erik Larsson <karl.erik.larsson@gmail.com>
Date: Sat, 10 Mar 2018 12:51:40 +0100
Subject: [Buildroot] [PATCH v6 2/4] freescale-imx: add config option for
 i.MX8M
In-Reply-To: <1520682702-10035-1-git-send-email-karl.erik.larsson@gmail.com>
References: <1520682702-10035-1-git-send-email-karl.erik.larsson@gmail.com>
Message-ID: <1520682702-10035-3-git-send-email-karl.erik.larsson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
---
v6: No changes
v5: No changes
v4: Changed title on commit (suggested by Gary B.)
---
 package/freescale-imx/Config.in | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index b5e5ab2..fe993f3 100644
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
-- 
2.7.4
