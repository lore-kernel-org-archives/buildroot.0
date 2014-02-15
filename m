From: Romain Naour <romain.naour@openwide.fr>
Date: Sat, 15 Feb 2014 16:52:11 +0100
Subject: [Buildroot] [PATCH 1/1] imagemagick: needs mmu
Message-ID: <1392479531-22613-1-git-send-email-romain.naour@openwide.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
http://autobuild.buildroot.net/results/d2f/d2f673b71f771ab5a6435805e39338fd023f04c8/build-end.log

The complete log file says:
libMagickCore-6.Q16.so: undefined reference to `_fork'

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
---
 package/imagemagick/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/imagemagick/Config.in b/package/imagemagick/Config.in
index e66ded0..1bd04a9 100644
--- a/package/imagemagick/Config.in
+++ b/package/imagemagick/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_IMAGEMAGICK
 	bool "imagemagick"
+	depends on BR2_USE_MMU # fork()
 	help
 	  ImageMagick(R) is a software suite to create, edit, and compose
 	  bitmap images. It can read, convert and write images in a variety of
-- 
1.8.5.3
