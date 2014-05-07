From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed,  7 May 2014 22:09:38 +0200
Subject: [Buildroot] [PATCH v5 04/32] mesa3d: Fix gbm related compile error
In-Reply-To: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399493406-7247-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1399493406-7247-5-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

https://bugs.freedesktop.org/show_bug.cgi?id=78225#c1
"AFAICS both gbm backends require DRI"

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |    2 --
 1 file changed, 2 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f95df0c..e9e5b8b 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -69,7 +69,6 @@ endif
 
 ifeq ($(MESA3D_DRI_DRIVERS-y),)
 MESA3D_CONF_OPT += \
-	--disable-dri \
 	--without-dri-drivers
 else
 MESA3D_CONF_OPT += \
@@ -102,7 +101,6 @@ MESA3D_CONF_OPT += \
 	--with-egl-platforms=$(subst $(space),$(comma),$(MESA3D_EGL_PLATFORMS))
 else
 MESA3D_CONF_OPT += \
-	--disable-gbm \
 	--disable-egl
 endif
 
-- 
1.7.10.4
