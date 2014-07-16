From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 20:42:20 +0200
Subject: [Buildroot] [git commit] ffmpeg: Add libva support
Message-ID: <20140716184354.7780C9D244@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=17240db1432fd97f2d619cdec7e84e20c2ace7fa
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk |    8 +++++++-
 1 files changed, 7 insertions(+), 1 deletions(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 478c66a..2b73fbc 100644
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
