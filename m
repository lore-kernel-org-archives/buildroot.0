From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri, 18 Jun 2021 21:22:36 +0200
Subject: [Buildroot] [PATCH 3/4] package/mpv: Add optional support for
 OpenGL DRM EGL Backend
In-Reply-To: <20210618192237.808519-1-bernd.kuhls@t-online.de>
References: <20210618192237.808519-1-bernd.kuhls@t-online.de>
Message-ID: <20210618192237.808519-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reference: https://github.com/mpv-player/mpv/blob/master/wscript#L571

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mpv/mpv.mk | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/package/mpv/mpv.mk b/package/mpv/mpv.mk
index 877b84f63a..4292abb876 100644
--- a/package/mpv/mpv.mk
+++ b/package/mpv/mpv.mk
@@ -50,8 +50,13 @@ endif
 ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL),y)
 MPV_CONF_OPTS += --enable-gbm
 MPV_DEPENDENCIES += mesa3d
+ifeq ($(BR2_PACKAGE_LIBDRM),y)
+MPV_CONF_OPTS += --enable-egl-drm
+else
+MPV_CONF_OPTS += --disable-egl-drm
+endif
 else
-MPV_CONF_OPTS += --disable-gbm
+MPV_CONF_OPTS += --disable-gbm --disable-egl-drm
 endif
 
 # jack support
-- 
2.30.2
