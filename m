From: Peter Korsgaard <peter@korsgaard.com>
Date: Sat, 20 Oct 2018 19:53:56 +0200
Subject: [Buildroot] [git commit] package/mjpg-streamer: fix typo in opencv3
 dependencies
Message-ID: <20181020175329.BF81C8778A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=133c68bb40a1427ed2457e94a075c31c367913ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

mjpg-streamer needs these OpenCV3 modules:
https://github.com/jacksonliam/mjpg-streamer/blob/master/mjpg-streamer-experimental/plugins/input_opencv/CMakeLists.txt#L4

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
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
