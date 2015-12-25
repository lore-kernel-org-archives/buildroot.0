From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Fri, 25 Dec 2015 22:24:59 +0100
Subject: [Buildroot] [PATCH 30/84 RFC] package/tiff: use 'menuconfig' instad
	of 'config'+'menu'
In-Reply-To: <cover.1451076704.git.yann.morin.1998@free.fr>
References: <cover.1451076704.git.yann.morin.1998@free.fr>
Message-ID: <4a8c04b154a6ec41e298bcd54ce6467db7f38d87.1451076704.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 package/tiff/Config.in | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/package/tiff/Config.in b/package/tiff/Config.in
index acb335c..66d37fd 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_TIFF
+menuconfig BR2_PACKAGE_TIFF
 	bool "tiff"
 	help
 	  Library for handling TIFF (Tag Image File Format) images.
@@ -6,7 +6,6 @@ config BR2_PACKAGE_TIFF
 	  http://www.libtiff.org/
 
 if BR2_PACKAGE_TIFF
-menu "tiff Options"
 
 config BR2_PACKAGE_TIFF_CCITT
 	bool "CCITT Group 3 & 4 support"
@@ -58,7 +57,6 @@ config BR2_PACKAGE_TIFF_OLD_JPEG
 config BR2_PACKAGE_TIFF_JBIG
 	bool "JBIG compression"
 	default y
-endmenu
 
 config BR2_PACKAGE_TIFF_UTILITIES
 	bool "tiff utilities"
-- 
1.9.1
