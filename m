Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 759C2C30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 07:59:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 475B2810D9;
	Tue,  2 Jul 2024 07:59:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y6W2LTRnVWAy; Tue,  2 Jul 2024 07:59:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 183F1810C5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 183F1810C5;
	Tue,  2 Jul 2024 07:59:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id EAAB71BF31C
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:59:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E35C3606AE
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgenQFnxmPBw for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 07:59:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E5DE1606B6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id E5DE1606B6
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 07:59:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D051B83AC8; Tue,  2 Jul 2024 07:59:19 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 09:53:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 6524a5966454181fd879a492fc4815520a5d0514
X-Git-Newrev: b2c5c608a366faed8af312a59e9ad22eec69be5f
X-Patchwork-Hint: ignore
Message-Id: <20240702075919.D051B83AC8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libtheora: update the patches to
 be applied with fuzz 0
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=b2c5c608a366faed8af312a59e9ad22eec69be5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, theora fails to build with output:

    Applying 0002-fix-autoreconf.patch using patch:
    patching file Makefile.am
    Hunk #1 FAILED at 4.
    1 out of 1 hunk FAILED -- saving rejects to file Makefile.am.rej
    patching file configure.ac
    Hunk #1 FAILED at 68.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

While we're at it, fix the usage of the Upstream: tag and update
.checkpackageignore accordingly.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 .checkpackageignore                         |  1 -
 package/libtheora/0002-fix-autoreconf.patch | 14 +++++++-------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/.checkpackageignore b/.checkpackageignore
index 8fc0f4e798..d4a4b47274 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -910,7 +910,6 @@ package/libsvgtiny/0004-Build-Include-gperf-generated-code-directly.patch lib_pa
 package/libtalloc/0001-buildtools-wafsamba-add-disable-stack-protector-opti.patch lib_patch.Upstream
 package/libtelnet/0001-fix-compilation-without-zlib.patch lib_patch.Upstream
 package/libtheora/0001-link-libtheoradec.patch lib_patch.Upstream
-package/libtheora/0002-fix-autoreconf.patch lib_patch.Upstream
 package/libtomcrypt/0001-fix-CVE-2019-17362.patch lib_patch.Upstream
 package/libtommath/0001-Build-test-bn_mp_set_double-c-on-more-platforms.patch lib_patch.Upstream
 package/libtorrent/0001-libtorrent.pc.in-add-Libs.Private.patch lib_patch.Upstream
diff --git a/package/libtheora/0002-fix-autoreconf.patch b/package/libtheora/0002-fix-autoreconf.patch
index dd3f473222..27fc379ad4 100644
--- a/package/libtheora/0002-fix-autoreconf.patch
+++ b/package/libtheora/0002-fix-autoreconf.patch
@@ -1,9 +1,10 @@
 Fix broken autoreconf
 
-Downloaded from upstream git
-https://git.xiph.org/?p=theora.git;a=commitdiff;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
+Upstream: https://git.xiph.org/?p=theora.git;a=commitdiff;h=28cc6dbd9b2a141df94f60993256a5fca368fa54
 
 Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 
 From: Tim Terriberry <tterribe@xiph.org>
@@ -22,9 +23,8 @@ diff --git a/Makefile.am b/Makefile.am
 index 89fd753..1783857 100644
 --- a/Makefile.am
 +++ b/Makefile.am
-@@ -4,6 +4,8 @@
- #AUTOMAKE_OPTIONS = foreign 1.7 dist-zip dist-bzip2
- AUTOMAKE_OPTIONS = foreign 1.11 dist-zip dist-xz
+@@ -2,5 +2,7 @@
+ AUTOMAKE_OPTIONS = foreign 1.6 dist-zip dist-bzip2
  
 +ACLOCAL_AMFLAGS=-I m4
 +
@@ -35,7 +35,7 @@ diff --git a/configure.ac b/configure.ac
 index 1cbec1a..456b603 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -68,7 +68,7 @@ AC_LIBTOOL_WIN32_DLL
+@@ -61,7 +61,7 @@ AC_LIBTOOL_WIN32_DLL
  AM_PROG_LIBTOOL
  
  dnl Add parameters for aclocal
@@ -43,4 +43,4 @@ index 1cbec1a..456b603 100644
 +AC_CONFIG_MACRO_DIR([m4])
  
  dnl Check for doxygen
- AC_ARG_ENABLE([doc],
+ AC_CHECK_PROG(HAVE_DOXYGEN, doxygen, true, false)
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
