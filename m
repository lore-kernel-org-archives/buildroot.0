From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 3 Jul 2016 08:59:12 +0200
Subject: [Buildroot] [git commit] imx-usb-loader: add explicit dependencies
	for host variant
Message-ID: <20160703071146.20CB17FE29@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=9fe2a4b4916a32e7b5a1738009ef6745881999c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Julien Floret <julien.floret@6wind.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/imx-usb-loader/imx-usb-loader.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 280ffc0..c855625 100644
--- a/package/imx-usb-loader/imx-usb-loader.mk
+++ b/package/imx-usb-loader/imx-usb-loader.mk
@@ -8,7 +8,7 @@ IMX_USB_LOADER_VERSION = f96aee286ea17c832b7ec922dd76842deb5ce299
 IMX_USB_LOADER_SITE = $(call github,boundarydevices,imx_usb_loader,$(IMX_USB_LOADER_VERSION))
 IMX_USB_LOADER_LICENSE = LGPLv2.1+
 IMX_USB_LOADER_LICENSE_FILES = COPYING
-IMX_USB_LOADER_DEPENDENCIES = host-libusb host-pkgconf
+HOST_IMX_USB_LOADER_DEPENDENCIES = host-libusb host-pkgconf
 
 define HOST_IMX_USB_LOADER_BUILD_CMDS
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)
