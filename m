Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69093C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CBC344F822;
	Fri, 28 Feb 2025 17:10:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZCSOT7mTWupM; Fri, 28 Feb 2025 17:10:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 42F17502C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 42F17502C2;
	Fri, 28 Feb 2025 17:10:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 07FA81DD
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:43:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04FEB408BE
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTT2TET3sjn9 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6222A42CF5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6222A42CF5
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 594F787A92; Fri, 28 Feb 2025 16:30:29 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Feb 2025 12:28:26 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 4b133efbd30ef2116b8f76663ef0bf1fcd1dbc42
X-Git-Newrev: 6ecab31fad12a494ec0d2a3767c736a55c80a769
X-Patchwork-Hint: ignore
Message-Id: <20250228163029.594F787A92@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/{glibc,
 localedef}: bump to version 2.41
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ecab31fad12a494ec0d2a3767c736a55c80a769
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Release notes:
https://lists.gnu.org/archive/html/info-gnu/2025-01/msg00014.html

The only thing that required a small change is our
0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch to
continue to fix the build issue it aims at fixing, by taking into
account changes in glibc 2.41.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/glibc/glibc.hash                                   |  2 +-
 package/glibc/glibc.mk                                     |  3 ++-
 .../0001-HACK-only-build-and-install-localedef.patch       | 10 +++++-----
 ...lax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 10 +++++-----
 ...K-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch | 14 ++++++++------
 package/localedef/localedef.mk                             |  2 +-
 6 files changed, 22 insertions(+), 19 deletions(-)

diff --git a/package/glibc/glibc.hash b/package/glibc/glibc.hash
index bfb2942abb..f6d3ce6f2b 100644
--- a/package/glibc/glibc.hash
+++ b/package/glibc/glibc.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  6426766187d177412e7f3daed793dec93fce417db5ae99296c0d880aa808091e  glibc-2.40-18-g5641780762723156b0d20a0b9f7df1d76831bab0.tar.gz
+sha256  ed2cd1f058f22f682e700c5be408975db62025a14863a5a6700ee93d5927504e  glibc-2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 25e28c7cf6..29617b9756 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -7,7 +7,8 @@
 # Generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
 # When updating the version, please also update localedef
-GLIBC_VERSION = 2.40-18-g5641780762723156b0d20a0b9f7df1d76831bab0
+GLIBC_VERSION = 2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163
+
 # Upstream doesn't officially provide an https download link.
 # There is one (https://sourceware.org/git/glibc.git) but it's not reliable,
 # sometimes the connection times out. So use an unofficial github mirror.
diff --git a/package/localedef/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
index ef126c6bd3..bcec4067c2 100644
--- a/package/localedef/0001-HACK-only-build-and-install-localedef.patch
+++ b/package/localedef/0001-HACK-only-build-and-install-localedef.patch
@@ -1,4 +1,4 @@
-From 03b1573ca341f1852ac05a884a68ed375cceccc0 Mon Sep 17 00:00:00 2001
+From b90ae9abee7e5cc3a92b053f00db959c853a745e Mon Sep 17 00:00:00 2001
 From: Michael Olbrich <m.olbrich@pengutronix.de>
 Date: Mon, 21 May 2018 16:45:02 +0200
 Subject: [PATCH] HACK: only build and install localedef
@@ -17,10 +17,10 @@ Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
  2 files changed, 10 insertions(+), 7 deletions(-)
 
 diff --git a/Rules b/Rules
-index 9010c5d5b2..f5e5525061 100644
+index c8adc00008..4acf69790f 100644
 --- a/Rules
 +++ b/Rules
-@@ -223,10 +223,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
+@@ -234,10 +234,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
  				       $(binaries-all-notests))
  
  ifneq "$(strip $(binaries-shared-notests))" ""
@@ -42,7 +42,7 @@ index 9010c5d5b2..f5e5525061 100644
  
  ifneq "$(strip $(binaries-shared-tests))" ""
 diff --git a/locale/Makefile b/locale/Makefile
