Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BFDCA0EDC
	for <buildroot@archiver.kernel.org>; Tue, 12 Aug 2025 21:42:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6A15941DD4;
	Tue, 12 Aug 2025 21:42:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vf4eNdG0onzL; Tue, 12 Aug 2025 21:42:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 14AE241D9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14AE241D9A;
	Tue, 12 Aug 2025 21:42:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 82CF1939
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 694B841D81
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:42:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZVGfcznkfMF3 for <buildroot@buildroot.org>;
 Tue, 12 Aug 2025 21:42:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3842541D82
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3842541D82
 for <buildroot@buildroot.org>; Tue, 12 Aug 2025 21:42:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 335E18750F; Tue, 12 Aug 2025 21:42:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 Aug 2025 21:28:23 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: c9c8624d45eefe3465fb0a5d75dc12c1a74e9044
X-Git-Newrev: fb6256c0efbc93d242e9ae2aa2d3b4a2e7fd149c
X-Patchwork-Hint: ignore
Message-Id: <20250812214220.335E18750F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{glibc,
 localdef}: bump to version 2.42
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb6256c0efbc93d242e9ae2aa2d3b4a2e7fd149c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release e-mail:

  https://inbox.sourceware.org/libc-alpha/5906001.DvuYhMxLoT@pinacolada/

Major new features:

* The following ISO C23 function families (introduced in TS
  18661-4:2015) are now supported in <math.h>.  Each family includes
  functions for float, double, long double, _FloatN and _FloatNx, and a
  type-generic macro in <tgmath.h>.

  - Power and absolute-value functions: compoundn, pown, powr, rootn,
    rsqrt.

* On Linux, the pthread_gettid_np function has been added.

* The ISO C2Y family of unsigned abs functions, i.e. uabs, ulabs,
  ullabs, and uimaxabs, is now supported.

* On Linux, the <termios.h> interface now supports arbitrary baud rates;
  speed_t is redefined to simply be the baud rate specified as an
  unsigned int, which matches the kernel interface.

* The thread-local cache in malloc (tcache) now supports caching of
  large blocks.  This feature can be enabled by setting the tunable
  glibc.malloc.tcache_max to a larger value (max 4194304). Tcache is
  also significantly faster for small sizes.

* A new configure option, "--enable-sframe", can be used to enable
  SFrame support of the GNU C Libraries.  SFrame is a new stack trace
  information format which can be used by backtrace.  It requires
  binutils with a minimum version of 2.45.

* Support for lightweight stack guard pages via madvise and the
  MADV_GUARD_INSTALL flag has been added to pthread_create.

* Additional optimized and correctly rounded mathematical functions have
  been imported from the CORE-MATH project, in particular acospif,
  asinpif, atanpif, atan2pif, cospif, sinpif, tanpif.

* The testsuite has been significantly extended, including coverage of
  the functionality of the printf and scanf function families in many
  variants.

* The manual has been significantly extended and updated, particularly
  the threads, terminal, filesystem, resource, and math chapters.

* Code has been added to detect the x86-64 Intel Arrow Lake, Panther
  Lake, Clearwater Forest, and Diamond Rapids microarchitectures.

* Regarding S390, support for the new z17 platform has been added.

Deprecated and removed features, and other changes affecting compatibility:

* The glibc.rtld.execstack tunable now supports a compatibility mode to
  allow programs that require an executable stack through dynamically
  loaded shared libraries.

* On Linux, the <termio.h> header and the definition of struct termio
  in <sys/ioctl.h> have been removed. The termio interface has been
  obsolete since the very first version of POSIX.1 in 1988, replaced
  with <termios.h>.

* The support for TX lock elision of pthread mutexes has been deprecated
  on all architectures and will be removed in the next release.

* On AArch64 Linux targets supporting the Scalable Matrix Extension
  (SME), setjmp and sigsetjmp will disable the ZA state of SME.

Changes to build and runtime requirements:

* GCC 12.1 or later is now required to build the GNU C Library.

