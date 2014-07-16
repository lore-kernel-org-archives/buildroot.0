From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:56:43 +0200
Subject: [Buildroot] [git commit] opencv: disable opencl support/module
Message-ID: <20140716210452.D3AB29D25F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=9401953c45efb21c94d25110b6dfbca5268dda87
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 94eba4d..e84dd18 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -58,6 +58,7 @@ OPENCV_CONF_OPT += \
 	-DBUILD_opencv_ml=$(if $(BR2_PACKAGE_OPENCV_LIB_ML),ON,OFF)             \
 	-DBUILD_opencv_nonfree=$(if $(BR2_PACKAGE_OPENCV_LIB_NONFREE),ON,OFF)   \
 	-DBUILD_opencv_objdetect=$(if $(BR2_PACKAGE_OPENCV_LIB_OBJDETECT),ON,OFF) \
+	-DBUILD_opencv_ocl=OFF                                                  \
 	-DBUILD_opencv_photo=$(if $(BR2_PACKAGE_OPENCV_LIB_PHOTO),ON,OFF)       \
 	-DBUILD_opencv_python=OFF                                               \
 	-DBUILD_opencv_stitching=$(if $(BR2_PACKAGE_OPENCV_LIB_STITCHING),ON,OFF) \
@@ -150,6 +151,7 @@ OPENCV_CONF_OPT += \
 	-DWITH_1394=OFF    \
 	-DWITH_EIGEN=OFF   \
 	-DWITH_IMAGEIO=OFF \
+	-DWITH_OPENCL=OFF  \
 	-DWITH_OPENEXR=OFF \
 	-DWITH_OPENGL=OFF  \
 	-DWITH_OPENNI=OFF  \
