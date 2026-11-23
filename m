Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F741606A31E
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SL1beRM/;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=UvFMOasr
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B3B824076E;
	Mon, 23 Nov 2026 17:46:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TxANSnu6SOXC; Mon, 23 Nov 2026 17:46:32 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 91ED54075C
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795455992;
	b=hd2JNWtPPV3byqekW/y0OZqv9R1/n9ud6NRPBVzL3POw4LoHuu4TPbHg7fZ+sLLSuFLO
	 lNQgfoJJ7LRxIQvDoU1O1ivR682AIhUTtQLppf6OARoY+8dGHKUTlUxgGH1xBwV6kJ/Su
	 SJaCDR6dJ1K1MqXFtJPky4Dk4UFoYyB22YaktEhdrHmPlR/3J2/i4eLFr/aM7+wicPrPn
	 zJjYn9pWKiYuhg26Zaxk/Vtp3xT6ajUxF0AxP53Fqb3ZF7/hmBgoDk1vgnW5cPbIi41F5
	 682Sq6SqwmKIDoso9lkTBD8t5sMCjDbthn3rNK28J4G8jsllwwhYMJ72bwLu69xHu8Q==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795455992;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=ZDODu1cRqMZc7Re2LwQ4q7yeh77LscNYGPkn/V//5uk=;
	b=gd26vzSwUXviJTD0nh1UAGmkHawLkErwKgk/PQ9OaSqoVg4yb/B887MSI1XO2FQFiXu/
	 uApAgBVkUDrkd9tyaXaYwdFSYZet7HhPTrw/7zTMPFnwMbjmGI/xs7lCnWU3UIw1svuKh
	 x1xxl6eMB6x/qMep3fuhAzrQ2q8VDJP7uyGeFvzg2L1KNpdDHPL94Q7wS4Lp+7K172YwF
	 rU/nmuhmQ2MFuy/CsBfUdCbtVlyTUfA5qrXcjqE6bQ0l8Jh2DN/zZM9k4ZOEfsZC9wPdP
	 Iq4ULjDgfRynmF33nx6/fASCx42ki1I7OdYKcDlfwTHYF8Sc3G2Yy9eu09RKkUV1jFQ==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=UvFMOasr;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795455992;
	bh=ZDODu1cRqMZc7Re2LwQ4q7yeh77LscNYGPkn/V//5uk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=SL1beRM/LGAZlciXP5nnasiJHaDazwAW3qDjMj2mHFiU6rF5cPtj8s9IHKOXwLEYs
	 uDjevAo64JJd5Vfpk+uzSepVhDju6vDajCQv+Ov9LdnX4i7g6e9Jq2BxZWxNT+5wgh
	 ampngKfZaZ3dF5KQIbOzh6XufyQWo7ORe3ZAJ70tzRSQ7GE3s/vtEwteCZdQs14Grr
	 hzpa0EBuCACpBMMCtw/o8Ac0lIilRBsYtndJogTzedvoiwed6+0gwMM6Jbv6dtBDE2
	 glx4BrDmkjNCsxCF12Q1lOBfm/dwRYAHhG0/ruWuCG2nNlBic3ptwlfOHVG/gybfxO
	 G+1Jca4wA3Pnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 91ED54075C;
	Mon, 23 Nov 2026 17:46:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id B267979D
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 849EA40748
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rOzQiE1GZdGu for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:46:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5E29E40704
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=62.149.156.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp4.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp4.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=UvFMOasr
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5E29E40704
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:25 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VY7SxTNIykbYcVY7Txrph5; Mon, 23 Nov 2026 18:46:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795455983; bh=vHZHE4jwrJqfS0PQhLFgg++RR0Y4jYasl0tvEQLUrYg=;
 h=From:To:Subject:Date:MIME-Version;
 b=UvFMOasr8M+by5joBVsjhxIeYlgwOEZX8rpc63wvRAnHckBc2g0bkUHks3403Xy6O
 fRi7VhwxTXYoxHvcfQaTqwLMQeCrej6+krd3/UWlqzmiRDKRUtijYNFzlln0fszbgi
 30gZu1sYBlfl0xt+E824y6Zw8lNPlBk2NMgtrDxW/RYz9zzVsbKwAAjlOvpUZel/88
 x2PUjOQxLygUStuJQD9rLfejh6cCKgh1ci1WxNF6WBqfYiN3cvBaNOENq/QtlzSgT7
 D+idE7y+5QHjrvNnHOzXsRhOcv+9WN/KB58YqgMIaxD0V4D5bIz8ffQK2wH345ee2s
 sbNY026ZBTQkg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Petr Vorel <petr.vorel@gmail.com>
Date: Mon, 23 Nov 2026 18:46:20 +0100
Message-ID: <20261123174622.1851843-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123174622.1851843-1-giulio.benetti@benettiengineering.com>
References: <20261123174622.1851843-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIJhV6CJiflsRCt3hRj0a9p9+Q1M6m8BX5FnVYiCi0TuX8oLK+2cSmbbpiRAlEohxKm01OXzr4VTXbiP00XVFxp9VLmkbVlzHSzzMiCmIbnl/mooGNqe
 e1k+EUkuD0jRB7d8qriDePI4MEeWVNpxW2fSi1yjw2e88eNslKGKedliVBRWmkMRvIoaYsmWLYNPLB5fbUpAd7YmgT+AFrKq58sl1iDVGaVdismRG8g+AyWH
 nWK5e4qDub6XLNzbtN2p1mo12Xn2PgLmRIu/0DLPyopJ3sd8sXXC0VEODAXu+ZcBKoZX9as3BmE9wawI0yf0PA==
Subject: [Buildroot] [PATCH/next 4/4] package/nfs-utils: bump to version
 3.2.1
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-16.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

For release note, see:
https://www.kernel.org/pub/linux/utils/nfs-utils/3.2.1/3.2.1-Changelog

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/nfs-utils/nfs-utils.hash | 4 ++--
 package/nfs-utils/nfs-utils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/nfs-utils/nfs-utils.hash b/package/nfs-utils/nfs-utils.hash
index 1353a1a39d..1363903dbc 100644
--- a/package/nfs-utils/nfs-utils.hash
+++ b/package/nfs-utils/nfs-utils.hash
@@ -1,4 +1,4 @@
-# From https://www.kernel.org/pub/linux/utils/nfs-utils/3.1.1/sha256sums.asc
-sha256  7dbc05eb8b32828b322872b759a62cb3979cb4118f344dd8616813d1390e84e0  nfs-utils-3.1.1.tar.xz
+# From https://www.kernel.org/pub/linux/utils/nfs-utils/3.2.1/sha256sums.asc
+sha256  a54163d8dd589fc87048c6029011bda101a580c27770a377558be2422a976afb  nfs-utils-3.2.1.tar.xz
 # Locally computed
 sha256  576540abf5e95029ad4ad90e32071385a5e95b2c30708c706116f3eb87b9a3de  COPYING
diff --git a/package/nfs-utils/nfs-utils.mk b/package/nfs-utils/nfs-utils.mk
index 4b7c9fc12d..ec6e846d2b 100644
--- a/package/nfs-utils/nfs-utils.mk
+++ b/package/nfs-utils/nfs-utils.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-NFS_UTILS_VERSION = 3.1.1
+NFS_UTILS_VERSION = 3.2.1
 NFS_UTILS_SOURCE = nfs-utils-$(NFS_UTILS_VERSION).tar.xz
 NFS_UTILS_SITE = https://www.kernel.org/pub/linux/utils/nfs-utils/$(NFS_UTILS_VERSION)
 NFS_UTILS_LICENSE = GPL-2.0+
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
