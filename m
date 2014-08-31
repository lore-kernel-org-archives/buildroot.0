From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 31 Aug 2014 22:09:07 +0200
Subject: [Buildroot] [PATCH v3 5/8] opencv: add hidden symbol
	BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS
In-Reply-To: <1409515750-10289-1-git-send-email-s.martin49@gmail.com>
References: <1409515750-10289-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1409515750-10289-6-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This new hidden symbol aims to automatically select all OpenCV modules
required when another package use the deprecated OpenCV 'cv.h' headers.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v2 -> v3:
- rebase
- update A/R/T tags

changes v1 -> v2:
- new patch
---
 package/opencv/Config.in | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 7c2b964..83771d4 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -14,6 +14,21 @@ menuconfig BR2_PACKAGE_OPENCV
 
 if BR2_PACKAGE_OPENCV
 
+config BR2_PACKAGE_OPENCV_USE_DEPRECATED_HEADERS
+	bool
+	select BR2_PACKAGE_OPENCV_LIB_CALIB3D
+	select BR2_PACKAGE_OPENCV_LIB_FEATURES2D
+	select BR2_PACKAGE_OPENCV_LIB_HIGHGUI
+	select BR2_PACKAGE_OPENCV_LIB_IMGPROC
+	select BR2_PACKAGE_OPENCV_LIB_LEGACY
+	select BR2_PACKAGE_OPENCV_LIB_ML
+	select BR2_PACKAGE_OPENCV_LIB_OBJDETECT
+	select BR2_PACKAGE_OPENCV_LIB_PHOTO
+	select BR2_PACKAGE_OPENCV_LIB_VIDEO
+	help
+	  Select all required modules needed by the deprecated OpenCV API
+	  (cv.h, cvaux.h, cxcore.h, etc).
+
 comment "OpenCV modules"
 
 config BR2_PACKAGE_OPENCV_LIB_CALIB3D
-- 
2.1.0
