From: Samuel Martin <s.martin49@gmail.com>
Date: Mon,  6 Oct 2014 22:19:18 +0200
Subject: [Buildroot] [PATCH v4 1/9] package/opencv: update opencv options
	after last version bump
In-Reply-To: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
References: <1412626766-24683-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1412626766-24683-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Update OPENCV_CONF_OPTS following its last bump to version 2.4.10.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v3 -> v4:
- new patch
---
 package/opencv/opencv.mk | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 5fc7387..271e751 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -18,6 +18,12 @@ OPENCV_CONF_OPTS += \
 	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
 	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF)
 
+ifneq ($(BR2_PACKAGE_OPENCV_BUILD_TESTS)$(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),)
+OPENCV_CONF_OPTS += -DINSTALL_TEST=ON
+else
+OPENCV_CONF_OPTS += -DINSTALL_TEST=OFF
+endif
+
 # OpenCV build options
 OPENCV_CONF_OPTS += \
 	-DBUILD_WITH_STATIC_CRT=OFF      \
@@ -66,6 +72,7 @@ OPENCV_CONF_OPTS += \
 	-DBUILD_opencv_ts=$(if $(BR2_PACKAGE_OPENCV_LIB_TS),ON,OFF)             \
 	-DBUILD_opencv_video=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEO),ON,OFF)       \
 	-DBUILD_opencv_videostab=$(if $(BR2_PACKAGE_OPENCV_LIB_VIDEOSTAB),ON,OFF) \
+	-DBUILD_opencv_viz=OFF \
 	-DBUILD_opencv_world=OFF
 
 # Hardware support options.
@@ -159,6 +166,7 @@ OPENCV_CONF_OPTS += \
 	-DWITH_OPENMP=OFF  \
 	-DWITH_OPENNI=OFF  \
 	-DWITH_UNICAP=OFF  \
+	-DWITH_VTK=OFF     \
 	-DWITH_XINE=OFF
 
 OPENCV_DEPENDENCIES += zlib
-- 
2.1.2
