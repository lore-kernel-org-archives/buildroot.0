From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 23 May 2021 15:57:23 +0200
Subject: [Buildroot] [PATCH 1/1] package/opencv3: add CPE variables
Message-ID: <20210523135723.1521772-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

cpe:2.3:a:opencv:opencv is a valid CPE identifier for this package:

  https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aopencv%3Aopencv

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/opencv3/opencv3.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/opencv3/opencv3.mk b/package/opencv3/opencv3.mk
index b1b86ba71d..5c82da9975 100644
--- a/package/opencv3/opencv3.mk
+++ b/package/opencv3/opencv3.mk
@@ -9,6 +9,8 @@ OPENCV3_SITE = $(call github,opencv,opencv,$(OPENCV3_VERSION))
 OPENCV3_INSTALL_STAGING = YES
 OPENCV3_LICENSE = BSD-3-Clause
 OPENCV3_LICENSE_FILES = LICENSE
+OPENCV3_CPE_ID_VENDOR = opencv
+OPENCV3_CPE_ID_PRODUCT = opencv
 OPENCV3_SUPPORTS_IN_SOURCE_BUILD = NO
 
 OPENCV3_CXXFLAGS = $(TARGET_CXXFLAGS)
-- 
2.30.2
