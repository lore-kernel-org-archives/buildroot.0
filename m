From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:27 +0200
Subject: [Buildroot] [PATCH/next v2 15/23] package/vlc: add optional
 dependency to harfbuzz
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-16-bernd.kuhls@t-online.de>
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
index 6643d6fd8d..7ce1f57cd8 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -59,7 +59,6 @@ VLC_CONF_OPTS += \
 	--disable-fluidsynth \
 	--disable-gme \
 	--disable-goom \
-	--disable-harfbuzz \
 	--disable-jack \
 	--disable-jpeg \
 	--disable-kai \
@@ -191,6 +190,13 @@ ifeq ($(BR2_PACKAGE_HAS_LIBGL),y)
 VLC_DEPENDENCIES += libgl
 endif
 
+ifeq ($(BR2_PACKAGE_HARFBUZZ),y)
+VLC_CONF_OPTS += --enable-harfbuzz
+VLC_DEPENDENCIES += harfbuzz
+else
+VLC_CONF_OPTS += --disable-harfbuzz
+endif
+
 ifeq ($(BR2_PACKAGE_HAS_LIBGLES),y)
 VLC_CONF_OPTS += --enable-gles2
 VLC_DEPENDENCIES += libgles
-- 
2.18.0
