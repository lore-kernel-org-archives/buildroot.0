Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE97606AB0B
	for <buildroot@archiver.kernel.org>; Tue, 20 Oct 2026 13:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=cj1jYnwq
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 962144084B;
	Tue, 20 Oct 2026 13:55:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luVJa4ZMgrlh; Tue, 20 Oct 2026 13:55:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 6DEAE40856
Authentication-Results: smtp4.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792504512;
	b=ijJ/l9iaIMsRIc4ZyJ1o1vdKjy42M/0opRijA1GqGPRVJ4St6hbc/mk1Umo9VsG6mCtJ
	 ORAscNqCLS3UCYR+3HWeaErEiJYzWoiH4arsR7Kp0tCZh6Q2lu1iz/swj+3hzaTdx84pm
	 hWa8a5p9nI07wj1Mn229u4fr7UAD0ApSHUcp/eNQgVDKZrUEmJLEK7SF/8VL7hTxiQn/i
	 mQXF7j5YhlNGB+HNmVDMd0a8ZuD/yYxoMTSvOPUQkzrzwrSYaXY13LbroDShTqIQox5iv
	 iv79MViZEEVn4ily/PWjqToB95hilRoHzN7XNDx6yBeFg9N7X0q/PmaQJRwob6J3uCg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792504512;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 Received:Received:To:Cc:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-Last-TLS-Session-Version:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=ymwhQMokcAX+qi9ylQF4RcvEZZj9qN7ShyZzia91L/g=;
	b=NgrnCI9sPEHoEHrcIoZmjv0mhDpJCzBaWyRSLupSoei6JhZoAyZcJNB1UGoynkTzEE/d
	 aElTcISj7n7S6hs7QNH4qQB50A3hCTxyPrJ+wwIhUXXHukFvBHEMP8MsUUIH2DklEsx9x
	 qKhEAqN6Sa1QKtNiMr/7Cf5Td1bIhbp2xjPawtvNA2d86t2FQqmhoLPmjyPg33KVby50B
	 iGY+6KLiuYTklTBXBjUnv1rHgJlHV4u1UOFENfZrAY+XwtU9hcFPB73mPIOAWV6tTkBHn
	 FYvMW1/ARhNERZxNxvpJhpMQ//7Af5Xkn3kMjEzB1h3OaqCHlUgr9MKXjxFfS7dR9FA==
