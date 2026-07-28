Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D21AC5516D
	for <buildroot@archiver.kernel.org>; Fri, 31 Jul 2026 11:58:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1882360B09;
	Fri, 31 Jul 2026 11:58:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cWurcpruWg_9; Fri, 31 Jul 2026 11:58:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 460D560B0E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1785499118;
	bh=cUF11Whu4uFBpMvyieLTL04/WR/JQKAQkppIkDwoG1k=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SjiLwkzuRgbPX+epjjf5e1hs7mKw1qZ7+g6ToHbN7SM6nqQ2qO39KuhYFXfY0azyO
	 2rQEVGiKUrevfK+U7hHjzOotR2LMgQy3Ov5RCilnXeM7CV0aob0JM3dFaoKimQt/Tz
	 rRulkndXIcmnNXtBNCdD/G6bbVZmab+NdhKf9Wp4R+x4xzzsrtBziiZFvTC9wiTEzU
	 f8JpG79zycWdrWUBBL/ZUoD+05OUg7MsXF3zG7S8cVSAL5z8PX88V6EOPHF3TDYZNd
	 9zhYL2G9v5LS4FzWBu1cMXUEJcOCuYFk/SVfEGCDC8mM6ie80YOYa+bNdIylkLCCa3
	 vUE3xiwFEhFQA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 460D560B0E;
	Fri, 31 Jul 2026 11:58:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id D299927C
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B946F40F87
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aAoW71LFVUar for <buildroot@buildroot.org>;
 Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04D2340FA8
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 04D2340FA8
 for <buildroot@buildroot.org>; Fri, 31 Jul 2026 11:58:13 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EA5C28B741; Fri, 31 Jul 2026 11:57:29 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 28 Jul 2026 12:19:00 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 617fe0289ec0132e060d37473aaab6dd95e4f06f
X-Git-Newrev: 1048f55fa04a024ec5d00b3242a728ff97cb9244
X-Patchwork-Hint: ignore
Message-Id: <20260731115729.EA5C28B741@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 package/environment-setup: add license info
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/1048f55fa04a024ec5d00b3242a728ff97cb9244
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The package is part of Buildroot and thus under GPL-2.0-or-later
unless stated otherwise, as described in COPYING.

Signed-off-by: Fiona Klute (Othermo GmbH) <fiona.klute@gmx.de>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 770b684426cc388a13f31f1627dec0037b38b696)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/environment-setup/environment-setup.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/environment-setup/environment-setup.mk b/package/environment-setup/environment-setup.mk
index 069ee25f9f..276d5caca8 100644
--- a/package/environment-setup/environment-setup.mk
+++ b/package/environment-setup/environment-setup.mk
@@ -4,6 +4,8 @@
 #
 ################################################################################
 
+ENVIRONMENT_SETUP_LICENSE = GPL-2.0-or-later
+
 ENVIRONMENT_SETUP_FILE = $(HOST_DIR)/environment-setup
 
 define HOST_ENVIRONMENT_SETUP_INSTALL_CMDS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
