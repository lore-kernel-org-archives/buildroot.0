From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Fri,  8 Apr 2016 10:35:21 -0300
Subject: [Buildroot] [PATCH 2/2] weston: don't forcibly disable simple EGL
	clients
In-Reply-To: <1460122521-19079-1-git-send-email-gustavo@zacarias.com.ar>
References: <1460122521-19079-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1460122521-19079-2-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Only do so when there's no EGL.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/weston/weston.mk | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/weston/weston.mk b/package/weston/weston.mk
index a0e2358..c98689b 100644
--- a/package/weston/weston.mk
+++ b/package/weston/weston.mk
@@ -16,7 +16,6 @@ WESTON_DEPENDENCIES = host-pkgconf wayland wayland-protocols \
 
 WESTON_CONF_OPTS = \
 	--with-dtddir=$(STAGING_DIR)/usr/share/wayland \
-	--disable-simple-egl-clients \
 	--disable-xwayland \
 	--disable-x11-compositor \
 	--disable-wayland-compositor \
@@ -53,7 +52,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_ES)$(BR2_PACKAGE_MESA3D_OPENGL_ES),yy)
 WESTON_CONF_OPTS += --enable-egl
 WESTON_DEPENDENCIES += libegl
 else
-WESTON_CONF_OPTS += --disable-egl
+WESTON_CONF_OPTS += \
+	--disable-egl \
+	--disable-simple-egl-clients
 endif
 
 ifeq ($(BR2_PACKAGE_LIBUNWIND),y)
-- 
2.7.3
