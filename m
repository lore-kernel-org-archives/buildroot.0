From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 20 Oct 2018 10:03:41 +0200
Subject: [Buildroot] [PATCH v2 1/2] package/mjpg-streamer: fix typo in
 opencv3 dependencies
Message-ID: <20181020080343.32067-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

mjpg-streamer needs these OpenCV3 modules:
https://github.com/jacksonliam/mjpg-streamer/blob/master/mjpg-streamer-experimental/plugins/input_opencv/CMakeLists.txt#L4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v2: no changes

 package/mjpg-streamer/mjpg-streamer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 6ea8c47030..e5de847825 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -22,7 +22,7 @@ ifeq ($(BR2_PACKAGE_LIBV4L),y)
 MJPG_STREAMER_DEPENDENCIES += libv4l
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV3_LIB_IMGPROC),yyy)
+ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV3_LIB_VIDEOIO),yyy)
 MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_OPENCV=ON
 MJPG_STREAMER_DEPENDENCIES += host-pkgconf opencv3
 else
-- 
2.19.1
