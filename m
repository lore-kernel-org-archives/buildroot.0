Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44301D4336B
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:22:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E0E4F81380;
	Fri, 12 Dec 2025 07:22:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sBbONuInOfis; Fri, 12 Dec 2025 07:22:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D97A81395
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765524134;
	bh=854JsJ47v8R79r1etGvhiggcIpUWCu4u8CORmDi5UTc=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=D7WucBpqLA8FczJKHg7VNGJFXpTk+AzH6nRXkQW7Md4NKRVsW/Z3yGfKkyL6rD6+4
	 D2ZhESgp731Xx+1PLzggRvCQ5sWPbDETbWRF0V115GMna2jlP4/2LqhSsN+hmOIKxW
	 po+DRW3K6ZsuJnLK6OJgZQCRYQ+rCcHlMZm0EQRycyxOGyE1J0M/dmgwsamBSdzKPZ
	 +M3cs1SsWD+3yHEDN102IZdl8oGXr4d8e35OlQhSBIGa5L4YjnTsb8BCIxXsG9Khhg
	 vbYsgmRza/CRfTLa1fVuFdUwJ4tB0P9b7TJu+rTvWpBz414yBe0TZPP4ioYvFpbZpd
	 5V9I8yECPUO0w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0D97A81395;
	Fri, 12 Dec 2025 07:22:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A58952E9
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:22:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8873C40154
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:22:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fIIvZcj5qev1 for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:22:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EE205400FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE205400FB
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:22:10 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id DEDE086C8D; Fri, 12 Dec 2025 07:22:10 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Fri, 12 Dec 2025 08:21:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a6fb918153c77c24aa86da4c88402ff64ba33329
X-Git-Newrev: 6ddb75786ea22632663204c03cdf5b7057afc580
X-Patchwork-Hint: ignore
Message-Id: <20251212072210.DEDE086C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Kickoff 2026.02 cycle
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6ddb75786ea22632663204c03cdf5b7057afc580
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 4145574db0..d2257ed3a3 100644
--- a/Makefile
+++ b/Makefile
@@ -92,7 +92,7 @@ all:
 .PHONY: all
 
 # Set and export the version string
-export BR2_VERSION := 2025.11
+export BR2_VERSION := 2026.02-git
 # Actual time the release is cut (for reproducible builds)
 BR2_VERSION_EPOCH = 1765493000
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