* GNU Binutils 2.39 or later is now required to build the GNU C Library.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
[Julien: resolve conflict with commit feaf53585a]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/glibc/glibc.hash                                   |  2 +-
 package/glibc/glibc.mk                                     |  2 +-
 .../0001-HACK-only-build-and-install-localedef.patch       |  8 ++++----
 ...lax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 14 +++++++-------
 ...K-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch | 10 +++++-----
 package/localedef/localedef.mk                             |  2 +-
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 0deba84dc7..538f8b69a7 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  166b6e7637bb45cb9352e4813005f83dd48f03ef634d3e9e94a30aa5a0300fab  glibc-2.41-70-g1502c248d58cb99a203731707987a4342926e830.tar.gz
+sha256  a364a548ebda9c570f5bf62bf5e4ad3240a90056455b9edfbf1472a7254bd1c0  glibc-2.42-3-gbc13db73937730401d592b33092db6df806d193e.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 239e39a2ba..b0fa66218a 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
+GLIBC_VERSION = 2.42-3-gbc13db73937730401d592b33092db6df806d193e
 
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
diff --git a/package/localedef/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
index bcec4067c2..dd3906eb37 100644
--- a/package/localedef/0001-HACK-only-build-and-install-localedef.patch
+++ b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
@@ -1,4 +1,4 @@
-From b90ae9abee7e5cc3a92b053f00db959c853a745e Mon Sep 17 00:00:00 2001
+From a3006d23a58d825dcaa4863ce81a454e151d038d Mon Sep 17 00:00:00 2001
 From: Michael Olbrich <m.olbrich@pengutronix.de>
 Date: Mon, 21 May 2018 16:45:02 +0200
 Subject: [PATCH] HACK: only build and install localedef
@@ -17,10 +17,10 @@ Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
  2 files changed, 10 insertions(+), 7 deletions(-)
 
 diff --git a/Rules b/Rules
-index c8adc00008..4acf69790f 100644
+index 44c041c491..156c82619b 100644
 --- a/Rules
 +++ b/Rules
-@@ -234,10 +234,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
+@@ -239,10 +239,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
  				       $(binaries-all-notests))
  
  ifneq "$(strip $(binaries-shared-notests))" ""
@@ -70,5 +70,5 @@ index 9d9c1a7691..4d26032c15 100644
  
  libBrokenLocale-routines = broken_cur_max
 -- 
-2.48.1
+2.50.1
 
diff --git a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index af352eee5f..cc11c9a08c 100644
--- a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -1,4 +1,4 @@
-From df211e396f3a2183eed33dc3ac05ecea6bc16f0a Mon Sep 17 00:00:00 2001
+From 2cb626348a64846b836a878ab7fc93f54eb0afd6 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Thu, 6 Feb 2020 14:36:21 -0600
 Subject: [PATCH] relax dependency on GCC to 4.8 and binutils to 2.24
@@ -35,27 +35,27 @@ Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index eb8abd0054..24abd55594 100755
+index 180e49d95b..fdb19d1d27 100755
 --- a/configure
 +++ b/configure
-@@ -5329,7 +5329,7 @@ printf %s "checking version of $LD... " >&6; }
+@@ -5352,7 +5352,7 @@ printf %s "checking version of $LD... " >&6; }
    ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
--    2.1[0-9][0-9]*|2.2[5-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
+-    2.[1-9][0-9][0-9]*|2.39*|2.[4-9][0-9]*|[3-9].*|[1-9][0-9]*)
 +    2.1[0-9][0-9]*|2.2[4-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
  
-@@ -5777,7 +5777,7 @@ int
+@@ -5801,7 +5801,7 @@ int
  main (void)
  {
  
--#if !defined __GNUC__ || __GNUC__ < 6 || (__GNUC__ == 6 && __GNUC_MINOR__ < 2)
+-#if !defined __GNUC__ || __GNUC__ < 12 || (__GNUC__ == 12 && __GNUC_MINOR__ < 1)
 +#if !defined __GNUC__ || __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
  #error insufficient compiler
  #endif
    ;
 -- 
-2.48.1
+2.50.1
 
diff --git a/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch b/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
index 64dbdefed2..5c3803d583 100644
--- a/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
+++ b/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
@@ -1,8 +1,8 @@
-From 7f52329793c88260260631593c9bc558b7eb01f8 Mon Sep 17 00:00:00 2001
+From c01b78e37885c7c4a191f752dc346c848d73b731 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 9 Sep 2023 23:58:50 +0200
-Subject: [PATCH] HACK: keep _ISOC23_SOURCE undefined to build localedef with
- old glibc
+Subject: [PATCH] HACK: keep _ISOC23_SOURCE undefined to build localedef
+ with old glibc
 
 Fixes:
 host-localedef-2.38-13-g92201f16cbcfd9eafe314ef6654be2ea7ba25675/build/locale/ld-ctype.o: in function `ctype_read':
@@ -19,7 +19,7 @@ Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
  1 file changed, 2 deletions(-)
 
 diff --git a/include/features.h b/include/features.h
-index 44bc4bbc85..c856368a71 100644
+index 8515b06b36..9abd65af93 100644
 --- a/include/features.h
 +++ b/include/features.h
 @@ -217,9 +217,7 @@
@@ -33,5 +33,5 @@ index 44bc4bbc85..c856368a71 100644
  # define _POSIX_SOURCE	1
  # undef  _POSIX_C_SOURCE
 -- 
-2.48.1
+2.50.1
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index c76a8d82a0..c34fe22b5e 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-70-g1502c248d58cb99a203731707987a4342926e830
+LOCALEDEF_VERSION = 2.42-3-gbc13db73937730401d592b33092db6df806d193e
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
