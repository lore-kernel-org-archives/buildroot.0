Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7F98606A31B
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:52:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=gZeBwIS+
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B354581696;
	Fri, 23 Oct 2026 21:52:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2JpDroWUIz8A; Fri, 23 Oct 2026 21:52:24 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org BB2E98169A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792344;
	b=h5d1xgAlt5yGoinCfRz0alN+Z1PFaLNIgvvuUMWrg2BDDLqsTaPTRAY3e9yHLq2QRV7k
	 hH/kimMCjTNJjmStOHypcZXU05+PMQUaJ2aMi0wVyGXn6oen2uTjzCnEVmZJn2+pbv5Nx
	 wfG/cHStQVzsAPR9JRGEiXsX/aeMGQVfRLfTrA+Xy4D3+UzYVCTA2RO2do1n/iZcrJXZz
	 6ZOyeM1/9n4VSAuTp3SpEle7qwdvefrZ5be1T1wgYGzAPVS293JVpQbpbPQ78MdN2gyY0
	 djqno9zLPwXOjNqYT04+fS/zSnjCM2aYNCI+kEltPsECU0Q7YBO2WYw0BFxQgR3qqig==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792344;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 Received:X-Relaying-Domain:X-CFilter-Loop:Received:X-Received:
	 X-Received:Received:To:Date:Message-Id:X-Mailer:In-Reply-To:
	 References:MIME-Version:X-DetectorID-Processed:Subject:X-BeenThere:
	 X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=FHLPC7IS2/POlxHL4koNLgJNfSVSCodult6qlUB23QU=;
	b=gYzhdNZWmHFrkEtohwI1qBXutSP8xN3D0ZE9pBA480UgC21oSr4Kuq8/w3d0+KiE5cOq
	 bjzgPtSgQQ9CHS5T9SicIlGmKp67fo3p0ni0hAw+TArNT9CFgH9suB6VO3//Vd6L9o8hu
	 TS2KXASj2DohCvNpDNDvKN0kG9hB3b8ynFq25/QOMSHu+bQIDCnwm7+P8m/ErMS+WCg16
	 sUrVXRb47niNOespd3izHYnlInAwnb461g1k+zrfbZw0p3k2Ii8Gj1HDl2Ngj8OdHhcXY
	 P+zS02XzWTLlcrCLPc0rSsMJ+xm3jjZ4NuvnxXsVRntynb/+L9GXJAfkX3mLDMm5t5g==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792344;
	bh=FHLPC7IS2/POlxHL4koNLgJNfSVSCodult6qlUB23QU=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=gZeBwIS+s4zV3lh2XBo5/wn6Daut7UVlw6iOZDKzU1vMLRx2mxglAoHn2uHcBzZGJ
	 qVT3cTeZ35hxPuveLvrfLvlgam+DaVs97Jxwri6tO6cack2I9JgBBEqgt96gr0Tmo/
	 QPkETQgKL+gA9ElxUqtvW8kE9+6Q0No8cDU+jSg8qCXKjXETKUElklolMJZBR+oKv5
	 Vet12FMATWmm1Ig6e30c9JMSC4k7f6zS2HCKZtG6jHx/UQtD0OM8+fm5R8lsdimBfI
	 QDOYyHQU6GBLKs+hcw3nZOFKYxrONW3NKi1J0zFt9nh3PYjWp3rGMCMVuLxaGwRWlP
	 E/OrrGFbiv0DA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB2E98169A;
	Fri, 23 Oct 2026 21:52:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5655A79F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47B758168A
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PveSdk6Mgsl1 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:52:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org AC98681690
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792340;
 b=WOLRD/19dKXzF4NE5i3ubPx6h8ZuQ1evAC5AAmThK7Uz5BVb9cOWtITHNUbrpcOUXW/K
 y+2dPdmFkTXmYvDkjq29qCnAOrtLYXAZnyduEbJF3vokuDi38rK1G33NNnatl/5yZi4+e
 vYO1z73JGOjL3vVyCw5aT83VLKGdtRlbgZdTaWRd59y5hw+S0qXjO780Q6ULGstGOAoVg
 EmspbR17qg3voKeMcXNQ24xT01GmE8cNG/k5ATyj8bemWAlBr5H7h9abpWx1V8CThHZeZ
 yNPOF51ncHaaVBg/mdr7wQphJ1MQLxJlioI8A7yzdefdNBjNLkFvuqdRqob2p4J4egg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792340;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=fDfqmKdnVAt9cLjLpG63RhgYIhl44GJBMMKvHmjxo4U=;
 b=j1R7w363bwFdJpuxukJTC+kSHQCCNGBlly1BmE61pi/RkWR8yhXUB5dZGbb2f6RnUBki
 FAZ8qEPjfLeJxj0FVixVV93tcYNmJiqkQ8NXXaK+R+KFPynAdEQ20hEx4nYQVKd+SyFCA
 K9NBVOpiwftx1/3/HIt1nAHkRx1NDft72qGuxkiPwosAqkba1dNsdfEypK+NoOOwGb/R0
 VM0MLJfKELF1E3t9vRAbmjhwUdJiul4iLWMJlIybOGhCBHUL91xlOARxAq+AWgd0T+nIq
 00CtZ8TGifUhyRY804cuoSIQgrtVCb8WXrh689d1fNMzgaKX7WrW5P8iaE/24CDlwSw==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=PzrI5kH7; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::1064"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::1064; helo=mail-pj1-x1064.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pj1-x1064.google.com (mail-pj1-x1064.google.com
 [IPv6:2607:f8b0:4864:20::1064])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AC98681690
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:52:20 +0000 (UTC)
Received: by mail-pj1-x1064.google.com with SMTP id
 98e67ed59e1d1-3ac91ac8924so772760a91.1
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792339; x=1793397139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=fDfqmKdnVAt9cLjLpG63RhgYIhl44GJBMMKvHmjxo4U=;
 b=dtDCByTDmA1RkWi37AvvBYC+gvodDktqs3EQ+rOMlaZZTBUg22+4n0llE613EOdCyN
 4jd63egXx6nAD2sbxjknreRin08nqPpl0V0XC9OlzdisICaA0SDd7YfnfIe3+zQ2sW7A
 nDqq2XIioFRA4XjVGwfj8BG+9WblCouCInsjMPP5P9f2tWIxgRzlOjU3VD2ByZXeSoXR
 wiAe5zhhn8pKqxaIjZfA13119s8zRvN4PMlDqxmExKRlqTsOy8OiMRRcSFHOdr8KPwys
 kd3N9Bn6fHH8GWExVqeILDfVdUl5iodDh+iEF2onBiXeWnmVgReSA9u1gHzqZZ+HsTU6
 q4rQ==
