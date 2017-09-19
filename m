From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Tue, 19 Sep 2017 22:16:05 +0200
Subject: [Buildroot] [git commit] package/freescale-imx: add support for
	i.MX6UL
Message-ID: <20170919201318.7F70081076@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=907618af4d35c556c6bb9cc8b34add126213f480
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Mostly to compile imx-lib (providing libpxp) on i.MX6UL (which have a
PXP hardware unit) and to prevent compilation of imx-lib's modules not
supported on i.MX6UL.

Signed-off-by: Julien BOIBESSOT <julien.boibessot@armadeus.com>
Acked-by: J??rg Krause <joerg.krause@embedded.rocks>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/freescale-imx/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 656b44b..fa3f9a0 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -31,6 +31,9 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 	bool "imx6q"
 
+config BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
+	bool "imx6ul"
+
 endchoice
 
 config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
@@ -42,6 +45,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX51" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
 	default "IMX53" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
 	default "IMX6Q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+	default "IMX6UL" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6UL
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	bool
