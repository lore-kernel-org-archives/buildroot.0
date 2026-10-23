Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F7BF606A31F
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 13:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=mxBUv3GN;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=UVtV2JsF
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 147436070E;
	Fri, 23 Oct 2026 13:30:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DGqqm2Xl6L0x; Fri, 23 Oct 2026 13:30:23 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 2E36E606D6
Authentication-Results: smtp3.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792762223;
	b=sBoN66pydNpujOESXJEwbJyooPihCrsJZb+RFyHh7VPrLPFj2L2iBfdUfLdMHSjUxMFd
	 lX1bT+gLGJOWEg3/p7sqrM05FUv1ny7XNjEB7sMEPqn/nL9GylAyh/78Kzx48c/wmJioJ
	 tXq2dzmx1HC+7p/O7yEBQ4LQnX8h4DKwD1ogMCwkSdToSqDjXapCteUDGDzx8ggNNF+Ij
	 61u2BSgv1N3frO027fbgeIK+uN+JRYUFYSquTc3gD3z4K0RFkf0InhHSkc33zCjoAgF5e
	 ahcCN44+T/ADsRa0H5SN7Ed9Lga32OS4N2HAMnXNIMDkOF5lJoIh8v+yjGG2w/mB15A==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792762223;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-Id:X-Mailer:MIME-Version:
	 Subject:X-BeenThere:X-Mailman-Version:Precedence:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Content-Type:Content-Transfer-Encoding:Errors-To:Sender;
	bh=/n2d8KfLQHTwof/TuqneRhAlq4VdlDu/keslyyxkQP0=;
	b=kEJAFlAuLFab20CMbNkvIdsXOaS7COABY0MSHC0P97GrWU52OsZjOvN9WdZqpRfKZYbq
	 YtdupmnHWyBIzUGsWayRsYAO5sn+du0EAv74bGoABBBLfC8yAJAt3r3oBKuF/Hf1Bcvru
	 N5nPO+kHNOkedEg85tSEdK/fnraE91vqxVyr0xZIL59QWog/8LRKxJOdG7aBVX7kJ7Tvm
	 8y4RYJ+u9vAF8+gyK3bK7ZVCxG9ElJRCB3fQndjeHekJBFJIzEqwYAI/yG/2+dWdVFucm
	 Xhe2wljBq02ur1mXp10HKI1AHZWG/DxOWf+TjFwR1t/3ePEM1eLNPmGyQ5wAkTAJI4g==
