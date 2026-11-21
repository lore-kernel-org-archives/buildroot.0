Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82243606A330
	for <buildroot@archiver.kernel.org>; Sat, 21 Nov 2026 20:09:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qmiBuejg;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256 header.s=kas202605290044 header.b=spBb3E0f
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 59E8E40607;
	Sat, 21 Nov 2026 20:09:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7y5vC_RpWVkv; Sat, 21 Nov 2026 20:09:40 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 5B0064061D
Authentication-Results: smtp4.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795291780;
	b=d3lIb8JfUNbLjiUo7LxXTcnXwWv7hcqhhWtIxNUgsJRyTigb1IhGnCGRgP+kZu+c5dz5
	 xLVA4MLln/79Qd1irt4yTCcpBkbRGydf2HeCMFre06dbeTK3og8pVgf+Z1/e+3WBFCxTr
	 50fbzdMqE9AIowHFgYo4RL0uo5IDv36DgN4myJz7Nssg1yLq6pV4jBw38LnuDoBWW7lWU
	 wDSIbr2ozwDMeJC/ypffBf6c6PCgmkQdaHiB3KLjLKXXMrmq7VrQ669fOrMoazjK1yl1L
	 r2hARHyDSgk2jax93ycfSlptZCKWbC1hIOU4R3FZqDChkAk1ZkwNFsCVKUbnT1IJHfw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795291780;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:
	 DKIM-Signature:X-KAS-Sym:Received:Received:From:To:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:X-Spamd-Bar:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=oq73ySv8/Xi3UqeXeXfb/AFAncI5nCMVX87ZVem9eIg=;
	b=f9tdntBzFl0F+7vTqAdsaY/VgygDYf/tREmrItC5JX7skix6EAriwKuOUyqLyCwnr6mx
	 SL0qrrK8cPCOoJSrgJbsRR1kr6V+eWjcCX7zrEeOLYowoMWM8r1HBUs7qedSKmATQPt5z
	 uRkGb/QF+5QOrjAobhN7d8j4gUjLJfRCyxVUTmSMnM00XjgdTHPDT8ubU15M1fRzQ8Fjm
	 0mAN6oGkbmkDvY4E9OBY+TiRDc2jjih0TyqDWqKHJqPYaVvivvS09WRcDXDRg7K1/oVs9
	 uCxODJzUj6qZK6JtumOm3fr5GZ0REn2tWkcNg9wHwZnR2DHaQXwo1F0OsWWYWX3pjeA==
ARC-Authentication-Results: i=1; smtp4.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795291780;
	bh=oq73ySv8/Xi3UqeXeXfb/AFAncI5nCMVX87ZVem9eIg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=qmiBuejgDYv7d+tBfW8psaTvpniiNrL/dyLKE9dtbGftJcxKU77onPf4G5IJZfheV
	 LU39Ffu2yW2WCD+E534JJtJfxcEOMrpD4SiId++gJ8RzLiDQxUh/rMOby10z5fyWfY
	 P/5PD1pI9rNQ7T77GE5OPih/J+o7TOPXcjZyyqyM0zr567iPGlSHYUya/i/ZG3b2UR
	 lQbd3Fuh16eQalp1lwe9Zz51/WvIPkQnHd83JYvYBSC7GDNp0R3V//+tW61MpqacnE
	 qIZmGVQ/ngIM2PE+y7QyEa45tt2ybpZSx76srlf75OYdlcgY0f+geRajuL1eoOBwDd
	 JBHB0NNAtS9vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B0064061D;
	Sat, 21 Nov 2026 20:09:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 4E078465
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:09:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 341EE40081
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:09:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 60UgSzZ18qGO for <buildroot@buildroot.org>;
 Sat, 21 Nov 2026 20:09:38 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org 64F6140070
Authentication-Results: smtp2.osuosl.org; arc=none smtp.remote-ip=85.13.140.57
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=kuhls.net
Authentication-Results: smtp2.osuosl.org; dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202605290044 header.b=spBb3E0f
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 64F6140070
 for <buildroot@buildroot.org>; Sat, 21 Nov 2026 20:09:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kuhls.net;
 s=kas202605290044; t=1795291759;
 bh=Y0eT5KwBTfdRBVmnrZKZ8zaEvS6+V5K2q3V5nR/GqgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=spBb3E0fnOm7rgGrzg2Jzcj0kQyy4YMlCcVmQj2S3+6s8R08+AAYIa+bLklSg5Ov8
 wrJmJPOlxc0VYrqZn6nGJKD2jjUf33OdkxZ0hj57zShghpGIS2dRV2cZhAsWYIfQyc
 92L+rkODa74NMl8fsnpv2gVj39u5NwqQ3L/wb3gohVbMWYEK4iUXmtwU0fRa4QZh4H
 mM9IFw5GQIrLRzhCWCKCVX7YbK9yzZndE20n+gl0o0YzoBbhx4RTKBNeVrHxutuRq7
 yebS9w1PM8HFOrFy0MjsFeakMmpx/MK5TAOl/r/s95AsX8jdW+XS0HmdEO+I0x5Mh2
 IH4rzUtzIqhxg==
