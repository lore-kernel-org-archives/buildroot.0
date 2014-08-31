From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 22:09:10 +0200
Subject: [Buildroot] [PATCH v3 8/8] package/opencv: fix ts module missing
	dependency to highgui
In-Reply-To: <1409515750-10289-1-git-send-email-s.martin49@gmail.com>
References: <1409515750-10289-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409515750-10289-9-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
  http://autobuild.buildroot.net/results/3dc/3dc3e10e412d87937adae4d20a67cc4557bb328b/

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v2 -> v3:
- new patch
---
 package/opencv/Config.in                           |  1 +
 ...-ts-add-missing-opencv_highgui-dependency.patch | 26 ++++++++++++++++++++++
 2 files changed, 27 insertions(+)
 create mode 100644 package/opencv/opencv-0002-modules-ts-add-missing-opencv_highgui-dependency.patch

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 83771d4..7b59e6c 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -162,6 +162,7 @@ config BR2_PACKAGE_OPENCV_LIB_TS
 	bool "ts (touchscreen)"
 	# opencv_core dependency is already enabled
 	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
 	help
 	  Include opencv_ts module into the OpenCV build.
 
diff --git a/package/opencv/opencv-0002-modules-ts-add-missing-opencv_highgui-dependency.patch b/package/opencv/opencv-0002-modules-ts-add-missing-opencv_highgui-dependency.patch
new file mode 100644
index 0000000..1238703
--- /dev/null
+++ b/package/opencv/opencv-0002-modules-ts-add-missing-opencv_highgui-dependency.patch
@@ -0,0 +1,26 @@
+From 1ac234b4a5d4e6c562daa5f17193403f59a9a3a0 Mon Sep 17 00:00:00 2001
+From: Samuel Martin <s.martin49@gmail.com>
+Date: Sat, 30 Aug 2014 14:09:44 +0200
+Subject: [PATCH] modules/ts: add missing opencv_highgui dependency
+
+Signed-off-by: Samuel Martin <s.martin49@gmail.com>
+---
+ modules/ts/CMakeLists.txt | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/modules/ts/CMakeLists.txt b/modules/ts/CMakeLists.txt
+index bb56da2..8fa8a58 100644
+--- a/modules/ts/CMakeLists.txt
++++ b/modules/ts/CMakeLists.txt
+@@ -9,7 +9,7 @@ set(OPENCV_MODULE_IS_PART_OF_WORLD FALSE)
+ 
+ ocv_warnings_disable(CMAKE_CXX_FLAGS -Wundef)
+ 
+-ocv_add_module(ts opencv_core opencv_features2d)
++ocv_add_module(ts opencv_core opencv_features2d opencv_highgui)
+ 
+ ocv_glob_module_sources()
+ ocv_module_include_directories()
+-- 
+2.1.0
+
-- 
2.1.0
