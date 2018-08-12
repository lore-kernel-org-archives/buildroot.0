From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:26 +0200
Subject: [Buildroot] [PATCH/next v2 14/23] package/vlc: add optional
 dependency to gst1-plugins-base
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-15-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 91e96516ac..6643d6fd8d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -59,7 +59,6 @@ VLC_CONF_OPTS += \
 	--disable-fluidsynth \
 	--disable-gme \
 	--disable-goom \
-	--disable-gst-decode \
 	--disable-harfbuzz \
 	--disable-jack \
 	--disable-jpeg \
@@ -181,6 +180,13 @@ else
 VLC_CONF_OPTS += --disable-freerdp
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+VLC_CONF_OPTS += --enable-gst-decode
+VLC_DEPENDENCIES += gst1-plugins-base
+else
+VLC_CONF_OPTS += --disable-gst-decode
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 VLC_DEPENDENCIES += libgl
 endif
-- 
2.18.0
