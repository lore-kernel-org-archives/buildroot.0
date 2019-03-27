From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Wed, 27 Mar 2019 20:11:31 +0100
Subject: [Buildroot] [git commit] package/qjson: drop Qt4 patch
Message-ID: <20190327190830.6F9A982B3D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c70629735cea391bbe3f45f235e86e45f7e0fc41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that Qt4 has been removed, drop patch

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-fix-Qt4-package-error-in-CMakeLists.txt.patch | 26 ----------------------
 1 file changed, 26 deletions(-)

diff --git a/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch b/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
deleted file mode 100644
index a9e34e4c26..0000000000
--- a/package/qjson/0001-fix-Qt4-package-error-in-CMakeLists.txt.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From 254858bbf443bded2e80480e9f9032ce166b923e Mon Sep 17 00:00:00 2001
-From: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
-Date: Fri, 2 Dec 2016 23:00:58 +0100
-Subject: [PATCH] CMake, Qt4: check specifically for QtCore, fixes #96
-
-Signed-off-by: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>
----
- CMakeLists.txt | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/CMakeLists.txt b/CMakeLists.txt
-index 31d9987..2fde79f 100755
---- a/CMakeLists.txt
-+++ b/CMakeLists.txt
-@@ -62,7 +62,7 @@ IF (Qt5Core_FOUND)
- ELSE()
-   MESSAGE ("Qt5 not found, searching for Qt4")
-   # Find Qt4
--  FIND_PACKAGE( Qt4 4.5 REQUIRED )
-+  FIND_PACKAGE( Qt4 4.5 REQUIRED QtCore)
-   # QStringBuilder is supported since Qt 4.8 for both QString and QByteArray
-   IF (NOT (${QT_VERSION_MINOR} STRLESS "8"))
-     MESSAGE ("Enable QStringBuilder")
--- 
-2.7.4
-
