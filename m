From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 15 Aug 2018 22:47:41 +0200
Subject: [Buildroot] [git commit branch/2018.02.x] package/ffmpeg: add
 optional support for libdrm
Message-ID: <20180815204249.3D6578D40E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=840d0ee1980acca414c3d8039da7e15a8bc940c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.02.x

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 5c1ae91a245e1d9bcec03852c7be8cbbdf858a6b)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 5d2f89fb43..bf01ddbbf1 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -225,6 +225,13 @@ ifeq ($(BR2_PACKAGE_FFMPEG_GPL)$(BR2_PACKAGE_LIBEBUR128),yy)
 FFMPEG_DEPENDENCIES += libebur128
 endif
 
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+FFMPEG_CONF_OPTS += --enable-libdrm
+FFMPEG_DEPENDENCIES += libdrm
+else
+FFMPEG_CONF_OPTS += --disable-libdrm
+endif
+
 ifeq ($(BR2_PACKAGE_LIBOPENH264),y)
 FFMPEG_CONF_OPTS += --enable-libopenh264
 FFMPEG_DEPENDENCIES += libopenh264