-index 2810f28605..6b4cc9e831 100644
+index 9d9c1a7691..4d26032c15 100644
 --- a/locale/Makefile
 +++ b/locale/Makefile
 @@ -76,7 +76,6 @@ aux = \
@@ -70,5 +70,5 @@ index 2810f28605..6b4cc9e831 100644
  
  libBrokenLocale-routines = broken_cur_max
 -- 
-2.45.2
+2.48.1
 
diff --git a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index b8e53a23a6..af352eee5f 100644
--- a/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -1,4 +1,4 @@
-From 1ddee6fdcde6b12df22619380d51b47e6c8f2c08 Mon Sep 17 00:00:00 2001
+From df211e396f3a2183eed33dc3ac05ecea6bc16f0a Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Thu, 6 Feb 2020 14:36:21 -0600
 Subject: [PATCH] relax dependency on GCC to 4.8 and binutils to 2.24
@@ -35,10 +35,10 @@ Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
  1 file changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure b/configure
-index 1d543548cd..3e13c46b2e 100755
+index eb8abd0054..24abd55594 100755
 --- a/configure
 +++ b/configure
-@@ -5302,7 +5302,7 @@ printf %s "checking version of $LD... " >&6; }
+@@ -5329,7 +5329,7 @@ printf %s "checking version of $LD... " >&6; }
    ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -47,7 +47,7 @@ index 1d543548cd..3e13c46b2e 100755
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
  
-@@ -5750,7 +5750,7 @@ int
+@@ -5777,7 +5777,7 @@ int
  main (void)
  {
  
@@ -57,5 +57,5 @@ index 1d543548cd..3e13c46b2e 100755
  #endif
    ;
 -- 
-2.45.2
+2.48.1
 
diff --git a/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch b/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
index 57a8f8e35c..64dbdefed2 100644
--- a/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
+++ b/package/localedef/0003-HACK-keep-_ISOC23_SOURCE-undefined-to-build-localede.patch
@@ -1,4 +1,4 @@
-From efc989e7e5dcbc38ccc32634e49cfc2881c5a318 Mon Sep 17 00:00:00 2001
+From 7f52329793c88260260631593c9bc558b7eb01f8 Mon Sep 17 00:00:00 2001
 From: Romain Naour <romain.naour@gmail.com>
 Date: Sat, 9 Sep 2023 23:58:50 +0200
 Subject: [PATCH] HACK: keep _ISOC23_SOURCE undefined to build localedef with
@@ -15,21 +15,23 @@ Signed-off-by: Romain Naour <romain.naour@gmail.com>
 to _ISOC23_SOURCE]
 Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
 ---
- include/features.h | 1 -
- 1 file changed, 1 deletion(-)
+ include/features.h | 2 --
+ 1 file changed, 2 deletions(-)
 
 diff --git a/include/features.h b/include/features.h
-index 093de6f44c..8d9ca6e402 100644
+index 44bc4bbc85..c856368a71 100644
 --- a/include/features.h
 +++ b/include/features.h
-@@ -215,7 +215,6 @@
+@@ -217,9 +217,7 @@
  # undef  _ISOC11_SOURCE
  # define _ISOC11_SOURCE	1
  # undef  _ISOC23_SOURCE
 -# define _ISOC23_SOURCE	1
+ # undef  _ISOC2Y_SOURCE
+-# define _ISOC2Y_SOURCE	1
  # undef  _POSIX_SOURCE
  # define _POSIX_SOURCE	1
  # undef  _POSIX_C_SOURCE
 -- 
-2.45.2
+2.48.1
 
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index b3e8ab5a1b..7a6c94bd2f 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.40-18-g5641780762723156b0d20a0b9f7df1d76831bab0
+LOCALEDEF_VERSION = 2.41-5-gcb7f20653724029be89224ed3a35d627cc5b4163
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
