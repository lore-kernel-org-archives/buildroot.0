Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4E0F606A31A
	for <buildroot@archiver.kernel.org>; Fri, 23 Oct 2026 21:48:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=qds166dg
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C004080AC8;
	Fri, 23 Oct 2026 21:48:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Oo9OAdBGukUe; Fri, 23 Oct 2026 21:48:28 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org B82288168A
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1792792108;
	b=W8J2XfGT7FxWWf9W44oIgBE7ZoJSevkQD/y0iB6xpOfRhxExc+w74gW5TZUtyBAu+DOi
	 97jBjwl9TDzCkc1Gy0He8zxDEdmLOMjH91UYyuj+bCGyAaS9yf6jEh8GpfZDopt+P1P0w
	 z0GrSCO5GKG1TeZ0VWxtZnLfstnKMoFQT+U32uDsQyxZDcaLkdMFYhU10+41ePWRACXI7
	 DfEkSdOqEb5P4W5X8PdJ8wiocPHzZMq9dgaV16tJ3jLinRKtdNbVhbu3Si2WiyGnFafRW
	 +dJ16zTWV4I+t4ZFA1611XqGsNqlq4kpk+nkMm9rAynByOveC2XuHgP+YEzIEz5CTLQ==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1792792108;
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
	bh=fvWqMFyqklWDeRyyvBVaHBfqmsjO8OYcbDmMo4X9FUI=;
	b=E8CScyZ8wxISdX0SfuEn87V5M8uIlaXOlW5BD7zjhlA222KetVfaRtS1SGc8zQsW6Dx7
	 K7jrPXmbHf+apmtYQ9qlpqeu7f+iIcioq6eZ9uJkOl2o+qycoAGZYQD4kUGu9bTymUFeQ
	 532Tzw8jc1SGI4jqvWO1Y34Xnhid9D03PuhV66cao0xrUY7iHB0pEJgMCVlhe5u0V+vA6
	 BqGwP2Xdb4qUZUwywFthaaK4Mb/1ikXJ3OMGusylRspNDNbWoLC8wqMK3lsGnDgtPY0WH
	 y1ZX50UXOnom3rSnAn8t0gOiMm5OxTdTDVRLSrBoQQ/6TbPwpKcAQhCP0F12sDZ7kpA==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; 
	arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1792792108;
	bh=fvWqMFyqklWDeRyyvBVaHBfqmsjO8OYcbDmMo4X9FUI=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=qds166dgl2ma6h+W9czb4YZ/hK1NZ8dnEUfCPATwwccCw4MQmXEWd2z66BR2RJ00P
	 el6kQEY2kq6xpDFKDCs0DElB0S1mOuVcanyp6lIXzi2ZZJe12PRYzXK0G2OCMjhcaA
	 xC5zwtnrt7jyy4kIYrmbNwfRUFpv2iudwDjkDs5HyqM/5W27WzaPpWAY3MzVHs9A3u
	 YVSANkROuRzR8Tf7+o2z/hd0QbwrtUjCwogXwhQTq6z8wEozOIv7n107AF7ISBbVrU
	 7+miZ0z+Iw649MPnvaTq66mLEv8Q/5ZjMvuv0pj1tnclMyzv0wttUd2KxYl7KlbdsM
	 AndtK+aE6N5vQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B82288168A;
	Fri, 23 Oct 2026 21:48:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 95D5579F
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7BF60404A0
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EuvkaHzeyf33 for <buildroot@buildroot.org>;
 Fri, 23 Oct 2026 21:48:26 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp2.osuosl.org CD72140488
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1792792106;
 b=UmX/TK8fcKaBE163yA4LGVrPKYdMd8IS+R1f7iM7xPdwi53YF1uFV0YSmlf1nUrWbYf5
 Sriel5hD7ThPt9u5nwEhD5DiFbw3mO5eG0GwokRwQjdTOdpZyBdxU9FbWoCgRp5iSvjoh
 svqg0Xc9KHOm8HbwpPWDYgZ7QpWlSOCoChBRqme+BRLa1YbhwQ3gFZm5IGFjbP8p4LCnP
 8Sb1TbRrIQXySqiLbT1p81H3AQJ835IRO/uPyyqnYxcZz5JCTdvDtj0NjKD3OfFeRcvPj
 WwGYGiBjviIvmAtk/6k/RxVNzXmno5yWNVZrEbyVv2XSfrBnLjrf0BNki8povqnIqUg==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1792792106;
 h=Received-SPF:Received:X-Google-DKIM-Signature:X-Gm-Message-State:
 X-Gm-Gg:X-Received:Received:X-Relaying-Domain:X-CFilter-Loop:Received:
 DKIM-Signature:X-Received:X-Received:Received:From:To:Cc:Subject:Date:
 Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding:X-DetectorID-Processed;
 bh=hwIEBEa8Un+wP5fcgCJDVfrrM8rNnrFhEpqRy5mfUoM=;
 b=A3btcre4JdsLA5vLDAYYTXQnjjBQj/9WgEMc4Z5oS9NZWWd+AAVQoI1eNdDpnAUqYiff
 10dx2vSkNgIz6fmCFHgZCwyZcGw4DXHm/zOuXG/H8MTcfqqoBfOyNyD7mnr4Q3pG8T5S0
 W76AcsQnMiHkannOhDvxXxNAe0Pk3rf0MD8cDBiM8HRY5XsoEzC/mWEcU1Bg7n3bO2AV1
 C5WKo16bJVBaerQy3Q3qs8QZ6NcSz9OYdpF3c5Ju+sqaGRGb6Neh7Te2chLtb/fkhXIws
 8wfJJFtEnqfCX1rW/QLM7gkZ2K2KXY/CcSSf4vZ1LXk8sOUg3vL2daaMABPzlWLDz8Q==
