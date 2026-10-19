Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93AAB606A31F
	for <buildroot@archiver.kernel.org>; Mon, 19 Oct 2026 19:31:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=KRkdjBoI
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 73A33406C0;
	Mon, 19 Oct 2026 19:31:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id njM61Dba_BxU; Mon, 19 Oct 2026 19:31:08 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 8F536405EE
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792438268;
	b=CDlVkLOApxg7mgMc466O96aHmU07sGBE0MBpKzdlO7prFZ4mOF2ZT+IozsFXQFGYtvnS
	 T2CgCijIfeRoPm6dlVhoHdN1nb0ZtESmse/rZkVLzhjsmx6fNmzQ1EZa8IDLE38OJVsiG
	 xhtdw47I0X1cmluLKbt/4L7oWvOraqTOTCl+h9yRFmENJU+msLbYrhwwE74VcMfQojGKs
	 aoqo26FJWcf6VhRxg8uFKFAAqtdZEmNOUB0FJl81MNsnqpvI/QuyPTyUebg2fBXxdPut4
	 XGekagRmPbG6NQwV8JQ0Bz7/zx4SN18H6rEend9lutNMy9fhdX7wN3AXf/DnciUY6aQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792438268;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=t7UVe/JPoYc7UIlVcxcnJQ/az6YGBaeFBtWE9/BP5Ec=;
	b=lp06L2hhCRyyQ1fsYF9nSYyG/gGBYcONGEy63M76n+stPw9NX3ArF+uDqLc4UZdR8P0N
	 4a4JFGhUWVzHf88sjHMbNtW1unkmDzNpCC4n8alAVP0A+2kDPxFUSg+JRaNYzaqkZq6d2
	 VlFxvF87dNAo7vJ4KzVebPuzPTPCScJq6k9wQ2p9oqXWOjGSvJ+gTqCkLRH0PFTXqubHv
	 LkaOfl7USAqEyWkO657prK7KRPesBkM48BIpswtZ+3cS1wG0WuZRRQwPlrbBeuvSz+Kyi
	 /kqrUYw7cdIcwrkt5asknCmiXcl5YJeHX+IwZs0E/09W/pHTOZocaSqvLPk6KFp11QQ==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792438268;
	bh=t7UVe/JPoYc7UIlVcxcnJQ/az6YGBaeFBtWE9/BP5Ec=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=KRkdjBoIVInrmzivnYJHj+RQVr15uY+ELXfYu3EZeYkS8CXAf78VcnUeitn/u8F1h
	 wAhNVNuBL8Q2VLiHvqzwq664L3+sPRMiG6qhevPbnpC56fNdBmltj0OrzUL4fteej6
	 1y/eZJCC4klFvPhKoNS2NqoFb2FvC/PDJDx2N/OlikIOXfoHYCGg/YZStcKI6ikexO
	 9lfPga2+5lZYHn3DqHNa8CCg4aL9DHab+KjStSl0+lBHT+Bpf/4s/h/UY649HOM30q
	 w5iD6W2CItJfQOQCty8Vogozb4I67AFkWXG/RmxkK/hpXtAMtIo6qbjMYdIN/Qq1Gf
	 58h51hUxA0T0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F536405EE;
	Mon, 19 Oct 2026 19:31:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9641D1DE
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:31:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 883A680D2D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:31:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rdSfQDRlCLcS for <buildroot@buildroot.org>;
 Mon, 19 Oct 2026 19:31:06 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B1CA780D01
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792438265;
 b=YQasPcxsEV+loisKI5AIy9b/u7gfUASS9dgNLVIaSZzGQ1XxBjLtbvUv4iupzdxMTqiE
 EmzwExJ+lXPfXSePIlp1byqR85Wclva/YzD65dBPOXgy62nXZ3YhyNVp0ZboPyDHvfSH5
 I1N1wCZejkWbKS/hveecBDM3jgisqS1OL4y25GC71Y3USZbfDH8mBqmq6PUZt5R5zFsze
 dbI8cThNv2q5/XYpiD/on0A3wJK/InKV67EAolWYCtQO5aKP2z9lTLIpW7OCjxnT5gwz+
 DZ9HjJxPBqFcWozbpmtaxfHuhA1InoWep5iucVYJ75rGUNlBbPQ4KTGEyT1mPWOfFKA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792438265;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=of72OiwjHMXhvB/o0FSV+ossyz1S1dFEgztSloNwUX0=;
 b=PnMx0oo7xpSTjqGL1fncgw7hO9aCqNC2fJ+3ZNgv8shbSbORIXjex/bHf1XEZSksjosz
 fCLSUNWmUvm4JR2CLstf1U3di3vupJyv1/ulDE6p65Ss0pEXUQmvOhYkbPQqktePjuO/0
 1PDvqppjgx+CrRzp6KLvMsv7790TK6AAdg3J+kLaTct6pd4ufQHZfda1qTejdTMGn/hwV
 XeFAytOVTUpJN8V+0lo/DEihm0WATGmucgGZO02gVyeVsfVvapL54Xq1Tui6NFjIHgW6Y
 WXndzJnLOLvJXrxi7RdYy+sWeCKMewTG1SQ4r0z8NwgC8nMc1/LATuMj7s1NNKHiazQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=vdIB9SRg; 
 arc=none smtp.remote-ip=185.246.84.56
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.84.56;
 helo=smtpout-02.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1CA780D01
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:31:05 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-02.galae.net (Postfix) with ESMTPS id BB36C1A124D
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:31:03 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 90C6860582
 for <buildroot@buildroot.org>; Mon, 19 Oct 2026 19:31:03 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id EBA8510328D1B; 
 Mon, 19 Oct 2026 21:30:58 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 19 Oct 2026 21:30:43 +0200
Message-ID: <20261019193044.900785-3-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019193044.900785-1-thomas.petazzoni@bootlin.com>
References: <20261019193044.900785-1-thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 3/3] package/fmlib: add warning about the need
 for NXP kernel
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-24.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Building fmlib, either on PowerPC or ARM64 against an upstream kernel
will fail to build as the kernel modules include fm_ioctls.h, which
doesn't exist upstream. fmlib will only build with NXP-provided Linux
kernel sources. This commit mentions this in the Config.in help text.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/fmlib/Config.in | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/fmlib/Config.in b/package/fmlib/Config.in
index 459d5bf102..17ab47ec08 100644
--- a/package/fmlib/Config.in
+++ b/package/fmlib/Config.in
@@ -13,6 +13,9 @@ config BR2_PACKAGE_FMLIB
 	  configure driver parameters and PCD (parse - classify -
 	  distribute) rules.
 
+	  This package builds kernel modules that need header files
+	  only available in NXP-provided Linux kernel sources.
+
 	  https://github.com/nxp-qoriq/fmlib
 
 if BR2_PACKAGE_FMLIB
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
