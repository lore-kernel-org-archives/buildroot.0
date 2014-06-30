From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon, 30 Jun 2014 23:52:10 +0200
Subject: [Buildroot] [PATCH 10/14] package/gst-fsl-plugins: add default
	platform
In-Reply-To: <cover.1404164261.git.yann.morin.1998@free.fr>
References: <cover.1404164261.git.yann.morin.1998@free.fr>
Message-ID: <8542e6ddeccf7d8f18f45069198e0939d4a1535a.1404164261.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Set the default platform for gst-fsl-plugins, based on the one choosen
as the generic Freescale i.MX platform.

We can't use only this generic platform choice, as gst-fsl-plugins has
support for more platforms.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Gary Bisson <bisson.gary@gmail.com>
Cc: Hadrien Boutteville <hadrien.boutteville@gmail.com>

---
Note: this is a tentative patch, I would not care if it is dropped.
---
 package/gstreamer/gst-fsl-plugins/Config.in | 7 +++++++
 1 file changed, 7 insertions(+)

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
-- 
1.9.1
