From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 22 Jan 2014 21:59:38 +0100
Subject: [Buildroot] [PATCH v2 2/5] opencv: remove BUILD_SHARED_LIBS flags
In-Reply-To: <1390424381-6889-1-git-send-email-s.martin49@gmail.com>
References: <1390424381-6889-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1390424381-6889-2-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This CMake flag is now handled by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
---
 package/opencv/opencv.mk | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index b9ed8cb..de38ae0 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -11,7 +11,6 @@ OPENCV_INSTALL_STAGING = YES
 
 OPENCV_CONF_OPT += \
 	-DCMAKE_BUILD_TYPE=$(if $(BR2_ENABLE_DEBUG),Debug,Release)   \
-	-DBUILD_SHARED_LIBS=$(if $(BR2_PREFER_STATIC_LIB),OFF,ON)    \
 	-DBUILD_WITH_STATIC_CRT=OFF                                  \
 	-DBUILD_DOCS=$(if $(BR2_HAVE_DOCUMENTATION),ON,OFF)          \
 	-DBUILD_EXAMPLES=OFF                                         \
-- 
1.8.5.3
