From: Wojciech Slenska <wojciech.slenska@gmail.com>
Date: Wed, 15 May 2013 22:34:44 +0200
Subject: [Buildroot] [PATCH] qt5 libQt5OpenGL.so library installation
Message-ID: <1368650084-24427-1-git-send-email-wojciech.slenska@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When qt5 is build with EGLFS support, libQt5OpenGL library should be copied to target.

Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
---
 package/qt5/qt5base/qt5base.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
index bfc6c91..7c6a093 100644
--- a/package/qt5/qt5base/qt5base.mk
+++ b/package/qt5/qt5base/qt5base.mk
@@ -118,6 +118,7 @@ QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_CONCURRENT) += Qt5Concurrent
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_SQL)        += Qt5Sql
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_TEST)       += Qt5Test
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_XML)        += Qt5Xml
+QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_EGLFS)      += Qt5OpenGL
 
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_GUI)          += Qt5Gui
 QT5BASE_INSTALL_LIBS_$(BR2_PACKAGE_QT5BASE_WIDGETS)      += Qt5Widgets
-- 
1.8.1.2
