Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6F4DC30658
	for <buildroot@archiver.kernel.org>; Tue,  2 Jul 2024 19:44:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A61A58127C;
	Tue,  2 Jul 2024 19:44:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AegNTyloOn4b; Tue,  2 Jul 2024 19:44:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 007C7811C4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 007C7811C4;
	Tue,  2 Jul 2024 19:44:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D258B1BF303
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:44:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C002B4155B
 for <buildroot@lists.busybox.net>; Tue,  2 Jul 2024 19:44:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4bXdRlCC7lR for <buildroot@lists.busybox.net>;
 Tue,  2 Jul 2024 19:44:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C513941518
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C513941518
 for <buildroot@buildroot.org>; Tue,  2 Jul 2024 19:44:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id AF90283B28; Tue,  2 Jul 2024 19:44:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 2 Jul 2024 21:33:03 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 328721a6e053043043309ddc8eb23f9aae36bb72
X-Git-Newrev: d285e9efae37219dec7e5a4dfd013d611439c6a9
X-Patchwork-Hint: ignore
Message-Id: <20240702194447.AF90283B28@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/sdl_mixer: update the patches to
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

commit: https://git.buildroot.net/buildroot/commit/?id=d285e9efae37219dec7e5a4dfd013d611439c6a9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, sdl_mixer fails to build with output:

    Applying 0002-configure__set_macro_directory.patch using patch:
    patching file configure.ac
    Hunk #1 FAILED at 2.
    1 out of 1 hunk FAILED -- saving rejects to file configure.ac.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/sdl_mixer/0002-configure__set_macro_directory.patch | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/package/sdl_mixer/0002-configure__set_macro_directory.patch b/package/sdl_mixer/0002-configure__set_macro_directory.patch
index 9802333a1d..cad9baa9c3 100644
--- a/package/sdl_mixer/0002-configure__set_macro_directory.patch
+++ b/package/sdl_mixer/0002-configure__set_macro_directory.patch
@@ -20,13 +20,15 @@ Fixes:
     libtool: and run autoconf again.
 
 Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff --git a/configure.ac b/configure.ac
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1,6 +1,7 @@
- dnl Process this file with autoconf to produce a configure script.
- AC_INIT(README)
+@@ -2,6 +2,7 @@ dnl Process this file with autoconf to produce a configure script.
+ AC_INIT
+ AC_CONFIG_SRCDIR([mixer.c])
  AC_CONFIG_AUX_DIR(build-scripts)
 +AC_CONFIG_MACRO_DIR([acinclude])
  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
