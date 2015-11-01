From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  1 Nov 2015 19:47:29 +0100
Subject: [Buildroot] [PATCH 1/1] package/ffmpeg: Add support for x265
Message-ID: <1446403649-20834-1-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index d4815ca..d25346c 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -341,6 +341,13 @@ else
 FFMPEG_CONF_OPTS += --disable-libx264
 endif
 
+ifeq ($(BR2_PACKAGE_X265)$(BR2_PACKAGE_FFMPEG_GPL),yy)
+FFMPEG_CONF_OPTS += --enable-libx265
+FFMPEG_DEPENDENCIES += x265
+else
+FFMPEG_CONF_OPTS += --disable-libx265
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPTS += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
-- 
2.6.1
