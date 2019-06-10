From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Jun 2019 20:10:55 +0200
Subject: [Buildroot] [git commit] package/freescale-imx: add option for
 i.MX8MM
Message-ID: <20190610183348.CE3FB8F690@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5fabf916a8db85e5d578e97cd6ff17d7c436a351
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The i.MX8MMini is slightly different from the i.MX8M. The main
difference of interrest here is that the i.MX8MMini has no HDMI
support. The firmware blobs must not include the HDMI signed firmware,
which is why we need this new configuration option.

Signed-off-by: Julien Olivain <juju@cotds.org>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
