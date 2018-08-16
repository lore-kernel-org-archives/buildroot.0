From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 16 Aug 2018 13:37:06 +0200
Subject: [Buildroot] [git commit branch/next] package/vlc: add optional
 support for skins2
Message-ID: <20180816113142.10C998027E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6191737cfc54a277445673ea86d564ea48d51318
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
