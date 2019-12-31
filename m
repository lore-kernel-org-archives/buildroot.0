From: Gilles Talis <gilles.talis@gmail.com>
Date: Tue, 31 Dec 2019 11:40:35 +0100
Subject: [Buildroot] [PATCH] package/tesseract-ocr: bump to version 4.1.1
Message-ID: <20191231104035.5506-1-gilles.talis@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also removed one patch that was merged upstream

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
---
 ...stead-of-off_t-for-result-from-ftell.patch | 26 -------------------
 package/tesseract-ocr/tesseract-ocr.hash      |  2 +-
 package/tesseract-ocr/tesseract-ocr.mk        |  2 +-
 3 files changed, 2 insertions(+), 28 deletions(-)
 delete mode 100644 package/tesseract-ocr/0001-Use-long-instead-of-off_t-for-result-from-ftell.patch

diff --git a/package/tesseract-ocr/0001-Use-long-instead-of-off_t-for-result-from-ftell.patch b/package/tesseract-ocr/0001-Use-long-instead-of-off_t-for-result-from-ftell.patch
deleted file mode 100644
index 7cb5d6877e..0000000000
--- a/package/tesseract-ocr/0001-Use-long-instead-of-off_t-for-result-from-ftell.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From d4e0ab3014c57e519513c10b8e23d8bf66610bff Mon Sep 17 00:00:00 2001
-From: Stefan Weil <sw@weilnetz.de>
-Date: Wed, 17 Jul 2019 21:11:53 +0200
-Subject: [PATCH] Use long instead of off_t for result from ftell
-
-Signed-off-by: Stefan Weil <sw@weilnetz.de>
-[Retrieved from:
-https://github.com/tesseract-ocr/tesseract/commit/d4e0ab3014c57e519513c10b8e23d8bf66610bff]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- src/ccutil/scanutils.cpp | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/ccutil/scanutils.cpp b/src/ccutil/scanutils.cpp
-index da0c6918e..ea376a570 100644
---- a/src/ccutil/scanutils.cpp
-+++ b/src/ccutil/scanutils.cpp
-@@ -214,7 +214,7 @@ static int tvfscanf(FILE* stream, const char *format, va_list ap) {
-       (CHAR_BIT * sizeof(long))];
-   int matchinv = 0;   // Is match map inverted?
-   unsigned char range_start = 0;
--  off_t start_off = ftell(stream);
-+  long start_off = ftell(stream);
- 
-   // Skip leading spaces
-   SkipSpace(stream);
diff --git a/package/tesseract-ocr/tesseract-ocr.hash b/package/tesseract-ocr/tesseract-ocr.hash
index a5601adfc7..808ea174ef 100644
--- a/package/tesseract-ocr/tesseract-ocr.hash
+++ b/package/tesseract-ocr/tesseract-ocr.hash
@@ -1,5 +1,5 @@
 # locally computed
-sha256  5c5ed5f1a76888dc57a83704f24ae02f8319849f5c4cf19d254296978a1a1961  tesseract-ocr-4.1.0.tar.gz
+sha256  2a66ff0d8595bff8f04032165e6c936389b1e5727c3ce5a27b3e059d218db1cb  tesseract-ocr-4.1.1.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
 sha256  daa0c97d651c19fba3b25e81317cd697e9908c8208090c94c3905381c23fc047  eng.traineddata
 sha256  eac01c1d72540d6090facb7b2f42dd0a2ee8fc57c5be1b20548ae668e2761913  fra.traineddata
diff --git a/package/tesseract-ocr/tesseract-ocr.mk b/package/tesseract-ocr/tesseract-ocr.mk
index 0fbbb93422..4d2df5cb39 100644
--- a/package/tesseract-ocr/tesseract-ocr.mk
+++ b/package/tesseract-ocr/tesseract-ocr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TESSERACT_OCR_VERSION = 4.1.0
+TESSERACT_OCR_VERSION = 4.1.1
 TESSERACT_OCR_DATA_VERSION = 4.0.0
 TESSERACT_OCR_SITE = $(call github,tesseract-ocr,tesseract,$(TESSERACT_OCR_VERSION))
 TESSERACT_OCR_LICENSE = Apache-2.0
-- 
2.17.1
