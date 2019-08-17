From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 17 Aug 2019 14:24:02 +0200
Subject: [Buildroot] [PATCH] package/gstreamer1/gst1-plugins-base: fix
 dispmanx option
Message-ID: <20190817122402.15366-1-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

There is a typo in the handling of the
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX option: we're adding
dispmax to GST1_PLUGINS_BASE_WINSYS_LIST, which causes the following
build failure:

meson.build:1:0: ERROR: Options "dispmax" are not in allowed choices: "x11, wayland, win32, cocoa, dispmanx, viv-fb, gbm, auto"

We fix this by using the proper option name, "dispmanx" instead of the
slightly incorrect "dispmax".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
index 66c136c36c..90d2478bbc 100644
--- a/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
+++ b/package/gstreamer1/gst1-plugins-base/gst1-plugins-base.mk
@@ -74,7 +74,7 @@ GST1_PLUGINS_BASE_DEPENDENCIES += wayland wayland-protocols
 endif
 
 ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX),y)
-GST1_PLUGINS_BASE_WINSYS_LIST += dispmax
+GST1_PLUGINS_BASE_WINSYS_LIST += dispmanx
 GST1_PLUGINS_BASE_DEPENDENCIES += rpi-userland
 endif
 GST1_PLUGINS_BASE_CONF_OPTS += -Dgl_winsys='$(subst $(space),$(comma),$(GST1_PLUGINS_BASE_WINSYS_LIST))'
-- 
2.21.0
