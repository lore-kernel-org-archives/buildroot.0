From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 1 Apr 2018 23:48:30 +0200
Subject: [Buildroot] [git commit] package/qt5/qt5scxml: install missing QML
 module
Message-ID: <20180401214843.725EA83761@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=80928388286b6f25a9e70466dba57aa0587db8c0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 qrc:/MainUI.qml:2 module "QtScxml" is not installed

Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
Reviewed-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/qt5/qt5scxml/qt5scxml.mk | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt5/qt5scxml/qt5scxml.mk b/package/qt5/qt5scxml/qt5scxml.mk
index 2d197a2bca..b6281975c6 100644
--- a/package/qt5/qt5scxml/qt5scxml.mk
+++ b/package/qt5/qt5scxml/qt5scxml.mk
@@ -35,6 +35,10 @@ define QT5SCXML_INSTALL_TARGET_LIBS
 endef
 endif
 
+define QT5SCXML_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtScxml/ $(TARGET_DIR)/usr/qml/
+endef
+
 ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
 define QT5SCXML_INSTALL_TARGET_EXAMPLES
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/scxml $(TARGET_DIR)/usr/lib/qt/examples/
@@ -43,6 +47,7 @@ endif
 
 define QT5SCXML_INSTALL_TARGET_CMDS
 	$(QT5SCXML_INSTALL_TARGET_LIBS)
+	$(QT5SCXML_INSTALL_TARGET_QMLS)
 	$(QT5SCXML_INSTALL_TARGET_EXAMPLES)
 endef
 