X-Gm-Message-State: AFq9FYIbXLB9hMip1876VzsBPEajWjdZs/5k4OkcfWhgV/Q/yMdyIRGZ
 weWYjQ5P8K2VPG5DlUibR73wMjjHHg6zKUklZB26mcS6VdbUgoiE/R15sO7nG89DAamV8z3C6yP
 Nwe6lcQC0K0G65zO1NF0NCZexy2IHiRZQ05Zj9a590p4oZ4yzYuqc6z221Fm/iDZ1/zRE8EF72P
 ZGjybbSpn/dbcDmkF/hh+ZcIBh0e/Q6nmAFXyEYmU6FkUPmGuEHnYC3hCobO6YtsJKo9e0MYii0
 JpI1v/QGSeyrXg4hofq
X-Gm-Gg: AYBFou3tu0hEzCnU1FsenXoI2SWgnWamus0/MaDJTC4BEYMEmkggcdRfbs3LYR8ceXF
 koHmaulfvQjTlkbf1cIc6YDwZwV0WjbcahT8XWWNJoAR1C8hv3OyTNScusuhsue8LKVBS5f68cT
 YEiRgJpwWIVb9f6TvLKaD6PzTaUlm+Y47x9qH2Tk0cJ8zFYR0SI87Y1t0515LCwEwSOoKnDTpkq
 q/8UnKK3sGpucxlJ8jNm/N/B2CNroFxQ9wtqu5O9Haq3TKdfxRO9S5kzmBmyFdmQncTB3d4YmKr
 e/aLBv8V5Q38HEu+V2N3G0RkI8l+VvMGGQV3cI0yCYnlfMwQMykB15kcUvwXz5z2FUcvYaUnnbO
 qRY/P1fQCLIugiar4zY7w61J2RoGBVZoo2OoAdp0M1HKTdMHFnMrQxNOnV1dGkHCTguX1PuSj8x
 LrZRQ9lrGxjnmori8ACOOMxwLI1tULUMCiuJhA1YShb80=
