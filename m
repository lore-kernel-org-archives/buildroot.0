From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:55:01 +0200
Subject: [Buildroot] [git commit] opencv: sort and reorder HW support options
Message-ID: <20140716210452.829A59CE78@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=c391043ef5008f8f2d7a81b45af30b31dad0ccb4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Sort per HW features and disable their support when it is not suppported
by Buildroot.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk |   37 ++++++++++++++++++++++++++++++-------
 1 files changed, 30 insertions(+), 7 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 5d83074..34a01c1 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -46,6 +46,7 @@ OPENCV_CONF_OPT += \
 	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF)   \
 	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF)   \
 	-DBUILD_opencv_core=ON                                                  \
+	-DBUILD_opencv_dynamicuda=OFF                                           \
 	-DBUILD_opencv_features2d=$(if $(BR2_PACKAGE_OPENCV_LIB_FEATURES2D),ON,OFF) \
 	-DBUILD_opencv_flann=$(if $(BR2_PACKAGE_OPENCV_LIB_FLANN),ON,OFF)       \
 	-DBUILD_opencv_gpu=$(if $(BR2_PACKAGE_OPENCV_LIB_GPU),ON,OFF)           \
@@ -76,6 +77,35 @@ OPENCV_CONF_OPT += \
 	-DENABLE_SSSE3=$(if $(BR2_X86_CPU_HAS_SSSE3),ON,OFF)
 
 # Software/3rd-party support options.
+# Cuda stuff
+OPENCV_CONF_OPT += \
+	-DWITH_CUBLAS=OFF \
+	-DWITH_CUDA=OFF   \
+	-DWITH_CUFFT=OFF
+
+# NVidia stuff
+OPENCV_CONF_OPT += -DWITH_NVCUVID=OFF
+
+# AMD stuff
+OPENCV_CONF_OPT += \
+	-DWITH_OPENCLAMDFFT=OFF \
+	-DWITH_OPENCLAMDBLAS=OFF
+
+# Intel stuff
+OPENCV_CONF_OPT += \
+	-DWITH_INTELPERC=OFF \
+	-DWITH_IPP=OFF       \
+	-DWITH_TBB=OFF
+
+# Smartek stuff
+OPENCV_CONF_OPT += -DWITH_GIGEAPI=OFF
+
+# Prosilica stuff
+OPENCV_CONF_OPT += -DWITH_PVAPI=OFF
+
+# Ximea stuff
+OPENCV_CONF_OPT += -DWITH_XIMEA=OFF
+
 OPENCV_CONF_OPT += \
 	-DBUILD_JASPER=OFF \
 	-DBUILD_JPEG=OFF   \
@@ -95,22 +125,15 @@ OPENCV_CONF_OPT += \
 	-DWITH_ANDROID_CAMERA=OFF \
 	-DWITH_AVFOUNDATION=OFF	  \
 	-DWITH_CARBON=OFF         \
-	-DWITH_CUBLAS=OFF         \
-	-DWITH_CUDA=OFF           \
-	-DWITH_CUFFT=OFF          \
 	-DWITH_EIGEN=OFF          \
 	-DWITH_IMAGEIO=OFF        \
-	-DWITH_IPP=OFF            \
 	-DWITH_JASPER=OFF         \
 	-DWITH_OPENEXR=OFF        \
 	-DWITH_OPENGL=OFF         \
 	-DWITH_OPENNI=OFF         \
-	-DWITH_PVAPI=OFF          \
 	-DWITH_QUICKTIME=OFF      \
-	-DWITH_TBB=OFF            \
 	-DWITH_UNICAP=OFF         \
 	-DWITH_VIDEOINPUT=OFF     \
-	-DWITH_XIMEA=OFF          \
 	-DWITH_XINE=OFF
 
 OPENCV_DEPENDENCIES += zlib
