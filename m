Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 330F9CD4F48
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:30:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CD6140A78;
	Fri, 15 May 2026 13:30:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q7q_PfA_WV_3; Fri, 15 May 2026 13:30:02 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2F3C741A56
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851802;
	bh=Y80Tru4DX785vJTSkTtsK4kyouhgkR0uVHaXt6n4B8U=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=TRcxPHxAhlRf4CyMBanQKl+gK/L5zGoAOlCQ7XYQMYSPHx33pOCGk8MVOowzfO93A
	 MvOawNoRgxFPeH+o2C/gl8g/fCgIP+i9qR4Op5F8A/l1BK4NGpTj64I36uQ+D6WpI3
	 l4O1o3ARH9LGk/R0wa1ELge7iaOmFSkJf0g2YgAetDEI36s2FFZ+4m6OPIYK0OHHG6
	 ORcdYYL1XhLnOq9g425kJSaE/zei3ToQ0+J/ltX6wS5bV03i4BKFrAo9Eu0r1Mw1YH
	 vXxx7JH32Pa/Oii+eh1DZRY+w45Chjh2OLEMDwyDphmKcywQQTSsg7n7VIMWIJM43H
	 Sjn5OHs5Iswng==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2F3C741A56;
	Fri, 15 May 2026 13:30:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3447F49E
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D9E358421D
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PnPz_VXXo1n1 for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0326C84224
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0326C84224
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:29:54 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4A8A686352; Fri, 15 May 2026 13:29:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:11:24 +0200
X-Git-Refname: refs/heads/2026.02.x
X-Git-Oldrev: e79faf42b67320e1be08a386a7ededd9c5455a0d
X-Git-Newrev: 712e2e8f7cbd5eeadbf817945656ebaa7ce381e2
X-Patchwork-Hint: ignore
Message-Id: <20260515132948.4A8A686352@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.02.x]
 package/python3/Config.in.host: remove select on BR2_PACKAGE_HOST_OPENSSL
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/712e2e8f7cbd5eeadbf817945656ebaa7ce381e2
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.02.x

There is no such option, and according to the commit history never
was. If BR2_PACKAGE_HOST_PYTHON3_SSL=y the build adds host-openssl to
HOST_PYTHON3_DEPENDENCIES directly.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
(cherry picked from commit 201d6f4937d3b428a7ec858d0cb1cdb7483469f0)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/python3/Config.in.host | 1 -
 1 file changed, 1 deletion(-)

diff --git a/package/python3/Config.in.host b/package/python3/Config.in.host
index f3fcd63567..28fc0dbaf8 100644
--- a/package/python3/Config.in.host
+++ b/package/python3/Config.in.host
@@ -24,7 +24,6 @@ config BR2_PACKAGE_HOST_PYTHON3_CURSES
 
 config BR2_PACKAGE_HOST_PYTHON3_SSL
 	bool "ssl"
-	select BR2_PACKAGE_HOST_OPENSSL
 	help
 	  _ssl module for host Python3.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
