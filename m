Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B041E77180
	for <buildroot@archiver.kernel.org>; Mon,  9 Dec 2024 08:28:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 40F54404D5;
	Mon,  9 Dec 2024 08:28:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 54aWZbD7VQ8b; Mon,  9 Dec 2024 08:28:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22C1640384
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C1640384;
	Mon,  9 Dec 2024 08:28:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5EA09979
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 48A44408C3
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AaK9UUyZEf8s for <buildroot@buildroot.org>;
 Mon,  9 Dec 2024 08:27:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@korsgaard.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0AE6F40604
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0AE6F40604
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0AE6F40604
 for <buildroot@buildroot.org>; Mon,  9 Dec 2024 08:27:34 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 075861C0006;
 Mon,  9 Dec 2024 08:27:31 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@dell.be.48ers.dk>) id 1tKZ75-00CnRT-16;
 Mon, 09 Dec 2024 09:27:31 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon,  9 Dec 2024 09:27:14 +0100
Message-Id: <20241209082722.3049825-16-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20241209082722.3049825-1-peter@korsgaard.com>
References: <20241209082722.3049825-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 16/23] package/ti-sgx-demos: fix 'available' typo
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
Cc: Lothar Felten <lothar.felten@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Found by codespell.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ti-sgx-demos/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ti-sgx-demos/Config.in b/package/ti-sgx-demos/Config.in
index ec7b8e6038..f45ccd8d01 100644
--- a/package/ti-sgx-demos/Config.in
+++ b/package/ti-sgx-demos/Config.in
@@ -3,7 +3,7 @@ config BR2_PACKAGE_TI_SGX_DEMOS
 	depends on BR2_PACKAGE_TI_SGX_UM
 	help
 	  These SGX powervr demo applications from Imagination
-	  Technologies are availabe as binaries only.  The binaries
+	  Technologies are available as binaries only.  The binaries
 	  are compiled for the TI SGX implementation.
 
 	  https://git.ti.com/cgit/graphics/img-pvr-sdk
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
