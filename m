From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 2 May 2013 23:52:47 +0200
Subject: [Buildroot] [git commit] ffmpeg: define license
Message-ID: <20130502215429.734A299A15@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=a17d8942a4b7247822421946a21584b460ac1650
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    7 +++++++
 1 files changed, 7 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 2e88b6b..fd7a256 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -9,6 +9,13 @@ FFMPEG_SOURCE = ffmpeg-$(FFMPEG_VERSION).tar.bz2
 FFMPEG_SITE = http://ffmpeg.org/releases
 FFMPEG_INSTALL_STAGING = YES
 
+FFMPEG_LICENSE = LGPLv2.1+, libjpeg license
+FFMPEG_LICENSE_FILES = LICENSE COPYING.LGPLv2.1
+ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
+FFMPEG_LICENSE += and GPLv2+
+FFMPEG_LICENSE_FILES += COPYING.GPLv2
+endif
+
 FFMPEG_CONF_OPT = \
 	--prefix=/usr		\
 	--disable-avfilter	\
