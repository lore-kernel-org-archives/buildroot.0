Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 235EFC46467
	for <buildroot@archiver.kernel.org>; Sat, 14 Jan 2023 20:16:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BBBA9415B5;
	Sat, 14 Jan 2023 20:16:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BBBA9415B5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id d96TEmRpWpUs; Sat, 14 Jan 2023 20:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D585415A9;
	Sat, 14 Jan 2023 20:16:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D585415A9
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id AC7581BF2A5
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:16:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86B74415A9
 for <buildroot@lists.busybox.net>; Sat, 14 Jan 2023 20:16:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86B74415A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8VMEMRMlZ_yn for <buildroot@lists.busybox.net>;
 Sat, 14 Jan 2023 20:16:21 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3B6BE415A4
 for <buildroot@buildroot.org>; Sat, 14 Jan 2023 20:16:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3B6BE415A4
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 273D787B44; Sat, 14 Jan 2023 20:16:21 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat, 14 Jan 2023 21:16:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 664897295a3667db2ff95c5c1b458b16c1192a47
X-Git-Newrev: f1d7155952d9abcad4d5d75b56508114469c2a1c
X-Patchwork-Hint: ignore
Message-Id: <20230114201621.273D787B44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Cleanup/simplify copyright info
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
