From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 23:33:03 +0200
Subject: [Buildroot] [git commit] package/mpv: add optional support for
 OpenGL DRM EGL Backend
Message-ID: <20210718205920.C11CA88335@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=031df474c24f92757ac95ade572b90995ebdc6a2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Reference: https://github.com/mpv-player/mpv/blob/master/wscript#L571

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
