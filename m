Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 305AEC3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 20:20:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEDDE60804;
	Mon,  8 Jul 2024 20:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yJzvP7i8aenk; Mon,  8 Jul 2024 20:20:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE6B9608E9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EE6B9608E9;
	Mon,  8 Jul 2024 20:20:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ADCE51BF275
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9A87C404E1
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 20:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IuOEvccDb8Zy for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8C8DE404D4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8C8DE404D4
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 842FC83FEE; Mon,  8 Jul 2024 20:20:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 22:13:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3805820d550467121d74320a8fb76663fb57b698
X-Git-Newrev: 2898d7bef63adf677bdb8c0d0d4d7da93bddc7e8
X-Patchwork-Hint: ignore
Message-Id: <20240708202012.842FC83FEE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dahdi-tools: update the patches to
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2898d7bef63adf677bdb8c0d0d4d7da93bddc7e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, dahdi-tools fails to build with output:

    Applying 0002-no-perl-manpages.patch using patch:
    patching file xpp/Makefile.am
    Hunk #2 FAILED at 58.
    Hunk #3 succeeded at 149 (offset 3 lines).
    1 out of 3 hunks FAILED -- saving rejects to file xpp/Makefile.am.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/dahdi-tools/0002-no-perl-manpages.patch | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/dahdi-tools/0002-no-perl-manpages.patch b/package/dahdi-tools/0002-no-perl-manpages.patch
index dae1b6c3c0..5f24c81994 100644
--- a/package/dahdi-tools/0002-no-perl-manpages.patch
+++ b/package/dahdi-tools/0002-no-perl-manpages.patch
@@ -6,6 +6,8 @@ so the install step fails.
 Just disable them.
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -durN dahdi-tools-2.11.0.orig/xpp/Makefile.am dahdi-tools-2.11.0/xpp/Makefile.am
 --- dahdi-tools-2.11.0.orig/xpp/Makefile.am	2015-12-22 21:19:12.000000000 +0100
@@ -25,8 +27,8 @@ diff -durN dahdi-tools-2.11.0.orig/xpp/Makefile.am dahdi-tools-2.11.0/xpp/Makefi
 -man_MANS		+= $(perl_mans)
  CLEANFILES		= $(perl_checks) $(perl_mans)
  
- if	PBX_USB
-@@ -147,8 +145,6 @@
+ dracutconfdir = @prefix@/lib/dracut/dracut.conf.d
+@@ -150,8 +148,6 @@
  		astribank_allow.8 \
  		astribank_is_starting.8
  
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
