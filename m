Return-Path: <SRS0=2pYX=NR=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 195F7C432BE
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:36:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id BA9C060FF2
	for <buildroot@archiver.kernel.org>; Thu, 26 Aug 2021 22:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org BA9C060FF2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 93A98606B6;
	Thu, 26 Aug 2021 22:36:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2k2rQjTX30Mm; Thu, 26 Aug 2021 22:36:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 293EC614A8;
	Thu, 26 Aug 2021 22:36:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id F087D1BF33E
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:04:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 67B47407C5
 for <buildroot@lists.busybox.net>; Thu, 26 Aug 2021 22:03:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3d0PHLONH0ab for <buildroot@lists.busybox.net>;
 Thu, 26 Aug 2021 22:02:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14439407DE
 for <buildroot@buildroot.org>; Thu, 26 Aug 2021 22:02:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 6981C8DC50; Thu, 26 Aug 2021 22:01:34 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 26 Aug 2021 23:49:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e17e37bcea2a1e96bd3caf608a0265fac9e05bfa
X-Git-Newrev: 61730de4c0a83e7309bfd766df58c14410a543b3
X-Patchwork-Hint: ignore
Message-Id: <20210826220134.6981C8DC50@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/localedef: bump to
 version 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=61730de4c0a83e7309bfd766df58c14410a543b3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

resync the version with glibc package.

Dropped 2 patches (fixes backported from previous releases),
rebased 2 which are kept (only line numbers changed).

Suggested-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
[Arnout: resolve conflicts]
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 .../0001-HACK-only-build-and-install-localedef.patch        |  8 ++++----
 ...elax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch | 13 ++++++-------
 .../localedef.hash                                          |  2 +-
 package/localedef/localedef.mk                              |  2 +-
 4 files changed, 12 insertions(+), 13 deletions(-)

diff --git a/package/localedef/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/0001-HACK-only-build-and-install-localedef.patch b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-HACK-only-build-and-install-localedef.patch
similarity index 92%
rename from package/localedef/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/0001-HACK-only-build-and-install-localedef.patch
rename to package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-HACK-only-build-and-install-localedef.patch
index 0dcecc1a70..b289000c8a 100644
--- a/package/localedef/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/0001-HACK-only-build-and-install-localedef.patch
+++ b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0001-HACK-only-build-and-install-localedef.patch
@@ -1,4 +1,4 @@
-From 942f45364e7db805f0390c808ef656faa577a419 Mon Sep 17 00:00:00 2001
+From 442e9a3f262c49cf61f9e7bdf12882f0a427666b Mon Sep 17 00:00:00 2001
 From: Michael Olbrich <m.olbrich@pengutronix.de>
 Date: Mon, 21 May 2018 16:45:02 +0200
 Subject: [PATCH] HACK: only build and install localedef
@@ -13,10 +13,10 @@ Signed-off-by: Peter Seiderer <ps.report@gmx.net>
  2 files changed, 13 insertions(+), 7 deletions(-)
 
 diff --git a/Rules b/Rules
-index 082625bb71..2603c96734 100644
+index b1137afe71..2aeac31922 100644
 --- a/Rules
 +++ b/Rules
-@@ -212,10 +212,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
+@@ -216,10 +216,16 @@ binaries-shared-notests = $(filter-out $(binaries-pie) $(binaries-static), \
  				       $(binaries-all-notests))
  
  ifneq "$(strip $(binaries-shared-notests))" ""
@@ -61,5 +61,5 @@ index b7c60681fa..de4cf4003f 100644
  
  libBrokenLocale-routines = broken_cur_max
 -- 
-2.31.1
+2.33.0
 
