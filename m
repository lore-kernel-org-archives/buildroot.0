From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Sun,  6 Oct 2013 00:16:35 +0300
Subject: [Buildroot] [PATCH 1/2] qt5base: fix build when PNG support is
	disabled
Message-ID: <1381007796-20031-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 ...correct-path-for-private-header-inclusion.patch | 32 ++++++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/qt5/qt5base/qt5base-0005-Use-the-correct-path-for-private-header-inclusion.patch

diff --git a/package/qt5/qt5base/qt5base-0005-Use-the-correct-path-for-private-header-inclusion.patch b/package/qt5/qt5base/qt5base-0005-Use-the-correct-path-for-private-header-inclusion.patch
new file mode 100644
index 0000000..85c2714
--- /dev/null
+++ b/package/qt5/qt5base/qt5base-0005-Use-the-correct-path-for-private-header-inclusion.patch
@@ -0,0 +1,32 @@
+From 4a5fa73c7c65f2b58da5288199f6af993a737273 Mon Sep 17 00:00:00 2001
+From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
+Date: Sat, 5 Oct 2013 13:39:44 +0300
+Subject: [PATCH] Use the correct path for private header inclusion
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes the build when PNG support is disabled.
+
+Reported-Upstream: https://bugreports.qt-project.org/browse/QTBUG-33496
+Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
+---
+ src/gui/kernel/qplatformtheme.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/gui/kernel/qplatformtheme.cpp b/src/gui/kernel/qplatformtheme.cpp
+index 02b69bc..46b59b5 100644
+--- a/src/gui/kernel/qplatformtheme.cpp
++++ b/src/gui/kernel/qplatformtheme.cpp
+@@ -48,7 +48,7 @@
+ #include <QtCore/qfileinfo.h>
+ #include <qpalette.h>
+ #include <qtextformat.h>
+-#include <qiconloader_p.h>
++#include "private/qiconloader_p.h"
+ 
+ QT_BEGIN_NAMESPACE
+ 
+-- 
+1.8.4.rc3
+
-- 
1.8.4.rc3
