From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  4 Jul 2016 11:24:33 +0200
Subject: [Buildroot] [PATCH 22/83 v2] package/tiff: use 'menuconfig' instead
	of 'config'+'menu'
In-Reply-To: <cover.1467624132.git.yann.morin.1998@free.fr>
References: <cover.1467624132.git.yann.morin.1998@free.fr>
Message-ID: <66b0a2d0a679453343184d9992cb51849d904f82.1467624132.git.yann.morin.1998@free.fr>
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
index 7d66dd2..6e5c176 100644
--- a/package/tiff/Config.in
+++ b/package/tiff/Config.in
@@ -1,4 +1,4 @@
-config BR2_PACKAGE_TIFF
+menuconfig BR2_PACKAGE_TIFF
 	bool "tiff"
 	help
 	  Library for handling TIFF (Tag Image File Format) images.
@@ -6,7 +6,6 @@ config BR2_PACKAGE_TIFF
 	  http://www.remotesensing.org/libtiff/
 
 if BR2_PACKAGE_TIFF
-menu "tiff Options"
 
 config BR2_PACKAGE_TIFF_CCITT
 	bool "CCITT Group 3 & 4 support"
@@ -62,7 +61,6 @@ config BR2_PACKAGE_TIFF_OLD_JPEG
 config BR2_PACKAGE_TIFF_JBIG
 	bool "JBIG compression"
 	default y
-endmenu
 
 config BR2_PACKAGE_TIFF_UTILITIES
 	bool "tiff utilities"
-- 
2.7.4
