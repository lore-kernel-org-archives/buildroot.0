From: Julien Corjon <corjon.j@ecagroup.com>
Date: Thu,  6 Aug 2015 12:06:15 +0200
Subject: [Buildroot] [PATCH 2/2] qt/qt5multimedia: install gsttools for
	gstreamer1
In-Reply-To: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
References: <1438855575-4767-1-git-send-email-corjon.j@ecagroup.com>
Message-ID: <1438855575-4767-2-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 763fc28..34f3a0a 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -22,6 +22,10 @@ ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
 QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
 endif
 
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+QT5MULTIMEDIA_DEPENDENCIES += gst1-plugins-base
+endif
+
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
 endif
@@ -40,7 +44,7 @@ define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE)$(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
 define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
 	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
 endef
-- 
2.1.0
