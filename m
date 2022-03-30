Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F5EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 14:21:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 19E2941CA8;
	Wed, 30 Mar 2022 14:21:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RW5XGRJxF6yw; Wed, 30 Mar 2022 14:21:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DE96D41C8F;
	Wed, 30 Mar 2022 14:21:01 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 851B91BF360
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 14:21:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6D334404F6
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 14:21:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xyqoi1HNOist for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 14:20:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C7B91402F3
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 14:20:59 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id r13so29497149wrr.9
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:20:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=Od9EKXjCxsYZFTu9tvTYyXvanHh3Q5oYRjS6kpi011A=;
 b=OWmazJETP/BidT67rfyZzCo7I8PVj9PAjLyk0qmI/YJbDqOCBpwl9AJVlJkvXd6cbq
 nkTb5OEsZI2UJdt7eN5XGQit7uxLonnppmDxghPQwNAFhpXuDdN6lONWmfftwWRXiZ8v
 KLiqLEf/rW3M2G2fBmrtPTus7IAx0eft8M+MrjKr7YX8zLDfDRQY8Z/02FTdjeIXC5Rd
 6FDAOlw5e033CoY7cVEPiFUSrZpNs1Hx+IE313tjfGBkRvbokwwhs39Th44NpVwqRV4y
 U02u0iAAfoXOlY3oWW5htCB0fj/YvH1n2s2mJhgBXJ2qLFbxl4Eqyq8oMcTvG7e0mZ2L
 ku7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=Od9EKXjCxsYZFTu9tvTYyXvanHh3Q5oYRjS6kpi011A=;
 b=UQV3aPhgMr8XfTStJ8ofqzCJXwpki2DHIuDvBcLBA6RtNW41IatFYCHFJeJMN97kcq
 WE86/aDRa80fZpJqUWjU85wsfUd7sFIN039DvfPMRLuqumatE0iIMIh8cOuGrYkAi6sy
 NvfuU3zPoMlE/z4nPd5fNpNXrry+7Luc/Rf0FsEGAke6uk6aEDhAqUS8pnvKhRVM+HDo
 TKKxMvXn86TXPTTkNkGMAJ2f5xZRV9ZvxwYyVfWFRO3J8fZinr7/MzE9ipmFyj5Lpdju
 JSutiDpEthTHlE7L86tI0cQLM7oDMQRwpd+/+Sn/TKu7EmQgbtJyh2c/G88ZXK1YxwR7
 +RFw==
X-Gm-Message-State: AOAM5310AQDdrXmudtTq+PFuW6U7h/cJlm9jeEhZpUB/F7WoZ7vTusin
 +aiv9t7+EUPofqFlmkw/A3DSpoa8FIVAag==
X-Google-Smtp-Source: ABdhPJznTUW8a2Cmzav7nb0g2LiP+v8V+wz1FhFRK6Wx4e7TpvUrKVJ8WMQ1QIMvjqLHvGRN6xshoQ==
X-Received: by 2002:adf:f481:0:b0:205:b814:887b with SMTP id
 l1-20020adff481000000b00205b814887bmr23590902wro.472.1648650057779; 
 Wed, 30 Mar 2022 07:20:57 -0700 (PDT)
Received: from localhost.localdomain
 (i19-lef01-ix2-176-180-85-92.dsl.dyn.abo.bbox.fr. [176.180.85.92])
 by smtp.gmail.com with ESMTPSA id
 d14-20020a056000186e00b0020405198faasm20334973wri.52.2022.03.30.07.20.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 07:20:57 -0700 (PDT)
From: David GOUARIN <dgouarin@gmail.com>
X-Google-Original-From: David GOUARIN <david.gouarin@thalesgroup.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 17:30:13 +0200
Message-Id: <20220330153013.16091-1-david.gouarin@thalesgroup.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH 1/1] package/pkg-cargo.mk: fix build with
 BR2_ENABLE_DEBUG
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
Cc: David GOUARIN <david.gouarin@thalesgroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
---
 package/pkg-cargo.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/pkg-cargo.mk b/package/pkg-cargo.mk
index f7e3f39503..cf5ee2ae54 100644
--- a/package/pkg-cargo.mk
+++ b/package/pkg-cargo.mk
@@ -155,6 +155,7 @@ define $(2)_INSTALL_TARGET_CMDS
 		$$($(2)_CARGO_ENV) \
 		cargo install \
 			--offline \
+			$$(if $$(BR2_ENABLE_DEBUG),--debug,) \
 			--root $$(TARGET_DIR)/usr/ \
 			--bins \
 			--path ./ \
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
