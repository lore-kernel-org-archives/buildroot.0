From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 21 Dec 2009 10:54:14 +0100
Subject: [Buildroot] [git commit master] qt: add selection for keyboard
	drivers
Message-ID: <20091221095432.C64EE777F8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=f31bbf9e681f17d3baf4c23b2696d1d04513a603
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/Config.in          |    1 +
 package/qt/Config.keyboard.in |   21 +++++++++++++++++++++
 package/qt/qt.mk              |   32 ++++++++++++++++++++++++++++++++
 3 files changed, 54 insertions(+), 0 deletions(-)
 create mode 100644 package/qt/Config.keyboard.in

diff --git a/package/qt/Config.in b/package/qt/Config.in
index ad5b543..7d9f6f9 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -259,6 +259,7 @@ source "package/qt/Config.sql.in"
 if BR2_PACKAGE_QT_GUI_MODULE
 source "package/qt/Config.gfx.in"
 source "package/qt/Config.mouse.in"
+source "package/qt/Config.keyboard.in"
 endif
 
 config BR2_PACKAGE_QT_PHONON
diff --git a/package/qt/Config.keyboard.in b/package/qt/Config.keyboard.in
new file mode 100644
index 0000000..7d169a1
--- /dev/null
+++ b/package/qt/Config.keyboard.in
@@ -0,0 +1,21 @@
+menu "Keyboard drivers"
+
+config BR2_PACKAGE_QT_KEYBOARD_TTY
+	bool "tty"
+
+config BR2_PACKAGE_QT_KEYBOARD_USB
+	bool "usb"
+
+config BR2_PACKAGE_QT_KEYBOARD_SL5000
+	bool "sl5000"
+
+config BR2_PACKAGE_QT_KEYBOARD_YOPY
+	bool "yopy"
+
+config BR2_PACKAGE_QT_KEYBOARD_VR41XX
+	bool "vr41xx"
+
+config BR2_PACKAGE_QT_KEYBOARD_QVFB
+	bool "qvfb"
+
+endmenu
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index e4a354d..4b6876f 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -147,6 +147,38 @@ else
 QT_CONFIGURE += -no-mouse-qvfb
 endif
 
+### Keyboard drivers
+ifeq ($(BR2_PACKAGE_QT_KEYBOARD_TTY),y)
+QT_CONFIGURE += -qt-kbd-tty
+else
+QT_CONFIGURE += -no-kbd-tty
+endif
+ifeq ($(BR2_PACKAGE_QT_KEYBOARD_USB),y)
+QT_CONFIGURE += -qt-kbd-usb
+else
+QT_CONFIGURE += -no-kbd-usb
+endif
+ifeq ($(BR2_PACKAGE_QT_KEYBOARD_SL5000),y)
+QT_CONFIGURE += -qt-kbd-sl5000
+else
+QT_CONFIGURE += -no-kbd-sl5000
+endif
+ifeq ($(BR2_PACKAGE_QT_KEYBOARD_YOPY),y)
+QT_CONFIGURE += -qt-kbd-yopy
+else
+QT_CONFIGURE += -no-kbd-yopy
+endif
+ifeq ($(BR2_PACKAGE_QT_KEYBOARD_VR41XX),y)
+QT_CONFIGURE += -qt-kbd-vr41xx
+else
+QT_CONFIGURE += -no-kbd-vr41xx
+endif
+ifeq ($(BR2_PACKAGE_QT_KEYBOARD_QVFB),y)
+QT_CONFIGURE += -qt-kbd-qvfb
+else
+QT_CONFIGURE += -no-kbd-qvfb
+endif
+
 ifeq ($(BR2_PACKAGE_QT_DEBUG),y)
 QT_CONFIGURE+= -debug
 else
-- 
1.6.3.3
