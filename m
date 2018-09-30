From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Sep 2018 21:03:21 +0200
Subject: [Buildroot] [PATCH 2/4] package/mjpg-streamer: add optional
 dependency to opencv3
In-Reply-To: <20180930190323.3369-1-bernd.kuhls@t-online.de>
References: <20180930190323.3369-1-bernd.kuhls@t-online.de>
Message-ID: <20180930190323.3369-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

According to
https://github.com/jacksonliam/mjpg-streamer/blob/master/mjpg-streamer-experimental/plugins/input_opencv/README.md
the plugin does not support OpenCV 2.x.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mjpg-streamer/mjpg-streamer.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/mjpg-streamer/mjpg-streamer.mk b/package/mjpg-streamer/mjpg-streamer.mk
index 2941e314b3..50ed980b7a 100644
--- a/package/mjpg-streamer/mjpg-streamer.mk
+++ b/package/mjpg-streamer/mjpg-streamer.mk
@@ -15,4 +15,11 @@ ifeq ($(BR2_PACKAGE_LIBV4L),y)
 MJPG_STREAMER_DEPENDENCIES += libv4l
 endif
 
+ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)$(BR2_PACKAGE_OPENCV3_LIB_IMGPROC),yyy)
+MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_OPENCV=ON
+MJPG_STREAMER_DEPENDENCIES += host-pkgconf opencv3
+else
+MJPG_STREAMER_CONF_OPTS += -DPLUGIN_INPUT_OPENCV=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.19.0
