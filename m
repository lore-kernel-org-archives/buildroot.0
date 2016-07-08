From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 22:03:06 +0200
Subject: [Buildroot] [git commit] imx-usb-loader: remove - from prompt
Message-ID: <20160708200346.B40BB8222B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=7774a48b5d293a48742bc8082f5b58e0e46ad4b4
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The prompt of all host packages is "host foo", except for imx-usb-loader
that uses "host-foo", and more precisely "host-imx-usb loader", which is
really weird. This commit fixes this inconsistency.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imx-usb-loader/Config.in.host | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/imx-usb-loader/Config.in.host b/package/imx-usb-loader/Config.in.host
index aefa01b..a4a0f88 100644
--- a/package/imx-usb-loader/Config.in.host
+++ b/package/imx-usb-loader/Config.in.host
@@ -1,5 +1,5 @@
 config BR2_PACKAGE_HOST_IMX_USB_LOADER
-	bool "host-imx-usb loader"
+	bool "host imx-usb-loader"
 	depends on BR2_arm
 	help
 	  This package contains tools to download and execute code
