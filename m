From: Samuel Martin <s.martin49@gmail.com>
Date: Mon, 11 Nov 2013 22:00:10 +0100
Subject: [Buildroot] [PATCH 4/7] opencv: add eigen dependency
In-Reply-To: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
References: <1384203613-17871-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1384203613-17871-5-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/Config.in | 1 +
 package/opencv/opencv.mk | 4 ++--
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/opencv/Config.in b/package/opencv/Config.in
index 146011a..5b970e8 100644
--- a/package/opencv/Config.in
+++ b/package/opencv/Config.in
@@ -1,6 +1,7 @@
 menuconfig BR2_PACKAGE_OPENCV
 	bool "opencv"
 	select BR2_PACKAGE_ZLIB
+	select BR2_PACKAGE_EIGEN
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_USE_WCHAR
 	help
diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index b9ed8cb..8556272 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -88,7 +88,7 @@ OPENCV_CONF_OPT += \
 	-DWITH_CUBLAS=OFF         \
 	-DWITH_CUDA=OFF           \
 	-DWITH_CUFFT=OFF          \
-	-DWITH_EIGEN=OFF          \
+	-DWITH_EIGEN=ON           \
 	-DWITH_IMAGEIO=OFF        \
 	-DWITH_IPP=OFF            \
 	-DWITH_JASPER=OFF         \
@@ -103,7 +103,7 @@ OPENCV_CONF_OPT += \
 	-DWITH_XIMEA=OFF          \
 	-DWITH_XINE=OFF
 
-OPENCV_DEPENDENCIES += zlib
+OPENCV_DEPENDENCIES += zlib eigen
 
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_FFMPEG),y)
 OPENCV_CONF_OPT += -DWITH_FFMPEG=ON
-- 
1.8.4.2
