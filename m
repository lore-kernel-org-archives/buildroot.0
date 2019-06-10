From: Julien Olivain <juju@cotds.org>
Date: Mon, 10 Jun 2019 12:19:20 +0200
Subject: [Buildroot] [PATCH 1/5] package/freescale-imx: add option for
 i.MX8MM
In-Reply-To: <20190610101924.9124-1-juju@cotds.org>
References: <20190610101924.9124-1-juju@cotds.org>
Message-ID: <20190610101924.9124-2-juju@cotds.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The i.MX8MMini is slightly different from the i.MX8M. The main
difference of interrest here is that the i.MX8MMini has no HDMI
support. The boot image must not include the HDMI signed firmware,
which is why we need this new configuration option.

Signed-off-by: Julien Olivain <juju@cotds.org>
---
 package/freescale-imx/Config.in | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index fcceacdc9e..f010aab87b 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -43,6 +43,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 	bool "imx8m"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
+	bool "imx8mm"
+
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
 	bool "imx8x"
 endchoice
@@ -77,7 +80,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6S || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX7 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8MM
 
 source "package/freescale-imx/imx-alsa-plugins/Config.in"
 source "package/freescale-imx/imx-codec/Config.in"
-- 
2.21.0
