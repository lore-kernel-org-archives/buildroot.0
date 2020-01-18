From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 18 Jan 2020 19:37:32 +0100
Subject: [Buildroot] [PATCH 1/1] package/mpv: add libvdpau optional
 dependency
Message-ID: <20200118183732.1114950-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mpv/mpv.mk | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index f92b604c28..2150f7e9aa 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -30,7 +30,6 @@ MPV_CONF_OPTS = \
 	--disable-uchardet \
 	--disable-vapoursynth \
 	--disable-vapoursynth-lazy \
-	--disable-vdpau \
 	--disable-mali-fbdev
 
 # ALSA support requires pcm+mixer
@@ -130,6 +129,14 @@ else
 MPV_CONF_OPTS += --disable-drm
 endif
 
+# libvdpau
+ifeq ($(BR2_PACKAGE_LIBVDPAU),y)
+MPV_CONF_OPTS += --enable-vdpau
+MPV_DEPENDENCIES += libvdpau
+else
+MPV_CONF_OPTS += --disable-vdpau
+endif
+
 # LUA support, only for lua51/lua52/luajit
 # This enables the controller (OSD) together with libass
 ifeq ($(BR2_PACKAGE_LUA_5_1)$(BR2_PACKAGE_LUAJIT),y)
-- 
2.24.1
