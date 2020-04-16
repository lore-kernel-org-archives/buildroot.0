From: Timo Ketola <timo.ketola@exertus.fi>
Date: Thu, 16 Apr 2020 08:50:16 +0300
Subject: [Buildroot] [PATCH 1/1] package/fbgrab: bump to version 1.3.3
Message-ID: <1587016216-14126-1-git-send-email-timo.ketola@exertus.fi>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The pixfmt report bug has been fixed upstream.

Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
---
 package/fbgrab/0100-fix-pixfmt-report.patch | 24 ------------------------
 package/fbgrab/fbgrab.hash                  |  2 +-
 package/fbgrab/fbgrab.mk                    |  2 +-
 3 files changed, 2 insertions(+), 26 deletions(-)
 delete mode 100644 package/fbgrab/0100-fix-pixfmt-report.patch

diff --git a/package/fbgrab/0100-fix-pixfmt-report.patch b/package/fbgrab/0100-fix-pixfmt-report.patch
deleted file mode 100644
index 8cff7ef..0000000
--- a/package/fbgrab/0100-fix-pixfmt-report.patch
+++ /dev/null
@@ -1,24 +0,0 @@
-Fix pixel format report
-
-When fbgrab tells about the framebuffer pixel format, blue and green
-are accidentally swapped in 'length' and 'msb_right' columns. Let's
-order everything as RGB.
-
-Upstream-Status: Submitted [Gunnar Monell <gmo@linux.nu>]
-
-Signed-off-by: Timo Ketola <timo.ketola@exertus.fi>
-
-diff -u a/fbgrab.c b/fbgrab.c
---- a/fbgrab.c	2018-03-07 11:42:04.739250433 +0200
-+++ b/fbgrab.c	2018-03-07 11:43:26.128043877 +0200
-@@ -169,8 +169,8 @@
-         fprintf(stderr, "bits_per_pixel: %i\n", fb_varinfo_p->bits_per_pixel);
-         fprintf(stderr, "grayscale: %s\n", fb_varinfo_p->grayscale ? "true" : "false");
-         fprintf(stderr, "red:   offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->red.offset, fb_varinfo_p->red.length, fb_varinfo_p->red.msb_right);
--        fprintf(stderr, "blue:  offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->blue.offset, fb_varinfo_p->green.length, fb_varinfo_p->green.msb_right);
--        fprintf(stderr, "green: offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->green.offset, fb_varinfo_p->blue.length, fb_varinfo_p->blue.msb_right);
-+        fprintf(stderr, "green: offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->green.offset, fb_varinfo_p->green.length, fb_varinfo_p->green.msb_right);
-+        fprintf(stderr, "blue:  offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->blue.offset, fb_varinfo_p->blue.length, fb_varinfo_p->blue.msb_right);
-         fprintf(stderr, "alpha: offset: %i, length: %i, msb_right: %i\n", fb_varinfo_p->transp.offset, fb_varinfo_p->transp.length, fb_varinfo_p->transp.msb_right);
-         fprintf(stderr, "pixel format: %s\n", fb_varinfo_p->nonstd == 0 ? "standard" : "non-standard");
-     }
diff --git a/package/fbgrab/fbgrab.hash b/package/fbgrab/fbgrab.hash
index 6cd19dc..414a93c 100644
--- a/package/fbgrab/fbgrab.hash
+++ b/package/fbgrab/fbgrab.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  3314a932f830e32feaf36914e1b43326529fe35b7eb7410ff55f16c930ddfbcb  fbgrab-1.3.1.tar.gz
+sha256  2bfdad379579c4ca1a910d0a8ac63183ef2c12a45e6b7d402fd045d83bb3faee  fbgrab-1.3.3.tar.gz
 sha256  fa5fc1d1eec39532ea517518eeefd7b6e3c14341a55e5880a0e2a49eee47a5b7  COPYING
diff --git a/package/fbgrab/fbgrab.mk b/package/fbgrab/fbgrab.mk
index 43fd0ba..6d2f09b 100644
--- a/package/fbgrab/fbgrab.mk
+++ b/package/fbgrab/fbgrab.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FBGRAB_VERSION = 1.3.1
+FBGRAB_VERSION = 1.3.3
 FBGRAB_SITE = $(call github,GunnarMonell,fbgrab,$(FBGRAB_VERSION))
 FBGRAB_DEPENDENCIES = libpng
 FBGRAB_LICENSE = GPL-2.0
-- 
2.7.4
