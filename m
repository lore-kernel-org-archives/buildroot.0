From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun,  2 Jun 2019 10:51:30 +0200
Subject: [Buildroot] [PATCH/next 1/1] package/opencv3: objdetect needs
 calib3d
Message-ID: <20190602085130.30353-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

objdetect needs calib3d since version 3.4.4 and
https://github.com/opencv/opencv/commit/53ec8f286b7d475fa5a799023595bd4dc73e5c81

Fixes:
 - http://autobuild.buildroot.org/results/37d0a5ba57de4c52b6e0ec99aedaca71f3397fbb

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv3/Config.in b/package/opencv3/Config.in
index 61405a7c64..3a6ff8e80c 100644
--- a/package/opencv3/Config.in
+++ b/package/opencv3/Config.in
@@ -140,6 +140,7 @@ config BR2_PACKAGE_OPENCV3_LIB_ML
 config BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
 	bool "objdetect"
 	# opencv_core dependency is already enabled
+	select BR2_PACKAGE_OPENCV3_LIB_CALIB3D
 	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
 	select BR2_PACKAGE_OPENCV3_LIB_ML
 	help
-- 
2.20.1
