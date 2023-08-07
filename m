Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8358EC001B0
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 19:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4BB681D11;
	Mon,  7 Aug 2023 19:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4BB681D11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mLkySxYzncrN; Mon,  7 Aug 2023 19:58:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 477C681761;
	Mon,  7 Aug 2023 19:58:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 477C681761
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A2E831BF284
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 19:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7C2AE4049E
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 19:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C2AE4049E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fshteOi3A4-o for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 19:58:52 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C5D4E40122
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 19:58:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C5D4E40122
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fe4a89e7efso26668685e9.3
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 12:58:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691438330; x=1692043130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BG+ju/RJ64pmo8dbuI8kiBwK06J3DfppQVGFulhC3WY=;
 b=I8nYcdYdcu3m37JKdOx2KXtII0wbu2g2QtO4hVj/Xjmr7QCZw2KcgDRX4pIKafSMBV
 UQJFO4TTrcy/Up9DZZJAkyHo4X6hWzxecaXrv1X3IuHZ29vXngLole3woksQAhFXo9tp
 8V4aoumbzSiiRZGATf3++/e13itsZUeggOIsnbpNMCGVTd94moJNC8yPEcjImYUqCz5A
 sxCzI6yadY+RtAMD+7m40U48eIiU39a55LjqrdPc8TJa3W2mXyecknuxoOsnrnSZkgut
 oOzjbqOR6m3HuoLg98D4399vFpzNOXKUKBNkU7sU9kXpWJJop31NO/MbhgpRz0Q4GDqh
 WIKw==
X-Gm-Message-State: AOJu0YykGsKh+mrRy63NEQ9X+kL+dvcNxdlKKlbrjZ4OIuIl3dBG3FTn
 b0kWbDWfQUyRCRf2t7IWlp11dyRzkOY=
X-Google-Smtp-Source: AGHT+IHz0clasSd1q7OYnkIuN+MTKv8m9o+8+RK1hBF07mWlIdUYiE9ytG1EPnBarhd00FxVLgwwVQ==
X-Received: by 2002:a5d:42c4:0:b0:314:1d53:f3aa with SMTP id
 t4-20020a5d42c4000000b003141d53f3aamr6322076wrr.50.1691438329514; 
 Mon, 07 Aug 2023 12:58:49 -0700 (PDT)
Received: from p1g2.home (2a01cb000fac0c0088f09ee77063439d.ipv6.abo.wanadoo.fr.
 [2a01:cb00:fac:c00:88f0:9ee7:7063:439d])
 by smtp.gmail.com with ESMTPSA id
 x11-20020adfffcb000000b0031779e82414sm11451294wrs.79.2023.08.07.12.58.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 12:58:49 -0700 (PDT)
From: Gary Bisson <bisson.gary@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  7 Aug 2023 21:58:43 +0200
Message-Id: <20230807195846.1553615-1-bisson.gary@gmail.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691438330; x=1692043130;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BG+ju/RJ64pmo8dbuI8kiBwK06J3DfppQVGFulhC3WY=;
 b=ZrTiUFGiIg6RRLN9M6q4gT67Q1qsulXnMbjYAiKbztRtPOPYn/6+rFYa4Mv9De8uP5
 P9it3mBAI0+THfDXtTXiEUZjj/VQNpS+qwLLMZjxPgo+brIP4x2VkVj9l8HwBZc3MzEd
 XdVUYPDRdzj6byh5Wm2jrX/GgouS7/X7bbxN9KdOUelowc8gQy4swibNhRTV6Uyzp+7I
 ljEo8aooXv78cw4Ny17hCKNNV0AJFKtoPDYmRuSaM3HfZC6jHzRwQJQD5I3Go+ehHIKj
 skNv+VfM+fti4RkzYt7+OBe6bsqAN0/OWx84Co8B5+kHzLHwO+NY9eoghNSQjUmorDAQ
 0c2w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=ZrTiUFGi
Subject: [Buildroot] [PATCH 0/3] configs/nitrogen*: update & fixes
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
Cc: Gary Bisson <bisson.gary@gmail.com>, thomas.petazzoni@bootlin.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi,

This series updates bootloader and kernel for the Nitrogen platforms in
order to fix a few build issues reported by gitlab CI.

Regards,
Gary

Gary Bisson (3):
  configs/nitrogen8*: bump atf version to v2.8
  configs/nitrogen*: bump u-boot revision
  configs/nitrogen*: update kernel to lf-6.1.22-2.0.0

 configs/nitrogen6sx_defconfig | 10 +++++-----
 configs/nitrogen6x_defconfig  | 10 +++++-----
 configs/nitrogen7_defconfig   | 10 +++++-----
 configs/nitrogen8m_defconfig  | 14 +++++++-------
 configs/nitrogen8mm_defconfig | 14 +++++++-------
 configs/nitrogen8mn_defconfig | 14 +++++++-------
 configs/nitrogen8mp_defconfig | 16 ++++++++--------
 7 files changed, 44 insertions(+), 44 deletions(-)

-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
