From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 16 Jun 2018 14:28:22 +0200
Subject: [Buildroot] [git commit] package/mediastreamer: add optional
 dependency to speexdsp
Message-ID: <20180616122621.5A7CA886E8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9b1ec76aa457affc35d372b3d8604a93670d28b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes
http://autobuild.buildroot.net/results/594/594ea96cd7b6726052268a3c0b094e00e7b8f12f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mediastreamer/mediastreamer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index 1276cfae10..d3b70f4ca9 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -46,7 +46,7 @@ MEDIASTREAMER_CONF_OPTS += --disable-opus
 endif
 
 # portaudio backend needs speex as well
-ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEX),yy)
+ifeq ($(BR2_PACKAGE_PORTAUDIO)$(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yyy)
 MEDIASTREAMER_CONF_OPTS += --enable-portaudio
 MEDIASTREAMER_DEPENDENCIES += portaudio speex
 else
