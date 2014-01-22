From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 22 Jan 2014 22:06:21 +0100
Subject: [Buildroot] [git commit] opencv: remove BUILD_SHARED_LIBS flags
Message-ID: <20140122210913.906B99C59B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e5cf8d5999be6459ce2ff37531f07e5a1dd55762
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This CMake flag is now handled by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv/opencv.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

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
