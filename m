Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F352CD343F
	for <buildroot@archiver.kernel.org>; Fri, 15 May 2026 13:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10BCE41A4F;
	Fri, 15 May 2026 13:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gHW8uoWz9MIS; Fri, 15 May 2026 13:28:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46E9F41A51
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778851704;
	bh=GcUGHFLILA/FdbOrLvhBrsy8JoU4bjrelwl7SgFR6xg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=W2yWW7CnD/bqqh0ihUIA1PC7GWuo/yReqiJ/rH+nz5nzeGNeWOc4xHD4OJA+Z4y2T
	 zrjkp3H3z+UgsbObNYwfgcViWwCnMTwkQBwANcUe5Sjy95+CSA9ywOyS7iGdfti6Dj
	 nm2UHEdy5LtAZRr8/KTHLXT1AHB8kDWSbcxsB1X7sNUf5oNYR2P/p9ZFn5p21ZxxZn
	 qckk7EV8WxCc/OxlliC+0jHeIVNkop5t6atpT2Bvwf/sLR+7JKtYVfafHx/D+H9IzC
	 F1FaYOgpUGqjT1nNaQOIbfPpu+uvkcsiA5/Oz5EtUlRvSMvM5KrTnGAJcK6wmkdoGR
	 RHISyBK3UN2WA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46E9F41A51;
	Fri, 15 May 2026 13:28:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 8DB2442B
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FECF61564
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L1wVaftrsXtK for <buildroot@buildroot.org>;
 Fri, 15 May 2026 13:28:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 624BA61546
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 624BA61546
 for <buildroot@buildroot.org>; Fri, 15 May 2026 13:28:21 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A5E1486356; Fri, 15 May 2026 13:28:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 12 May 2026 15:11:22 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: fa085b7d8122258e917f80c191bd750a3c5803d3
X-Git-Newrev: 49dbc683e752d7b7defe08011eafdfd8ef77b71c
X-Patchwork-Hint: ignore
Message-Id: <20260515132815.A5E1486356@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/49dbc683e752d7b7defe08011eafdfd8ef77b71c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

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
