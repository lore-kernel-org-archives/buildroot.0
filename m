From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:29 +0200
Subject: [Buildroot] [PATCH/next v2 17/23] package/vlc: add optional
 dependency to libnfs
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-18-bernd.kuhls@t-online.de>
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
index d34ab2a9e0..fab08b950d 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -71,7 +71,6 @@ VLC_CONF_OPTS += \
 	--disable-mmal \
 	--disable-mpg123 \
 	--disable-mtp \
-	--disable-nfs \
 	--disable-notify \
 	--disable-projectm \
 	--disable-schroedinger \
@@ -311,6 +310,13 @@ else
 VLC_CONF_OPTS += --disable-libmpeg2
 endif
 
+ifeq ($(BR2_PACKAGE_LIBNFS),y)
+VLC_CONF_OPTS += --enable-nfs
+VLC_DEPENDENCIES += libnfs
+else
+VLC_CONF_OPTS += --disable-nfs
+endif
+
 ifeq ($(BR2_PACKAGE_LIBPNG),y)
 VLC_CONF_OPTS += --enable-png
 VLC_DEPENDENCIES += libpng
-- 
2.18.0
