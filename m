Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD20BC4332F
	for <buildroot@archiver.kernel.org>; Wed, 28 Dec 2022 20:01:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8753E40002;
	Wed, 28 Dec 2022 20:01:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8753E40002
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NSlA4Gs4a4PN; Wed, 28 Dec 2022 20:01:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4D48E40220;
	Wed, 28 Dec 2022 20:01:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4D48E40220
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0280D1BF59F
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0C7D40202
 for <buildroot@lists.busybox.net>; Wed, 28 Dec 2022 20:01:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0C7D40202
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyFfABoEtNaV for <buildroot@lists.busybox.net>;
 Wed, 28 Dec 2022 20:01:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 14571401E9
 for <buildroot@buildroot.org>; Wed, 28 Dec 2022 20:01:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14571401E9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0086186F57; Wed, 28 Dec 2022 20:01:38 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 28 Dec 2022 21:01:30 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: be69066d8fee8b30dad8317bb4aad425bc005623
X-Git-Newrev: 16b27f7cdbc8c203b3b957a33ade03739149021f
X-Patchwork-Hint: ignore
Message-Id: <20221228200139.0086186F57@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dieharder: bump to version 3.31.1.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=16b27f7cdbc8c203b3b957a33ade03739149021f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Switch to the maintenance "upstream" repo which regroup updates made
  for the Debian package
- Drop all patches (already in version)
- Drop DIEHARDER_M4_CLEAN which is not needed since
  https://github.com/eddelbuettel/dieharder/commit/c875e5d8196c4a79547281ff5f9fb04af734db97
- -fcommon is not needed since
  https://github.com/eddelbuettel/dieharder/commit/8feba3cc2bf92627f32ac637827ac760d3a17e63

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...includedir-as-include-search-path-for-bui.patch |  62 --
 .../dieharder/0002-Fix-missing-type-intptr_t.patch |  27 -
 ...U_SOURCE-for-uint-and-M_PI-with-musl-libc.patch |  28 -
 .../0004-Add-static-to-inline-functions.patch      |  65 --
 .../dieharder/0005-Remove-defunct-rgb_operm.patch  | 732 ---------------------
 package/dieharder/dieharder.hash                   |   2 +-
 package/dieharder/dieharder.mk                     |  25 +-
 7 files changed, 4 insertions(+), 937 deletions(-)

