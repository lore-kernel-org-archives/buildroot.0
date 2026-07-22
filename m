Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D645C44536
	for <buildroot@archiver.kernel.org>; Wed, 22 Jul 2026 20:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81FDF80F78;
	Wed, 22 Jul 2026 20:24:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hE8Th6K-t6cm; Wed, 22 Jul 2026 20:24:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EB31780FEF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1784751858;
	bh=b6BZomTCeYt24WsPF47FFwksZmj70BM6bmGllGZIVG4=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=AT/UuMa4mIIvSzIXHMsTElnm/f6NYsCsISevnH6jCaCb6qjEgDzJb10LRJkBTRpGI
	 /k4mt/8TlAG5SKD3KzmxBh+wG0VkC23qFYudcGsReIu9vwj0dw6iqBLaf9K+Ee+Sq+
	 BvMcQkQBhqNNKr5WD5ZkdFLOjiTcJigQB2k/eeVeD/FB0mD0f4BIXjhhpTzN8ZGW2s
	 cDreztSyfoSKfrtNPyOxmPbdfRWlii4OBj4PankT0eDQCEZMV4bCeVy+duO7Is4Khh
	 W+0nPbY2duBMCmfYJLzNRD0w738bqGsqbEcOGqEM7yulXPKFaxFZw+cnUl35zrKE3b
	 0m0ow1M0gDMxA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EB31780FEF;
	Wed, 22 Jul 2026 20:24:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8B8A33B0
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DD5D4029B
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LFLaNnZeXBi9 for <buildroot@buildroot.org>;
 Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A464D400A6
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id A464D400A6
 for <buildroot@buildroot.org>; Wed, 22 Jul 2026 20:24:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DAFB38A346; Wed, 22 Jul 2026 20:23:36 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 22 Jul 2026 22:20:58 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 770b684426cc388a13f31f1627dec0037b38b696
X-Git-Newrev: 9b8a2d86336d8755730da741c59de72708c52653
X-Patchwork-Hint: ignore
Message-Id: <20260722202336.DAFB38A346@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ifupdown-scripts: add license info
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/9b8a2d86336d8755730da741c59de72708c52653
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/ifupdown-scripts/ifupdown-scripts.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/ifupdown-scripts/ifupdown-scripts.mk b/package/ifupdown-scripts/ifupdown-scripts.mk
index 5ef032142c..d7d5244ffc 100644
--- a/package/ifupdown-scripts/ifupdown-scripts.mk
+++ b/package/ifupdown-scripts/ifupdown-scripts.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+IFUPDOWN_SCRIPTS_LICENSE = GPL-2.0-or-later
+
 define IFUPDOWN_SCRIPTS_PREAMBLE
 	echo "# interface file auto-generated by buildroot" \
 		> $(TARGET_DIR)/etc/network/interfaces
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
