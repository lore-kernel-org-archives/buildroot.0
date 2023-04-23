Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9A4CC77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 10:43:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 556F240B67;
	Sun, 23 Apr 2023 10:43:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 556F240B67
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iEIiti1-WunK; Sun, 23 Apr 2023 10:43:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CFBF4059F;
	Sun, 23 Apr 2023 10:43:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7CFBF4059F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EE351C2B5C
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DCCAB60D88
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 10:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DCCAB60D88
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uQxtbwNeg1qs for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 10:43:44 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 019C360BA6
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 10:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 019C360BA6
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E63F98444E; Sun, 23 Apr 2023 10:43:43 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 12:42:38 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: ab0507cd5abf6b68ab73a793e95306008957ef41
X-Git-Newrev: 32dc4feacc29b9dc377746168d174b7ecd2cfa70
X-Patchwork-Hint: ignore
Message-Id: <20230423104343.E63F98444E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/openocd: add the
 eCos exception to the GPL-2.0+ license
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

commit: https://git.buildroot.net/buildroot/commit/?id=32dc4feacc29b9dc377746168d174b7ecd2cfa70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

As noted by Yann E. MORIN in [1] only the src/flash/nand/ecc.c file
refers to the eCos license.

The SPDX identifier for that file is:
SPDX-License-Identifier: GPL-2.0-or-later WITH eCos-exception-2.0

The file is part of the openocd executable via libopenocd.la, which being
a static library it is not installed.

Based on this, becomes more natural to associate the eCos exception with
the GPL 2.0+ license, rather than considering it separately as a license.

[1] https://patchwork.ozlabs.org/project/buildroot/patch/20230411203930.2455301-1-dario.binacchi@amarulasolutions.com/
Suggested-by: Yann E. MORIN <yann.morin.1998@free.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 548e30d140066d5464eef1c3be57284a1a3dcf5e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/openocd/openocd.mk | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/openocd/openocd.mk b/package/openocd/openocd.mk
index 9973498cf5..78c6e10c58 100644
--- a/package/openocd/openocd.mk
+++ b/package/openocd/openocd.mk
@@ -8,14 +8,13 @@ OPENOCD_VERSION = 0.12.0
 OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
 OPENOCD_SITE = http://sourceforge.net/projects/openocd/files/openocd/$(OPENOCD_VERSION)
 OPENOCD_LICENSE = \
-	eCos-exception-2.0, \
 	BSD-1-clause, \
 	BSD-2-clause, \
 	BSD-2-Clause-Views, \
 	BSD-3-clause, \
 	BSD-Source-Code, \
 	GFDL-1.2-no-invariants-or-later (docs), \
-	GPL-2.0+ (code), \
+	GPL-2.0+ with eCos-exception-2.0 (code), \
 	GPL-3.0+ (stand-alone code), \
 	MIT
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
