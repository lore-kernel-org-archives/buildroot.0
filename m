Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9650C77B73
	for <buildroot@archiver.kernel.org>; Sun, 23 Apr 2023 09:41:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C050417A8;
	Sun, 23 Apr 2023 09:41:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C050417A8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RzvO5LNbScfn; Sun, 23 Apr 2023 09:41:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21BF2417C8;
	Sun, 23 Apr 2023 09:41:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21BF2417C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1AA7D1BF369
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:41:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E889182095
 for <buildroot@lists.busybox.net>; Sun, 23 Apr 2023 09:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E889182095
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dmyqG62ikeTW for <buildroot@lists.busybox.net>;
 Sun, 23 Apr 2023 09:41:41 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2204F82043
 for <buildroot@buildroot.org>; Sun, 23 Apr 2023 09:41:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2204F82043
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0E2C384108; Sun, 23 Apr 2023 09:41:40 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 23 Apr 2023 11:41:16 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b100440bffea3e47e72a9ccce0bee618658f6a47
X-Git-Newrev: 548e30d140066d5464eef1c3be57284a1a3dcf5e
X-Patchwork-Hint: ignore
Message-Id: <20230423094141.0E2C384108@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/openocd: add the eCos exception to
 the GPL-2.0+ license
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

commit: https://git.buildroot.net/buildroot/commit/?id=548e30d140066d5464eef1c3be57284a1a3dcf5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