diff --git a/package/dieharder/0001-Do-not-use-includedir-as-include-search-path-for-bui.patch b/package/dieharder/0001-Do-not-use-includedir-as-include-search-path-for-bui.patch
deleted file mode 100644
index b475e5c470..0000000000
--- a/package/dieharder/0001-Do-not-use-includedir-as-include-search-path-for-bui.patch
+++ /dev/null
@@ -1,62 +0,0 @@
-From fbc9b7c3b83a99ac996c0a268487d1f800630328 Mon Sep 17 00:00:00 2001
-From: Julien Viard de Galbert <julien@vdg.name>
-Date: Wed, 8 Feb 2017 21:26:58 +0100
-Subject: [PATCH] Do not use includedir as include search path for build
-
---includedir is not used to specify where a program should
-look for headers of libraries, but to tell where it should
-install its own headers.
-
-Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
----
- configure.ac             | 6 +++---
- dieharder/Makefile.am    | 2 +-
- libdieharder/Makefile.am | 2 +-
- 3 files changed, 5 insertions(+), 5 deletions(-)
-
-diff --git a/configure.ac b/configure.ac
-index b336115..91f7c64 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -96,9 +96,9 @@ AC_TYPE_SIZE_T
- AC_C_VOLATILE
- AC_C_INLINE
- 
--DIEHARDER_CFLAGS="-I$includedir"
--dieharder_CFLAGS="-std=c99 -Wall -pedantic -I$includedir"
--libdieharder_lo_CFLAGS="-Wall -pedantic -I$includedir"
-+DIEHARDER_CFLAGS=""
-+dieharder_CFLAGS="-std=c99 -Wall -pedantic"
-+libdieharder_lo_CFLAGS="-Wall -pedantic"
- DIEHARDER_LIBS="-L$libdir -ldieharder"
- ACLOCAL_AMFLAGS="-I m4"
- 
-diff --git a/dieharder/Makefile.am b/dieharder/Makefile.am
-index e6fbff2..7bdac5c 100644
---- a/dieharder/Makefile.am
-+++ b/dieharder/Makefile.am
-@@ -64,7 +64,7 @@ DEFINES = -DVERSION=$(VERSION)
- # CC = gcc
- 
- # Compile flags (use fairly standard -O3 as default)
--AM_CPPFLAGS = -I ${top_srcdir}/include $(DEFINES) -I ${includedir}
-+AM_CPPFLAGS = -I ${top_srcdir}/include $(DEFINES)
- AM_CFLAGS = -O3
- 
- # Load flags (optional)
-diff --git a/libdieharder/Makefile.am b/libdieharder/Makefile.am
-index 5fd3396..0873f9c 100644
---- a/libdieharder/Makefile.am
-+++ b/libdieharder/Makefile.am
-@@ -114,7 +114,7 @@ DEFINES = -DVERSION=$(VERSION) -DLITTLE_ENDIAN=$(LITTLE_ENDIAN)
- # CC = gcc
- 
- # Compile flags (use fairly standard -O3 as default)
--AM_CPPFLAGS = $(DEFINES) -I ${top_srcdir}/include -I ${includedir}
-+AM_CPPFLAGS = $(DEFINES) -I ${top_srcdir}/include
- AM_CFLAGS = -O3 -Wall -pedantic -Wno-unused-variable 
- 
- #========================================================================
--- 
-2.1.4
-
diff --git a/package/dieharder/0002-Fix-missing-type-intptr_t.patch b/package/dieharder/0002-Fix-missing-type-intptr_t.patch
deleted file mode 100644
index 12ea5e7fa0..0000000000
--- a/package/dieharder/0002-Fix-missing-type-intptr_t.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 6f550841943f19612af064b3d3a1db134078e03c Mon Sep 17 00:00:00 2001
-From: Julien Viard de Galbert <julien@vdg.name>
-Date: Sat, 14 Jan 2017 14:18:10 +0100
-Subject: [PATCH] Fix missing type intptr_t
-
-With glibc-2.23 unistd.h need intptr_t when __USE_MISC is defined.
-
-Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
----
- include/dieharder/libdieharder.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/dieharder/libdieharder.h b/include/dieharder/libdieharder.h
-index 2138ebf..d98b758 100644
---- a/include/dieharder/libdieharder.h
-+++ b/include/dieharder/libdieharder.h
-@@ -17,6 +17,7 @@
- 
- /* This turns on uint macro in c99 */
- #define __USE_MISC 1
-+#include <stdint.h>
- #include <sys/types.h>
- #include <sys/stat.h>
- #include <unistd.h>
--- 
-2.1.4
-
diff --git a/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch b/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
deleted file mode 100644
index d71cd57445..0000000000
--- a/package/dieharder/0003-Add-_GNU_SOURCE-for-uint-and-M_PI-with-musl-libc.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 526510a27ef47a16699dd34a2373ad9b6bb5e8f3 Mon Sep 17 00:00:00 2001
-From: Julien Viard de Galbert <julien@vdg.name>
-Date: Sat, 14 Jan 2017 14:19:47 +0100
-Subject: [PATCH] Add _GNU_SOURCE for uint and M_PI with musl libc
-
-When building with musl libc _GNU_SOURCE need to be defined
-to provide uint type and M_PI macro
-
-Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
----
- include/dieharder/libdieharder.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/include/dieharder/libdieharder.h b/include/dieharder/libdieharder.h
-index d98b758..c1a5023 100644
---- a/include/dieharder/libdieharder.h
-+++ b/include/dieharder/libdieharder.h
-@@ -17,6 +17,7 @@
- 
- /* This turns on uint macro in c99 */
- #define __USE_MISC 1
-+#define _GNU_SOURCE 1
- #include <stdint.h>
- #include <sys/types.h>
- #include <sys/stat.h>
--- 
-2.1.4
-
diff --git a/package/dieharder/0004-Add-static-to-inline-functions.patch b/package/dieharder/0004-Add-static-to-inline-functions.patch
deleted file mode 100644
index 64cde1d21d..0000000000
--- a/package/dieharder/0004-Add-static-to-inline-functions.patch
+++ /dev/null
@@ -1,65 +0,0 @@
-From 9c71a211dcf20f53f747326f5bc3fee9fabe3f52 Mon Sep 17 00:00:00 2001
-From: Julien Viard de Galbert <julien@vdg.name>
-Date: Tue, 27 Jun 2017 00:16:11 +0200
-Subject: [PATCH] Add static to inline functions
-
-This is needed to avoid a link error where the inline functions appear
-missing at link time.
-From c99 standard inline function should either be declared static or
-have an extern instance in a c file for linking.
-This fix is necessary to build with gcc 7; for some reason it was not
-trigerred before.
-
-Signed-off-by: Julien Viard de Galbert <julien@vdg.name>
----
- libdieharder/dab_filltree.c  | 4 ++--
- libdieharder/dab_filltree2.c | 4 ++--
- 2 files changed, 4 insertions(+), 4 deletions(-)
-
-diff --git a/libdieharder/dab_filltree.c b/libdieharder/dab_filltree.c
-index 9cc5ce7..a377c3d 100644
---- a/libdieharder/dab_filltree.c
-+++ b/libdieharder/dab_filltree.c
-@@ -34,7 +34,7 @@ static double targetData[] = {
- 0.0, 0.0, 0.0, 0.0, 0.13333333, 0.20000000, 0.20634921, 0.17857143, 0.13007085, 0.08183633, 0.04338395, 0.01851828, 0.00617270, 0.00151193, 0.00023520, 0.00001680, 0.00000000, 0.00000000, 0.00000000, 0.00000000
- };
- 
--inline int insert(double x, double *array, unsigned int startVal);
-+static inline int insert(double x, double *array, unsigned int startVal);
- 
- int dab_filltree(Test **test,int irun) {
-  int size = (ntuple == 0) ? 32 : ntuple;
-@@ -105,7 +105,7 @@ int dab_filltree(Test **test,int irun) {
- }
- 
- 
--inline int insert(double x, double *array, unsigned int startVal) {
-+static inline int insert(double x, double *array, unsigned int startVal) {
-  uint d = (startVal + 1) / 2;
-  uint i = startVal;
-  while (d > 0) {
-diff --git a/libdieharder/dab_filltree2.c b/libdieharder/dab_filltree2.c
-index 1e33af2..59cbd52 100644
---- a/libdieharder/dab_filltree2.c
-+++ b/libdieharder/dab_filltree2.c
-@@ -92,7 +92,7 @@ static double targetData[128] = {  // size=128, generated from 6e9 samples
- 0.00000000000e+00,0.00000000000e+00,0.00000000000e+00,0.00000000000e+00,
- };
- 
--inline int insertBit(uint x, uchar *array, uint *i, uint *d);
-+static inline int insertBit(uint x, uchar *array, uint *i, uint *d);
- 
- int dab_filltree2(Test **test, int irun) {
-  int size = (ntuple == 0) ? 128 : ntuple;
-@@ -181,7 +181,7 @@ int dab_filltree2(Test **test, int irun) {
-  * The function returns >= 0 if the path went too deep; the
-  * returned value is the last position of the path.
-  */
--inline int insertBit(uint x, uchar *array, uint *i, uint *d) {
-+static inline int insertBit(uint x, uchar *array, uint *i, uint *d) {
-  if (x != 0) {
-    *i += *d;
-  } else {
--- 
-2.13.2
-
diff --git a/package/dieharder/0005-Remove-defunct-rgb_operm.patch b/package/dieharder/0005-Remove-defunct-rgb_operm.patch
deleted file mode 100644
index efc311dbaa..0000000000
--- a/package/dieharder/0005-Remove-defunct-rgb_operm.patch
+++ /dev/null
@@ -1,732 +0,0 @@
-From 40d377b86c856f5a4510a6f5cd56be004873ad77 Mon Sep 17 00:00:00 2001
-From: =?UTF-8?q?Marcus=20M=C3=BCller?= <mueller@kit.edu>
-Date: Mon, 12 Oct 2020 21:30:12 +0200
-Subject: [PATCH] Remove defunct rgb_operm
-
-[Retrieved from:
-https://github.com/eddelbuettel/dieharder/pull/2/commits/40d377b86c856f5a4510a6f5cd56be004873ad77]
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- include/Makefile.am           |   1 -
- include/dieharder/rgb_operm.h |  38 --
- include/dieharder/tests.h     |   2 -
- libdieharder/rgb_operm.c      | 633 ----------------------------------
- 4 files changed, 674 deletions(-)
- delete mode 100644 include/dieharder/rgb_operm.h
- delete mode 100644 libdieharder/rgb_operm.c
-
-diff --git a/include/Makefile.am b/include/Makefile.am
-index f80b4ff..e4659cd 100644
---- a/include/Makefile.am
-+++ b/include/Makefile.am
-@@ -33,7 +33,6 @@ nobase_include_HEADERS = dieharder/copyright.h \
- 	dieharder/rgb_lagged_sums.h \
- 	dieharder/rgb_lmn.h \
- 	dieharder/rgb_minimum_distance.h \
--	dieharder/rgb_operm.h \
- 	dieharder/rgb_persist.h \
- 	dieharder/rgb_permutations.h \
- 	dieharder/rgb_timing.h \
-diff --git a/include/dieharder/rgb_operm.h b/include/dieharder/rgb_operm.h
-deleted file mode 100644
-index c48fa37..0000000
---- a/include/dieharder/rgb_operm.h
-+++ /dev/null
-@@ -1,38 +0,0 @@
--/*
-- * rgb_operm test header.
-- */
--
--/*
-- * function prototype
-- */
--int rgb_operm(Test **test,int irun);
--
--static Dtest rgb_operm_dtest __attribute__((unused)) = {
--  "RGB Overlapping Permuations Test",
--  "rgb_operm",
--  "\n\
--#========================================================================\n\
--#                 RGB Overlapping Permutations Test\n\
--# Forms both the exact (expected) covariance matrix for overlapping\n\
--# permutations of random integer and an empirical covariance matrix\n\
--# formed from a long string of samples.  The difference is expected\n\
--# to have a chisq distribution and hence can be transformed into a\n\
--# sample p-value.  Note that this is one possible functional replacement\n\
--# for the broken/defunct diehard operm5 test, but one that permits k (the\n\
--# number of numbers in the overlapping permutation window) to be varied\n\
--# from 2 to perhaps 8.\n\
--#\n",
--  100,     /* Default psamples */
--  100000,  /* Default tsamples */
--  1,       /* We magically make all the bit tests return a single histogram */
--  rgb_operm,
--  0
--};
--
--/*
-- * Global variables.
-- *
-- * rgb_operm_k is the size of the overlapping window that is slid along
-- * a data stream of rands from x_i to x_{i+k} to compute c[][].
-- */
--unsigned int rgb_operm_k;
-diff --git a/include/dieharder/tests.h b/include/dieharder/tests.h
-index 1674aed..b50dbe3 100644
---- a/include/dieharder/tests.h
-+++ b/include/dieharder/tests.h
-@@ -11,7 +11,6 @@
- #include <dieharder/rgb_kstest_test.h>
- #include <dieharder/rgb_lagged_sums.h>
- #include <dieharder/rgb_minimum_distance.h>
--#include <dieharder/rgb_operm.h>
- #include <dieharder/rgb_permutations.h>
- #include <dieharder/dab_bytedistrib.h>
- #include <dieharder/dab_dct.h>
-@@ -80,7 +79,6 @@
-    RGB_PERMUTATIONS,
-    RGB_LAGGED_SUMS,
-    RGB_LMN,
--   RGB_OPERM,
-    DAB_BYTEDISTRIB,
-    DAB_DCT,
-    DAB_FILLTREE,
-diff --git a/libdieharder/rgb_operm.c b/libdieharder/rgb_operm.c
-deleted file mode 100644
-index 15f8e9a..0000000
---- a/libdieharder/rgb_operm.c
-+++ /dev/null
-@@ -1,633 +0,0 @@
--/*
-- * ========================================================================
-- * $Id: rgb_operm.c 252 2006-10-10 13:17:36Z rgb $
-- *
-- * See copyright in copyright.h and the accompanying file COPYING
-- * ========================================================================
-- */
--
--/*
-- * ========================================================================
-- * This is the revised Overlapping Permutations test.  It directly
-- * simulates the covariance matrix of overlapping permutations.  The way
-- * this works below (tentatively) is:
-- *
-- *    For a bit ntuple of length N, slide a window of length N to the
-- *    right one bit at a time.  Compute the permutation index of the
-- *    original ntuple, the permutation index of the window ntuple, and
-- *    accumulate the covariance matrix of the two positions.  This
-- *    can be directly and precisely computed as well.  The simulated
-- *    result should be distributed according to the chisq distribution,
-- *    so we subtract the two and feed it into the chisq program as a
-- *    vector to compute p.
-- *
-- * This MAY NOT BE RIGHT.  I'm working from both Marsaglia's limited
-- * documentation (in a program that doesn't do ANYTHING like what the
-- * documentation says it does) and from Nilpotent Markov Processes.
-- * But I confess to not quite understand how to actually perform the
-- * test in the latter -- it is very good at describing the construction
-- * of the target matrix, not so good at describing how to transform
-- * this into a chisq and p.
-- *
-- * FWIW, as I get something that actually works here, I'm going to
-- * THOROUGHLY document it in the book that will accompany the test.
-- *========================================================================
-- */
--
--#include <dieharder/libdieharder.h>
--#define RGB_OPERM_KMAX 10
--
--/*
-- * Some globals that will eventually go in the test include where they
-- * arguably belong.
-- */
--double fpipi(int pi1,int pi2,int nkp);
--uint piperm(size_t *data,int len);
--void make_cexact();
--void make_cexpt();
--int nperms,noperms;
--double **cexact,**ceinv,**cexpt,**idty;
--double *cvexact,*cvein,*cvexpt,*vidty;
--
--int rgb_operm(Test **test,int irun)
--{
--
-- int i,j,n,nb,iv,s;
-- uint csamples;   /* rgb_operm_k^2 is vector size of cov matrix */
-- uint *count,ctotal; /* counters */
-- uint size;
-- double pvalue,ntuple_prob,pbin;  /* probabilities */
-- Vtest *vtest;   /* Chisq entry vector */
--
-- gsl_matrix_view CEXACT,CEINV,CEXPT,IDTY;
--
-- /*
--  * For a given n = ntuple size in bits, there are n! bit orderings
--  */
-- MYDEBUG(D_RGB_OPERM){
--   printf("#==================================================================\n");
--   printf("# rgb_operm: Running rgb_operm verbosely for k = %d.\n",rgb_operm_k);
--   printf("# rgb_operm: Use -v = %d to focus.\n",D_RGB_OPERM);
--   printf("# rgb_operm: ======================================================\n");
-- }
--
-- /*
--  * Sanity check first
--  */
-- if((rgb_operm_k < 0) || (rgb_operm_k > RGB_OPERM_KMAX)){
--   printf("\nError:  rgb_operm_k must be a positive integer <= %u.  Exiting.\n",RGB_OPERM_KMAX);
--   exit(0);
-- }
--
-- nperms = gsl_sf_fact(rgb_operm_k);
-- noperms = gsl_sf_fact(3*rgb_operm_k-2);
-- csamples = rgb_operm_k*rgb_operm_k;
-- gsl_permutation * p = gsl_permutation_alloc(nperms);
--
-- /*
--  * Allocate memory for value_max vector of Vtest structs and counts,
--  * PER TEST.  Note that we must free both of these when we are done
--  * or leak.
--  */
-- vtest = (Vtest *)malloc(csamples*sizeof(Vtest));
-- count = (uint *)malloc(csamples*sizeof(uint));
-- Vtest_create(vtest,csamples+1);
--
-- /*
--  * We have to allocate and free the cexact and cexpt matrices here
--  * or they'll be forgotten when these routines return.
--  */
-- MYDEBUG(D_RGB_OPERM){
--   printf("# rgb_operm: Creating and zeroing cexact[][] and cexpt[][].\n");
-- }
-- cexact = (double **)malloc(nperms*sizeof(double*));
-- ceinv  = (double **)malloc(nperms*sizeof(double*));
-- cexpt  = (double **)malloc(nperms*sizeof(double*));
-- idty   = (double **)malloc(nperms*sizeof(double*));
-- cvexact = (double *)malloc(nperms*nperms*sizeof(double));
-- cvein   = (double *)malloc(nperms*nperms*sizeof(double));
-- cvexpt  = (double *)malloc(nperms*nperms*sizeof(double));
-- vidty   = (double *)malloc(nperms*nperms*sizeof(double));
-- for(i=0;i<nperms;i++){
--   /* Here we pack addresses to map the matrix addressing onto the vector */
--   cexact[i] = &cvexact[i*nperms];
--   ceinv[i] = &cvein[i*nperms];
--   cexpt[i] = &cvexpt[i*nperms];
--   idty[i] = &vidty[i*nperms];
--   for(j = 0;j<nperms;j++){
--     cexact[i][j] = 0.0;
--     ceinv[i][j] = 0.0;
--     cexpt[i][j]  = 0.0;
--     idty[i][j]   = 0.0;
--   }
-- }
--
-- make_cexact();
-- make_cexpt();
--
-- iv=0;
-- for(i=0;i<nperms;i++){
--   for(j=0;j<nperms;j++){
--     cvexact[iv] = cexact[i][j];
--     cvexpt[iv]  = cexpt[i][j];
--     vidty[iv]   = 0.0;
--   }
-- }
--
-- CEXACT = gsl_matrix_view_array(cvexact, nperms, nperms);
-- CEINV  = gsl_matrix_view_array(cvein  , nperms, nperms);
-- CEXPT  = gsl_matrix_view_array(cvexpt , nperms, nperms);
-- IDTY   = gsl_matrix_view_array(vidty  , nperms, nperms);
--
-- /*
--  * Hmmm, looks like cexact isn't invertible.  Duh.  So it has eigenvalues.
--  * This seems to be important (how, I do not know) so let's find out.
--  * Here is the gsl ritual for evaluating eigenvalues etc.
--  */
--
-- gsl_vector *eval = gsl_vector_alloc (nperms);
-- gsl_matrix *evec = gsl_matrix_alloc (nperms,nperms);
-- /*
-- gsl_eigen_nonsymm_workspace* w =  gsl_eigen_nonsymmv_alloc(nperms);
-- gsl_eigen_nonsymm_params (1,0,w);
-- gsl_eigen_nonsymmv(&CEXACT.matrix, eval, evec, w);
-- gsl_eigen_nonsymmv_free (w);
-- */
-- gsl_eigen_symmv_workspace* w =  gsl_eigen_symmv_alloc(nperms);
-- gsl_eigen_symmv(&CEXACT.matrix, eval, evec, w);
-- gsl_eigen_symmv_free (w);
-- gsl_eigen_symmv_sort (eval, evec, GSL_EIGEN_SORT_ABS_ASC);
--
-- {
--   int i;
--
--   printf("#==================================================================\n");
--   for (i = 0; i < nperms; i++) {
--     double eval_i = gsl_vector_get (eval, i);
--     gsl_vector_view evec_i = gsl_matrix_column (evec, i);
--     printf ("eigenvalue[%u] = %g\n", i, eval_i);
--     printf ("eigenvector[%u] = \n",i);
--     gsl_vector_fprintf (stdout,&evec_i.vector, "%10.5f");
--   }
--   printf("#==================================================================\n");
-- }
--
-- gsl_vector_free (eval);
-- gsl_matrix_free (evec);
--
--/*
-- gsl_linalg_LU_decomp(&CEXACT.matrix, p, &s);
-- gsl_linalg_LU_invert(&CEXACT, p, &CEINV);
-- gsl_permutation_free(p);
-- gsl_blas_dgemm(CblasNoTrans, CblasNoTrans, 1.0, &CEINV.matrix, &CEXPT.matrix, 0.0, &IDTY.matrix);
-- printf("#==================================================================\n");
-- printf("# Should be inverse of C, assuming it is invertible:\n");
-- for(i=0;i<nperms;i++){
--   printf("# ");
--   for(j = 0;j<nperms;j++){
--     printf("%8.3f ",idty[i][j]);
--   }
--   printf("\n");
-- }
-- printf("#==================================================================\n");
-- printf("#==================================================================\n");
-- printf("# Should be normal on identity:\n");
-- for(i=0;i<nperms;i++){
--   printf("# ");
--   for(j = 0;j<nperms;j++){
--     printf("%8.3f ",idty[i][j]);
--   }
--   printf("\n");
-- }
-- printf("#==================================================================\n");
-- */
--
--    
--
-- /*
--  * OK, at this point we have two matrices:  cexact[][] is filled with
--  * the exact covariance matrix expected for the overlapping permutations.
--  * cexpt[][] has been filled numerically by generating strings of random
--  * uints or floats, generating sort index permutations, and
--  * using them to IDENTICALLY generate an "experimental" version of c[][].
--  * The two should correspond, in the limit of large tsamples.  IF I
--  * understand Alhakim, Kawczak and Molchanov, then the way to implement
--  * the simplest possible chisq test is to evaluate:
--  *       cexact^-1 cexpt \approx I
--  * where the diagonal terms should form a vector that is chisq distributed?
--  * Let's try this...
--  */
-- 
-- 
--
-- /*
--  * Free cexact[][] and cexpt[][]
--  * Fix this when we're done so we don't leak; for now to much trouble.
-- for(i=0;i<nperms;i++){
--   free(cexact[i]);
--   free(cexpt[i]);
-- }
-- free(cexact);
-- free(cexpt);
--  */
-- 
-- return(0);
--
--}
--
--void make_cexact()
--{
--
-- int i,j,k,ip,t,nop;
-- double fi,fj;
-- /*
--  * This is the test vector.
--  */
-- double testv[RGB_OPERM_KMAX*2];  /* easier than malloc etc, but beware length */
-- /*
--  * pi[] is the permutation index of a sample.  ps[] holds the
--  * actual sample.
--  */
-- size_t pi[4096],ps[4096];
-- /*
--  * We seem to have made a mistake of sorts.  We actually have to sum
--  * BOTH the forward AND the backward directions.  That means that the
--  * permutation vector has to be of length 3k-1, with the pi=1 term
--  * corresponding to the middle.  So for k=2, instead of 0,1,2 we need
--  * 0 1 2 3 4 and we'll have to do 23, 34 in the leading direction and
--  * 21, 10 in the trailing direction.
--  */
-- gsl_permutation **operms;
--
-- MYDEBUG(D_RGB_OPERM){
--   printf("#==================================================================\n");
--   printf("# rgb_operm: Running cexact()\n");
-- }
--
-- /*
--  * Test fpipi().  This is probably cruft, actually.
-- MYDEBUG(D_RGB_OPERM){
--   printf("# rgb_operm: Testing fpipi()\n");
--   for(i=0;i<nperms;i++){
--     for(j = 0;j<nperms;j++){
--       printf("# rgb_operm: fpipi(%u,%u,%u) = %f\n",i,j,nperms,fpipi(i,j,nperms));
--     }
--   }
-- }
-- */
--
-- MYDEBUG(D_RGB_OPERM){
--   printf("#==================================================================\n");
--   printf("# rgb_operm: Forming set of %u overlapping permutations\n",noperms);
--   printf("# rgb_operm: Permutations\n");
--   printf("# rgb_operm:==============================\n");
-- }
-- operms = (gsl_permutation**) malloc(noperms*sizeof(gsl_permutation*));
-- for(i=0;i<noperms;i++){
--   operms[i] = gsl_permutation_alloc(3*rgb_operm_k - 2);
--   /* Must quiet down
--   MYDEBUG(D_RGB_OPERM){
--     printf("# rgb_operm: ");
--   }
--   */
--   if(i == 0){
--     gsl_permutation_init(operms[i]);
--   } else {
--     gsl_permutation_memcpy(operms[i],operms[i-1]);
--     gsl_permutation_next(operms[i]);
--   }
--   /*
--   MYDEBUG(D_RGB_OPERM){
--     gsl_permutation_fprintf(stdout,operms[i]," %u");
--     printf("\n");
--   }
--   */
-- }
--
-- /*
--  * We now form c_exact PRECISELY the same way that we do c_expt[][]
--  * below, except that instead of pulling random samples of integers
--  * or floats and averaging over the permutations thus represented,
--  * we iterate over the complete set of equally weighted permutations
--  * to get an exact answer.  Note that we have to center on 2k-1 and
--  * go both forwards and backwards.
--  */
-- for(t=0;t<noperms;t++){
--   /*
--    * To sort into a perm, test vector needs to be double.
--    */
--   for(k=0;k<3*rgb_operm_k - 2;k++) testv[k] = (double) operms[t]->data[k];
--
--   /* Not cruft, but quiet...
--   MYDEBUG(D_RGB_OPERM){
--     printf("#------------------------------------------------------------------\n");
--     printf("# Generating offset sample permutation pi's\n");
--   }
--   */
--   for(k=0;k<2*rgb_operm_k - 1;k++){
--     gsl_sort_index((size_t *) ps,&testv[k],1,rgb_operm_k);
--     pi[k] = piperm((size_t *) ps,rgb_operm_k);
--
--     /* Not cruft, but quiet...
--     MYDEBUG(D_RGB_OPERM){
--       printf("# %u: ",k);
--       for(ip=k;ip<rgb_operm_k+k;ip++){
--         printf("%.1f ",testv[ip]);
--       }
--       printf("\n# ");
--       for(ip=0;ip<rgb_operm_k;ip++){
--         printf("%u ",ps[ip]);
--       }
--       printf(" = %u\n",pi[k]);
--     }
--     */
--
--   }
--
--   /*
--    * This is the business end of things.  The covariance matrix is the
--    * the sum of a central function of the permutation indices that yields
--    * nperms-1/nperms on diagonal, -1/nperms off diagonal, for all the
--    * possible permutations, for the FIRST permutation in a sample (fi)
--    * times the sum of the same function over all the overlapping permutations
--    * drawn from the same sample.  Quite simple, really.
--    */
--   for(i=0;i<nperms;i++){
--     fi = fpipi(i,pi[rgb_operm_k-1],nperms);
--     for(j=0;j<nperms;j++){
--       fj = 0.0;
--       for(k=0;k<rgb_operm_k;k++){
--         fj += fpipi(j,pi[rgb_operm_k - 1 + k],nperms);
--         if(k != 0){
--           fj += fpipi(j,pi[rgb_operm_k - 1 - k],nperms);
--	 }
--       }
--       cexact[i][j] += fi*fj;
--     }
--   }
--
-- }
--
-- MYDEBUG(D_RGB_OPERM){
--   printf("# rgb_operm:==============================\n");
--   printf("# rgb_operm: cexact[][] = \n");
-- }
-- for(i=0;i<nperms;i++){
--   MYDEBUG(D_RGB_OPERM){
--     printf("# ");
--   }
--   for(j=0;j<nperms;j++){
--     cexact[i][j] /= noperms;
--     MYDEBUG(D_RGB_OPERM){
--       printf("%10.6f  ",cexact[i][j]);
--     }
--   }
--   MYDEBUG(D_RGB_OPERM){
--     printf("\n");
--   }
-- }
--
-- /*
--  * Free operms[]
--  */
-- for(i=0;i<noperms;i++){
--   gsl_permutation_free(operms[i]);
-- }
-- free(operms);
--
--}
--
--void make_cexpt()
--{
--
-- int i,j,k,ip,t;
-- double fi,fj;
-- /*
--  * This is the test vector.
--  */
-- double testv[RGB_OPERM_KMAX*2];  /* easier than malloc etc, but beware length */
-- /*
--  * pi[] is the permutation index of a sample.  ps[] holds the
--  * actual sample.
--  */
-- int pi[4096],ps[4096];
--
-- MYDEBUG(D_RGB_OPERM){
--   printf("#==================================================================\n");
--   printf("# rgb_operm: Running cexpt()\n");
-- }
--
-- /*
--  * We evaluate cexpt[][] by sampling.  In a nutshell, this involves
--  *   a) Filling testv[] with 2*rgb_operm_k - 1 random uints or doubles
--  * It clearly cannot matter which we use, as long as the probability of
--  * exact duplicates in a sample is very low.
--  *   b) Using gsl_sort_index the exact same way it was used in make_cexact()
--  * to generate the pi[] index, using ps[] as scratch space for the sort
--  * indices.
--  *   c) Evaluating fi and fj from the SAMPLED result, tsamples times.
--  *   d) Normalizing.
--  * Note that this is pretty much identical to the way we formed c_exact[][]
--  * except that we are determining the relative frequency of each sort order
--  * permutation 2*rgb_operm_k-1 long.
--  *
--  * NOTE WELL!  I honestly think that it is borderline silly to view
--  * this as a matrix and to go through all of this nonsense.  The theoretical
--  * c_exact[][] is computed from the observation that all the permutations
--  * of n objects have equal weight = 1/n!.  Consequently, they should
--  * individually be binomially distributed, tending to normal with many
--  * samples.  Collectively they should be distributed like a vector of
--  * equal binomial probabilities and a p-value should follow either from
--  * chisq on n!-1 DoF or for that matter a KS test.  I see no way that
--  * making it into a matrix can increase the sensitivity of the test -- if
--  * the p-values are well defined in the two cases they can only be equal
--  * by their very definition.
--  *
--  * If you are a statistician reading these words and disagree, please
--  * communicate with me and explain why I'm wrong.  I'm still very much
--  * learning statistics and would cherish gentle correction.
--  */
-- for(t=0;t<tsamples;t++){
--   /*
--    * To sort into a perm, test vector needs to be double.
--    */
--   for(k=0;k<3*rgb_operm_k - 2;k++) testv[k] = (double) gsl_rng_get(rng);
--
--   /* Not cruft, but quiet...
--   MYDEBUG(D_RGB_OPERM){
--     printf("#------------------------------------------------------------------\n");
--     printf("# Generating offset sample permutation pi's\n");
--   }
--   */
--   for(k=0;k<2*rgb_operm_k-1;k++){
--     gsl_sort_index(ps,&testv[k],1,rgb_operm_k);
--     pi[k] = piperm(ps,rgb_operm_k);
--
--     /* Not cruft, but quiet...
--     MYDEBUG(D_RGB_OPERM){
--       printf("# %u: ",k);
--       for(ip=k;ip<rgb_operm_k+k;ip++){
--         printf("%.1f ",testv[ip]);
--       }
--       printf("\n# ");
--       for(ip=0;ip<rgb_operm_k;ip++){
--         printf("%u ",permsample->data[ip]);
--       }
--       printf(" = %u\n",pi[k]);
--     }
--     */
--   }
--
--   /*
--    * This is the business end of things.  The covariance matrix is the
--    * the sum of a central function of the permutation indices that yields
--    * nperms-1/nperms on diagonal, -1/nperms off diagonal, for all the
--    * possible permutations, for the FIRST permutation in a sample (fi)
--    * times the sum of the same function over all the overlapping permutations
--    * drawn from the same sample.  Quite simple, really.
--    */
--   for(i=0;i<nperms;i++){
--     fi = fpipi(i,pi[rgb_operm_k-1],nperms);
--     for(j=0;j<nperms;j++){
--       fj = 0.0;
--       for(k=0;k<rgb_operm_k;k++){
--         fj += fpipi(j,pi[rgb_operm_k - 1 + k],nperms);
--	 if(k != 0){
--           fj += fpipi(j,pi[rgb_operm_k - 1 - k],nperms);
--	 }
--       }
--       cexpt[i][j] += fi*fj;
--     }
--   }
--
-- }
--
-- MYDEBUG(D_RGB_OPERM){
--   printf("# rgb_operm:==============================\n");
--   printf("# rgb_operm: cexpt[][] = \n");
-- }
-- for(i=0;i<nperms;i++){
--   MYDEBUG(D_RGB_OPERM){
--     printf("# ");
--   }
--   for(j=0;j<nperms;j++){
--     cexpt[i][j] /= tsamples;
--     MYDEBUG(D_RGB_OPERM){
--       printf("%10.6f  ",cexpt[i][j]);
--     }
--   }
--   MYDEBUG(D_RGB_OPERM){
--     printf("\n");
--   }
-- }
--
--}
--
--uint piperm(size_t *data,int len)
--{
--
-- uint i,j,k,max,min;
-- uint pindex,uret,tmp;
-- static gsl_permutation** lookup = 0;
--
-- /*
--  * Allocate space for lookup table and fill it.
--  */
-- if(lookup == 0){
--   lookup = (gsl_permutation**) malloc(nperms*sizeof(gsl_permutation*));
--   MYDEBUG(D_RGB_OPERM){
--     printf("# rgb_operm: Allocating piperm lookup table of perms.\n");
--   }
--   for(i=0;i<nperms;i++){
--        lookup[i] = gsl_permutation_alloc(rgb_operm_k);
--   }
--   for(i=0;i<nperms;i++){
--     if(i == 0){
--       gsl_permutation_init(lookup[i]);
--     } else {
--       gsl_permutation_memcpy(lookup[i],lookup[i-1]);
--       gsl_permutation_next(lookup[i]);
--     }
--   }
--
--   /*
--    * This method yields a mirror symmetry in the permutations top to
--    * bottom.
--   for(i=0;i<nperms/2;i++){
--     if(i == 0){
--       gsl_permutation_init(lookup[i]);
--       for(j=0;j<rgb_operm_k;j++){
--         lookup[nperms-i-1]->data[rgb_operm_k-j-1] = lookup[i]->data[j];
--       }
--     } else {
--       gsl_permutation_memcpy(lookup[i],lookup[i-1]);
--       gsl_permutation_next(lookup[i]);
--       for(j=0;j<rgb_operm_k;j++){
--         lookup[nperms-i-1]->data[rgb_operm_k-j-1] = lookup[i]->data[j];
--       }
--     }
--   }
--   */
--   MYDEBUG(D_RGB_OPERM){
--     for(i=0;i<nperms;i++){
--       printf("# rgb_operm: %u => ",i);
--       gsl_permutation_fprintf(stdout,lookup[i]," %u");
--       printf("\n");
--     }
--   }
--
-- }
--
-- for(i=0;i<nperms;i++){
--   if(memcmp(data,lookup[i]->data,len*sizeof(uint))==0){
--     /* Not cruft, but off:
--     MYDEBUG(D_RGB_OPERM){
--       printf("# piperm(): ");
--       gsl_permutation_fprintf(stdout,lookup[i]," %u");
--       printf(" = %u\n",i);
--     }
--     */
--     return(i);
--   }
-- }
-- printf("We'd better not get here...\n");
--
-- return(0);
--
--}
--
--double fpipi(int pi1,int pi2,int nkp)
--{
--
-- int i;
-- double fret;
--
-- /*
--  * compute the k-permutation index from iperm for the window
--  * at data[offset] of length len.  If it matches pind, return
--  * the first quantity, otherwise return the second.
--  */
-- if(pi1 == pi2){
--
--   fret = (double) (nkp - 1.0)/nkp;
--   if(verbose < 0){
--     printf(" f(%d,%d) = %10.6f\n",pi1,pi2,fret);
--   }
--   return(fret);
--
-- } else {
--
--   fret = (double) (-1.0/nkp);
--   if(verbose < 0){
--     printf(" f(%d,%d) = %10.6f\n",pi1,pi2,fret);
--   }
--   return(fret);
--
-- }
--
--
--}
--
--
--
--
diff --git a/package/dieharder/dieharder.hash b/package/dieharder/dieharder.hash
index 65b60e7aa7..3d285d03cc 100644
--- a/package/dieharder/dieharder.hash
+++ b/package/dieharder/dieharder.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256  6cff0ff8394c553549ac7433359ccfc955fb26794260314620dfa5e4cd4b727f  dieharder-3.31.1.tgz
+sha256  0fdd8a66a077e86652a47641589aa4667ae13d322a7214bb555ab37f082002dd  dieharder-3.31.1.4.tar.gz
 sha256  c475bcd1afa6fc15a65174e31c599c0d23706a34e4b9f2fcb03a4dad5438d53f  COPYING
diff --git a/package/dieharder/dieharder.mk b/package/dieharder/dieharder.mk
index cbf28922fd..6fe5b1f743 100644
--- a/package/dieharder/dieharder.mk
+++ b/package/dieharder/dieharder.mk
@@ -4,28 +4,14 @@
 #
 ################################################################################
 
-DIEHARDER_VERSION = 3.31.1
-DIEHARDER_SITE = http://www.phy.duke.edu/~rgb/General/dieharder
-DIEHARDER_SOURCE = dieharder-$(DIEHARDER_VERSION).tgz
-DIEHARDER_STRIP_COMPONENTS = 2
+DIEHARDER_VERSION = 3.31.1.4
+DIEHARDER_SITE = $(call github,eddelbuettel,dieharder,$(DIEHARDER_VERSION))
 DIEHARDER_LICENSE = GPL-2.0 with beverage clause
 DIEHARDER_LICENSE_FILES = COPYING
 DIEHARDER_DEPENDENCIES = gsl
-
-# The original configure does not use variables provided in the
-# environment so _CONF_ENV does not work. (_CONF_OPTS does).
-#
-# Finally, we patch configure.ac and some Makefile.am so we need to
-# autoreconf anyway
+# configure retrieved from git is outdated
 DIEHARDER_AUTORECONF = YES
 
-# The m4/*.m4 files are symlinks to /usr/share, which clearly doesn't
-# work, and doing an autoreconf does not replace them.
-define DIEHARDER_M4_CLEAN
-	rm -f $(@D)/m4/*.m4
-endef
-DIEHARDER_POST_PATCH_HOOKS += DIEHARDER_M4_CLEAN
-
 # fix endianness detection
 ifeq ($(BR2_ENDIAN),"BIG")
 DIEHARDER_CONF_ENV = ac_cv_c_endian=big
@@ -36,9 +22,4 @@ endif
 # parallel build fail, disable it
 DIEHARDER_MAKE = $(MAKE1)
 
-# Too many fixes needed to build with -fno-common which is default since gcc 10
-ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_10),y)
-DIEHARDER_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -fcommon"
-endif
-
 $(eval $(autotools-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
