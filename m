Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAF84E6FE47
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 19:59:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E962384186;
	Fri,  6 Sep 2024 19:59:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Szd0CY6qPsXC; Fri,  6 Sep 2024 19:59:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DEAE78437F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DEAE78437F;
	Fri,  6 Sep 2024 19:59:51 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 157DF1BF980
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 318876077B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PPhwGrw0_pvJ for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 35DF4606F8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 35DF4606F8
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2931486EE1; Fri,  6 Sep 2024 19:58:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 12 Aug 2024 22:54:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee9d0183413ef1bec03b0703e1b917f3335aeda5
X-Git-Newrev: 74cb378aff231c4f4605d7f479b9ae1a7a4e1fb6
X-Patchwork-Hint: ignore
Message-Id: <20240906195853.2931486EE1@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/{glibc,
 localdef}: bump to version 2.40
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

commit: https://git.buildroot.net/buildroot/commit/?id=74cb378aff231c4f4605d7f479b9ae1a7a4e1fb6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit bumps glibc to version 2.40. See the release notes at:

https://sourceware.org/pipermail/libc-alpha/2024-July/158467.html

The patches against localedef are refreshed. The patch 0003 requires a
small change: the macro to tweak is no longer _ISOC2K_SOURCE, but
_ISOC23_SOURCE.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/glibc/glibc.hash                           |  2 +-
 package/glibc/glibc.mk                             |  2 +-
 ...001-HACK-only-build-and-install-localedef.patch | 30 +++++++++++-----------
 ...ndency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 16 ++++++------
 ...SOC23_SOURCE-undefined-to-build-localede.patch} | 17 +++++++-----
 package/localedef/localedef.mk                     |  2 +-
 6 files changed, 36 insertions(+), 33 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index aaf7848a7c..bfb2942abb 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  2858e8e47c4c0df32b526c56d5590ec939e8178201ee9526bb070999ce4aa1f2  glibc-2.39-74-g198632a05f6c7b9ab67d3331d8caace9ceabb685.tar.gz
+sha256  6426766187d177412e7f3daed793dec93fce417db5ae99296c0d880aa808091e  glibc-2.40-18-g5641780762723156b0d20a0b9f7df1d76831bab0.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index db6fa55819..cee03a16fd 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,7 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.39-74-g198632a05f6c7b9ab67d3331d8caace9ceabb685
+GLIBC_VERSION = 2.40-18-g5641780762723156b0d20a0b9f7df1d76831bab0
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
index a65c896eb7..ef126c6bd3 100644
--- a/package/localedef/0001-HACK-only-build-and-install-localedef.patch
+++ b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
@@ -1,4 +1,4 @@
-From bd5a87ea4a0cc0ba393a16bbeb166903e4085e8b Mon Sep 17 00:00:00 2001
+From 03b1573ca341f1852ac05a884a68ed375cceccc0 Mon Sep 17 00:00:00 2001
 From: Michael Olbrich <m.olbrich@pengutronix.de>
 Date: Mon, 21 May 2018 16:45:02 +0200
 Subject: [PATCH] HACK: only build and install localedef
@@ -13,16 +13,16 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 ---
  Rules           | 14 ++++++++++----
- locale/Makefile |  6 +++---
- 2 files changed, 13 insertions(+), 7 deletions(-)
+ locale/Makefile |  3 ---
+ 2 files changed, 10 insertions(+), 7 deletions(-)
 
 diff --git a/Rules b/Rules
-index 279ae490ac..1321956be6 100644
+index 9010c5d5b2..f5e5525061 100644
 --- a/Rules
 +++ b/Rules
-@@ -221,10 +221,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
+@@ -223,10 +223,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
  				       $(binaries-all-notests))
-
+ 
  ifneq "$(strip $(binaries-shared-notests))" ""
 -$(addprefix $(objpfx),$(binaries-shared-notests)): %: %.o \
 -  $(sort $(filter $(common-objpfx)lib%,$(link-libc))) \
@@ -39,13 +39,13 @@ index 279ae490ac..1321956be6 100644
 +			   $(common-objpfx)libc% $(+postinit),$^) \
 +	      $(link-extra-libs)
  endif
-
+ 
  ifneq "$(strip $(binaries-shared-tests))" ""
 diff --git a/locale/Makefile b/locale/Makefile
-index d7036b0855..68afdddc7f 100644
+index 2810f28605..6b4cc9e831 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
-@@ -76,7 +76,6 @@
+@@ -76,7 +76,6 @@ aux = \
    xlocale \
    # aux
  others = \
@@ -53,7 +53,7 @@ index d7036b0855..68afdddc7f 100644
    localedef \
    # others
  #others-static = \