ARC-Authentication-Results: i=2; smtp3.osuosl.org; 
	dmarc=pass header.from=googlemail.com;
	dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256 header.s=20251104 header.b=UVtV2JsF;
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792762223;
	bh=/n2d8KfLQHTwof/TuqneRhAlq4VdlDu/keslyyxkQP0=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=mxBUv3GNWdx0s+wQK7/bmO090Bfg9jQS93/dk03OkEqeJ/FUMk16giopcFGWiZ4xx
	 RCUdjVyFAv1dZY1om14E3yxDBJcn3+a644JCW9DeD+GOHgkXIqOfLmYI2C4XgI1i8b
	 g6zHkrVCUxBgHwJOosbQ0KARMrKzVdssHVlp9iiwYLmpF4ugLFisRHLmKmd5+yQQMo
	 zT462jem9LdDwL25HZN7/laBTMdjTzSefVsyJWL8Em2q1V54LNl5i8x+yfydXyYAPD
	 JzlKmi1HVxwyFSZ7+7Vs4At9spw97b8qPT5B8bu4zbNmibrP4xmg833cLdM340XM34
	 O5yXeW9C9Yc4Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E36E606D6;
	Fri, 23 Oct 2026 13:30:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1987623A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:30:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0ADFC606D6
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:30:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NQL0mEyvLFvg for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 13:30:21 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 00A9A60668
Authentication-Results: smtp3.osuosl.org;
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792762221;
 b=tGY86k3y6r3I79ZUz9ZKcx/ZRh6vCk1Y4yr2+nfoWwtxHFuT+/WKp8QdlKm6v9f+QTGd
 k+0ZDqgVRIAeXe4gLBZ/liTJVhDsy6OWzX4qSVdgS4RdRgm3PWr7iKNtiZNHEJckkT2AR
 TvWZe5IH4zT2ekvoz/U9td1kBzvzzyzD2SAPtJ+rTZs/UAtJADXuc8Vs9HjtOtZTJcTlm
 8dxQD5lDpSfwiGNBwOUVXyDlwG/Bb+35nTE150kSU3pQYbWW3X20GLBdWikDqHBZmUEc1
 f7LqPWq/coOmbUanSGO8TSh2e8JvdpfKcPHgvFdh5uUPwwWmYVbCrWpBM0vVuoQicng==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792762221;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-Id:X-Mailer:MIME-Version:Content-Transfer-Encoding;
 bh=/yUxxMpPxJcXzXtEugtPq7QEY2fZ1AD8oXSKRb29e7c=;
 b=hYLPZb2Socqc8ZQmHfh3C25x8+wdvkXp6UBQxQ4rXC+E/GzflG9F+ZF3oUugkPgqn/iY
 Z+FV0mAQkz0tRRtFSm+Iag0BEcOvbkhyw89KEOdt8mJYD9RCiQ1R7RJc3zFgJclZVftOl
 JZokfpnwQ4qkv6LKHFyYWeuWCrzlY6McxRYm4plS/+1swcjSpSA74slACKs4WdXM1zPoh
 Wf1J5RrbTDh4Hnom7MuHZQJhmxWhs0CbxFMW4Y8SPbHkuA9SWOKWsxfM0hnwqrUcfMewJ
 OiBOa6UNGNt9lC/p1iCJIsmRvSaFlnRZQnXqDN270s0e3lIkU5UWrj1/b2dpCTGnFIw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
 dmarc=pass header.from=googlemail.com;
 dkim=pass header.d=googlemail.com header.i=@googlemail.com header.a=rsa-sha256
 header.s=20251104 header.b=UVtV2JsF; 
 arc=none smtp.remote-ip="2a00:1450:4864:20::634"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::634; helo=mail-ej1-x634.google.com;
 envelope-from=yegorslists@googlemail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org; dmarc=pass (p=quarantine dis=none)
 header.from=googlemail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com
 header.a=rsa-sha256 header.s=20251104 header.b=UVtV2JsF
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 00A9A60668
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 13:30:20 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-c4395d31228so137977266b.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 06:30:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20251104; t=1792762218; x=1793367018; darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
 bh=/yUxxMpPxJcXzXtEugtPq7QEY2fZ1AD8oXSKRb29e7c=;
 b=UVtV2JsF9U/+XVK3rTLfF/oHgI6Vy3gZwRUpdvXHSldxMBoG25E2tIwjnQ3EBfRIlG
 +t2ZFeu1CG1cEppWL29OnySBixBAwHY1U1V287jYE+OfXVNUq7SSUhP/1x3le6MUIrds
 bjd/WakS/zD4G+BzrDzjhu5PceSca+E7N//yUjnYCuyAJk8+xu/Z30U6dtZFVzzcNUYi
 CWtX2gf976Yb6ciyyjPp9VnPkWU9bZxJvAjM5SITzFWlQzrBNegqR3JSzF5MrOG9URDK
 WNHc51uLekFUHsUu1YLZM03OljNWnQ6IhYqZj3U5f7gB6vqi778z2lvaP1eWG2zy4iPM
 JgCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792762218; x=1793367018;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=/yUxxMpPxJcXzXtEugtPq7QEY2fZ1AD8oXSKRb29e7c=;
 b=YyYD/u3fXfVzSyYaOt1QlqPeHKijTdyRyBgRFNN8Ub/0c8Ig2N2LD+zKtcRiVwflKW
 tlUD96/iBlGhqcz1Eq8RaZ63bsFTj93GiY463d+DRDhtN9CB9ryACKFh53h+knfm/LgJ
 +v9/SvHjVEV+wzG+mUOjJh37U536v9TBVv/nT3AaoXWpoJb7wdFCgxl4sH7vU9rCznu9
 +wMXByJ+0Wf4mGteJahi4z1jgYnaySVcxjGIOAGemWnE54/LYNNJ2gsjzeEGr/B7z0it
 CawGIKy+Ekk7O4oomxClpzXbgMGFkRJA+ajPPgguSObgSvfgLxw8/ijmPbyNBn1CpbPH
 eFNQ==
