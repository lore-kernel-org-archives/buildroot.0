From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun,  9 Nov 2014 01:26:27 +0100
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: Add support for x265
	encoding
In-Reply-To: <1415492787-10993-1-git-send-email-bernd.kuhls@t-online.de>
References: <1415492787-10993-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1415492787-10993-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk |    7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 1a68fa0..8d84e5b 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -236,6 +236,13 @@ else
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
1.7.10.4
