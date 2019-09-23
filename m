From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 23 Sep 2019 22:06:48 +0200
Subject: [Buildroot] [git commit] package/libspatialindex: fix static build
Message-ID: <20190923200206.E4C3B8F190@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=3c73b893b3500ec8fc76e5c2d965dc132dcbe488
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
 - http://autobuild.buildroot.org/results/3ea3aa8ba6c89139ee69b055fdccfa62b85e8821

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...txt-don-t-force-the-build-of-a-shared-lib.patch | 35 ++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/package/libspatialindex/0001-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch b/package/libspatialindex/0001-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch
new file mode 100644
index 0000000000..3316a3825d
--- /dev/null
+++ b/package/libspatialindex/0001-CMakeLists.txt-don-t-force-the-build-of-a-shared-lib.patch
@@ -0,0 +1,35 @@
+From 2333cd804e33e67567b656b847094cd9a8c8fbbf Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sun, 22 Sep 2019 20:58:19 +0200
+Subject: [PATCH] CMakeLists.txt: don't force the build of a shared library
+
+Building a shared library doesn't work on all platforms, so instead,
+let CMake rely on the standard BUILD_SHARED_LIBS variable to decide
+whether a static or shared library should be built.
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status:
+https://github.com/libspatialindex/libspatialindex/pull/158]
+---
+ src/CMakeLists.txt | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/CMakeLists.txt b/src/CMakeLists.txt
+index e6b733b..f8a4980 100644
+--- a/src/CMakeLists.txt
++++ b/src/CMakeLists.txt
+@@ -194,9 +194,9 @@ if (NOT WITH_STATIC_LASZIP)
+ endif()
+ endif()
+ 
+-add_library(${SIDX_LIB_NAME} SHARED ${SIDX_SOURCES})
++add_library(${SIDX_LIB_NAME} ${SIDX_SOURCES})
+ 
+-add_library(${SIDX_C_LIB_NAME} SHARED ${SIDX_CAPI_CPP})
++add_library(${SIDX_C_LIB_NAME} ${SIDX_CAPI_CPP})
+ 
+ target_link_libraries(${SIDX_C_LIB_NAME}
+   ${SIDX_LIB_NAME}
+-- 
+2.23.0
+