X-Gm-Message-State: AFq9FYLXQAx9tVxlyy+ZaWKJIq9BRQmB0EoHMg1a9y9I/G+jEd41zMTj
 gxz7KSjVZ2dz6oJwNXrxGh6gUdzZeDBnkOEyDcgGwc7NYmlzDZJnxctEFPP4Qg==
X-Gm-Gg: AYBFou3PQ7OzARNYBk9V3+CPOlJL3NYBMqQaQLEMt9LVW6AuNjkiBQrRDMhXK323UTS
 kY5QqzxrcmBNOeapap815IBKqLzbmilnS1+P5VsF5EcQiXXvddc26UC5kr+/b5zLWhJApD6ixNx
 e6SreL3bzOEy+a44xNbYIaHBmIFuMWjXyyNmnDgEHDhH7RPBv0wtRiuJVnGR6mW8o10V40TA2+X
 9DGCBkEqzrL4w6LurkPJTNKCYA+Jc0KzWc8yi0yhIF+RVRIbFq1WEO90XyOio80qwQ6ZWZ6UB+u
 rsGoJOLr5eLZVk164Osm1pva0XY9v8tMUtZKiEsU13h7gHWI+ebJsS5vMxCQZ++a6UAGxvV13Sf
 Y1VzgJN4G75cE36orbX3UOTv6U4Hc5gt36P6GyZQ4kcmC5BlbwLRGg+F2HyTw1gSY2m1R85VOwf
 1DPL9hQOGM8ZVg5q07YMqKqip5kEM6cg6y7QRNaki80WFaAx1BFi2c5dxKqME0w6WCcD2crSESY
 Rmas4IKYX1KWI10/3BWWlXItHr9a8QUljSaGt6HhB6JDSjC7QFyfB+sxF2xEipCRqRlG6SMRvZH
 Z/uvJxXIXOk57Z1eoivIQGEL5W0SfoIxsik=
X-Received: by 2002:a17:906:f595:b0:c46:7ec3:fdfd with SMTP id
 a640c23a62f3a-c46a8fd5c3amr318246866b.14.1792762218057; 
 Fri, 23 Oct 2026 06:30:18 -0700 (PDT)
Received: from development2.visionsystems.local (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c46b8bc2c8esm1390666b.38.2026.10.23.06.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 06:30:17 -0700 (PDT)
From: Yegor Yefremov <yegorslists@googlemail.com>
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 15:30:16 +0200
Message-Id: <20261023133016.1694359-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.34.1
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/feh: bump to version 3.13.1
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
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,
	FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Changes since 3.11.2 include:

- 3.12: %f and %n format specifiers are no longer allowed in --action
  and --info strings, as they don't escape shell syntax and allowed
  command injection through untrusted file names [1]. Use %F and %N
  instead.
- 3.13: switch the default font to the bundled NotoSans Medium.

ChangeLog:
https://github.com/derf/feh/blob/3.13.1/ChangeLog

[1] https://github.com/derf/feh/issues/821

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/feh/feh.hash | 2 +-
 package/feh/feh.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/feh/feh.hash b/package/feh/feh.hash
index 61c35e6386..78babb4751 100644
--- a/package/feh/feh.hash
+++ b/package/feh/feh.hash
@@ -1,3 +1,3 @@
 # Locally calculated after checking pgp signature
-sha256  020f8bce84c709333dcc6ec5fff36313782e0b50662754947c6585d922a7a7b2  feh-3.11.2.tar.bz2
+sha256  785cd3bf51e05f6bb86ab0d649b7ed20e31892eb635bc5a25c963bf934088445  feh-3.13.1.tar.bz2
 sha256  c07900c3c11294d8dea3c592092aa41fda3789f58fa009910695de0ba2570aeb  COPYING
diff --git a/package/feh/feh.mk b/package/feh/feh.mk
index 340418e570..c32ebb95af 100644
--- a/package/feh/feh.mk
+++ b/package/feh/feh.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-FEH_VERSION = 3.11.2
+FEH_VERSION = 3.13.1
 FEH_SOURCE = feh-$(FEH_VERSION).tar.bz2
 FEH_SITE = https://feh.finalrewind.org
 FEH_DEPENDENCIES = imlib2 libpng xlib_libXt
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
