From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat,  9 Nov 2019 09:37:09 +0100
Subject: [Buildroot] [PATCH 1/2] package/zxing-cpp: add optional cppunit
 dependency
Message-ID: <20191109083710.10660-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

zxing-cpp optionally depends on cppunit

There is no option to disable it until we bump the version to at least
https://github.com/glassechidna/zxing-cpp/commit/4e2b4fe1668c60d73e7649b0d3d5888912878392

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zxing-cpp/zxing-cpp.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/zxing-cpp/zxing-cpp.mk b/package/zxing-cpp/zxing-cpp.mk
index 7113ae2b06..4b46f2d29f 100644
--- a/package/zxing-cpp/zxing-cpp.mk
+++ b/package/zxing-cpp/zxing-cpp.mk
@@ -10,6 +10,7 @@ ZXING_CPP_LICENSE = Apache-2.0
 ZXING_CPP_LICENSE_FILES = COPYING
 ZXING_CPP_INSTALL_STAGING = YES
 ZXING_CPP_SUPPORTS_IN_SOURCE_BUILD = NO
+ZXING_CPP_DEPENDENCIES = $(if $(BR2_PACKAGE_CPPUNIT),cppunit)
 
 ifeq ($(BR2_PACKAGE_LIBICONV),y)
 ZXING_CPP_DEPENDENCIES += libiconv
-- 
2.23.0