X-KAS-Sym: v3:f51bdf72230551df:kiR/jCxABIilLY762ar9EXtvcaN4WdtnENdIvaq1hxPum
 hwbTp3VkMgvw37dw2qWzic8kqtyzmg9P6FVJP0rUyuN+ay9WFRsCtKMTbx7fk8E4quInsmjWZEh
 yPdgZw5IR2ZuPPkC7W8VqEIdLfoLH462//SFnQEi0ve7sseiMMia8OPqwUyoJJHIOlb4Ki6TYKE
 pXsuhB8LR4IUydJrBOc4/iKJoymbC+E0okd5KLrPajxJ4R9jFu4s8NlTA5SRdioAL7iLfgFSofg
 RSdHzbrh/jgON+GaaCClAUd7iyGIgrb5NBai9adGGEWFSX09KlmZhqeoz98aMInC8Exk8f9A==:
 Hev9OOWsKSNWE2QjdxZyugpa8lDNnsmskrZ1+7bduk42PR5a21juQ4HDZi4I6G4QVlEWwr2ukyQ
 nzBVfxbp3hw9HtTB/3lbsTtlyZT3L134LGC4Ux+DzAc33bvzf6ZWdUH4F9n7fUsUyQ878w20MAa
 jxsXKz22ISAu8r+gdP1IUiFpqIti0qA3Jtid/jcdFnUZ3kFiaQP2RoL9x7ZIBJL2Ex+obtDxqEk
 0hNgoyuni5GqfPOIpA00FYiYxo4tVhNL5OWTYXyFqYw9s2FVCnEWfsmT7WQlBytKfQcFAuQ3B5v
 agvTJwHRLoKAX+7vc834aUoz9RhU0f56beLY9cHm9koZDdTaRBJ2x80/5EC2NGrGG9G3LUA+H5P
 I5i43rQ4h9R0M/fZrfT7nRHb0dRIhW9SZzjCyOPFaYGgUd+CLs6aI2cy9NtPsJjFx2JlUiHbZ9/
 IDRZTCW5P7aTxlnLIG0SSK+wk0fuaO33M+dkuSZTNP00Oy5hVHzefkwo6fHoXUg0FTphAcAeZeE
 LnXGD0zvjPUk18RpI4MGMmU1DO+veo4WOFjHsbHwHhlsVbvV5IExPpSlBrGrDjbbDBzC2R2wg==
Received: from fli4l.lan.fli4l (p5b3a06d0.dip0.t-ipconnect.de [91.58.6.208])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 62124A4C45C9;
 Sat, 21 Nov 2026 21:09:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46466)
 by fli4l.lan.fli4l with esmtp (Exim 4.100.1)
 (envelope-from <bernd@kuhls.net>) id 1xUrOh-000000002I8-08PV;
 Sat, 21 Nov 2026 20:09:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 21 Nov 2026 21:09:18 +0100
Message-ID: <20261121200918.130286-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261121200918.130286-1-bernd@kuhls.net>
References: <20261121200918.130286-1-bernd@kuhls.net>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-Spamd-Bar: +
Subject: [Buildroot] [PATCH/next 3/3] package/docker-engine: bump version to
 29.10.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Christian Stewart <christian@aperture.us>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_EF,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

https://github.com/moby/moby/releases/tag/docker-v29.10.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
Series passed Gitlab pipelines:
https://gitlab.com/bkuhls/buildroot/-/commits/5415da42408ca8c8d1feef0997646df1a3ccf698

 package/docker-engine/docker-engine.hash | 2 +-
 package/docker-engine/docker-engine.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-engine/docker-engine.hash b/package/docker-engine/docker-engine.hash
index bfc184bb75..9f3600af4a 100644
--- a/package/docker-engine/docker-engine.hash
+++ b/package/docker-engine/docker-engine.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  cd6ce54e46ac19f5dd0b5226a9b292965ba542bc16bdf9edbbca946da8930b15  docker-engine-29.9.3-go2.tar.gz
+sha256  52ee9d504b0ff278fb591956d761f6f5a8f0008b6bc6d19bc2916856b3f725b9  docker-engine-29.10.0-go2.tar.gz
 sha256  7c87873291f289713ac5df48b1f2010eb6963752bbd6b530416ab99fc37914a8  LICENSE
diff --git a/package/docker-engine/docker-engine.mk b/package/docker-engine/docker-engine.mk
index a8fa808032..a703c11825 100644
--- a/package/docker-engine/docker-engine.mk
+++ b/package/docker-engine/docker-engine.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_ENGINE_VERSION = 29.9.3
+DOCKER_ENGINE_VERSION = 29.10.0
 DOCKER_ENGINE_SITE = $(call github,moby,moby,docker-v$(DOCKER_ENGINE_VERSION))
 
 DOCKER_ENGINE_LICENSE = Apache-2.0
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
