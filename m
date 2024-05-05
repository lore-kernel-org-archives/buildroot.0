Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 680ABC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 11:52:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4CA35404C3;
	Sun,  5 May 2024 11:52:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2iy4QxXoyJve; Sun,  5 May 2024 11:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95BC840B5B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95BC840B5B;
	Sun,  5 May 2024 11:52:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 09F6F1BF36C
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 11:52:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E965882120
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 11:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BkElW_qpSr_o for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 11:52:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32b; helo=mail-wm1-x32b.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org AEC97821DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AEC97821DD
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id AEC97821DD
 for <buildroot@busybox.net>; Sun,  5 May 2024 11:52:14 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-41b869326daso7387005e9.0
 for <buildroot@busybox.net>; Sun, 05 May 2024 04:52:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714909933; x=1715514733;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wBe8cTWAA/y3wzAk50ApOZUWujb90roWAEyH8v9abhM=;
 b=ExDMgWtXIZC5pKwXaoqgWBYMCtEPEDZ6PDMcjSyVPvKgcr86T6goPfEpO5QolQQkeA
 rDzGY1eNGE4eTlXa2ACQu5fmTMtA9pkrWEPprn9jSm+1zZZZgmZq/+bpsr0zKCzWpORq
 R3hZuNZZqje3/1IBEXNoh77e4FEQuEWDCU6p+tODkM/rZze6V7rnbwf9WZvuFEjrdqwK
 +I0RKTGeRPDPYvwLaH9/3ZpO/To7buWVaRKESqc4G0Om4TjVnA0l8h89VNO3UG0yhRUI
 obVBrnP9aFnnPCmb7VptJw6EJR4kSaeyRXun86VvOBV9QMO5ssC40wVWWE/Z6qWgMQ4e
 vVzg==
X-Gm-Message-State: AOJu0Yzas+/dj4ZM1DWiTOPhxicLRzlYt0N8WUleEIGxcSxdJebReeWs
 iuu01TkP5oHUaJK8Mfiywdr3v0EMQuDeMponj19ObZYSFPyHHW4NLozvK97fyNeTUIeCubBpHJ1
 YeA==
X-Google-Smtp-Source: AGHT+IGV9ej4Z2FK32nRwbUbuNdDozX3Z8EcqsaFge6OYB8m12jMkgPGf1CV36UdRVc2Shm0LMHYww==
X-Received: by 2002:a05:600c:1d0a:b0:41c:2699:dd9d with SMTP id
 l10-20020a05600c1d0a00b0041c2699dd9dmr7326662wms.28.1714909932584; 
 Sun, 05 May 2024 04:52:12 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 bh10-20020a05600c3d0a00b0041c130520fbsm12254212wmb.46.2024.05.05.04.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 May 2024 04:52:12 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Sun,  5 May 2024 13:51:52 +0200
Message-Id: <20240505115152.24857-2-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240505115152.24857-1-francois.perrad@gadz.org>
References: <20240505115152.24857-1-francois.perrad@gadz.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1714909933; x=1715514733; darn=busybox.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wBe8cTWAA/y3wzAk50ApOZUWujb90roWAEyH8v9abhM=;
 b=b/TwboQX4ZsZ5Sjo5aJ6w8W0+fdP/QrSE3uR3fHc4LBMQ2kr2Orjobo3+9F1+b1sGH
 icsmVIWoOEiBNUJWHKANYmt0JG8zSz7DfYLmYT67HdIlzJHvCBP5cOvcVvqzmUrR53A+
 bPZ5QCpnFuTGtqmPl67D8zEIhdqc7ObY3YYt7/mO71QfbWevMij+6IBGrLiZVgn1TgjB
 g9rMUEILubuG9gUbKzqSbtR/NME7XUu5Ed1dFfWFwDe3qPcgVgpljU1mz+ZFY6tM1g9W
 rIjbRvB1Yzp78654BcTya/FFzxEUvTDG8F2NaW02NX+C4wbHKOQKypSQL0Pv2AwG0us6
 3LCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gadz.org header.i=@gadz.org
 header.a=rsa-sha256 header.s=google header.b=b/TwboQX
Subject: [Buildroot] [PATCH 2/2] configs/olimex_imx233_olinuxino: configure
 eth0 with DHCP
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_imx233_olinuxino_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 647292899..7049cfeac 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -7,6 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
+BR2_SYSTEM_DHCP="eth0"
 
 # For automatic firmware loading
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
