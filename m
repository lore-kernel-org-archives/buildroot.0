From: Peter Korsgaard <peter@korsgaard.com>
Date: Wed, 28 Oct 2020 23:12:16 +0100
Subject: [Buildroot] [git commit branch/2020.02.x] package/zxing-cpp: add
 opencv3 optional dependency
Message-ID: <20201028220325.8D2BE834D4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1ca19d1daddce4efd150f09726a1bc826b1fc081
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2020.02.x

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998 at free.fr: split to a separate condition]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit a25793ba0403f5073f606f8323c74209d21bc894)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/zxing-cpp/zxing-cpp.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index c138c925bb..fbe3cc7dd9 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -19,6 +19,9 @@ endif
 ifeq ($(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),y)
 ZXING_CPP_DEPENDENCIES += opencv
 ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=ON
+else ifeq ($(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),y)
+ZXING_CPP_DEPENDENCIES += opencv3
+ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=ON
 else
 ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=OFF
 endif
