From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 1 Nov 2014 22:08:25 +0100
Subject: [Buildroot] [git commit] qjson: bump version
Message-ID: <20141101221442.E760CB2BD5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=18714011b231fc326c96782134fbea778ab6a94d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Remove useless empty line.
Update the patch and its name.

We change from a release from Nov 2012 to a commit, because the project
and there has been quite a number of commits since then.

The patch will be sent upstream along with a request for a new release.

Signed-off-by: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...-fix-Qt4-package-error-in-CMakeLists.txt.patch} |   24 ++++++++++----------
 package/qjson/qjson.mk                             |    3 +-
 2 files changed, 13 insertions(+), 14 deletions(-)

diff --git a/package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch b/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
similarity index 54%
rename from package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch
rename to package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
index 058973e..6f7a9ba 100644
--- a/package/qjson/qjson-fix-qt4-package-error-in-cmakelists.patch
+++ b/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
@@ -1,4 +1,4 @@
-From 529e50939316abc3c4190f89a482b17a4d4b3355 Mon Sep 17 00:00:00 2001
+From 45ec86156819c0872d023b05001682a8d2d2dc25 Mon Sep 17 00:00:00 2001
 From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 Date: Sat, 6 Apr 2013 16:54:25 +0200
 Subject: [PATCH] fix Qt4 package error in CMakeLists.txt
@@ -8,22 +8,22 @@ time error if QtGui isn't installed.
 
 Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
 ---
- CMakeLists.txt |    2 +-
+ CMakeLists.txt | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
 diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 13e65f1..447f209 100644
+index adb65e9..81854b1 100644
 --- a/CMakeLists.txt
 +++ b/CMakeLists.txt
-@@ -32,7 +32,7 @@ SET(FRAMEWORK_INSTALL_DIR "${CMAKE_INSTALL_PREFIX}/Library/Frameworks"
- SET(QT_USE_IMPORTED_TARGETS TRUE)
+@@ -52,7 +52,7 @@ IF (Qt5Core_FOUND)
+ ELSE()
+   MESSAGE ("Qt5 not found, searching for Qt4")
+   # Find Qt4
+-  FIND_PACKAGE( Qt4 REQUIRED )
++  FIND_PACKAGE( Qt4 COMPONENTS QtCore REQUIRED )
  
- # Find Qt4
--FIND_PACKAGE( Qt4 REQUIRED )
-+find_package(Qt4 COMPONENTS QtCore REQUIRED )
- 
- IF (NOT WIN32)
-   SET( QT_DONT_USE_QTGUI TRUE )
+   # Include the cmake file needed to use qt4
+   INCLUDE( ${QT_USE_FILE} )
 -- 
-1.7.10.4
+2.1.1
 
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
