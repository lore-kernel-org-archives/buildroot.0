From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon,  5 Sep 2016 16:51:20 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: add optional support for
	opencv3
In-Reply-To: <20160905145120.8613-1-bernd.kuhls@t-online.de>
References: <20160905145120.8613-1-bernd.kuhls@t-online.de>
Message-ID: <20160905145120.8613-2-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 74f783c..e42cceb 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -254,6 +254,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENCV_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV_WITH_FFMPEG)x$(BR2_ARM_ENABLE_VFP),yxx)
 FFMPEG_CONF_OPTS += --enable-libopencv
 FFMPEG_DEPENDENCIES += opencv
+else ifeq ($(BR2_PACKAGE_OPENCV3_LIB_IMGPROC)x$(BR2_PACKAGE_OPENCV3_WITH_FFMPEG),yx)
+FFMPEG_CONF_OPTS += --enable-libopencv
+FFMPEG_DEPENDENCIES += opencv3
 else
 FFMPEG_CONF_OPTS += --disable-libopencv
 endif
-- 
2.9.3
