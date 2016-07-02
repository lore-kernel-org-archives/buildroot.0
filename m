From: Julien Floret <julien.floret@6wind.com>
Date: Sun,  3 Jul 2016 00:20:47 +0200
Subject: [Buildroot] [PATCH 18/69] imx-usb-loader: add explicit dependencies
	for host variant
In-Reply-To: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
References: <1467498098-23731-1-git-send-email-julien.floret@6wind.com>
Message-ID: <1467498098-23731-19-git-send-email-julien.floret@6wind.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Floret <julien.floret@6wind.com>
---
 package/imx-usb-loader/imx-usb-loader.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/imx-usb-loader/imx-usb-loader.mk b/package/imx-usb-loader/imx-usb-loader.mk
index 280ffc04012a..c85562578eab 100644
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
-- 
2.1.0
