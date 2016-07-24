From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 24 Jul 2016 17:53:18 +0200
Subject: [Buildroot] [PATCH 2/2] package/ffmpeg: add optional dependency to
	libebur128
In-Reply-To: <1469375598-10887-1-git-send-email-bernd.kuhls@t-online.de>
References: <1469375598-10887-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1469375598-10887-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

ebur128 support depends on gpl support in ffmpeg:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=configure;h=ec4ff083dd373bce34869b67189905e2822b848b;hb=refs/heads/release/2.8#l2747

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a4e2be6..c42336f 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -224,6 +224,10 @@ else
 FFMPEG_CONF_OPTS += --disable-libdcadec
 endif
 
+ifeq ($(BR2_PACKAGE_FFMPEG_GPL)$(BR2_PACKAGE_LIBEBUR128),yy)
+FFMPEG_DEPENDENCIES += libebur128
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOPENH264),y)
 FFMPEG_CONF_OPTS += --enable-libopenh264
 FFMPEG_DEPENDENCIES += libopenh264
-- 
2.8.1
