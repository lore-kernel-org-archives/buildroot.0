Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 613D2606A326
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 19:16:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=DI2hwEuG;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jQscZpaZ
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C93381467;
	Fri,  6 Nov 2026 19:16:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fc6EomN1aEyu; Fri,  6 Nov 2026 19:16:46 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 45828812D6
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793992606;
	b=iVMWB0JeEKa8hQZQ/GDf0FdGzJLWAAJ+Im4SK3fSxm0Y25K6fwvvCrvOr9SDMUpmu1CN
	 Urj14MIaXPCSDTadq+G7zizNY4ToxPMFAZjPVsHt9msYA0Qv0YFi3Q87/pO2x6GQsb+Dr
	 ZxShjP+AHErNtNthcY2PAAGeiIlwFpprRspYTYo0nmJ/LtXOJMX/iAJxBQ3wFjOM0nj/w
	 85vzx1te/T3WoFEuRvRX3UAa8AEbvX8jvnXPZ7buHXmvVkn23sjokFTB5RPcBQzu2Qvkj
	 zto3XgLqCSJKQ06znSpKM7rcCW6xp4HHwKFVQH87njVFzb4sGf0izNjT2EzVWii0W9w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793992606;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:Cc:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=yWAXQxN768/0yC/uras6n3eGyXDI3rdYn4u+dX7qqhE=;
	b=p+YbusmXGxsLKF02lC3HnYcW0JbTAppUlsjW3sfN4KuxFoIY7PD+/bbTvdWlv7xnIwHf
	 eKwohK0M8JvOOaERRkJrW0A/IBUG9vyoj50Amc82tmJqTgOeyTlwpgs7JMW7+SI7XohJE
	 OyVXv3irCCfLW/QnvzfXkfohvnvxandyAiPJewPMBt3+nq7kv5r5ikMd1VQQGXCQvj2zW
	 TzFin4WBFDraM/C2d1foSstDt/AebnvZ7s3/gbO4FXZb2Qg6JfbwMtw75A1OwiMum0wF9
	 70JV1BmvsOsZ8Uizna3vZCDJidoPWAvNyfWVRKKK4QI1GCYs3nqD1gKA88UPUudytyg==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793992606;
	bh=yWAXQxN768/0yC/uras6n3eGyXDI3rdYn4u+dX7qqhE=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=DI2hwEuGHD6+meYUCKs3NPQnHGghVcBPinAhzP1EctYINI3awMdF2rfrYYmRMx0NQ
	 JBdwemBfjJ6XDp5ib7hAiSvJ8C1XSx+V/Kvy0qp2JX8ZUbemu7Uv6/Ygjfw9GZWFIT
	 QrVNfD7OGE/w7j4YfDC7B4Ch7kNM0jLRRpckM9cnCZV8627Fs7+qNIkcFyLCCp2QiU
	 K5YVUGmAuge9rLmX+AzXj5ImpJ09xodq4Swg63Gq3Tq27hGjhO2Pwc5Yr09F0cnApQ
	 +roiiUuP9LOHR8q28PeW1I6q/P8N8jiDRcFlFDnHQge7bbLGX8SCTyuJblNHgPC3H8
	 L+n2GBmmowS4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45828812D6;
	Fri,  6 Nov 2026 19:16:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A68594B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8BFFF400A2
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2SOQYJ9K8t53 for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 19:16:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org A1BA5403FE
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::c33"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::c33; helo=mail-oo1-xc33.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=jQscZpaZ
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A1BA5403FE
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 19:16:38 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 006d021491bc7-6f5a0893610so677803eaf.1
 for <buildroot@buildroot.org>; Fri, 06 Nov 2026 11:16:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1793992597; x=1794597397; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=Q0v5nEHxNguSNH/8xDXOgLLGWHcpzmQeIbw6WyQ4BSM=;
 b=jQscZpaZnQb6fK+Mq5hsQUXO3dEIFrOenrT0/lrdY4gsFCUjhmh5E1/jwv2y3b8cru
 D6LyJfsbk4D5iONE6ihG+886rIVRakuIk91RgSwuCZLM6FFsGn/ioB8LSP+7HLKGVip+
 /zvOm3ik6b7TbvgVI2QH9omwIMd4EwhWAe0HQT6+HdIjZorm5jHwyVFjiIPbtKL4H3WQ
 8GAMDutP/CTxcygasxpvTvDb/TE32n1nA/Qhqu/06oxsPO4xHtViK7z6h7p9THNL3DvW
 6/Vp4iruSSfvR9M3pY3E1Eb/rLTzMf/eFmNkgY2BiLrnB7HSyMMv/2+GpmmqkOwJ1yXM
 X4hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793992597; x=1794597397;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=Q0v5nEHxNguSNH/8xDXOgLLGWHcpzmQeIbw6WyQ4BSM=;
 b=OnS9fTjBsTsZrkHM0T7XVbFxKqJuR/GXwfDVCxrWFC9NPjLBHz0ydHk/SxFfwPpNm6
 4qSMxCsQBqGhFkyqEXtcIJTERDi5bjMl1Zy93d23AqRx0C4TKcpuWMgCczcDjuxjPpM5
 6xeQ3uve6stJObQzdWrDglO9etIqCu+e8UNnIiu1rx6FthnVsGptL+CnNjsKAE//4eEq
 XthqM4J+erutOAXTqYFr9Uw2vrGRV7t94mqE1TXLTNtqLlENoYY4Xxv4O9sMk2N6ATZk
 edvkJXhoY+NCZ9W5DUU0hNts/rPmuKun98Lq8k22pfXlVZvch/a9eHjOMwWnwHB/cSCN
 jKIA==
