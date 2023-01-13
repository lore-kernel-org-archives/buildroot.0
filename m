Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD8BDC54EBD
	for <buildroot@archiver.kernel.org>; Fri, 13 Jan 2023 07:54:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 48C5D812F7;
	Fri, 13 Jan 2023 07:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 48C5D812F7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IhIY9MroXgOS; Fri, 13 Jan 2023 07:53:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7648C812EB;
	Fri, 13 Jan 2023 07:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7648C812EB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2E7E31BF330
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 07:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A69D60B6A
 for <buildroot@lists.busybox.net>; Fri, 13 Jan 2023 07:53:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0A69D60B6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eq0fht3DTmRy for <buildroot@lists.busybox.net>;
 Fri, 13 Jan 2023 07:53:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9210360AAC
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9210360AAC
 for <buildroot@buildroot.org>; Fri, 13 Jan 2023 07:53:54 +0000 (UTC)
Received: (Authenticated sender: peter@korsgaard.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 3E6401BF203;
 Fri, 13 Jan 2023 07:53:50 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@dell.be.48ers.dk>)
 id 1pGEsn-003YTX-U2; Fri, 13 Jan 2023 08:53:49 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 13 Jan 2023 08:53:48 +0100
Message-Id: <20230113075348.847446-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] Cleanup/simplify copyright info
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Historically we have been (more-or-less consistently, sometimes forgetting
some files) updating the end year of the copyright statements at the
beginning of a new year.

We're naturally not alone in that.  Recently this was discussed in curl, and
it turns out that copyright years are not really required:

https://daniel.haxx.se/blog/2023/01/08/copyright-without-years/

So drop the years and simplify the copyright statements.  While we're at it,
also ensure the same syntax (capital C, email address) is used everywhere.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
