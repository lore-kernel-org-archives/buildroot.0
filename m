From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 13 Apr 2016 23:56:44 +0200
Subject: [Buildroot] [git commit] qt: get rid of extra spaces in license
	file list
Message-ID: <20160413215713.B993081D87@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=591cd5d37df17a7893e30746193a9c8eb2ca3676
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use "QT_LICENSE := $(QT_LICENSE), xxxx" construct to get rid of the
extra spaces before commas added by the font license clauses.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>
Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/qt/qt.mk | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index c4fff2d..f29a671 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -18,9 +18,9 @@ QT_SITE = http://download.qt-project.org/official_releases/qt/$(QT_VERSION_MAJOR
 QT_DEPENDENCIES = host-pkgconf
 QT_INSTALL_STAGING = YES
 
-QT_LICENSE = LGPLv2.1 with exceptions or GPLv3
+QT_LICENSE := LGPLv2.1 with exceptions or GPLv3
 ifneq ($(BR2_PACKAGE_QT_LICENSE_APPROVED),y)
-QT_LICENSE += or Digia Qt Commercial license
+QT_LICENSE := $(QT_LICENSE) or Digia Qt Commercial license
 endif
 QT_LICENSE_FILES = LICENSE.LGPL LGPL_EXCEPTION.txt LICENSE.GPL3
 
@@ -663,14 +663,14 @@ endef
 ifneq ($(BR2_PACKAGE_QT_FONT_MICRO)$(BR2_PACKAGE_QT_FONT_FIXED),)
 # as stated in the font source src/3rdparty/fonts/micro.bdf
 # source src/3rdparty/fonts/5x7.bdf and source src/3rdparty/fonts/6x13.bdf
-QT_LICENSE += , Public Domain (Micro/Fixed font)
+QT_LICENSE := $(QT_LICENSE), Public Domain (Micro/Fixed font)
 endif
 ifneq ($(BR2_PACKAGE_QT_FONT_HELVETICA)$(BR2_PACKAGE_QT_FONT_JAPANESE),)
-QT_LICENSE += , Adobe Helvetica license (Helvetica/Japanese fonts)
+QT_LICENSE := $(QT_LICENSE), Adobe Helvetica license (Helvetica/Japanese fonts)
 QT_LICENSE_FILES += src/3rdparty/fonts/COPYING.Helvetica
 endif
 ifeq ($(BR2_PACKAGE_QT_FONT_UNIFONT),y)
-QT_LICENSE += , Freeware (Unifont font)
+QT_LICENSE := $(QT_LICENSE), Freeware (Unifont font)
 QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.Unifont
 endif
 endif # QT_FONTS
@@ -680,7 +680,7 @@ define QT_INSTALL_TARGET_FONTS_TTF
 	mkdir -p $(TARGET_DIR)/usr/lib/fonts
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
 endef
-QT_LICENSE += , Bitstream license (DejaVu/Vera TrueType fonts)
+QT_LICENSE := $(QT_LICENSE), Bitstream license (DejaVu/Vera TrueType fonts)
 QT_LICENSE_FILES += src/3rdparty/fonts/COPYRIGHT.DejaVu \
 	src/3rdparty/fonts/README.DejaVu \
 	src/3rdparty/fonts/COPYRIGHT.Vera
