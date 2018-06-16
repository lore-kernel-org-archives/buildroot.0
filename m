From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 17 Jun 2018 00:07:00 +0200
Subject: [Buildroot] [PATCH 1/1] package/mediastreamer: add another optional
 dependency to speexdsp
Message-ID: <20180616220700.22784-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/b21/b2104c491f0898981c652043161c52ac6c43110f/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mediastreamer/mediastreamer.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/mediastreamer/mediastreamer.mk b/package/mediastreamer/mediastreamer.mk
index d3b70f4ca9..3c9756936a 100644
--- a/package/mediastreamer/mediastreamer.mk
+++ b/package/mediastreamer/mediastreamer.mk
@@ -60,7 +60,7 @@ else
 MEDIASTREAMER_CONF_OPTS += --disable-pulseaudio
 endif
 
-ifeq ($(BR2_PACKAGE_SPEEX),y)
+ifeq ($(BR2_PACKAGE_SPEEX)$(BR2_PACKAGE_SPEEXDSP),yy)
 MEDIASTREAMER_CONF_OPTS += --enable-speex
 MEDIASTREAMER_DEPENDENCIES += speex
 else
-- 
2.17.1
