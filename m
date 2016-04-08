From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Apr 2016 10:35:20 -0300
Subject: [Buildroot] [PATCH 1/2] weston: fix typo in EGL/GLES support
	conditional
Message-ID: <1460122521-19079-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It's BR2_PACKAGE_MESA3D_OPENGL_ES and not
BR2_PACKAGE_MESA3D_OPENGL_GLES, ouch.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index 7aa2130..a0e2358 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -49,7 +49,7 @@ WESTON_CONF_OPTS += --disable-weston-launch
 endif
 
 # Needs wayland-egl, which normally only mesa provides
-ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES)$(BR2_PACKAGE_MESA3D_OPENGL_GLES),yy)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES)$(BR2_PACKAGE_MESA3D_OPENGL_ES),yy)
 WESTON_CONF_OPTS += --enable-egl
 WESTON_DEPENDENCIES += libegl
 else
-- 
2.7.3
