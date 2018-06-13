From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 13 Jun 2018 22:52:43 +0200
Subject: [Buildroot] [git commit] imx-usb-loader: enable package for 64-bit
 ARM platforms
Message-ID: <20180613205035.6B5558856E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9bc75578616731b888b8934e4eed80ddb1b4ba3a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that it works for i.MX8MQ processors (tested on Nitrogen8M).

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imx-usb-loader/Config.in.host | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/imx-usb-loader/Config.in.host b/package/imx-usb-loader/Config.in.host
index a4a0f88531..04bd4cc018 100644
--- a/package/imx-usb-loader/Config.in.host
+++ b/package/imx-usb-loader/Config.in.host
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_HOST_IMX_USB_LOADER
 	bool "host imx-usb-loader"
-	depends on BR2_arm
+	depends on BR2_arm || BR2_aarch64
 	help
 	  This package contains tools to download and execute code
-	  on Freescale i.MX5/i.MX6 and Vybrid SoCs through the
+	  on Freescale i.MX5x/6x/7x/8x and Vybrid SoCs through the
 	  Serial Download Protocol.
 
 	  https://github.com/boundarydevices/imx_usb_loader
