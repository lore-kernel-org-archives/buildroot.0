From: David du Colombier <0intro@gmail.com>
Date: Wed,  1 Oct 2014 11:14:01 +0200
Subject: [Buildroot] [PATCH 5/5] ffmpeg: enable x264 support
In-Reply-To: <1412154841-708-1-git-send-email-0intro@gmail.com>
References: <1412154841-708-1-git-send-email-0intro@gmail.com>
Message-ID: <1412154841-708-2-git-send-email-0intro@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: David du Colombier <0intro@gmail.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index b4b2e56..c7bff62 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -229,6 +229,13 @@ else
 FFMPEG_CONF_OPT += --disable-libvpx
 endif
 
+ifeq ($(BR2_PACKAGE_X264)$(BR2_PACKAGE_FFMPEG_GPL),yy)
+FFMPEG_CONF_OPT += --enable-libx264
+FFMPEG_DEPENDENCIES += x264
+else
+FFMPEG_CONF_OPT += --disable-libx264
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPT += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
-- 
1.9.3