-@@ -84,7 +83,6 @@
+@@ -84,7 +83,6 @@ others = \
  # locale \
  # # others-static
  install-bin = \
@@ -61,14 +61,14 @@ index d7036b0855..68afdddc7f 100644
    localedef \
    # install-bin
  extra-objs = \
-@@ -96,7 +94,6 @@
+@@ -96,7 +94,6 @@ extra-objs = \
  generated += C-translit.h
  before-compile += $(objpfx)C-translit.h
-
+ 
 -extra-libs = libBrokenLocale
  extra-libs-others = $(extra-libs)
-
+ 
  libBrokenLocale-routines = broken_cur_max
---
-2.41.0
+-- 
+2.45.2
 
diff --git a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index 1aecc24405..b8e53a23a6 100644
--- a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -1,4 +1,4 @@
-From add730a680075ed611797b9ea771bf977667a7de Mon Sep 17 00:00:00 2001
+From 1ddee6fdcde6b12df22619380d51b47e6c8f2c08 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Thu, 6 Feb 2020 14:36:21 -0600
 Subject: [PATCH] relax dependency on GCC to 4.8 and binutils to 2.24
@@ -35,10 +35,10 @@ Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 4ef387146d..4c6f91117d 100755
+index 1d543548cd..3e13c46b2e 100755
 --- a/configure
 +++ b/configure
-@@ -5157,7 +5157,7 @@ printf %s "checking version of $LD... " >&6; }
+@@ -5302,7 +5302,7 @@ printf %s "checking version of $LD... " >&6; }
    ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -46,16 +46,16 @@ index 4ef387146d..4c6f91117d 100755
 +    2.1[0-9][0-9]*|2.2[4-9]*|2.[3-9][0-9]*|[3-9].*|[1-9][0-9]*)
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
-
-@@ -5599,7 +5599,7 @@ int
+ 
+@@ -5750,7 +5750,7 @@ int
  main (void)
  {
-
+ 
 -#if !defined __GNUC__ || __GNUC__ < 6 || (__GNUC__ == 6 && __GNUC_MINOR__ < 2)
 +#if !defined __GNUC__ || __GNUC__ < 4 || (__GNUC__ == 4 && __GNUC_MINOR__ < 8)
  #error insufficient compiler
  #endif
    ;
---
-2.41.0
+-- 
+2.45.2
 
diff --git a/package/localedef/0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch b/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
similarity index 63%
rename from package/localedef/0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch
rename to package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
index 741bd7b47f..57a8f8e35c 100644
--- a/package/localedef/0003-HACK-keep-_ISOC2X_SOURCE-undefined-to-build-localede.patch
+++ b/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
@@ -1,7 +1,7 @@
-From babfa64585bef6c53c1d399a1c244aea89437c9e Mon Sep 17 00:00:00 2001
+From efc989e7e5dcbc38ccc32634e49cfc2881c5a318 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 9 Sep 2023 23:58:50 +0200
-Subject: [PATCH] HACK: keep _ISOC2X_SOURCE undefined to build localedef with
+Subject: [PATCH] HACK: keep _ISOC23_SOURCE undefined to build localedef with
  old glibc
 
 Fixes:
@@ -11,22 +11,25 @@ ld-ctype.c:(.text+0x6cef): undefined reference to `__isoc23_strtoul'
 Upstream: Not applicable
 
 Signed-off-by: Romain Naour <romain.naour@gmail.com>
+[Thomas: adapted to glibc 2.40, which required the logic to be changed
+to _ISOC23_SOURCE]
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
  include/features.h | 1 -
  1 file changed, 1 deletion(-)
 
 diff --git a/include/features.h b/include/features.h
-index 7c51b4a2e4..f385370d18 100644
+index 093de6f44c..8d9ca6e402 100644
 --- a/include/features.h
 +++ b/include/features.h
-@@ -207,7 +207,6 @@
+@@ -215,7 +215,6 @@
  # undef  _ISOC11_SOURCE
  # define _ISOC11_SOURCE	1
- # undef  _ISOC2X_SOURCE
--# define _ISOC2X_SOURCE	1
+ # undef  _ISOC23_SOURCE
+-# define _ISOC23_SOURCE	1
  # undef  _POSIX_SOURCE
  # define _POSIX_SOURCE	1
  # undef  _POSIX_C_SOURCE
 -- 
-2.41.0
+2.45.2
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index 6940900f8d..b3e8ab5a1b 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.39-74-g198632a05f6c7b9ab67d3331d8caace9ceabb685
+LOCALEDEF_VERSION = 2.40-18-g5641780762723156b0d20a0b9f7df1d76831bab0
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
