From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Thu,  3 Feb 2011 00:06:44 +0100
Subject: [Buildroot] [PATCH] qt: add option to hide mouse cursor
Message-ID: <1296688004-27884-1-git-send-email-daniel.nystrom@timeterminal.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Allow the user to build Qt with the QT_NO_QWS_CURSOR macro set.

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
---
 package/qt/Config.mouse.in |    7 +++++++
 package/qt/qt.mk           |    3 +++
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.mouse.in b/package/qt/Config.mouse.in
index 87973d2..16c41c1 100644
--- a/package/qt/Config.mouse.in
+++ b/package/qt/Config.mouse.in
@@ -15,4 +15,11 @@ config BR2_PACKAGE_QT_MOUSE_TSLIB
 config BR2_PACKAGE_QT_MOUSE_QVFB
 	bool "qvfb"
 
+comment "Mouse Options"
+
+config BR2_PACKAGE_QT_MOUSE_NO_QWS_CURSOR
+	bool "Hide the mouse cursor"
+	help
+	  Do not show the mouse cursor in QWS.
+
 endmenu
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 6eb31bc..7a57357 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -154,6 +154,9 @@ QT_CONFIGURE += -qt-mouse-qvfb
 else
 QT_CONFIGURE += -no-mouse-qvfb
 endif
+ifeq ($(BR2_PACKAGE_QT_MOUSE_NO_QWS_CURSOR),y)
+QT_CONFIGURE+= -D QT_NO_QWS_CURSOR
+endif
 
 ### Keyboard drivers
 ifeq ($(BR2_PACKAGE_QT_KEYBOARD_TTY),y)
-- 
1.7.1
