From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:32 +0200
Subject: [Buildroot] [PATCH/next v2 20/23] package/vlc: add optional
 dependency to libva
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-21-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/vlc/vlc.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index a15bda3204..af500cba33 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -64,7 +64,6 @@ VLC_CONF_OPTS += \
 	--disable-kate \
 	--disable-kva \
 	--disable-libplacebo \
-	--disable-libva \
 	--disable-linsys \
 	--disable-mfx \
 	--disable-microdns \
@@ -378,6 +377,14 @@ else
 VLC_CONF_OPTS += --disable-upnp
 endif
 
+# libva support depends on ffmpeg
+ifeq ($(BR2_PACKAGE_FFMPEG)$(BR2_PACKAGE_LIBVA),yy)
+VLC_CONF_OPTS += --enable-libva
+VLC_DEPENDENCIES += libva
+else
+VLC_CONF_OPTS += --disable-libva
+endif
+
 ifeq ($(BR2_PACKAGE_LIBVNCSERVER),y)
 VLC_CONF_OPTS += --enable-vnc
 VLC_DEPENDENCIES += libvncserver
-- 
2.18.0
