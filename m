From: David du Colombier <0intro@gmail.com>
Date: Sun,  5 Oct 2014 18:29:57 +0200
Subject: [Buildroot] [PATCH v4 2/2] ffmpeg: enable x264 support
In-Reply-To: <1412526597-31347-1-git-send-email-0intro@gmail.com>
References: <1412526597-31347-1-git-send-email-0intro@gmail.com>
Message-ID: <1412526597-31347-2-git-send-email-0intro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David du Colombier <0intro@gmail.com>
---
Changes v1 -> v4:
  - s/FFMPEG_CONF_OPT/FFMPEG_CONF_OPTS/
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 41b06a7..6b5711c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -229,6 +229,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libvpx
 endif
 
+ifeq ($(BR2_PACKAGE_X264)$(BR2_PACKAGE_FFMPEG_GPL),yy)
+FFMPEG_CONF_OPTS += --enable-libx264
+FFMPEG_DEPENDENCIES += x264
+else
+FFMPEG_CONF_OPTS += --disable-libx264
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
-- 
1.8.3.1
