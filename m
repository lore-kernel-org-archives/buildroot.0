From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Aug 2019 13:20:12 +0200
Subject: [Buildroot] [git commit] package/gstreamer1/gst1-plugins-base: fix
 dispmanx option
Message-ID: <20190820112001.DD807815F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b5f961bcbd52750d42d2c0b01f5911a84f75098
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

There is a typo in the handling of the
BR2_PACKAGE_GST1_PLUGINS_BASE_LIB_OPENGL_DISPMANX option: we're adding
dispmax to GST1_PLUGINS_BASE_WINSYS_LIST, which causes the following
build failure:

meson.build:1:0: ERROR: Options "dispmax" are not in allowed choices: "x11, wayland, win32, cocoa, dispmanx, viv-fb, gbm, auto"

We fix this by using the proper option name, "dispmanx" instead of the
slightly incorrect "dispmax".

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
