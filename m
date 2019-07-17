From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 17 Jul 2019 23:46:52 +0200
Subject: [Buildroot] [PATCH v2,
 1/1] package/tesseract-ocr: fix build on uclibc
Message-ID: <20190717214652.6493-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
 - http://autobuild.buildroot.org/results/bdfbafa105ddf0b9b9399d94b557d318ad587d79

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Use upstream solution

 ...stead-of-off_t-for-result-from-ftell.patch | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 package/tesseract-ocr/0001-Use-long-instead-of-off_t-for-result-from-ftell.patch

diff --git a/package/tesseract-ocr/0001-Use-long-instead-of-off_t-for-result-from-ftell.patch b/package/tesseract-ocr/0001-Use-long-instead-of-off_t-for-result-from-ftell.patch
new file mode 100644
index 0000000000..7cb5d6877e
--- /dev/null
+++ b/package/tesseract-ocr/0001-Use-long-instead-of-off_t-for-result-from-ftell.patch
@@ -0,0 +1,26 @@
+From d4e0ab3014c57e519513c10b8e23d8bf66610bff Mon Sep 17 00:00:00 2001
+From: Stefan Weil <sw@weilnetz.de>
+Date: Wed, 17 Jul 2019 21:11:53 +0200
+Subject: [PATCH] Use long instead of off_t for result from ftell
+
+Signed-off-by: Stefan Weil <sw@weilnetz.de>
+[Retrieved from:
+https://github.com/tesseract-ocr/tesseract/commit/d4e0ab3014c57e519513c10b8e23d8bf66610bff]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+---
+ src/ccutil/scanutils.cpp | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/src/ccutil/scanutils.cpp b/src/ccutil/scanutils.cpp
+index da0c6918e..ea376a570 100644
+--- a/src/ccutil/scanutils.cpp
++++ b/src/ccutil/scanutils.cpp
+@@ -214,7 +214,7 @@ static int tvfscanf(FILE* stream, const char *format, va_list ap) {
+       (CHAR_BIT * sizeof(long))];
+   int matchinv = 0;   // Is match map inverted?
+   unsigned char range_start = 0;
+-  off_t start_off = ftell(stream);
++  long start_off = ftell(stream);
+ 
+   // Skip leading spaces
+   SkipSpace(stream);
-- 
2.20.1
