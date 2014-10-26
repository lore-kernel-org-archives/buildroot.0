From: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Date: Sun, 26 Oct 2014 19:45:32 +0100
Subject: [Buildroot] [PATCH 26/51] qjson: bump version
In-Reply-To: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
References: <1414349157-22749-1-git-send-email-maxime.hadjinlian@gmail.com>
Message-ID: <1414349157-22749-26-git-send-email-maxime.hadjinlian@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove useless empty line.
Update the patch and its name.

We change from a release from Nov 2012 to a commit, because the project
and there has been quite a number of commits since then.

The patch will be sent upstream along with a request for a new release.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
---
 ...1-fix-Qt4-package-error-in-CMakeLists.txt.patch | 29 ++++++++++++++++++++++
 ...qjson-fix-qt4-package-error-in-cmakelists.patch | 29 ----------------------
 package/qjson/qjson.mk                             |  3 +--
 3 files changed, 30 insertions(+), 31 deletions(-)
 create mode 100644 package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
 delete mode 100644 package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch

diff --git a/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch b/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
new file mode 100644
index 0000000..6f7a9ba
--- /dev/null
+++ b/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
@@ -0,0 +1,29 @@
+From 45ec86156819c0872d023b05001682a8d2d2dc25 Mon Sep 17 00:00:00 2001
+From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+Date: Sat, 6 Apr 2013 16:54:25 +0200
+Subject: [PATCH] fix Qt4 package error in CMakeLists.txt
+
+Avoid checking for uic executable by cmake as it results configure
+time error if QtGui isn't installed.
+
+Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
+---
+ CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index adb65e9..81854b1 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -52,7 +52,7 @@ IF (Qt5Core_FOUND)
+ ELSE()
+   MESSAGE ("Qt5 not found, searching for Qt4")
+   # Find Qt4
+-  FIND_PACKAGE( Qt4 REQUIRED )
++  FIND_PACKAGE( Qt4 COMPONENTS QtCore REQUIRED )
+ 
+   # Include the cmake file needed to use qt4
+   INCLUDE( ${QT_USE_FILE} )
+-- 
+2.1.1
+
diff --git a/package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch b/package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch
deleted file mode 100644
index 058973e..0000000
--- a/package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch
+++ /dev/null
@@ -1,29 +0,0 @@
-From 529e50939316abc3c4190f89a482b17a4d4b3355 Mon Sep 17 00:00:00 2001
-From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
-Date: Sat, 6 Apr 2013 16:54:25 +0200
-Subject: [PATCH] fix Qt4 package error in CMakeLists.txt
-
-Avoid checking for uic executable by cmake as it results configure
-time error if QtGui isn't installed.
-
-Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
----
- CMakeLists.txt |    2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 13e65f1..447f209 100644
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -32,7 +32,7 @@ SET(FRAMEWORK_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/Library/Frameworks"
- SET(QT_USE_IMPORTED_TARGETS TRUE)
- 
- # Find Qt4
--FIND_PACKAGE( Qt4 REQUIRED )
-+find_package(Qt4 COMPONENTS QtCore REQUIRED )
- 
- IF (NOT WIN32)
-   SET( QT_DONT_USE_QTGUI TRUE )
--- 
-1.7.10.4
-
diff --git a/package/qjson/qjson.mk b/package/qjson/qjson.mk
index 2a0690f..17f2d00 100644
--- a/package/qjson/qjson.mk
+++ b/package/qjson/qjson.mk
@@ -4,8 +4,7 @@
 #
 ################################################################################
 
-QJSON_VERSION = 0.8.1
-
+QJSON_VERSION = ba273682a9d33a7b3090e74f4742b5f3bf6c9b02
 QJSON_SITE = $(call github,flavio,qjson,$(QJSON_VERSION))
 QJSON_INSTALL_STAGING = YES
 QJSON_DEPENDENCIES = qt
-- 
2.1.1