ARC-Authentication-Results: i=1; smtp2.osuosl.org; 
 dmarc=pass header.from=broadcom.com;
 dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256
 header.s=google header.b=TRd1J4a5; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::563"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::563; helo=mail-pg1-x563.google.com;
 envelope-from=florian.fainelli@broadcom.com; receiver=<UNKNOWN> 
Received: from mail-pg1-x563.google.com (mail-pg1-x563.google.com
 [IPv6:2607:f8b0:4864:20::563])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CD72140488
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 21:48:25 +0000 (UTC)
Received: by mail-pg1-x563.google.com with SMTP id
 41be03b00d2f7-cc751eddf25so703674a12.3
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792792104; x=1793396904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=hwIEBEa8Un+wP5fcgCJDVfrrM8rNnrFhEpqRy5mfUoM=;
 b=Qgi0t/U6V9I2ag7HnRakFqxpVmQziFc5Kf8GNH+yvMdVFu2lUOKblbYbPPVpMQfXyn
 tNbnQTtTpKYqbolTeo36fF0A4kYYsiv0bOtSgPPzCaU2Kp2VwEqbEL7WjguypOWi/VyM
 AAZjQFFPMHH78ARabfP6XjNh5SwAvWxWqSb6gAQFyqvN+l7nvPBsA1mo6ANw6WbnfwC/
 Wus938T2D59+96UDbk2HLYtjELp2PqnrVtwSyMapU010XaL79va9hev5VaRlvVpgZPA5
 FxRCOIdg9W4Ve3DvaxwJTHA/IjoG2PCOD2ZEC90RujwdfacNkhP6grkALDsmcubhgOYP
 WqBA==
X-Gm-Message-State: AFq9FYJIAFZ/lmhS+VoTxkGp2hIi6+mmp3k3CZxGJvp7nmI4PfT2ZBQ3
 pcrrmpXZZ2zGMoHIN54MlpiBJiM6d7cKgxUaFmZs1da/esOwl5jG0+yOoHTj1Mt3Jww2/i0eMC9
 KxbBoHSSgFfp/d+0qDCRKUMgCuofGWTzqpJsNVmPzfel/lXYtsaMI95WvjLOqc7Po55ufTQD6t7
 /jvhBaD+66DuegcBQAZ4znYizsucMCDFngFCbd3fvuwg+7nO3tTvVeTmeiroR4n6+Pxh6FpIDsR
 yLT441XxlnyO8lfX1eX
