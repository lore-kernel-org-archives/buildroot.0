From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 26 Oct 2014 17:05:32 +0100
Subject: [Buildroot] [git commit] package/opencv: cleanup configure options
Message-ID: <20141026160700.4EFA2B0961@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d9d5682e8e6d440d3a70ea383abd07390e2b2d79
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Disabling doc and example build is already done by the cmake-package
infrastructure.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk |    2 --
 1 files changed, 0 insertions(+), 2 deletions(-)

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
 
