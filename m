From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 26 Jul 2017 00:09:09 +0200
Subject: [Buildroot] [git commit branch/2017.02.x] package/ffmpeg: add
	optional support for alsa-lib
Message-ID: <20170725222142.4532581E9E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=05f13baaf3557b3815de329aded5394054bea642
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2017.02.x

ffmpeg has optional support for alsa as input and/or output device:
http://git.videolan.org/?p=ffmpeg.git;a=blob;f=configure;h=23823e3b7012d847b614bd43316fb614676bedb2;hb=refs/heads/release/3.3#l2987

Problem was found while fixing
http://autobuild.buildroot.net/results/7ba/7ba485532fcab74928246a8f95dba7e5eea9d4a5/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit ca06ba2d2a673cf750ac92a4e61e7cba037a339e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ffmpeg/ffmpeg.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/ffmpeg/ffmpeg.mk b/package/ffmpeg/ffmpeg.mk
index 6540d41..4494612 100644
--- a/package/ffmpeg/ffmpeg.mk
+++ b/package/ffmpeg/ffmpeg.mk
@@ -159,12 +159,18 @@ endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_INDEVS),y)
 FFMPEG_CONF_OPTS += --enable-indevs
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+FFMPEG_DEPENDENCIES += alsa-lib
+endif
 else
 FFMPEG_CONF_OPTS += --disable-indevs
 endif
 
 ifeq ($(BR2_PACKAGE_FFMPEG_OUTDEVS),y)
 FFMPEG_CONF_OPTS += --enable-outdevs
+ifeq ($(BR2_PACKAGE_ALSA_LIB),y)
+FFMPEG_DEPENDENCIES += alsa-lib
+endif
 else
 FFMPEG_CONF_OPTS += --disable-outdevs
 endif
