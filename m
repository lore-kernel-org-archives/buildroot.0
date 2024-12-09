Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4072EE77180
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 08:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8374403F6;
	Mon,  9 Dec 2024 08:27:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vHFiCwBU0ZxY; Mon,  9 Dec 2024 08:27:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C59DA403F7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C59DA403F7;
	Mon,  9 Dec 2024 08:27:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A69E8979
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8708580A7A
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id iIcNpTfZBT5R for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 08:27:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.196;
 helo=relay4-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3F00B80A58
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3F00B80A58
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F00B80A58
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:26 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 45742E0002;
 Mon,  9 Dec 2024 08:27:24 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tKZ6x-00CnPM-2F;
 Mon, 09 Dec 2024 09:27:23 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  9 Dec 2024 09:26:59 +0100
Message-Id: <20241209082722.3049825-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 01/23] package/autoconf: fix 'uncommitted' typo
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/autoconf/0001-dont-add-dirty-to-version.patch | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/autoconf/0001-dont-add-dirty-to-version.patch b/package/autoconf/0001-dont-add-dirty-to-version.patch
index 8df2276865..a1a50d2838 100644
--- a/package/autoconf/0001-dont-add-dirty-to-version.patch
+++ b/package/autoconf/0001-dont-add-dirty-to-version.patch
@@ -1,7 +1,7 @@
 autoconf: don't append -dirty to version
 
 Don't append -dirty to autoconf version number if the buildroot git tree
-has uncommited changes.
+has uncommitted changes.
 
 This script is meant for the autoconf developers, but it also activates
 if you build autoconf in a subdirectory of a git tree (E.G. like how it's
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
