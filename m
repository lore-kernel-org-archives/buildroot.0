From: Matt Kraai <kraai@ftbfs.org>
Date: Thu,  8 Dec 2016 06:38:50 -0800
Subject: [Buildroot] [PATCH] qt5xmlpatterns: install examples
Message-ID: <20161208143850.17718-1-kraai@ftbfs.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
---
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 31477a7c0..0b518b052 100644
--- a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
+++ b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
@@ -32,9 +32,20 @@ define QT5XMLPATTERNS_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
-define QT5XMLPATTERNS_INSTALL_TARGET_CMDS
+define QT5XMLPATTERNS_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5XmlPatterns*.so.* $(TARGET_DIR)/usr/lib
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5XMLPATTERNS_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/xmlpatterns $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
+define QT5XMLPATTERNS_INSTALL_TARGET_CMDS
+	$(QT5XMLPATTERNS_INSTALL_TARGET_LIBS)
+	$(QT5XMLPATTERNS_INSTALL_TARGET_EXAMPLES)
+endef
+
 $(eval $(generic-package))
-- 
2.11.0
