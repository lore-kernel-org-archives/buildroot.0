From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 8 Oct 2018 21:28:03 +0200
Subject: [Buildroot] [git commit] package/mjpg-streamer: add optional
 dependency to opencv3
Message-ID: <20181008192711.D46448E4DB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=896d37044968aeb9c9b01ad5db820b6dcfef0b89
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

According to
https://github.com/jacksonliam/mjpg-streamer/blob/master/mjpg-streamer-experimental/plugins/input_opencv/README.md
the plugin does not support OpenCV 2.x.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
