From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 15 Jul 2014 23:10:09 +0200
Subject: [Buildroot] [git commit] package/gst-fsl-plugins: add default
	platform
Message-ID: <20140715211145.0358E9CE7A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=71f060f4d30a1cd2971091e9e29de9703b483b59
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Set the default platform for gst-fsl-plugins, based on the one choosen
as the generic Freescale i.MX platform.

We can't use only this generic platform choice, as gst-fsl-plugins has
support for more platforms.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gst-fsl-plugins/Config.in |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index fc0184e..309e745 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -33,6 +33,13 @@ config BR2_PACKAGE_GST_FSL_PLUGINS
 if BR2_PACKAGE_GST_FSL_PLUGINS
 choice
 	prompt "i.MX platform"
+	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX25 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX25_3STACK
+	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX27 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS
+	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX37 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX37_3STACK
+	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX50 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX50
+	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX51 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51
+	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX53 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53
+	default BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX6  if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 
 config BR2_PACKAGE_GST_FSL_PLUGINS_PLATFORM_MX233
 	bool "imx233"
