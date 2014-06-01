From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 1 Jun 2014 22:20:14 +0200
Subject: [Buildroot] [git commit] opencv: do not override CMAKE_BUILD_TYPE
Message-ID: <20140601202128.5DED79CE00@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2c2e3ef1731bbbcc1d7b53d14b955791a0106505
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This flag is already correctly set by the cmake-package infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/opencv/opencv.mk |    1 -
 1 files changed, 0 insertions(+), 1 deletions(-)

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
