From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 21:57:07 +0200
Subject: [Buildroot] [git commit] package/ffmpeg: add optional dependency to
	libebur128
Message-ID: <20160724195713.14E6781935@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=af127a6ddd48b7126701a98e1ebf2b40ebc6b1d8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ebur128 support depends on gpl support in ffmpeg:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=configure;h=ec4ff083dd373bce34869b67189905e2822b848b;hb=refs/heads/release/2.8#l2747

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
