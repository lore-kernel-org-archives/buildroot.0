From: Samuel Martin <s.martin49@gmail.com>
Date: Thu, 24 Apr 2014 00:48:31 +0200
Subject: [Buildroot] [PATCH 12/14] opencv: do not override CMAKE_BUILD_TYPE
In-Reply-To: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
References: <1398293313-17580-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398293313-17580-13-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This flag is already correctly set by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch
---
 package/opencv/opencv.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 42f9b0a..3fcba80 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -10,7 +10,6 @@ OPENCV_SOURCE  = OpenCV-$(OPENCV_VERSION).tar.bz2
 OPENCV_INSTALL_STAGING = YES
 
 OPENCV_CONF_OPT += \
-	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)   \
 	-DBUILD_WITH_STATIC_CRT=OFF                                  \
 	-DBUILD_DOCS=OFF                                             \
 	-DBUILD_EXAMPLES=OFF                                         \
-- 
1.9.2
