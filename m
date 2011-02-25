From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Fri, 25 Feb 2011 21:45:31 +0100
Subject: [Buildroot] [git commit master 1/1] qt: add option to hide mouse
	cursor
Message-ID: <20110225214149.66C718F75F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=fab79678f017363941d50abe7d12727cc01a3d5b
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Allow the user to build Qt with the QT_NO_QWS_CURSOR macro set.

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
Acked-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
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
index 3dfdcbf..cc90190 100644
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
1.7.3.4