diff --git a/package/localedef/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
similarity index 90%
rename from package/localedef/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
rename to package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
index 54c45650d5..297c96cc5e 100644
--- a/package/localedef/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
+++ b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/0002-relax-dependency-on-GCC-to-4.8-and-binutils-to-2.24.patch
@@ -1,4 +1,4 @@
-From ec4ebe89a7636da63ccff349d0f0c9f38ac3e3e1 Mon Sep 17 00:00:00 2001
+From 85412262460f6ba9f6e2cf8da74fc1904c54c854 Mon Sep 17 00:00:00 2001
 From: Matt Weber <matthew.weber@rockwellcollins.com>
 Date: Thu, 6 Feb 2020 14:36:21 -0600
 Subject: [PATCH] relax dependency on GCC to 4.8 and binutils to 2.24
@@ -29,10 +29,10 @@ Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
  1 file changed, 3 insertions(+), 3 deletions(-)
 
 diff --git a/configure b/configure
-index 1dc3af60b4..e3ee4e9fd7 100755
+index 9619c10991..0c481d2339 100755
 --- a/configure
 +++ b/configure
-@@ -4587,7 +4587,7 @@ $as_echo_n "checking version of $AS... " >&6; }
+@@ -4651,7 +4651,7 @@ $as_echo_n "checking version of $AS... " >&6; }
    ac_prog_version=`$AS --version 2>&1 | sed -n 's/^.*GNU assembler.* \([0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -41,7 +41,7 @@ index 1dc3af60b4..e3ee4e9fd7 100755
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
  
-@@ -4717,7 +4717,7 @@ $as_echo_n "checking version of $LD... " >&6; }
+@@ -4781,7 +4781,7 @@ $as_echo_n "checking version of $LD... " >&6; }
    ac_prog_version=`$LD --version 2>&1 | sed -n 's/^.*GNU ld.* \([0-9][0-9]*\.[0-9.]*\).*$/\1/p'`
    case $ac_prog_version in
      '') ac_prog_version="v. ?.??, bad"; ac_verc_fail=yes;;
@@ -50,7 +50,7 @@ index 1dc3af60b4..e3ee4e9fd7 100755
         ac_prog_version="$ac_prog_version, ok"; ac_verc_fail=no;;
      *) ac_prog_version="$ac_prog_version, bad"; ac_verc_fail=yes;;
  
-@@ -5126,7 +5126,7 @@ int
+@@ -5189,7 +5189,7 @@ int
  main ()
  {
  
@@ -60,5 +60,4 @@ index 1dc3af60b4..e3ee4e9fd7 100755
  #endif
    ;
 -- 
-2.31.1
-
+2.33.0
diff --git a/package/localedef/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/localedef.hash b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/localedef.hash
similarity index 70%
rename from package/localedef/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/localedef.hash
rename to package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/localedef.hash
index 4b8d8297ec..595de95a58 100644
--- a/package/localedef/2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f/localedef.hash
+++ b/package/localedef/2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/localedef.hash
@@ -1,5 +1,5 @@
 # Locally calculated (fetched from Github)
-sha256  3e2004b16ec6b79a19a88ed4736719ef9e419f9d8e7013faced654c0339e23dc  glibc-2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f.tar.gz
+sha256  1c7ed0f69ed268bd66f9754d0cb8fb65e0dafc1f9a1048ea50d1e96d60399686  glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4.tar.gz
 
 # Hashes for license files
 sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/localedef/localedef.mk b/package/localedef/localedef.mk
index d8dfdffaa2..87d921cffe 100644
--- a/package/localedef/localedef.mk
+++ b/package/localedef/localedef.mk
@@ -7,7 +7,7 @@
 # Use the same VERSION and SITE as target glibc
 # As in glibc.mk, generate version string using:
 #   git describe --match 'glibc-*' --abbrev=40 origin/release/MAJOR.MINOR/master | cut -d '-' -f 2-
-LOCALEDEF_VERSION = 2.33-46-gedfd11197ecf3629bbb4b66c5814da09a61a7f9f
+LOCALEDEF_VERSION = 2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4
 LOCALEDEF_SOURCE = glibc-$(LOCALEDEF_VERSION).tar.gz
 LOCALEDEF_SITE = $(call github,bminor,glibc,$(LOCALEDEF_VERSION))
 HOST_LOCALEDEF_DL_SUBDIR = glibc
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
