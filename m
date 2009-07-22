From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 22 Jul 2009 09:37:13 +0200
Subject: [Buildroot] [git commit] libpng: bump version
Message-ID: <20090722073903.4F52A7781D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0adeeddb252b3da877f94edb03afc4eea17ddbe1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master


Fixes an unitialized-memory-read bug.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/libpng/libpng-remove-setjmp-error.patch |   17 -----------------
 package/libpng/libpng.mk                        |    2 +-
 2 files changed, 1 insertions(+), 18 deletions(-)
 delete mode 100644 package/libpng/libpng-remove-setjmp-error.patch

diff --git a/package/libpng/libpng-remove-setjmp-error.patch b/package/libpng/libpng-remove-setjmp-error.patch
deleted file mode 100644
index 6d0d8f7..0000000
--- a/package/libpng/libpng-remove-setjmp-error.patch
+++ /dev/null
@@ -1,17 +0,0 @@
-diff -ur libpng-1.2.25/pngconf.h libpng-1.2.25-patched/pngconf.h
---- libpng-1.2.25/pngconf.h	2008-02-18 16:31:05.000000000 -0600
-+++ libpng-1.2.25-patched/pngconf.h	2008-03-05 07:30:22.900478085 -0600
-@@ -319,13 +319,6 @@
- #      define PNG_SAVE_BSD_SOURCE
- #      undef _BSD_SOURCE
- #    endif
--#    ifdef _SETJMP_H
--     /* If you encounter a compiler error here, see the explanation
--      * near the end of INSTALL.
--      */
--         __pngconf.h__ already includes setjmp.h;
--         __dont__ include it again.;
--#    endif
- #  endif /* __linux__ */
- 
-    /* include setjmp.h for error handling */
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index 8ed1b1a..b1cb220 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -3,7 +3,7 @@
 # libpng (Portable Network Graphic library)
 #
 #############################################################
-LIBPNG_VERSION:=1.2.35
+LIBPNG_VERSION:=1.2.38
 LIBPNG_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/libpng
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.bz2
 LIBPNG_LIBTOOL_PATCH = NO
-- 
1.6.3.3
