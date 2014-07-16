From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 16 Jul 2014 22:57:17 +0200
Subject: [Buildroot] [git commit] opencv: disable OpenMP support
Message-ID: <20140716210452.DA6549D25F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2abfd50aefdc89cf1b858c6c965a5e7d94a413b4
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since there is currently no easy way to know if the current Buildroot
configuration has a toolchain supporting OpenMP (especially for external
toolchains), then just disable it.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Acked-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/opencv/opencv.mk |    1 +
 1 files changed, 1 insertions(+), 0 deletions(-)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index e84dd18..d1620a2 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -154,6 +154,7 @@ OPENCV_CONF_OPT += \
 	-DWITH_OPENCL=OFF  \
 	-DWITH_OPENEXR=OFF \
 	-DWITH_OPENGL=OFF  \
+	-DWITH_OPENMP=OFF  \
 	-DWITH_OPENNI=OFF  \
 	-DWITH_UNICAP=OFF  \
 	-DWITH_XINE=OFF
