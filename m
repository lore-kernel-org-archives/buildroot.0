From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 8 Apr 2016 22:12:24 +0200
Subject: [Buildroot] [git commit] weston: don't forcibly disable simple EGL
	clients
Message-ID: <20160408201247.06EF881D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=8adc5224089ebb34bd83f3a43347835931fee77f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Only do so when there's no EGL.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/weston/weston.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index e3088ff..1f31097 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -16,7 +16,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-	--disable-simple-egl-clients \
 	--disable-xwayland \
 	--disable-x11-compositor \
 	--disable-wayland-compositor \
@@ -53,7 +52,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_EGL)$(BR2_PACKAGE_MESA3D_OPENGL_ES),yy)
 WESTON_CONF_OPTS += --enable-egl
 WESTON_DEPENDENCIES += libegl
 else
-WESTON_CONF_OPTS += --disable-egl
+WESTON_CONF_OPTS += \
+	--disable-egl \
+	--disable-simple-egl-clients
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