X-Received: by 2002:a17:90b:57c4:b0:39e:21a7:5df5 with SMTP id
 98e67ed59e1d1-3adeabde85amr494062a91.24.1792792339177; 
 Fri, 23 Oct 2026 14:52:19 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebd52e2dsm336058a91.3.2026.10.23.14.52.18
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:52:19 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id
 5a478bee46e88-36998507c13so1434804eec.0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:52:18 -0700 (PDT)
X-Received: by 2002:a05:693c:87d9:20b0:369:987f:d15e with SMTP id
 5a478bee46e88-369e8336389mr781484eec.2.1792792331674; 
 Fri, 23 Oct 2026 14:52:11 -0700 (PDT)
X-Received: by 2002:a05:693c:87d9:20b0:369:987f:d15e with SMTP id
 5a478bee46e88-369e8336389mr781405eec.2.1792792330532; 
 Fri, 23 Oct 2026 14:52:10 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 5a478bee46e88-369e8db450bsm830025eec.17.2026.10.23.14.52.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:52:08 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:51:33 -0700
Message-Id: <20261023215138.2301146-12-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023215138.2301146-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
 <20261023215138.2301146-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 18/23] infra/autotools: warn for package that
 autoreconf without libtool patch
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Florian Fainelli via buildroot <buildroot@buildroot.org>
Reply-To: Florian Fainelli <florian.fainelli@broadcom.com>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
 Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Pouiller?= <jezz@sysmic.org>,
 Florian Fainelli <florian.fainelli@broadcom.com>,
 Gary Bisson <bisson.gary@gmail.com>, Romain Naour <romain.naour@gmail.com>,
 Bernd Kuhls <bernd@kuhls.net>, Thomas Perale <thomas.perale@mind.be>,
 Maxime Chevallier <maxime.chevallier@bootlin.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Francois Perrad <francois.perrad.86@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Arnout Vandecappelle <arnout@rnout.be>, Petr Vorel <petr.vorel@gmail.com>,
 Spenser Gilliland <spenser@gillilanding.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pascal de Bruijn <p.debruijn@unilogic.nl>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Yann E. MORIN" <yann.morin.1998@free.fr>

The libtool patch is now implicit because it gets installed for any
package that gets autoreconf-ed, so refusing the libtool patch in that
case is moot anyway.

Error out when this is the case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
(cherry picked from commit 59aeba1caa1dba75962726904fe712aa6c3e9146)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 package/pkg-autotools.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/pkg-autotools.mk b/package/pkg-autotools.mk
index 89894b9b6cfc..8e1b1b6d40a4 100644
--- a/package/pkg-autotools.mk
+++ b/package/pkg-autotools.mk
@@ -120,6 +120,10 @@ endef
 
 define inner-autotools-package
 
+ifeq ($$($(2)_AUTORECONF)-$$($(2)_LIBTOOL_PATCH),YES-NO)
+$$(error $(1) must be autoreconf-ed, but refuses the libtool patch)
+endif
+
 ifndef $(2)_LIBTOOL_PATCH
  ifdef $(3)_LIBTOOL_PATCH
   $(2)_LIBTOOL_PATCH = $$($(3)_LIBTOOL_PATCH)
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
