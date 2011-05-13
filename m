From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Fri, 13 May 2011 15:12:25 +0200
Subject: [Buildroot] [git commit] ffmpeg: only build documentation if
	requested
Message-ID: <20110513131407.5B4A5834CD@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=dcad5235a944c2c675f35ac918ada767a4149bee
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/multimedia/ffmpeg/ffmpeg.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/multimedia/ffmpeg/ffmpeg.mk b/package/multimedia/ffmpeg/ffmpeg.mk
index 1c6e734..2c82da8 100644
--- a/package/multimedia/ffmpeg/ffmpeg.mk
+++ b/package/multimedia/ffmpeg/ffmpeg.mk
@@ -13,6 +13,7 @@ FFMPEG_CONF_OPT = \
 	--prefix=/usr		\
 	--enable-shared 	\
 	--disable-avfilter	\
+	$(if $(BR2_HAVE_DOCUMENTATION),,--disable-doc)
 
 ifeq ($(BR2_PACKAGE_FFMPEG_GPL),y)
 FFMPEG_CONF_OPT += --enable-gpl
-- 
1.7.3.4
