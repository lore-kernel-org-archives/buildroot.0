From: Samuel Martin <s.martin49@gmail.com>
Date: Sun,  7 Jun 2015 12:26:36 +0200
Subject: [Buildroot] [PATCH v5 10/13] package/opencv: add openmp support
In-Reply-To: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
References: <1433672799-21387-1-git-send-email-s.martin49@gmail.com>
Message-ID: <1433672799-21387-11-git-send-email-s.martin49@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Note that this situation is not ideal because it only add openmp support
to the Buildroot toolchain, not the external ones; but a couple of
packages already are in this situation.

Signed-off-by: Samuel Martin <s.martin49@gmail.com>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>

---
changes v4->v5:
- new patch
---
 package/opencv/opencv.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv/opencv.mk b/package/opencv/opencv.mk
index 2902a20..81c5544 100644
--- a/package/opencv/opencv.mk
+++ b/package/opencv/opencv.mk
@@ -250,6 +250,8 @@ else
 OPENCV_CONF_OPTS += -DWITH_OPENGL=OFF
 endif
 
+OPENCV_CONF_OPTS += -DWITH_OPENMP=$(if $(BR2_GCC_ENABLE_OPENMP),ON,OFF)
+
 ifeq ($(BR2_PACKAGE_OPENCV_WITH_PNG),y)
 OPENCV_CONF_OPTS += -DWITH_PNG=ON
 OPENCV_DEPENDENCIES += libpng
-- 
2.4.2
