Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B10C433EF
	for <buildroot@archiver.kernel.org>; Sat, 11 Dec 2021 10:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B9A7E856FC;
	Sat, 11 Dec 2021 10:10:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V5CrTtDTWxkP; Sat, 11 Dec 2021 10:10:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D158856F8;
	Sat, 11 Dec 2021 10:10:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 662BB1BF46A
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:10:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 558DB856F1
 for <buildroot@lists.busybox.net>; Sat, 11 Dec 2021 10:10:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jr684RQd4b1E for <buildroot@lists.busybox.net>;
 Sat, 11 Dec 2021 10:10:54 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F6B4856F0
 for <buildroot@buildroot.org>; Sat, 11 Dec 2021 10:10:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 6161B82784; Sat, 11 Dec 2021 10:05:46 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 11 Dec 2021 11:09:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c4b305bd818fb0151247dd5368c3221cba97dd97
X-Git-Newrev: bbd29df2e55354bcd158379b4503965def2713a1
X-Patchwork-Hint: ignore
Message-Id: <20211211100546.6161B82784@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/beagleboneai/patches/uboot: drop
 0002-Remove-redundant-YYLOC-global-declaration.patch
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=bbd29df2e55354bcd158379b4503965def2713a1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935106

This was missed when next was merged into master, bumping u-boot to 2021.04.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...Remove-redundant-YYLOC-global-declaration.patch | 28 ----------------------
 1 file changed, 28 deletions(-)

diff --git a/board/beagleboneai/patches/uboot/0002-Remove-redundant-YYLOC-global-declaration.patch b/board/beagleboneai/patches/uboot/0002-Remove-redundant-YYLOC-global-declaration.patch
deleted file mode 100644
index c9d5d71ca1..0000000000
--- a/board/beagleboneai/patches/uboot/0002-Remove-redundant-YYLOC-global-declaration.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-From 018921ee79d3f30893614b3b2b63b588d8544f73 Mon Sep 17 00:00:00 2001
-From: Peter Robinson <pbrobinson@gmail.com>
-Date: Thu, 30 Jan 2020 09:37:15 +0000
-Subject: [PATCH] Remove redundant YYLOC global declaration
-
-Same as the upstream fix for building dtc with gcc 10.
-
-Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
-Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
----
- scripts/dtc/dtc-lexer.l | 1 -
- 1 file changed, 1 deletion(-)
-
-diff --git a/scripts/dtc/dtc-lexer.l b/scripts/dtc/dtc-lexer.l
-index fd825ebba6..24af549977 100644
---- a/scripts/dtc/dtc-lexer.l
-+++ b/scripts/dtc/dtc-lexer.l
-@@ -38,7 +38,6 @@ LINECOMMENT	"//".*\n
- #include "srcpos.h"
- #include "dtc-parser.tab.h"
- 
--YYLTYPE yylloc;
- extern bool treesource_error;
- 
- /* CAUTION: this will stop working if we ever use yyless() or yyunput() */
--- 
-2.20.1
-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
