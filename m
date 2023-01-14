Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2100C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 23:16:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5E5ED82CF1;
	Mon, 20 Feb 2023 23:16:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5E5ED82CF1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H6v4oVAYy_P7; Mon, 20 Feb 2023 23:16:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70DE5832AA;
	Mon, 20 Feb 2023 23:16:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70DE5832AA
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D80171BF2E3
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4423B414E9
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4423B414E9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A1I6VjIX7ebC for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7CB7E41741
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CB7E41741
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 7A4A286495; Mon, 20 Feb 2023 20:52:32 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 21:16:07 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 664897295a3667db2ff95c5c1b458b16c1192a47
X-Git-Newrev: f1d7155952d9abcad4d5d75b56508114469c2a1c
X-Patchwork-Hint: ignore
Message-Id: <20230220205232.7A4A286495@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] Cleanup/simplify copyright info
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

commit: https://git.buildroot.net/buildroot/commit/?id=f1d7155952d9abcad4d5d75b56508114469c2a1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Historically we have been (more-or-less consistently, sometimes forgetting
some files) updating the end year of the copyright statements at the
beginning of a new year.

We're naturally not alone in that.  Recently this was discussed in curl, and
it turns out that copyright years are not really required:

https://daniel.haxx.se/blog/2023/01/08/copyright-without-years/

So drop the years and simplify the copyright statements.  While we're at it,
also ensure the same syntax (capital C, email address) is used everywhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Makefile                   | 4 +---
 docs/manual/manual.txt     | 2 +-
 docs/website/copyright.txt | 4 ++--
 3 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index efa0b2a7a0..8517d563d5 100644
--- a/Makefile
+++ b/Makefile
@@ -1,8 +1,6 @@
 # Makefile for buildroot
 #
-# Copyright (C) 1999-2005 by Erik Andersen <andersen@codepoet.org>
-# Copyright (C) 2006-2014 by the Buildroot developers <buildroot@uclibc.org>
-# Copyright (C) 2014-2020 by the Buildroot developers <buildroot@buildroot.org>
+# Copyright (C) the Buildroot developers <buildroot@buildroot.org>
 #
 # This program is free software; you can redistribute it and/or modify
 # it under the terms of the GNU General Public License as published by
diff --git a/docs/manual/manual.txt b/docs/manual/manual.txt
index fab66dbda5..d6534ca295 100644
--- a/docs/manual/manual.txt
+++ b/docs/manual/manual.txt
@@ -12,7 +12,7 @@ It is licensed under the GNU General Public License, version 2. Refer to the
 http://git.buildroot.org/buildroot/tree/COPYING?id={sys:git rev-parse HEAD}[COPYING]
 file in the Buildroot sources for the full text of this license.
 
-Copyright (C) 2004-2020 The Buildroot developers
+Copyright (C) The Buildroot developers <buildroot@buildroot.org>
 
 image::logo.png[]
 
diff --git a/docs/website/copyright.txt b/docs/website/copyright.txt
index b15ac5f919..3fe19bab8b 100644
--- a/docs/website/copyright.txt
+++ b/docs/website/copyright.txt
@@ -1,7 +1,7 @@
 
 The code and graphics on this website (and it's mirror sites, if any) are
-Copyright (c) 1999-2005 by Erik Andersen, 2006-2020 The Buildroot
-developers. All rights reserved.
+Copyright (C) The Buildroot developers <buildroot@buildroot.org>.  All
+rights reserved.
 
 Documents on this Web site including their graphical elements, design, and
 layout are protected by trade dress and other laws and MAY BE COPIED OR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
