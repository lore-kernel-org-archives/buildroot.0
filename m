From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:56:22 +0200
Subject: [Buildroot] [git commit] opencv: disable apps module
Message-ID: <20140716210452.CC1219D25F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=b49bd9c4ab32a64b5387cdcddbea0d6da937b556
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This module is used to build programs for training classifiers.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 6afe7ca..94eba4d 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -43,6 +43,7 @@ OPENCV_CONF_OPT += \
 # OpenCV module selection
 OPENCV_CONF_OPT += \
 	-DBUILD_opencv_androidcamera=OFF                                        \
+	-DBUILD_opencv_apps=OFF                                                 \
 	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF)   \
 	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF)   \
 	-DBUILD_opencv_core=ON                                                  \
