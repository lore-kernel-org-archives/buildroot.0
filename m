From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 8 Dec 2016 22:28:02 +0100
Subject: [Buildroot] [git commit] qt5xmlpatterns: install examples
Message-ID: <20161208212806.22F4281E53@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e9539143e93b4bfdc7c0c8ff01590a4b11feaa63
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Matt Kraai <kraai@ftbfs.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk b/package/qt5/qt5xmlpatterns/qt5xmlpatterns.mk
index 31477a7..0b518b0 100644
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
