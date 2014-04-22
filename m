From: Samuel Martin <s.martin49@gmail.com>
Date: Wed, 23 Apr 2014 01:15:47 +0200
Subject: [Buildroot] [PATCH v2 15/24] opencv: disable OpenMP support
In-Reply-To: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
References: <1398208556-4195-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1398208556-4195-16-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since there is currently no easy way to know if the current Buildroot
configuration has a toolchain supporting OpenMP (especially for external
toolchains), then just disable it.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>

---
changes v1 -> v2:
- new patch (split suggested by Yann)
---
 package/opencv/opencv.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index a4bdd39..eed5338 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -155,6 +155,7 @@ OPENCV_CONF_OPT += \
 	-DWITH_OPENCL=OFF  \
 	-DWITH_OPENEXR=OFF \
 	-DWITH_OPENGL=OFF  \
+	-DWITH_OPENMP=OFF  \
 	-DWITH_OPENNI=OFF  \
 	-DWITH_UNICAP=OFF  \
 	-DWITH_XINE=OFF
-- 
1.9.2
