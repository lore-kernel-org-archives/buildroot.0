From: Peter Seiderer <ps.report@gmx.net>
Date: Fri, 12 Jun 2015 22:22:15 +0200
Subject: [Buildroot] [PATCH v1] qt: add font license information
Message-ID: <1434140535-13792-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Not sure about the japanese font and about MIT or MIT-like
licenses (no exact match of the wording to other MIT licenses).
---
 package/qt/qt.mk | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index a7bbe5f..3fbb3e1 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -656,6 +656,32 @@ define QT_INSTALL_TARGET_FONTS
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(QT_FONTS) $(TARGET_DIR)/usr/lib/fonts
 endef
+ifeq ($(BR2_PACKAGE_QT_FONT_MICRO),y)
+QT_LICENSE += Public Domain (Micro font)
+# disabled because this file (containing the Public Domain notice) is
+# the font source file too...
+#QT_LICENSE_FILES += src/3rdparty/fonts/micro.bdf
+endif
+ifeq ($(BR2_PACKAGE_QT_FONT_FIXED),y)
+# according to https://launchpad.net/ubuntu/vivid/+source/qtbase-opensource-src/+copyright
+QT_LICENSE += Public Domain (Fixed font)
+endif
+ifeq ($(BR2_PACKAGE_QT_FONT_HELVETICA),y)
+QT_LICENSE += MIT-like (Helvetica fonts)
+QT_LICENSE_FILES += src/3rdparty/fonts/COPYING.Helvetica
+endif
+ifeq ($(BR2_PACKAGE_QT_FONT_JAPANESE),y)
+# according to https://launchpad.net/ubuntu/vivid/+source/qtbase-opensource-src/+copyright
+# Public Domain
+QT_LICENSE += Public Domain (Japanese font)
+# according to lib/fonts/README same as Helvetica fonts?
+#QT_LICENSE += MIT-like (Japanese fonts)
+#QT_LICENSE_FILES += src/3rdparty/fonts/COPYING.Helvetica
+endif
+ifeq ($(BR2_PACKAGE_QT_FONT_UNIFONT),y)
+QT_LICENSE += Freeware (Unifont font)
+QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.Unifont
+endif
 endif
 
 ifeq ($(BR2_PACKAGE_QT_QTFREETYPE)$(BR2_PACKAGE_QT_SYSTEMFREETYPE),y)
@@ -663,6 +689,10 @@ define QT_INSTALL_TARGET_FONTS_TTF
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
 endef
+QT_LICENSE += MIT-like (DejaVu/Vera TrueType fonts)
+QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.DejaVu \
+	src/3rdparty/fonts/README.DejaVu \
+	src/3rdparty/fonts/COPYRIGHT.Vera
 endif
 endif # BR2_PACKAGE_QT_EMBEDDED
 
-- 
2.1.4
