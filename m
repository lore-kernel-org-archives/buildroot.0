Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75592C5475B
	for <buildroot@archiver.kernel.org>; Fri,  1 Mar 2024 13:37:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3F70883696;
	Fri,  1 Mar 2024 13:37:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VMH8icPxuV5i; Fri,  1 Mar 2024 13:37:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A09835A3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A09835A3;
	Fri,  1 Mar 2024 13:37:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3B6EE1BF2C1
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 58FB54016D
 for <buildroot@lists.busybox.net>; Fri,  1 Mar 2024 13:36:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ci0D1AtRnlXJ for <buildroot@lists.busybox.net>;
 Fri,  1 Mar 2024 13:36:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52a; helo=mail-ed1-x52a.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 3B8F640644
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B8F640644
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3B8F640644
 for <buildroot@buildroot.org>; Fri,  1 Mar 2024 13:36:43 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-56694fdec74so2733105a12.1
 for <buildroot@buildroot.org>; Fri, 01 Mar 2024 05:36:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709300201; x=1709905001;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OlgqGuh36ehNJiVVoCxNXxhAlXwG6OEjKu1L1xo6aFU=;
 b=gq3P9o15p5H1KOfFaHsAOvByQCMZ0Ntti8/39tSRTxP9fFcVnMN8KP3+KFiLwe3riY
 ai3mNIlU/USIrUZBZ/Hq/YYJ1WXIYFA8+pLLW5h9xvNfMZDurDrwQccYJMxNgNhBZrYC
 sfLH2G34tXb/kp7AWY88usN3rAuGOsZhbAD9zGpURg6bzoy7v8CTUfezb/s+4aH7A0h/
 W9eLJJ3rpnf6xnrHLz5CFdsMP4gZwPfNsnKyKvDnuVyKw+xFKhOJ0MvG1gYV8SSWIDKi
 EmJS+A2SWJU/iD+5bz1dNe9nNCfla7eEm/QQz4hRpE06fSm8DSqKs25SX0K9UpVMLSWG
 9O+g==
X-Gm-Message-State: AOJu0YxFzX5gF3TwSr1TvuDMSRaZ0U4KyVrrZIvQPGfP1K+h+ks53DS1
 A+kUzwI4KTi9h5z3rVs/btLy5yoB9EmpELdmEDPINpGeVno2MQbOSnNQyxgN4RbYPaliFWI2j+Y
 WEXE=
X-Google-Smtp-Source: AGHT+IFa9IM4gHIAN5qfx2RIe9RcBhI+lyQCHRVgj0MzGDcfiIc4x2khqVC8QCzVDycUl6598EOw3w==
X-Received: by 2002:a05:6402:70d:b0:566:ab45:e6ca with SMTP id
 w13-20020a056402070d00b00566ab45e6camr1504846edx.39.1709300201247; 
 Fri, 01 Mar 2024 05:36:41 -0800 (PST)
Received: from localhost.localdomain ([2001:b07:6474:ebbf:5260:58bc:42cc:9d46])
 by smtp.gmail.com with ESMTPSA id
 q28-20020a056402033c00b005659ea1caf0sm1566608edw.6.2024.03.01.05.36.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Mar 2024 05:36:40 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri,  1 Mar 2024 14:36:11 +0100
Message-ID: <20240301133620.3547430-15-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
References: <20240301133620.3547430-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709300201; x=1709905001;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OlgqGuh36ehNJiVVoCxNXxhAlXwG6OEjKu1L1xo6aFU=;
 b=fWWwZx2GywGf4f76Cy1S176N9pOkiuLRf/1YevQOY0MTkON8yrShYwFfmbUq1lcLvT
 mpH5pVDtCj32KMgnAUKDcJkXeOqrh0kreGNuG5hpHompoqa/fezAOXyuDROLPuMTpFgO
 L08qKkvYcUNPvA8fvNJpDsT4wuf+u1vw4q/YY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=fWWwZx2G
Subject: [Buildroot] [PATCH v8 14/23] package/ti-k3: disable HS-FS for AM65
 SOC
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It seems that some TI K3 SoC variant doesn't provide all SECTYPE.

For example: AM65 provide only GP or HS, there is no HS-FS.

This can be checked in meta-ti:

meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES +=
"tiboot3-am65x_sr2-gp-evm.bin"
meta-ti-bsp/conf/machine/include/am65xx.inc:IMAGE_BOOT_FILES +=
"tiboot3-am65x_sr2-hs-evm.bin"

So BR2_PACKAGE_TI_K3_SECTYPE_HS_FS must not be selected if
BR2_PACKAGE_TI_K3_SOC_AM65X is used.

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v7

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 package/ti-k3/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/ti-k3/Config.in b/package/ti-k3/Config.in
index 2a51b1531487..b8545b7bca62 100644
--- a/package/ti-k3/Config.in
+++ b/package/ti-k3/Config.in
@@ -32,6 +32,7 @@ config BR2_PACKAGE_TI_K3_SECTYPE_GP
 
 config BR2_PACKAGE_TI_K3_SECTYPE_HS_FS
 	bool "hs-fs"
+	depends on !BR2_PACKAGE_TI_K3_SOC_AM65X
 
 config BR2_PACKAGE_TI_K3_SECTYPE_HS
 	bool "hs"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
