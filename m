From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 20 Jun 2020 22:10:08 +0200
Subject: [Buildroot] [git commit] package/gerbera: fix static build with
 libmatroska
Message-ID: <20200620200837.7D14D82983@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b15e60d26b638e42e84550b13ea87ad3dffd4990
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/ee365f792feb0fe69ed765fda625afabc91ec769

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...003-cmake-FindMatroska-fix-static-linking.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/package/gerbera/0003-cmake-FindMatroska-fix-static-linking.patch b/package/gerbera/0003-cmake-FindMatroska-fix-static-linking.patch
new file mode 100644
index 0000000000..128d617045
--- /dev/null
+++ b/package/gerbera/0003-cmake-FindMatroska-fix-static-linking.patch
@@ -0,0 +1,37 @@
+From aab2eacbaad10759294f4fd74bbb5ecef3cf3a8d Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Tue, 24 Dec 2019 22:57:18 +0100
+Subject: [PATCH] cmake/FindMatroska: fix static linking
+
+Fix static linking with libmatrasoka by adding PC_EBM_LIBRARIES to
+EBML_LIBRARIES and PC_MAT_LIBRARIES to MATROSKA_LIBRARIES
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Retrieved from:
+https://github.com/gerbera/gerbera/commit/aab2eacbaad10759294f4fd74bbb5ecef3cf3a8d]
+---
+ cmake/FindMatroska.cmake | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/cmake/FindMatroska.cmake b/cmake/FindMatroska.cmake
+index 4b09a5ec..12ca593d 100644
+--- a/cmake/FindMatroska.cmake
++++ b/cmake/FindMatroska.cmake
+@@ -23,7 +23,7 @@ FIND_LIBRARY(EBML_LIBRARY ebml
+ FIND_PACKAGE_HANDLE_STANDARD_ARGS(EBML
+     REQUIRED_VARS EBML_LIBRARY EBML_INCLUDE_DIR)
+ if (EBML_FOUND)
+-    set (EBML_LIBRARIES ${EBML_LIBRARY})
++    set (EBML_LIBRARIES ${EBML_LIBRARY} ${PC_EBM_LIBRARIES})
+     set (EBML_INCLUDE_DIRS ${EBML_INCLUDE_DIR} )
+ endif ()
+ MARK_AS_ADVANCED(
+@@ -41,7 +41,7 @@ find_library(MATROSKA_LIBRARY matroska
+ FIND_PACKAGE_HANDLE_STANDARD_ARGS(MATROSKA
+     REQUIRED_VARS MATROSKA_LIBRARY MATROSKA_INCLUDE_DIR)
+ if (MATROSKA_FOUND)
+-    set (MATROSKA_LIBRARIES ${MATROSKA_LIBRARY})
++    set (MATROSKA_LIBRARIES ${MATROSKA_LIBRARY} ${PC_MAT_LIBRARIES})
+     set (MATROSKA_INCLUDE_DIRS ${MATROSKA_INCLUDE_DIR} )
+ endif ()
+ MARK_AS_ADVANCED(
