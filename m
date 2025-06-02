Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36900C5AD49
	for <buildroot@archiver.kernel.org>; Mon,  2 Jun 2025 18:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCD6C408EC;
	Mon,  2 Jun 2025 18:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TfIf6P1xNScj; Mon,  2 Jun 2025 18:41:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC5F74088F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC5F74088F;
	Mon,  2 Jun 2025 18:41:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F21FDA
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 18:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 445A180EF0
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 18:41:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l1oejpaU1gzv for <buildroot@buildroot.org>;
 Mon,  2 Jun 2025 18:41:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.15.19;
 helo=mout.gmx.net; envelope-from=dalang@gmx.at; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EBBC480EC4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EBBC480EC4
Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EBBC480EC4
 for <buildroot@buildroot.org>; Mon,  2 Jun 2025 18:41:30 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from localhost.localdomain ([213.147.165.82]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1N17UW-1v2HPA3FJi-0121Dp; Mon, 02 Jun 2025 20:41:26 +0200
To: buildroot@buildroot.org
Cc: Bernd Kuhls <bernd@kuhls.net>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Mon,  2 Jun 2025 20:40:48 +0200
Message-ID: <20250602184049.933226-1-dalang@gmx.at>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:BNpTpldVdX6qks03zeiPL2B0FfPH+RuGs5hbXuPJV9gUY/o+8l5
 SF9BZqWvGtOtaywwdOfDXdT8U4nRzaJvCjsInqRC4kHzJcZWXRerDHMptyf24sk7W6qx2SQ
 xrpW3CE5piLfLfbnFjIc7/juflSf5skOVsATV+MS71RK6JeOz0Yhq4r/DzUKApKaY/DL8+N
 hLFs9ZQ3LvG6Ocu8zWXxQ==
UI-OutboundReport: notjunk:1;M01:P0:UJQEbAJrUdk=;Nlpc0cfzJJqUXzfndMAgTqxH4qA
 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
 bidy6MgQaAjfMSuulplMIJ8RO
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.at; 
 s=s31663417; t=1748889687; x=1749494487; i=dalang@gmx.at;
 bh=A57XrieYNOLnevVcd9Fjvwm+53bO6HbVpxsSLI7beBk=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=nDShvFYxQ5zVy+F0EqzCNTLNzoAIgxz9yO1GckgIbKbLBCnxmnsCqWwcZNBPbMGi
 5t2PqxqW1PV0a7DpegdG9URFBmqYMoG1k2Qp1kcCd3c4sE0SLlYg85BYIW+MNiPif
 tes3P33KotyNLOfzaJSjzxa7hz8GWPq4KZt/n1XhXxMzA+promSB2OoAyvoWy7N1/
 G9HNWQPTCPIecTZJW/xPcd9BvJ5fcjV2qhgezVhN7aaS+rPPEoZZlm4qiHIw6XStC
 BXnm9gGmUhz0Q8tbdKXLIUzZ8OqC5Hz0QlEtgR2XSiSRxe0Qxi1uxRK8uslrlak/d
 Bm0K/RCQzXLoUr0b6g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.at
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmx.at header.i=dalang@gmx.at header.a=rsa-sha256
 header.s=s31663417 header.b=nDShvFYx
Subject: [Buildroot] [PATCH] package/exim: drop stale CVE-2022-3559
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
From: Daniel Lang via buildroot <buildroot@buildroot.org>
Reply-To: Daniel Lang <dalang@gmx.at>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The CVE database was updated and includes the additional "up to
(including) 4.97" version information.

Signed-off-by: Daniel Lang <dalang@gmx.at>
---
 package/exim/exim.mk | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/package/exim/exim.mk b/package/exim/exim.mk
index 6fa16e69a2..3afe553caa 100644
--- a/package/exim/exim.mk
+++ b/package/exim/exim.mk
@@ -13,10 +13,6 @@ EXIM_CPE_ID_VENDOR = exim
 EXIM_SELINUX_MODULES = exim mta
 EXIM_DEPENDENCIES = host-berkeleydb host-pcre2 pcre2 berkeleydb host-pkgconf
 
-# Incorrect NVD database, reported at
-# https://lore.kernel.org/buildroot/20250517183423.07951665@windsurf/
-EXIM_IGNORE_CVES += CVE-2022-3559
-
 # Modify a variable value. It must already exist in the file, either
 # commented or not.
 define exim-config-change # variable-name, variable-value
-- 
2.49.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