ARC-Authentication-Results: i=2; smtp4.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792504512;
	bh=ymwhQMokcAX+qi9ylQF4RcvEZZj9qN7ShyZzia91L/g=;
	h=To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=cj1jYnwqmsqltK86pUKMUx8jiupWd4Vr6RHG48A0aoH5/piWsYUEeVenxuXxv4v1p
	 R6wvefUjaXO8CvkhL8xE1p5ZUsVkXeep2aRLZpgH30+1POfA+T12J4IYwphZ2zQb6W
	 iUfuASwx75w1C2z5y9q76OcT/ExUdsWwh1EuW+Km6aq/daSYJc4Ad8jKfJXvjnbvGs
	 PJv+aOoUrwpp6ZhcqQiFJXwJEnrPg+WlEzScJR5tYgaEfvuOxEQkCRPPIAHgrvhrZa
	 cFHEAHz98dI94ySAQKmEEMAmYIkfoKqcNU2vjnXk38Gd+9YTY1PPYJ3ZKw5OsgDc/R
	 mN3KHwSsFIXcA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6DEAE40856;
	Tue, 20 Oct 2026 13:55:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 60883255
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:55:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D7ABD60730
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:55:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4K-mk3_BLYoA for <buildroot@buildroot.org>;
 Tue, 20 Oct 2026 13:55:09 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org AD86F6069F
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792504508;
 b=G468bAy8K++7F24SHz9f5yFK294pPy/2kpSgACc6jqA8n4nXvwleOtGNyiRq03zMWbok
 WuOdcLcHvquldmp2V+n7hqJYMAc8qBHt9vRPghfTEiTmTc0M8ptX3b9sKYFirJqDJ0TYG
 SLbTAJEDgYVWhXSSclX9aMn1ZC1kft4EJXKDtbRtRlbft9JPvrr7NLVpPUSZCNWJGqaJs
 JDyOMzLDLC0aaETes+g/Z4muWegYmHiBtwz2J/PwEZZGwtfYbc5Wh5QmkmB3V1Xo8js8f
 DG3JuUvyErnmDWXh+v7JOouvSUwTV53da5BVwW5D3r1gXHpZWNWni9uIdhOHLMZ4nKg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792504508;
 h=Received-SPF:Received:Received:Received:DKIM-Signature:From:To:Cc:
 Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-Last-TLS-Session-Version;
 bh=/G6FbXx+OvIcidUlmigJyjo/YpYGVWLi4dxLk3o8gzU=;
 b=WEizPHz0lbBki7o/8wLdxmBgwKs9o23ejEfNsVX0ovssH0PJMWHnLGBmMi4ijQYoCsTj
 eOlj9Unko5U5rHOOU9R08e+rWS4ZhJLxrRDQgc1E8Srs11w30W04bm3vmbVXAEI132sem
 pQSHycnZC6ZidM1IycUf+uJSYq8M2aErhuPZNvFpxQda5bqyQjfqJK8tqwASHUVCuXHoR
 IL7FcUN7p2zHyPLY/lIkx4ZIPf4FmjMPM9qdm0sRQFOV4Ujb09/b8lB7dAJQE8bWmSVUT
 4MIp/trtkPClVi6hCmZkvPHcxhGDkkK+o9C7AGcJnRYw774m9fp2j0asHbQKuH+nP6A==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=bootlin.com;
 dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=dkim header.b=CU8bPQ7U; 
 arc=none smtp.remote-ip=185.246.85.4
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=185.246.85.4;
 helo=smtpout-03.galae.net; envelope-from=thomas.petazzoni@bootlin.com;
 receiver=<UNKNOWN> 
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id AD86F6069F
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:55:08 +0000 (UTC)
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
 by smtpout-03.galae.net (Postfix) with ESMTPS id 424A04E41289
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:55:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
 by smtpout-01.galae.net (Postfix) with ESMTPS id 1000460393
 for <buildroot@buildroot.org>; Tue, 20 Oct 2026 13:55:06 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon)
 with ESMTPSA id 2482310328D20; 
 Tue, 20 Oct 2026 15:55:03 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 20 Oct 2026 15:54:54 +0200
Message-ID: <20261020135455.1595899-2-thomas.petazzoni@bootlin.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261020135455.1595899-1-thomas.petazzoni@bootlin.com>
References: <20261020135455.1595899-1-thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
Subject: [Buildroot] [PATCH 2/2] package/network-manager: rework jansson
 handling
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
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

jansson is needed for BR2_PACKAGE_NETWORK_MANAGER_OVS (which selects
BR2_PACKAGE_JANSSON), but practicaly speaking, network-manager's
meson.build detects jansson regardless of ovs=true. So we make this
jansson optional dependency explicit.

This commit doesn't fix anything, it only makes the dependency more
explicit.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/network-manager/network-manager.mk | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
index 5071546c27..b96abaed14 100644
--- a/package/network-manager/network-manager.mk
+++ b/package/network-manager/network-manager.mk
@@ -107,9 +107,13 @@ else
 NETWORK_MANAGER_CONF_OPTS += -Dmodem_manager=false
 endif
 
+ifeq ($(BR2_PACKAGE_JANSSON),y)
+# No option available to explicitly enable/disable
+NETWORK_MANAGER_CONF_OPTS += jansson
+endif
+
 ifeq ($(BR2_PACKAGE_NETWORK_MANAGER_OVS),y)
 NETWORK_MANAGER_CONF_OPTS += -Dovs=true
-NETWORK_MANAGER_DEPENDENCIES += jansson
 else
 NETWORK_MANAGER_CONF_OPTS += -Dovs=false
 endif
-- 
2.56.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
