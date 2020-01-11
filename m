From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 11 Jan 2020 12:50:54 +0100
Subject: [Buildroot] [PATCH 1/1] package/poppler: really disable test
 programs
Message-ID: <20200111115054.864819-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...1-CMakeLists.txt-fix-BUILD_CPP_TESTS.patch | 32 +++++++++++++++++++
 1 file changed, 32 insertions(+)
 create mode 100644 package/poppler/0001-CMakeLists.txt-fix-BUILD_CPP_TESTS.patch

diff --git a/package/poppler/0001-CMakeLists.txt-fix-BUILD_CPP_TESTS.patch b/package/poppler/0001-CMakeLists.txt-fix-BUILD_CPP_TESTS.patch
new file mode 100644
index 0000000000..476676199a
--- /dev/null
+++ b/package/poppler/0001-CMakeLists.txt-fix-BUILD_CPP_TESTS.patch
@@ -0,0 +1,32 @@
+From ccc5f765c37b2d65e2e0b64d92326997f90acb3e Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 11 Jan 2020 12:37:07 +0100
+Subject: [PATCH] CMakeLists.txt: fix BUILD_CPP_TESTS
+
+Do not build programs under the test directory if BUILD_CPP_TESTS is OFF
+as this directory contains multiple C++ test executables
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://gitlab.freedesktop.org/poppler/poppler/merge_requests/490]
+---
+ CMakeLists.txt | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index c182d146..d159582b 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -677,7 +677,9 @@ endif()
+ if(ENABLE_GLIB)
+   add_subdirectory(glib)
+ endif()
++if(BUILD_CPP_TESTS)
+ add_subdirectory(test)
++endif()
+ if(ENABLE_QT5)
+   add_subdirectory(qt5)
+ endif()
+-- 
+2.24.1
+
-- 
2.24.1
