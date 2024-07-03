Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85880C31D97
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48235402FD;
	Wed,  3 Jul 2024 14:01:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27I1qFwK2u_V; Wed,  3 Jul 2024 14:01:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2000940347
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2000940347;
	Wed,  3 Jul 2024 14:01:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03E1C1BF302
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E494F40347
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 14:01:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SOB2c3ejelp5 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 14:01:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DE185402FD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE185402FD
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 14:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BFD3E8378E; Wed,  3 Jul 2024 14:01:01 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 3 Jul 2024 15:59:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b751a7b90f313188bd1b8d425a8a8082d60be712
X-Git-Newrev: a45d68b3c40ddcefd14b4346fc42649e433e90ff
X-Patchwork-Hint: ignore
Message-Id: <20240703140101.BFD3E8378E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libsvg: update the patches to be
 applied with fuzz 0
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=a45d68b3c40ddcefd14b4346fc42649e433e90ff
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 8f88a644ed7d6 ("support/scripts/apply-patches.sh: set the maximum
fuzz factor to 0") reduced the fuzz factor.

Due to this change, libsvg fails to build with output:

    Applying 0001-fix-expat-static-declaration.patch using patch:
    patching file src/svg_parser_expat.c
    Hunk #2 FAILED at 44.
    1 out of 2 hunks FAILED -- saving rejects to file src/svg_parser_expat.c.rej

This commit refreshes the package patch on the current package version.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/libsvg/0001-fix-expat-static-declaration.patch | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/libsvg/0001-fix-expat-static-declaration.patch b/package/libsvg/0001-fix-expat-static-declaration.patch
index 58ef286729..1086785d0f 100644
--- a/package/libsvg/0001-fix-expat-static-declaration.patch
+++ b/package/libsvg/0001-fix-expat-static-declaration.patch
@@ -12,6 +12,8 @@ Patch based on
 http://oe-lite.org/redmine/projects/xorg/repository/revisions/c4df7951e846e1be718f37f2455696a1d0861f3d/entry/recipes/cairo/libsvg-0.1.4/gcc4_and_expat.patch
 
 Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
+[Dario: make the patch to be applied with fuzz factor 0]
+Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 
 diff -bur libsvg-0.1.4~orig/src/svg_parser_expat.c libsvg-0.1.4/src/svg_parser_expat.c
 --- libsvg-0.1.4~orig/src/svg_parser_expat.c	2005-02-14 11:26:26.000000000 -0600
@@ -31,3 +33,4 @@ diff -bur libsvg-0.1.4~orig/src/svg_parser_expat.c libsvg-0.1.4/src/svg_parser_e
 +#endif
  
  static void
+ _svg_parser_sax_warning (void		*closure,
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
