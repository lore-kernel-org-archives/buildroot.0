Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAD0AC4453A
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:24:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 711A980C80;
	Wed, 22 Jul 2026 20:24:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0D5_KFBoNsGy; Wed, 22 Jul 2026 20:24:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB43580D89
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784751857;
	bh=oK2hUhPosUz0iFg1paFBrlP2zVd5tqiU4xIUqmFDD3k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=NtW9KPzUQpaofvY/B8zVdvkEivpm0Tpa1EyFdW4sH2MRiE8CwlU3sEja7L2TbGKdc
	 QfAil+Ny5rVIIxatC+CTZLi+RTjWqNKJhmkxCz0PwUOukkx1ZtMagkyP1Qb3uMVB1t
	 vGvm5Bft46qNP2abpT4LYBwUS71qpzjGbQ0Es18GAu9eoklQ1nSWDwWXt6BKDxwMds
	 UeTGA+tCKsSLhlQf1rs6KNGKiZcLMO8cX8Wi5r8wzRGauqB+NSQ7oxeM9QlnB6gnSK
	 MAyeSg3X4sv8AA3uL1JcL73HcigI5W0a6qERHz0WaJRh5JnXChot6U3zF4EFOzwA2G
	 crfqwXStqOR/g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB43580D89;
	Wed, 22 Jul 2026 20:24:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E627224
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7BB2B80DAF
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BGpoRew5nrbL for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B12F6808D1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B12F6808D1
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E78E38A349; Wed, 22 Jul 2026 20:23:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 22:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9b8a2d86336d8755730da741c59de72708c52653
X-Git-Newrev: c19a7fad93ad8fc018f326d99ad4df69c6a557cb
X-Patchwork-Hint: ignore
Message-Id: <20260722202336.E78E38A349@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/initscripts: add license info
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/c19a7fad93ad8fc018f326d99ad4df69c6a557cb
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/initscripts/initscripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/initscripts/initscripts.mk b/package/initscripts/initscripts.mk
index 2e997dcd6f..d3a7a8faa1 100644
--- a/package/initscripts/initscripts.mk
+++ b/package/initscripts/initscripts.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+INITSCRIPTS_LICENSE = GPL-2.0-or-later
+
 define INITSCRIPTS_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/etc/init.d
 	$(INSTALL) -D -m 0755 package/initscripts/init.d/* $(TARGET_DIR)/etc/init.d/
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
