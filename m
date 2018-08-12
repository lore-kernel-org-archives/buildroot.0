From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Aug 2018 22:29:34 +0200
Subject: [Buildroot] [PATCH/next v2 22/23] package/vlc: add optional
 dependency to wayland
In-Reply-To: <20180812202935.12983-1-bernd.kuhls@t-online.de>
References: <20180812202935.12983-1-bernd.kuhls@t-online.de>
Message-ID: <20180812202935.12983-23-bernd.kuhls@t-online.de>
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
index 3dbaac1757..53a2b61633 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -84,7 +84,6 @@ VLC_CONF_OPTS += \
 	--disable-vdpau \
 	--disable-vsxu \
 	--disable-wasapi \
-	--disable-wayland \
 	--disable-x262 \
 	--disable-zvbi \
 	--enable-run-as-root
@@ -529,6 +528,13 @@ else
 VLC_CONF_OPTS += --disable-udev
 endif
 
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+VLC_CONF_OPTS += --enable-wayland
+VLC_DEPENDENCIES += wayland
+else
+VLC_CONF_OPTS += --disable-wayland
+endif
+
 ifeq ($(BR2_PACKAGE_X264),y)
 VLC_CONF_OPTS += --enable-x264
 VLC_DEPENDENCIES += x264
-- 
2.18.0
