From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:35 +0200
Subject: [Buildroot] [PATCH/next v2 23/23] package/vlc: add optional support
 for skins2
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-24-bernd.kuhls@t-online.de>
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
index 53a2b61633..ed682e60b3 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -74,7 +74,6 @@ VLC_CONF_OPTS += \
 	--disable-schroedinger \
 	--disable-shine \
 	--disable-shout \
-	--disable-skins2 \
 	--disable-sndio \
 	--disable-spatialaudio \
 	--disable-srt \
@@ -560,6 +559,13 @@ else
 VLC_CONF_OPTS += --without-x
 endif
 
+ifeq ($(BR2_PACKAGE_XLIB_LIBXEXT)$(BR2_PACKAGE_XLIB_LIBXINERAMA)$(BR2_PACKAGE_XLIB_LIBXPM),yyy)
+VLC_CONF_OPTS += --enable-skins2
+VLC_DEPENDENCIES += xlib_libXext xlib_libXinerama xlib_libXpm
+else
+VLC_CONF_OPTS += --disable-skins2
+endif
+
 ifeq ($(BR2_PACKAGE_ZLIB),y)
 VLC_DEPENDENCIES += zlib
 endif
-- 
2.18.0
