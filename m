From: Max Filippov <jcmvbkbc@gmail.com>
Date: Sun, 30 Mar 2014 21:57:49 +0400
Subject: [Buildroot] [PATCH v3 05/10] Revert "gst-ffmpeg: fix build for
	xtensa"
In-Reply-To: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
References: <1396202274-5109-1-git-send-email-jcmvbkbc@gmail.com>
Message-ID: <1396202274-5109-6-git-send-email-jcmvbkbc@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This reverts commit 7e558aa0d87d86be1bbc91b284acd0d11378ee4e.
Now that -mtext-section-literals is specified in the xtensa ABI this fix
is no longer needed.

Signed-off-by: Max Filippov <jcmvbkbc@gmail.com>
---
Changes v2 -> v3:
- new patch

 package/gstreamer/gst-ffmpeg/gst-ffmpeg.mk | 8 --------
 1 file changed, 8 deletions(-)

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
-- 
1.8.1.4
