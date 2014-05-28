From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:42 +0200
Subject: [Buildroot] [PATCH 19/30] ffmpeg: Add libva support
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <92f128ac3b3554722a01e20eb4b0ecbb7ff8f65a.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/ffmpeg/ffmpeg.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index f8c1526..1be3575 100644
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
@@ -209,6 +208,13 @@ FFMPEG_CONF_OPT += \
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
1.8.3.2
