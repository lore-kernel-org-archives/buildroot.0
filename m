From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 4 Jul 2016 23:23:35 +0200
Subject: [Buildroot] [git commit] package/tiff: use 'menuconfig' instead of
	'config'+'menu'
Message-ID: <20160704212442.534DC81836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e66ce8a30013ba1c4805f36c3e558bf3ac448dcc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
