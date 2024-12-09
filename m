Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C1FAE7717D
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 08:27:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19091401C3;
	Mon,  9 Dec 2024 08:27:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NnX8JndG7lqV; Mon,  9 Dec 2024 08:27:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BE314053B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BE314053B;
	Mon,  9 Dec 2024 08:27:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C3244ED7
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 48A5D404CE
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xLBoDVIJIdt3 for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 08:27:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.201;
 helo=relay8-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0D4EB4043D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0D4EB4043D
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D4EB4043D
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:32 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5D2C51BF20A;
 Mon,  9 Dec 2024 08:27:30 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tKZ73-00CnQv-2U;
 Mon, 09 Dec 2024 09:27:29 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  9 Dec 2024 09:27:11 +0100
Message-Id: <20241209082722.3049825-13-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209082722.3049825-1-peter@korsgaard.com>
References: <20241209082722.3049825-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 13/23] package/python-asyncore: fix 'library'
 typo
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/python-pyasyncore/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-pyasyncore/Config.in b/package/python-pyasyncore/Config.in
index ad1376a243..09318baa58 100644
--- a/package/python-pyasyncore/Config.in
+++ b/package/python-pyasyncore/Config.in
@@ -4,7 +4,7 @@ config BR2_PACKAGE_PYTHON_PYASYNCORE
 	  Make asyncore available for Python 3.12 onwards.
 
 	  This is a compatibility package using the code removed from
-	  the standard libary, upstream does not intend any
+	  the standard library, upstream does not intend any
 	  maintenance.
 
 	  https://github.com/simonrob/pyasyncore
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
