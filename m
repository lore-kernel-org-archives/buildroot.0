From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:45 +0200
Subject: [Buildroot] [PATCH v2 13/24] opencv: disable apps module
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398208556-4195-14-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This module is used to build programs for training classifiers.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch (split suggested by Yann)
---
 package/opencv/opencv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index f129dc3..b87eddc 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -44,6 +44,7 @@ OPENCV_CONF_OPT += \
 # OpenCV module selection
 OPENCV_CONF_OPT += \
 	-DBUILD_opencv_androidcamera=OFF                                        \
+	-DBUILD_opencv_apps=OFF                                                 \
 	-DBUILD_opencv_calib3d=$(if $(BR2_PACKAGE_OPENCV_LIB_CALIB3D),ON,OFF)   \
 	-DBUILD_opencv_contrib=$(if $(BR2_PACKAGE_OPENCV_LIB_CONTRIB),ON,OFF)   \
 	-DBUILD_opencv_core=ON                                                  \
-- 
1.9.2