X-Gm-Message-State: APuU4Z8/oueXsUKj4GY64iR5XLz8U0z2ZNee7hdPCuRmYgkSG8R3J1ib
 nF1AZp8vh/Q74llnh3Tvo4geJMq00YIGcmDR2VB35cVhcYIyz52DQ34aLPOYqA==
X-Gm-Gg: AYBFou1A2kEqcji0HYEx2MMQ+DClQ4uglZe4ihI55Y8Q0R4bkI0hq851M5kpV4o5EU9
 lm8QeBKoTbd4K4c6kTwZ/uEknuFXhpwkR/smxt6sMbP+iXkpda2GKMnkRtt1aEGuvKfaNEfvzrM
 UHtsde8UCYQ7VVhQq2CwiN8LEQxXVJpmXg/GphVFF5qzRQEYIopztsvsXO2Lj4VKnml88LTcG20
 zNUeApYg4VtA4niQ7McYFLC7E4RgdLfjY8eIG+D6JG+Ja3FFZ7rRDU4dUu5mk5m2q3IanSKY/t4
 7PVyMq4Q+P0khGaQ0K5lq5rq1JaPLxWwmlceqoJbbhDddeSQzVwAE8atppUbUBgDHF+HkWi3tXl
 V3sH/CLAJtzviOQF0hUNrJhmu5Nu3+K524wcEJ6XhqXA7TfJapEBi4VhPxmvoNqan8BGyjnxJTh
 ntqbTjmknf+BYazp94u424c/0SMrLcdOBBIHynHK9I4cVqBHY14TsVu8esZyENuskOw1DE/vd07
 wTIbJSTVjDZPHrEzRZlaKlNtmhjTyMr2a2AFxPk9X2ZDYArrr+bXbhQKFHfQMUa3KeoEx3d/cVy
 UowUy+JzzJ/PTumgT6ffeUFGM+8tKqpZQbhqXQh+XWg5/+Z7TMGU8NxbOpOvzN6VQb/njm9r1iJ
 xFR7qGO1LmNqiEqYw14Q+kOi9fmFpGQ3bPKlNIyhmdRgsI/8W6FDb5QjrZhUYYzksgOhlDLcLAg
 qG4afEXP1hFSyR7HcBJG/k1/0ksvkS5L2zTEqA51rkDJCGIoj2tcOr0dtxb/9XdXGrJ8doCG6Te
 g==
X-Received: by 2002:a05:6820:16a0:b0:716:cd2c:e475 with SMTP id
 006d021491bc7-716e7986669mr1991949eaf.44.1793992597457; 
 Fri, 06 Nov 2026 11:16:37 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-85f1de4e53dsm2478655a34.20.2026.11.06.11.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 06 Nov 2026 11:16:37 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  6 Nov 2026 12:14:58 -0700
Message-ID: <20261106191536.2120153-32-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/python-typing-inspection: bump to
 version 0.4.5
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Manuel Diener <manuel.diener@oss.othermo.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	TVD_SPACE_RATIO,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-typing-inspection/python-typing-inspection.hash    | 4 ++--
 package/python-typing-inspection/python-typing-inspection.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-typing-inspection/python-typing-inspection.hash b/package/python-typing-inspection/python-typing-inspection.hash
index ba13d7b128..bdfb5698c2 100644
--- a/package/python-typing-inspection/python-typing-inspection.hash
+++ b/package/python-typing-inspection/python-typing-inspection.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/typing-inspection/json
-md5  9eb41f5bca1969b126f61febeb516a51  typing_inspection-0.4.4.tar.gz
-sha256  547274fa6b0a561ccf549cc9524b999a578e737d015d8709d021f9d0d13bea47  typing_inspection-0.4.4.tar.gz
+md5  17283fba012873d79df87ee889caeb9d  typing_inspection-0.4.5.tar.gz
+sha256  7f16c411e7930dc79596d42ab44672a3fe5f60eb34b781a1647e7872363120c7  typing_inspection-0.4.5.tar.gz
 # Locally computed sha256 checksums
 sha256  804b59b25f2c31bd278f9202a19ae49a3945aa2664387e2d0a128c7cacc61ec3  LICENSE
diff --git a/package/python-typing-inspection/python-typing-inspection.mk b/package/python-typing-inspection/python-typing-inspection.mk
index 74db189565..a10529290f 100644
--- a/package/python-typing-inspection/python-typing-inspection.mk
+++ b/package/python-typing-inspection/python-typing-inspection.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TYPING_INSPECTION_VERSION = 0.4.4
+PYTHON_TYPING_INSPECTION_VERSION = 0.4.5
 PYTHON_TYPING_INSPECTION_SOURCE = typing_inspection-$(PYTHON_TYPING_INSPECTION_VERSION).tar.gz
-PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/a3/26/b09b8010994eccc3c09092e6b34058f36a460eea2d4c3e8b910c695975a0
+PYTHON_TYPING_INSPECTION_SITE = https://files.pythonhosted.org/packages/ff/50/0195198eb1d75bab716bb0a813abea4cc394bfa17a92a189f021a34859af
 PYTHON_TYPING_INSPECTION_SETUP_TYPE = hatch
 PYTHON_TYPING_INSPECTION_LICENSE = MIT
 PYTHON_TYPING_INSPECTION_LICENSE_FILES = LICENSE
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
