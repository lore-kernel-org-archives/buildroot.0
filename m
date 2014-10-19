From: Samuel Martin <s.martin49@gmail.com>
Date: Sun, 19 Oct 2014 20:04:49 +0200
Subject: [Buildroot] [PATCH 13/15] package/opencv: cleanup configure options
In-Reply-To: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
References: <1413741891-30113-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1413741891-30113-14-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disabling doc and example build is already done by the cmake-package
infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/opencv.mk | 2 --
 1 file changed, 2 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 5fc7387..61f529e 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -13,8 +13,6 @@ OPENCV_LICENSE_FILES = LICENSE
 # OpenCV component options
 OPENCV_CONF_OPTS += \
 	-DBUILD_WITH_DEBUG_INFO=OFF \
-	-DBUILD_DOCS=OFF            \
-	-DBUILD_EXAMPLES=OFF        \
 	-DBUILD_PERF_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_PERF_TESTS),ON,OFF) \
 	-DBUILD_TESTS=$(if $(BR2_PACKAGE_OPENCV_BUILD_TESTS),ON,OFF)
 
-- 
2.1.2
