From: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
Date: Thu, 14 Jul 2011 12:12:20 -0400
Subject: [Buildroot] [PATCH] qt: add QtTest to default installed libs
Message-ID: <1310659940-11141-1-git-send-email-jerome.oufella@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When selecting Qt, the QtTest library is not copied to the target.
This adds QtTest to the list of copied libraries.

Signed-off-by: Jerome Oufella <jerome.oufella@savoirfairelinux.com>
---
 package/qt/qt.mk |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index ff67058..e8bb62e 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -512,7 +512,7 @@ endef
 
 # Build the list of libraries and plugins to install to the target
 
-QT_INSTALL_LIBS    += QtCore
+QT_INSTALL_LIBS    += QtCore QtTest
 QT_HOST_PROGRAMS   += moc rcc qmake lrelease
 
 ifeq ($(BR2_PACKAGE_QT_GUI_MODULE),y)
-- 
1.7.6
