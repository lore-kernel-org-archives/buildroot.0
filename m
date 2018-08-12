From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:33 +0200
Subject: [Buildroot] [PATCH/next v2 21/23] package/vlc: add optional
 dependency to mpg123
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-22-bernd.kuhls@t-online.de>
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
index af500cba33..3dbaac1757 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -68,7 +68,6 @@ VLC_CONF_OPTS += \
 	--disable-mfx \
 	--disable-microdns \
 	--disable-mmal \
-	--disable-mpg123 \
 	--disable-mtp \
 	--disable-notify \
 	--disable-projectm \
@@ -453,6 +452,13 @@ ifeq ($(BR2_PACKAGE_MINIZIP),y)
 VLC_DEPENDENCIES += minizip
 endif
 
+ifeq ($(BR2_PACKAGE_MPG123),y)
+VLC_CONF_OPTS += --enable-mpg123
+VLC_DEPENDENCIES += mpg123
+else
+VLC_CONF_OPTS += --disable-mpg123
+endif
+
 ifeq ($(BR2_PACKAGE_MUSEPACK),y)
 VLC_CONF_OPTS += --enable-mpc
 VLC_DEPENDENCIES += musepack
-- 
2.18.0
