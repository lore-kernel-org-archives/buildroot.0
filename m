From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 31 Mar 2014 22:06:23 +0200
Subject: [Buildroot] [PATCH 10/16] ffmpeg: Add libva support
In-Reply-To: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
References: <1396296389-28821-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1396296389-28821-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk |    8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index a067fe6..0084a53 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -41,7 +41,6 @@ FFMPEG_CONF_OPT = \
 	--enable-mdct \
 	--enable-rdft \
 	--disable-crystalhd \
-	--disable-vaapi \
 	--disable-vdpau \
 	--disable-dxva2 \
 	--enable-runtime-cpudetect \
@@ -217,6 +216,13 @@ FFMPEG_CONF_OPT += \
 	--enable-encoder=libvorbis
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVA),y)
+FFMPEG_CONF_OPT += --enable-vaapi
+FFMPEG_DEPENDENCIES += libva
+else
+FFMPEG_CONF_OPT += --disable-vaapi
+endif
+
 ifeq ($(BR2_X86_CPU_HAS_MMX),y)
 FFMPEG_CONF_OPT += --enable-yasm
 FFMPEG_DEPENDENCIES += host-yasm
-- 
1.7.10.4
