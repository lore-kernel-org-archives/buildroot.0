From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Apr 2016 14:20:17 +0200
Subject: [Buildroot] [PATCH 3/8] package/kodi: Update OpenGL check
In-Reply-To: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1461586822-1003-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/kodi.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index e812b50..7360fec 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -187,7 +187,7 @@ KODI_DEPENDENCIES += libtheora
 endif
 
 # kodi needs libva & libva-glx
-ifeq ($(BR2_PACKAGE_KODI_LIBVA)$(BR2_PACKAGE_MESA3D_DRI_DRIVER),yy)
+ifeq ($(BR2_PACKAGE_KODI_LIBVA)$(BR2_PACKAGE_MESA3D_OPENGL_GL),yy)
 KODI_DEPENDENCIES += mesa3d libva
 KODI_CONF_OPTS += --enable-vaapi
 else
-- 
2.8.0.rc3
