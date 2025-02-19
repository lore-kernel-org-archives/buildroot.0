Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22C8BC021AB
	for <buildroot@archiver.kernel.org>; Wed, 19 Feb 2025 08:51:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB4EC503AD;
	Wed, 19 Feb 2025 08:51:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Avp7ZLFSu12P; Wed, 19 Feb 2025 08:51:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AB9704F395
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB9704F395;
	Wed, 19 Feb 2025 08:51:53 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 446AE968
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 258AD606A3
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id raP0jHFIhe48 for <buildroot@buildroot.org>;
 Wed, 19 Feb 2025 08:50:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 54A4D60071
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 54A4D60071
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54A4D60071
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 08:50:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-4399deda38cso1238215e9.1
 for <buildroot@buildroot.org>; Wed, 19 Feb 2025 00:50:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739955055; x=1740559855;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=RYbAwh+xXXYdJw0BuIzDTf944bHmvt023iTElyJr05A=;
 b=gtsXjyeka4Mr6xMBQFjOFYq0C1E7s0P5ILiVpgnOQ3ktUj6zi/GIizQmOi+wb6SCvt
 OrSU2kK91lsamfbxAmY2SipMEiHG3Zy9+DCBjGYPaEZHoWcJVqEpapx94LVZYykt7naK
 prehY1EcGvybGGqZ+Ivnsp6CUIYEnhcjuLusdsbN39GLdqW2C2t66dYV/XwWE2MfB1uP
 MADeag7ECdaGJi6BCfIk1BEdnmy1JWBS4TSnEgb1hYCYxc4BCy40THGUYPFUQv1P9myA
 v8fGGt9wFKF7jwn79zvnyvnISOREgOBibumE2ZraQZBhjpiCy3Y2F5HT3QtQ7NfKV3dc
 YfyA==
X-Gm-Message-State: AOJu0YwnlvmdntATtgmGfuS7B4m0u0wyoxzhfNPVCFrUZhWKc8R49opZ
 WaIEzG06JAO6/51FXjGbRdas8pa4xUPWsfyXakRVufcle4oUuc7gMRG11Q==
X-Gm-Gg: ASbGncv7lCpy1W99OEPbORCTxviYuSlOOIDPLKbSOajpIvxuPjovBL1Y+eyy6Axuhmz
 F3xxKcMTVDFP/1WxrwgCkaz1EUSS92rh3NztXxEUBX2Pwh8Xg4Wp0T6bf9x3yhnTVvWDLJA/yTo
 s35iIBTvhcaF2tyOVavzNr51VBq4xWCNYLOBjrW9CifHE58LbPNuG2wb/2QDpDJGw92yG+mixvw
 8UrYteTp1Et400QDtYo6UP9uSeROw7SBOtBYSDuIH0v15C0RDanecyZnvhRKtc6xk5j4EpXCfpc
 MngEoL/NKrql6lX8ZcSPJ8Tbog==
X-Google-Smtp-Source: AGHT+IGzSBicB1Ojw61IN4hOnyd7uv2FV0eJ0raUh7/sz11QPWUNC3X5Cs/vQ4SAtE9Tj333tSIvbg==
X-Received: by 2002:a05:600c:1c04:b0:439:942c:c1cd with SMTP id
 5b1f17b1804b1-439942cc318mr51596875e9.15.1739955054798; 
 Wed, 19 Feb 2025 00:50:54 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259d5e9esm17517399f8f.61.2025.02.19.00.50.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Feb 2025 00:50:54 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 19 Feb 2025 09:50:33 +0100
Message-ID: <b326820811ae45852729132fb018525f572a4825.1739955023.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <cover.1739955023.git.yann.morin.1998@free.fr>
References: <cover.1739955023.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1739955055; x=1740559855; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:sender:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RYbAwh+xXXYdJw0BuIzDTf944bHmvt023iTElyJr05A=;
 b=BEZY6X3im9G0oWGGTadM1w8U/smIIx+D3FKqC0oQVowOllHZjfF3DEs8TM2ZeaJw0X
 WwThajeRjaEgJw58hMfT+lI0AiTMD7vwKlm+PinNMzQ+llUeHGxg36BQrYnHu9qgn3DP
 dEf1PsfA02pMTtvs/y7fREYFb++RMKhVV0HzmlM7rlFHP1SKeSuqeTIZsXncl4duEI1g
 WBuzMQ5Mc8jU4fD5JS6vd2hLXELrIpo7vvo80+LxpzC6Bdn+oWoSYFuFZOThbs43QaGd
 H++3odjulRW0Ar3Eh4hxQp0PGkET4sj6iMIp4jAieYNgZxA1FEUVElbkTQg9kzwpaM1u
 1y1A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=BEZY6X3i
Subject: [Buildroot] [PATCH 18/27] package/boost: add graph option for host
 variant
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-sdcc will need that option.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Michael Nosthoff <buildroot@heine.tech>
Cc: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/boost/Config.in.host | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/boost/Config.in.host b/package/boost/Config.in.host
index bf69287383..c378c0ce74 100644
--- a/package/boost/Config.in.host
+++ b/package/boost/Config.in.host
@@ -5,6 +5,10 @@ config BR2_PACKAGE_HOST_BOOST
 # an actual host package needs it.
 if BR2_PACKAGE_HOST_BOOST
 
+config BR2_PACKAGE_HOST_BOOST_GRAPH
+	bool
+	select BR2_PACKAGE_HOST_BOOST_REGEX
+
 config BR2_PACKAGE_HOST_BOOST_REGEX
 	bool
 
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