X-Gm-Gg: AYBFou0ngAytVPpjFSX0LWu3BcXjzNq1f3A4TUw2NI6mLeDSO5u9OPYG7blG2n9I0xM
 dL4kcvJ2aDbn0aU84GqF//L58AC5nTe+at1P9Qf2IIbwXlkB1Sqjc4JiMNvGO2fJX+SXQZ8Xs+h
 BL02SUJMRucv2O7SQUGOV4FwmAoxJ8yl9xPi4FX+HdnkLx39S8kfUSQJJaMJ25n2LySH0v9QOYy
 DXo5qB7Ayp63IXAA6ajW63SYeQvk2sUMORKGfQMrYzWKg/FIj7hpuumNujKomq7tvK3Hb7QwAYm
 ZS6L3ZZ5CecnxH8Hw+2ldt2JUEHGdg2xL8zPKbH1Cy74aafmWEUAGF0puonwZrhkpt3mFf3Z/zn
 WFh/yOmGE520pJbUz/cvwk+j0xsOJzPHsxPRglAaxa0zsCVjgQ41HCdjMKCoOiqal2YdCbFfda6
 bf8ztrPW4eplO5+jcSMTcfox5pbz8OavB+/DbIUjFx5Po=
X-Received: by 2002:a17:90b:2742:b0:3ac:762d:79ae with SMTP id
 98e67ed59e1d1-3ade9b2f33emr456881a91.2.1792792104323; 
 Fri, 23 Oct 2026 14:48:24 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
 by smtp-relay.gmail.com with ESMTPS id
 98e67ed59e1d1-3adebb0aec5sm349990a91.8.2026.10.23.14.48.23
 for <buildroot@buildroot.org>
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 23 Oct 2026 14:48:24 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-93cb71b1443so278501785a.2
 for <buildroot@buildroot.org>; Fri, 23 Oct 2026 14:48:23 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:939:f978:c1aa with SMTP id
 af79cd13be357-940ef7acc30mr60462785a.11.1792792103040; 
 Fri, 23 Oct 2026 14:48:23 -0700 (PDT)
X-Received: by 2002:a05:620a:460f:b0:939:f978:c1aa with SMTP id
 af79cd13be357-940ef7acc30mr60458285a.11.1792792102549; 
 Fri, 23 Oct 2026 14:48:22 -0700 (PDT)
Received: from stbirv-lnx-1.igp.broadcom.net ([192.19.223.252])
 by smtp.gmail.com with ESMTPSA id
 af79cd13be357-940f066a5bcsm16398785a.13.2026.10.23.14.48.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Oct 2026 14:48:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 23 Oct 2026 14:47:46 -0700
Message-Id: <20261023214807.2151753-3-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
References: <20261023214807.2151753-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Subject: [Buildroot] [PATCH 02/23] infra: introduce a global SRC_DIR variable
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
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

This commit introduces the global SRC_DIR variable, to point to a
directory where we will want to extract the packages sources into.
For now, it points to the same directory as BUILD_DIR, since we
don't yet support out-of-tree build of packages.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[yann.morin.1998@free.fr:
  - rebase on master
  - slightly expand commit log
]
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
(cherry picked from commit 3471f1620f8d78c5533d16d1c6d73b58e3e69962)
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 9b62da3e4065..c1f12a4bfc38 100644
--- a/Makefile
+++ b/Makefile
@@ -211,6 +211,7 @@ endif
 # Avoids doing the $(or...) everytime
 BR_GRAPH_OUT := $(or $(BR2_GRAPH_OUT),pdf)
 
+SRC_DIR := $(BASE_DIR)/build
 BUILD_DIR := $(BASE_DIR)/build
 BINARIES_DIR := $(BASE_DIR)/images
 BASE_TARGET_DIR := $(BASE_DIR)/target
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
