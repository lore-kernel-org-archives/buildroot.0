Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87D01C87FCB
	for <buildroot@archiver.kernel.org>; Wed, 30 Jul 2025 20:40:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A88F83A52;
	Wed, 30 Jul 2025 20:40:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Q0P5UhA8lYH; Wed, 30 Jul 2025 20:39:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0897583268
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0897583268;
	Wed, 30 Jul 2025 20:39:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id AAEF1186
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:39:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 68C9D4085A
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:39:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r2QX8g1ss9aK for <buildroot@buildroot.org>;
 Wed, 30 Jul 2025 20:39:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2001:4b98:dc4:8::236;
 helo=relay16.mail.gandi.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org D833840F6D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D833840F6D
Received: from relay16.mail.gandi.net (relay16.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::236])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D833840F6D
 for <buildroot@buildroot.org>; Wed, 30 Jul 2025 20:39:52 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPA id E34F144A05;
 Wed, 30 Jul 2025 20:39:50 +0000 (UTC)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>
Date: Wed, 30 Jul 2025 22:39:45 +0200
Message-ID: <20250730203947.1097409-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250730203947.1097409-1-thomas.petazzoni@bootlin.com>
References: <20250730203947.1097409-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
X-GND-State: clean
X-GND-Score: -100
X-GND-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdelkeeludcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfitefpfffkpdcuggftfghnshhusghstghrihgsvgenuceurghilhhouhhtmecufedtudenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepvfhhohhmrghsucfrvghtrgiiiihonhhiuceothhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmqeenucggtffrrghtthgvrhhnpefgjeeuveelleekkefggefffeefhfduvdevjeeuleelhfduueeghfejfffgudetgfenucffohhmrghinhepshhouhhrtggvfigrrhgvrdhorhhgnecukfhppedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepihhnvghtpedvrgdtudemtggsudekmeekieegugemvddutddtmegrtddtfhemheelsgefmeegfhdvmeeifegusgdphhgvlhhopeifihhnughsuhhrfhdrhhhomhgvpdhmrghilhhfrhhomhepthhhohhmrghsrdhpvghtrgiiiihonhhisegsohhothhlihhnrdgtohhmpdhnsggprhgtphhtthhopeefpdhrtghpthhtohepsghuihhlughrohhothessghuihhlughrohhothdrohhrghdprhgtphhtthhopehthhhomhgrshdrphgvthgriiiiohhnihessghoohhtlhhinhdrtghom
 hdprhgtphhtthhopehrohhmrghinhdrnhgrohhurhesghhmrghilhdrtghomh
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1753907991;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=tAfZqHLKn3rGOzY0I4yWQfDuLKWiB9d6mOCCcsWbnhY=;
 b=nj47MuM8NKiLYJKbZtoPphnfRZemqTMExVttZ14XoccrVhKaHoa9lEGpKIzIvjUC5rylbo
 0pVD2YtUF6niMcnnUhBLjXDKsZSQ12REB2wzFnttRxDTEBnsFzrDoVgxktktXYsn62XeCF
 H7kAa3AGrDEKrfPulGDalGcKNPhi/huBG6BZ6ri3S1oPfC04M8Fmtoz4SfTUJYmaWWfzr/
 VNxWQQ8MMuZhw0L9TTpcoTzYDSA7uy6nvosLwF1TJ9khB/gEVwoAuzgQzCFJsdOKv+mBI7
 cfkJdM2DIBO78fSucCTebUiH18nN0LEacN26XM3Rog+lUYoFIz33cSvlUHoa3Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bootlin.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=nj47MuM8
Subject: [Buildroot] [PATCH 2/2] package/{glibc,
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
---
 package/glibc/glibc.hash                           |  2 +-
 package/glibc/glibc.mk                             |  2 +-
 ...001-HACK-only-build-and-install-localedef.patch |  8 ++++----
 ...ndency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 14 +++++++-------
 ...ISOC23_SOURCE-undefined-to-build-localede.patch | 10 +++++-----
 package/localedef/localedef.mk                     |  2 +-
 6 files changed, 19 insertions(+), 19 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index 61af3d9488..538f8b69a7 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  ed2cd1f058f22f682e700c5be408975db62025a14863a5a6700ee93d5927504e  glibc-2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163.tar.gz
+sha256  a364a548ebda9c570f5bf62bf5e4ad3240a90056455b9edfbf1472a7254bd1c0  glibc-2.42-3-gbc13db73937730401d592b33092db6df806d193e.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 29617b9756..d250b197c6 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163
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
index 7a6c94bd2f..c34fe22b5e 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163
+LOCALEDEF_VERSION = 2.42-3-gbc13db73937730401d592b33092db6df806d193e
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
