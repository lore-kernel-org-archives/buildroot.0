From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 6 Jun 2018 22:12:20 +0200
Subject: [Buildroot] [git commit] imx-usb-loader: propagate libusb dependency
Message-ID: <20180606201103.24FDF83D86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=aef29acd148c3e0ce50d05f62ae5a44304404c9b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Avoid select of libusb when the toolchain does not support threads.

Fixes:
http://autobuild.buildroot.net/results/a21/a212ee3e5ec174f4e6e7d582f777325dac035bfd/

Cc: Adam Duskett <aduskett@gmail.com>
Signed-off-by: Baruch Siach <baruch@tkos.co.il>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/imx-usb-loader/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/imx-usb-loader/Config.in b/package/imx-usb-loader/Config.in
index 6f083f34d1..1cc0dd8c25 100644
--- a/package/imx-usb-loader/Config.in
+++ b/package/imx-usb-loader/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IMX_USB_LOADER
 	bool "imx-usb-loader"
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libusb
 	select BR2_PACKAGE_LIBUSB
 	help
 	  This package contains tools to download and execute code
@@ -7,3 +8,6 @@ config BR2_PACKAGE_IMX_USB_LOADER
 	  Serial Download Protocol.
 
 	  https://github.com/boundarydevices/imx_usb_loader
+
+comment "imx-usb-loader needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
