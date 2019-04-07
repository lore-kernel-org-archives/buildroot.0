From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 7 Apr 2019 10:45:48 +0200
Subject: [Buildroot] [git commit] package/mpfr: bump to version 4.0.2
Message-ID: <20190407084214.7681A813C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fbc218b4f84550302de87c5d23ffd78187cbc59b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove patch (already in version)
- Add hash for license file

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-Fix-obsolete-ARC-asm-constraints.patch    | 37 ----------------------
 package/mpfr/mpfr.hash                             |  7 ++--
 package/mpfr/mpfr.mk                               |  2 +-
 3 files changed, 6 insertions(+), 40 deletions(-)

diff --git a/package/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch b/package/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch
deleted file mode 100644
index 12590cfd30..0000000000
--- a/package/mpfr/0001-Fix-obsolete-ARC-asm-constraints.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-mpfr-longlong.h: Fix obsolete ARC asm constraints
-
-This patch replaces obsolete ARC "J" asm constraint with
-up-to-date "Cal" constraint.
-The patch should be applied to upstream "mpfr" library and
-after that it should be removed from buildroot as soon as 
-mpfr version with current fix will come up.
-
-Signed-off-by: Vlad Zakharov <vzakhar@synopsys.com>
-Signed-off-by: Claudiu Zissulescu <claziss@synopsys.com>
----
-Index: /src/mpfr-longlong.h
-===================================================================
---- /src/mpfr-longlong.h	(revision 10963)
-+++ /src/mpfr-longlong.h	(working copy)
-@@ -416,17 +416,17 @@
- 	   : "=r" (sh),							\
- 	     "=&r" (sl)							\
- 	   : "r"  ((USItype) (ah)),					\
--	     "rIJ" ((USItype) (bh)),					\
-+	     "rICal" ((USItype) (bh)),					\
- 	     "%r" ((USItype) (al)),					\
--	     "rIJ" ((USItype) (bl)))
-+	     "rICal" ((USItype) (bl)))
- #define sub_ddmmss(sh, sl, ah, al, bh, bl) \
-   __asm__ ("sub.f\t%1, %4, %5\n\tsbc\t%0, %2, %3"			\
- 	   : "=r" (sh),							\
- 	     "=&r" (sl)							\
- 	   : "r" ((USItype) (ah)),					\
--	     "rIJ" ((USItype) (bh)),					\
-+	     "rICal" ((USItype) (bh)),					\
- 	     "r" ((USItype) (al)),					\
--	     "rIJ" ((USItype) (bl)))
-+	     "rICal" ((USItype) (bl)))
- #endif
- 
- #if defined (__arm__) && (defined (__thumb2__) || !defined (__thumb__)) \
diff --git a/package/mpfr/mpfr.hash b/package/mpfr/mpfr.hash
index 1c825e1231..593c97d774 100644
--- a/package/mpfr/mpfr.hash
+++ b/package/mpfr/mpfr.hash
@@ -1,2 +1,5 @@
-# From http://lists.gnu.org/archive/html/info-gnu/2017-09/msg00004.html
-sha256 7a62ac1a04408614fccdc506e4844b10cf0ad2c2b1677097f8f35d3a1344a950  mpfr-3.1.6.tar.xz
+# From http://lists.gnu.org/archive/html/info-gnu/2019-01/msg00019.html
+sha256 1d3be708604eae0e42d578ba93b390c2a145f17743a744d8f3f8c2ad5855a38a  mpfr-4.0.2.tar.xz
+
+#??Hash for license file
+sha256 e3a994d82e644b03a792a930f574002658412f62407f5fee083f2555c5f23118  COPYING.LESSER
diff --git a/package/mpfr/mpfr.mk b/package/mpfr/mpfr.mk
index 1b67cf2e45..ef2999eb16 100644
--- a/package/mpfr/mpfr.mk
+++ b/package/mpfr/mpfr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MPFR_VERSION = 3.1.6
+MPFR_VERSION = 4.0.2
 MPFR_SITE = http://www.mpfr.org/mpfr-$(MPFR_VERSION)
 MPFR_SOURCE = mpfr-$(MPFR_VERSION).tar.xz
 MPFR_LICENSE = LGPL-3.0+
