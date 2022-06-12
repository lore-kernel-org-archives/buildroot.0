Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44109C433EF
	for <buildroot@archiver.kernel.org>; Sun, 12 Jun 2022 22:07:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 916F860E2F;
	Sun, 12 Jun 2022 22:07:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VZ7q0zMi6Yiv; Sun, 12 Jun 2022 22:07:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 75ACA60D78;
	Sun, 12 Jun 2022 22:07:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 86D791BF96B
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 22:07:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 81BEF83143
 for <buildroot@lists.busybox.net>; Sun, 12 Jun 2022 22:07:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cIh88Npw9Z8S for <buildroot@lists.busybox.net>;
 Sun, 12 Jun 2022 22:07:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C56E383131
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 22:07:39 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id m20so7730542ejj.10
 for <buildroot@buildroot.org>; Sun, 12 Jun 2022 15:07:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=mLFukBuXzAZ0RvBRGL3+zX2cwyl6ZFzrsvChnEHyN4o=;
 b=clUCUXZSH4YE3mPJ8qyA4qdOGzOMoTf+ZQOKWzQEXNnBDblAVHifPuK2eszBmUkXpx
 T7VurfPDNLstMoPf72V1zhkTluffApUyk3yZasBeEvZhGKRtPvM6yRlfrV5lICBiZEzw
 rWY/RVlDZPPR5psxZGFX/DH/LjKxDrFzWcIXg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=mLFukBuXzAZ0RvBRGL3+zX2cwyl6ZFzrsvChnEHyN4o=;
 b=0NmtmFUroLa4Dq//7N8O7M5RLXYM2kJcapJmYfBvjPT5CJ0Er2pfLEPlQWrX9UyfC9
 Fll7jSeApNWUsIXxLtUq+0xfmh/y5Mq+gE4RN+D3vQCa/c+vIid2UgZK7/0A4CrvrOem
 P5myZnNYhwQ9UzOfLC0uCJLHIrNnR1VMMJqEiYw4CNnil1soeuGitl8H2UFWj0MYlVwC
 AhaFCI8b+KwBDw38Rjf+bO6Iwdj/fxvWKTyPUz9ha9DLysxKSB8RwWgHCrD6z4jxFPo0
 ZolGgO9sBMi/L3O2BPFLsegZ1E7H0zlyKhZUdmn6dw2OIceCYZOKxCF9Z7tiJXnBktgm
 kGKw==
X-Gm-Message-State: AOAM533+63k9xYYlbs+pMN66J/QQXTvLxN57aCOS78crPkBNKEa79hyV
 lRAHcG0wMDkfxCUwSIM4l/PqpMZbVH6FLA==
X-Google-Smtp-Source: ABdhPJzup9/qKoy1PrWSAF0xj3qsyEQEnVrRay4++cKHGreYJMNoVB7RBqn3Saulwul8eaMhSS017Q==
X-Received: by 2002:a17:907:94c8:b0:711:d864:fd84 with SMTP id
 dn8-20020a17090794c800b00711d864fd84mr30330555ejc.18.1655071658052; 
 Sun, 12 Jun 2022 15:07:38 -0700 (PDT)
Received: from angelo-ThinkPad-X270.. ([37.162.241.219])
 by smtp.gmail.com with ESMTPSA id
 a20-20020a1709063e9400b006feb002a620sm2955914ejj.1.2022.06.12.15.07.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 12 Jun 2022 15:07:37 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon, 13 Jun 2022 00:07:29 +0200
Message-Id: <20220612220729.1231925-3-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220612220729.1231925-1-angelo@amarulasolutions.com>
References: <20220612220729.1231925-1-angelo@amarulasolutions.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v4 3/3] package/busybox: make udhcp discover
 faster
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Instead of waiting almost 10 seconds foreground (3 discovery packets for
3 seconds retry delay) at each boot, make only one request then fork to
background. This way, the behavior is the same for working interfaces,
but it's way faster for interfaces where the address cannot be obtained
straight away.

Acked-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/busybox/busybox.config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/busybox/busybox.config b/package/busybox/busybox.config
index 52cb8ffcd8..2409cbcce1 100644
--- a/package/busybox/busybox.config
+++ b/package/busybox/busybox.config
@@ -1022,7 +1022,7 @@ CONFIG_UDHCP_DEBUG=0
 CONFIG_UDHCPC_SLACK_FOR_BUGGY_SERVERS=80
 CONFIG_FEATURE_UDHCP_RFC3397=y
 CONFIG_FEATURE_UDHCP_8021Q=y
-CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-b -R -O search"
+CONFIG_IFUPDOWN_UDHCPC_CMD_OPTIONS="-t1 -b -R -O search"
 
 #
 # Print Utilities
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
