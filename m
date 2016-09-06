From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 6 Sep 2016 21:39:22 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: add optional support for
	opencv3
Message-ID: <20160906193930.81B3F8222E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1b69855b69118622d4048b6b744df0ee2ba29b5b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a90d437..782d913 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -253,6 +253,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENCV_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV_WITH_FFMPEG),yx)
 FFMPEG_CONF_OPTS += --enable-libopencv
 FFMPEG_DEPENDENCIES += opencv
+else ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),yx)
+FFMPEG_CONF_OPTS += --enable-libopencv
+FFMPEG_DEPENDENCIES += opencv3
 else
 FFMPEG_CONF_OPTS += --disable-libopencv
 endif
