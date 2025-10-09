Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 413EBCCD185
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 14:32:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD43B83EBC;
	Thu,  9 Oct 2025 14:32:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYYomjkT8oen; Thu,  9 Oct 2025 14:32:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0109E83E94
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0109E83E94;
	Thu,  9 Oct 2025 14:32:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 14548226
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 05CC841056
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CbSsfVqvd_X8 for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 14:32:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=fiona.klute@gmx.de; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org C697C41052
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C697C41052
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C697C41052
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 14:32:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from haruka.home.arpa ([85.22.1.172]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MQvD5-1urgMT129f-00So5s; Thu, 09
 Oct 2025 16:32:38 +0200
To: buildroot@buildroot.org
Date: Thu,  9 Oct 2025 16:32:15 +0200
Message-ID: <20251009143216.2282077-4-fiona.klute@gmx.de>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251009143216.2282077-1-fiona.klute@gmx.de>
References: <20251009143216.2282077-1-fiona.klute@gmx.de>
MIME-Version: 1.0
X-Provags-ID: V03:K1:A12tqSilD9Lv50xFmuWCtz5KJ/udG4uC+buKprMTkl9C/CiZhmK
 9Ke3P4p3mLwf2FKT8aenQvJQhOiGvyhEyMZhNCfQI2grDExJ7IK6maA1jSFxl/PzGxF1QZG
 IYMdlPhubfWGliWbBZkBoSns5Q+cdGTfBZU1Iyzs+gU0p/EklYMg2sEnDgX59LoBOzOUPuM
 rvVuSs5JhxTOrdKIjhEXQ==
UI-OutboundReport: notjunk:1;M01:P0:zLyIFOxe+Gs=;+gqxpa74PKz3SFErpuiksQ4FfPz
 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
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.de; 
 s=s31663417; t=1760020358; x=1760625158; i=fiona.klute@gmx.de;
 bh=v3yN/WlvZfP5WGbajacvSeNoMAcT2TnBIzRDj8rXGP4=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:In-Reply-To:
 References:MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RH5t5FoUIMZsuA3wk6E4gJMN7GmjvqVIMf8jo3UtIMZ4I/os3zGrGaNpwj+KXNb6
 ZawosBZ18h3M6BbE2ajpClUSSeRf3mSyHL+8ch/Bk/V4JJx9JfKpBdlP2B7vayUo3
 5RNUExXHyzRNwnr/hKRiNMuyZGYH5t3nI6j7ycGD2+il/aT3CH/olXkmzET1XJr41
 FUgWBz6pCBnm0oizgNDLZSKSjf6tG0gAzQprEds04nLzn4el8AIUijy7FxCyx1d7s
 O6cRy+RNuHavI56FP5HN+xDgC174B10LouqzWdlbnSavKGOd9cDuoomsi6EJ7iN4d
 j2FeYnh24dblksXclg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.de
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.de header.i=fiona.klute@gmx.de
 header.a=rsa-sha256 header.s=s31663417 header.b=RH5t5FoU
Subject: [Buildroot] [PATCH 3/4] package/refpolicy: fix upstream URL in help
 text
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
From: Fiona Klute via buildroot <buildroot@buildroot.org>
Reply-To: Fiona Klute <fiona.klute@gmx.de>
Cc: Antoine Tenart <atenart@kernel.org>,
 Marcus Folkesson <marcus.folkesson@gmail.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The previous URL currently redirects to
https://github.com/Exact-Realty/refpolicy, which as of this commit is
about two months old and contains a readme that just says "PoC by
Callgh0st". When the package was added with commit
bb442abdf18d6a4673ffa1f19e2a62f36c5d3038 the help text URL matched
REFPOLICY_SITE, so presumably the help was forgotten when the site URL
was updated, and there has been some kind of hostile takeover of the
former upstream repository since.

Signed-off-by: Fiona Klute <fiona.klute@gmx.de>
---
 package/refpolicy/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 8ae8f0448d..7aea39b223 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -26,7 +26,7 @@ config BR2_PACKAGE_REFPOLICY
 	  policies is not correct.  Individual policies would need to
 	  be tweaked to get everything functioning properly.
 
-	  https://github.com/TresysTechnology/refpolicy
+	  https://github.com/SELinuxProject/refpolicy
 
 if BR2_PACKAGE_REFPOLICY
 
-- 
2.51.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
