From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 8 Jul 2016 20:48:22 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: add optional support for
	libvdpau
Message-ID: <20160708184836.02EAD805F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c26132c95f4908542b6bbc8317794c8a3f2e2256
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/ffmpeg/ffmpeg.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index d5396ad..a4e2be6 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -36,7 +36,6 @@ FFMPEG_CONF_OPTS = \
 	--enable-mdct \
 	--enable-rdft \
 	--disable-crystalhd \
-	--disable-vdpau \
 	--disable-dxva2 \
 	--enable-runtime-cpudetect \
 	--disable-hardcoded-tables \
@@ -247,6 +246,13 @@ else
 FFMPEG_CONF_OPTS += --disable-vaapi
 endif
 
+ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
+FFMPEG_CONF_OPTS += --enable-vdpau
+FFMPEG_DEPENDENCIES += libvdpau
+else
+FFMPEG_CONF_OPTS += --disable-vdpau
+endif
+
 ifeq ($(BR2_PACKAGE_OPUS),y)
 FFMPEG_CONF_OPTS += --enable-libopus
 FFMPEG_DEPENDENCIES += opus
