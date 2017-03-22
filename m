From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Wed, 22 Mar 2017 22:42:31 +0100
Subject: [Buildroot] [git commit] tesseract-ocr: needs wchar support
Message-ID: <20170322214236.C2DC082240@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=51c5e50589d4c663efb65325d5bfe9bc767cfa28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
http://autobuild.buildroot.net/results/66e44564aac79c1c47755f6d158663317a5ffe09

Signed-off-by: Gilles Talis <gilles.talis@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/tesseract-ocr/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/tesseract-ocr/Config.in b/package/tesseract-ocr/Config.in
index d4c23fb..3afaca7 100644
--- a/package/tesseract-ocr/Config.in
+++ b/package/tesseract-ocr/Config.in
@@ -1,7 +1,7 @@
-comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 4.8, dynamic library"
+comment "tesseract-ocr needs a toolchain w/ threads, C++, gcc >= 4.8, dynamic library, wchar"
 	depends on BR2_USE_MMU
 	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || BR2_STATIC_LIBS || !BR2_USE_WCHAR
 
 menuconfig BR2_PACKAGE_TESSERACT_OCR
 	bool "tesseract-ocr"
@@ -10,6 +10,7 @@ menuconfig BR2_PACKAGE_TESSERACT_OCR
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_USE_WCHAR
 	select BR2_PACKAGE_LEPTONICA
 	help
 	  Tesseract is an OCR (Optical Character Recognition) engine,
