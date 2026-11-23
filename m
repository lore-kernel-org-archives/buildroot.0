Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB004606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 17:46:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=a1G4iCXr;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=FF6rbKGP
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7DD80E3E;
	Mon, 23 Nov 2026 17:46:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ha5VgI_o1ASF; Mon, 23 Nov 2026 17:46:30 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org CA48980DE2
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795455989;
	b=A1aNAYCwLThGM/EShdahLWt0g4HOfnzSYg/1wGODCE7nLVWKoqK23D6XfV3M1AYAfh++
	 NuDU1Ab6oz0+CWfTNV8ev8jE/iPLMQGPQpHt4HuIeg3+Qui5qg2ykM0DdU6bGs0L+NzIT
	 qnyJ39WoMoc0xNl7SnT5co29OGmGcyLkiyC40PRvtToDSm/NDcjuvm3OzeBwOBgeYOG2A
	 JbXWIFWMxhgVVy62D6H0B0i13mZ5JT7Bo5/xz9kouYAs9Y70XU9ySlLBsbGHGV1QXzmEe
	 lGrzCsovPltU42n9OMZ9E0GCw5al0hxYVLh4AuaUJz6xSZfIdf4Sjf/g0qk/k/XwgQw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795455989;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:From:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-CMAE-Envelope:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=YTK0xnsaampDHH52pahRw6t6WrH4kKxD8Ly10iYGulY=;
	b=m18K+uQG1JM587fZjezkizEhBMwjK6oLNgPpxvPSGZFsoXUV1Og2rUo34xBX1d9wMjJ2
	 r/8yPGviVciwHButRsAbgngmFBXbsrzhk5rkycb7xZDCmop/jDFc17YeLecuQHAphciyY
	 PAc1CMzlkmNMD/B81kSYWHZsz5r8XpOZcaWcv/x1hgKx+rpYrmtR39zpd+24n4hEGE0UN
	 G/WfjMkauM3qBihWLBUAUZ9LLqy+4WpqvkQadcr8sT6XGTs0Gkt4XQS7caVk43bmhzVZI
	 yDvFA/1B0OyWrk294Wh9oH9SPPPG2Os/zHiX3hHK22JqSxDfDPhUNtC+dcv2brjX3Fg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	dmarc=pass header.from=benettiengineering.com;
	dkim=pass header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256 header.s=a1 header.b=FF6rbKGP;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795455989;
	bh=YTK0xnsaampDHH52pahRw6t6WrH4kKxD8Ly10iYGulY=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=a1G4iCXr7St3xfSyWis9bWdaE37Da74XWFx690fAKuUtqHMC6MUyv9ClB2JMpovJ4
	 nMaeM3IcvN6D1dl36WrQAop/BLby3w8x8CCBf9wdCyCll/VzIJuSQB9nIXeTSL5LFa
	 3URfkawdCyPOM+zT3FFDDgCQs9l2LqXlSlE/9wQL+3kiyG/SRpFG2Isc9X19yZxKXj
	 sLxsW4W9D2GTURLImlQsgDtvJWfLE/sIq1HGek/LPzY5ZLJQ7FNRR1GRxbPNGY0hp4
	 aKBhPLVBnIEaaKlmtk4JgLWG3hd4mgaDnGzN3tjr0UY19kTy+Rc74x1gtCw4Hhi9si
	 4jL3JdQ6l9R/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA48980DE2;
	Mon, 23 Nov 2026 17:46:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 71E3E371
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 600B980E33
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8oN1eklwkqZJ for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 17:46:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 27F1A80C80
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=62.149.156.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.156.57;
 helo=smtpcmd0757.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
Authentication-Results: smtp1.osuosl.org; dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
Authentication-Results: smtp1.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=FF6rbKGP
Received: from smtpcmd0757.aruba.it (smtpcmd0757.aruba.it [62.149.156.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 27F1A80C80
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 17:46:24 +0000 (UTC)
Received: from localhost.localdomain ([95.249.82.110])
 by Aruba SMTP with ESMTPSA
 id VY7SxTNIykbYcVY7Sxrpge; Mon, 23 Nov 2026 18:46:23 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1795455983; bh=bJ59dIeZaqg7CLGtLyUmVfnVXK0qVrL2XQ5YV1rxBhI=;
 h=From:To:Subject:Date:MIME-Version;
 b=FF6rbKGPLegY4bLiXInX8cTyx7lRvWRU9mnjYfrPp+ob3xkbajGO0dj9bkQT7uR/r
 nkqCiNqtgvNQalvJkfYXrVpwEiXLvgQ/DH7///UBpPFPCJnV6uP1Z1MKbpP5/FGlhv
 j1v1IiaahWaX8q85Zkf8Fp+VNQYlb0utGkT2psu6HV2w06mlEkElxwFPUBd2Y+gLQI
 278TCjuF2NqHQGbCBDAQJMyMoFjJgcuIWAB0XLbpP7/6P+9nKz2D+WfbuOmJChxYtZ
 i4AjZBfIm8RUSwl3XETejY7UiFZiZqCn/8XpLSkfN31lFGe9nl3ve+etGzC+E40bnd
 AdX94tz7zT1HA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 23 Nov 2026 18:46:18 +0100
Message-ID: <20261123174622.1851843-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261123174622.1851843-1-giulio.benetti@benettiengineering.com>
References: <20261123174622.1851843-1-giulio.benetti@benettiengineering.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIJhV6CJiflsRCt3hRj0a9p9+Q1M6m8BX5FnVYiCi0TuX8oLK+2cSmbbpiRAlEohxKm01OXzr4VTXbiP00XVFxp9VLmkbVlzHSzzMiCmIbnl/mooGNqe
 e1k+EUkuD0jRB7d8qriDePI4MEeWVNpxW2ehWsWLl03lA3n0KpdoI+GZtzd2PM6jI7v8bSOGLg/NPxBHUXZF36YgdjHMjxBkN56B/FcOCuU4evecqC9Y+pyM
 pzJuPLNekvLYepVnhl9GIiQepc2FeZNYACQLXkUDLcNQoaWhsTH3/p/uB/k4TGqK
Subject: [Buildroot] [PATCH/next 2/4] package/libnspr: bump to version 4.41
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

Changelog:
https://hg-edge.mozilla.org/projects/nspr/log/54e7c1b0803d151e142e30dc0d05f12e1ec67a13

Co-Authored-By: Claude Opus 5.5 <noreply@anthropic.com>
Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 package/libnspr/libnspr.hash | 4 ++--
 package/libnspr/libnspr.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 068ac6b795..71e3783aaf 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/nspr/releases/v4.40/src/SHA256SUMS
-sha256  c0c1884c627f3db7a783f7c7314c695226b2043696791d15519e7e0578c19bdc  nspr-4.40.tar.gz
+# From https://ftp.mozilla.org/pub/nspr/releases/v4.41/src/SHA256SUMS
+sha256  c562b8ddfe93704b7dc077be013f01448fdc6c124b1821c0f10471a71cb2e9e6  nspr-4.41.tar.gz
 # Locally calculated
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  nspr/LICENSE
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 4ecdccf7b5..a9b6c9407e 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.40
+LIBNSPR_VERSION = 4.41
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
