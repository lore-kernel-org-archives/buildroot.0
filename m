From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:46 +0200
Subject: [Buildroot] [PATCH v2 14/24] opencv: disable opencl support/module
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398208556-4195-15-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch (split suggested by Yann)
---
 package/opencv/opencv.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index b87eddc..a4bdd39 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -59,6 +59,7 @@ OPENCV_CONF_OPT += \
 	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF)             \
 	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF)   \
 	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
+	-DBUILD_opencv_ocl=OFF                                                  \
 	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
 	-DBUILD_opencv_python=OFF                                               \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
@@ -151,6 +152,7 @@ OPENCV_CONF_OPT += \
 	-DWITH_1394=OFF    \
 	-DWITH_EIGEN=OFF   \
 	-DWITH_IMAGEIO=OFF \
+	-DWITH_OPENCL=OFF  \
 	-DWITH_OPENEXR=OFF \
 	-DWITH_OPENGL=OFF  \
 	-DWITH_OPENNI=OFF  \
-- 
1.9.2
