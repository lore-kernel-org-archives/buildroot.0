From: Peter Seiderer <ps.report@gmx.net>
Date: Sun,  6 Dec 2015 23:17:56 +0100
Subject: [Buildroot] [PATCH v2] qt53d: enabled assimpsceneparser plugin
In-Reply-To: <1449440276-6133-1-git-send-email-ps.report@gmx.net>
References: <1449440276-6133-1-git-send-email-ps.report@gmx.net>
Message-ID: <1449440276-6133-2-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- select assimp package
- copy enabled assimpsceneparser plugin

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Depends on '[PATCH v2] qt5/qt53d: new package' (see [1]).

[1] https://patchwork.ozlabs.org/patch/552897

Changes v1 -> v2:
  - no changes
---
 package/qt5/qt53d/Config.in | 1 +
 package/qt5/qt53d/qt53d.mk  | 3 ++-
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt53d/Config.in b/package/qt5/qt53d/Config.in
index d350922..6c09358 100644
--- a/package/qt5/qt53d/Config.in
+++ b/package/qt5/qt53d/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_QT53D
 	bool "qt53d"
+	select BR2_PACKAGE_ASSIMP
 	select BR2_PACKAGE_QT5BASE
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_QT5DECLARATIVE
diff --git a/package/qt5/qt53d/qt53d.mk b/package/qt5/qt53d/qt53d.mk
index 810242b..15d8999 100644
--- a/package/qt5/qt53d/qt53d.mk
+++ b/package/qt5/qt53d/qt53d.mk
@@ -7,7 +7,7 @@
 QT53D_VERSION = $(QT5_VERSION)
 QT53D_SITE = $(QT5_SITE)
 QT53D_SOURCE = qt3d-opensource-src-$(QT5SVG_VERSION).tar.xz
-QT53D_DEPENDENCIES = qt5base qt5declarative
+QT53D_DEPENDENCIES = assimp qt5base qt5declarative
 QT53D_INSTALL_STAGING = YES
 
 ifeq ($(BR2_PACKAGE_QT5BASE_LICENSE_APPROVED),y)
@@ -34,6 +34,7 @@ endef
 ifeq ($(BR2_STATIC_LIBS),)
 define QT53D_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt53D*.so.* $(TARGET_DIR)/usr/lib
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/sceneparsers $(TARGET_DIR)/usr/lib/qt/plugins
 	cp -dpfr $(STAGING_DIR)/usr/qml/Qt3D $(TARGET_DIR)/usr/qml
 endef
 endif
-- 
2.1.4
