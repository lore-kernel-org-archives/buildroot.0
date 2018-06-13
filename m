From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 13 Jun 2018 18:28:26 +0200
Subject: [Buildroot] [PATCH v3 6/6] package/mediastreamer: add optional
 dependency to speexdsp
In-Reply-To: <20180613162826.3490-1-bernd.kuhls@t-online.de>
References: <20180613162826.3490-1-bernd.kuhls@t-online.de>
Message-ID: <20180613162826.3490-6-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/594/594ea96cd7b6726052268a3c0b094e00e7b8f12f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v3: initial version

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
-- 
2.17.1
