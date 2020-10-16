From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 16 Oct 2020 23:45:51 +0200
Subject: [Buildroot] [PATCH 1/1] package/zxing-cpp: add opencv3 optional
 dependency
Message-ID: <20201016214551.2522338-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zxing-cpp/zxing-cpp.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index c138c925bb..316afd6ad2 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -16,8 +16,8 @@ ifeq ($(BR2_PACKAGE_LIBICONV),y)
 ZXING_CPP_DEPENDENCIES += libiconv
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV_LIB_HIGHGUI),y)
-ZXING_CPP_DEPENDENCIES += opencv
+ifeq ($(BR2_PACKAGE_OPENCV_LIB_HIGHGUI)$(BR2_PACKAGE_OPENCV3_LIB_HIGHGUI),y)
+ZXING_CPP_DEPENDENCIES += $(if $(BR2_PACKAGE_OPENCV),opencv,opencv3)
 ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=ON
 else
 ZXING_CPP_CONF_OPTS += -DBUILD_OPENCV=OFF
-- 
2.28.0
