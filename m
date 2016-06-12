From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 12 Jun 2016 11:30:20 +0200
Subject: [Buildroot] [PATCH 2/5] package/libv4l: qt4 support depends on
	OpenGL
In-Reply-To: <1465723823-6113-1-git-send-email-bernd.kuhls@t-online.de>
References: <1465723823-6113-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1465723823-6113-2-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes
http://autobuild.buildroot.net/results/8fc/8fc8cbc85dacebce5cb6ab13f5ff3b0764117471/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libv4l/libv4l.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/libv4l/libv4l.mk b/package/libv4l/libv4l.mk
index bdd28bf..d0a0369 100644
--- a/package/libv4l/libv4l.mk
+++ b/package/libv4l/libv4l.mk
@@ -54,7 +54,7 @@ LIBV4L_CONF_ENV += \
 	ac_cv_prog_MOC=$(HOST_DIR)/usr/bin/moc \
 	ac_cv_prog_RCC=$(HOST_DIR)/usr/bin/rcc \
 	ac_cv_prog_UIC=$(HOST_DIR)/usr/bin/uic
-else ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
+else ifeq ($(BR2_PACKAGE_QT_OPENGL_GL_DESKTOP),y)
 LIBV4L_CONF_OPTS += --enable-qv4l2
 LIBV4L_DEPENDENCIES += qt
 else
-- 
2.8.1
