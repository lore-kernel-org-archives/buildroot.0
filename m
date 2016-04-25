From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Mon, 25 Apr 2016 14:20:18 +0200
Subject: [Buildroot] [PATCH 4/8] package/libva: Update OpenGL check
In-Reply-To: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
References: <1461586822-1003-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1461586822-1003-4-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index e11bed3..c05a83d 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -19,7 +19,7 @@ LIBVA_CONF_OPTS = \
 	--disable-dummy-driver \
 	--with-drivers-path="/usr/lib/va"
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GL),y)
 LIBVA_DEPENDENCIES += mesa3d
 LIBVA_CONF_OPTS += --enable-glx
 else
-- 
2.8.0.rc3
