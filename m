From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Fri, 26 Jun 2015 20:46:01 +0200
Subject: [Buildroot] [git commit] package/opencv: add openmp support
Message-ID: <20150626184608.C7C6480E18@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7a76c358fae668db53de13e9ace6f90e03ef3d3a
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that this situation is not ideal because it only add openmp support
to the Buildroot toolchain, not the external ones; but a couple of
packages already are in this situation.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index a43de0c..633c2bf 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -250,6 +250,8 @@ else
 OPENCV_CONF_OPTS += -DWITH_JPEG=OFF
 endif
 
+OPENCV_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)
+
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
 OPENCV_CONF_OPTS += -DWITH_PNG=ON
 OPENCV_DEPENDENCIES += libpng
