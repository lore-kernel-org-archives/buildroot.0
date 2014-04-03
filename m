From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 3 Apr 2014 21:36:05 +0200
Subject: [Buildroot] [git commit] Revert "gst-ffmpeg: fix build for xtensa"
Message-ID: <20140403193845.318579A856@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b9f696e683676486f7f2eff74bbc49cc986aaa9f
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This reverts commit 7e558aa0d87d86be1bbc91b284acd0d11378ee4e.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk |    8 --------
 1 files changed, 0 insertions(+), 8 deletions(-)

diff --git a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
index eb7389f..6534f93 100644
--- a/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
+++ b/package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk
@@ -14,14 +14,6 @@ GST_FFMPEG_CONF_EXTRA_OPT = \
 		--cross-prefix=$(TARGET_CROSS) \
 		--target-os=linux
 
-GST_FFMPEG_CFLAGS = $(TARGET_CFLAGS)
-
-ifeq ($(BR2_xtensa),y)
-GST_FFMPEG_CFLAGS += -mtext-section-literals
-endif
-
-GST_FFMPEG_CONF_ENV = CFLAGS="$(GST_FFMPEG_CFLAGS)"
-
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 GST_FFMPEG_CONF_EXTRA_OPT += --enable-zlib
 GST_FFMPEG_DEPENDENCIES += zlib
