From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sat, 16 Jan 2016 23:37:16 +0100
Subject: [Buildroot] [PATCH 24/80 v1] package/tiff: use 'menuconfig' instead
	of 'config'+'menu'
In-Reply-To: <cover.1452983019.git.yann.morin.1998@free.fr>
References: <cover.1452983019.git.yann.morin.1998@free.fr>
Message-ID: <7ed6ec9d60caef1a4567d695966a501c450b0183.1452983019.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
