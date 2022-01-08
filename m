Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DDD3C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:36:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCC0560A71;
	Sat,  8 Jan 2022 17:36:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rfw4TU-lSEcj; Sat,  8 Jan 2022 17:36:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2711060804;
	Sat,  8 Jan 2022 17:36:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B9C601BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B53BB60B04
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:35:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e5DSVDJXKH_d for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:35:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com
 [IPv6:2a00:1450:4864:20::436])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 22418607F9
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:35:45 +0000 (UTC)
Received: by mail-wr1-x436.google.com with SMTP id t28so11003267wrb.4
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 09:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=p2po+5CHF91f4CLgZCtQ9a3KLbE8Uf1ixJrv/XjK8kQ=;
 b=EkQ45WRJuleUg5S0DpQYaDfPsm/1S5hK3ELHYw7s4CntGcQ4D/6CCpCea8ttnLIMov
 +JXrT1nW9lJT/dOfdAeRJu/TjFGYzwW3dAHmTpP59CILbApe7CBSqh7IfwjMcu4bvUNm
 YDZ5/9PMyzqRbYFNRP2laQMf6PGLAXZZBzhyFnU3Zd1k8Af9aHaq89rZ0h95D1UUhc/9
 rHBc3bSKy0rwvIVFvFeq8ripVFOZZwl3SGbISjVMEgihKLHH1OX82fsQybjkVEtyLMIp
 BTAXHb8G3RMT9rZHAecMgo6vIcqEwaV0ErUikYZ0CASRX/o4KOL1cW7pe+NtU8jleUhd
 ubvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=p2po+5CHF91f4CLgZCtQ9a3KLbE8Uf1ixJrv/XjK8kQ=;
 b=qKzserL+i+ZJ2j6Xz9bF3tBpJLadsEY38x+JBYM9TCBk+i7yBGIq8YtUkaRIa7i4BB
 wLQbv73juIWH/ryL5+f4Pv0sN47rfzsRLnoTCfg7j+i2VqGgunMWStV3c6C+Bem3N3RD
 gLWIN4SHpUTPnORyIaWzdZKFC6w0k97lao3lH9Vglicv1iHxWhAaubhPBqbErHQ2ReNW
 uAgsiJQLJCZ9QsfGlS0X63e3NkhlEvFofdW+CAbx7OhksNtq/ieqcSRE2GHngEdkmWHy
 2T3v03FM48ewXzO4BLd4MsgyApwFqk7ECO/YU8fL8uw2YWOs+Hl5v3vA634eAJf6AQRT
 1TiA==
X-Gm-Message-State: AOAM532CoFVAzk9pswJ+bQkTGtM4ozxC/thnXnfEzcFZ6J3lNRQfjbIX
 sSqsLIOhR4Z2QajC+Ctq5fG7mZZXZCY=
X-Google-Smtp-Source: ABdhPJyL4DsgS7YW8NzazWJsrGdzTOmOHJNxeop2+dmsFjMpZPAsRZtxf3Ruc3s1QNStFu6CtIHYLg==
X-Received: by 2002:a05:6000:1545:: with SMTP id
 5mr61103407wry.438.1641663343374; 
 Sat, 08 Jan 2022 09:35:43 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 by smtp.gmail.com with ESMTPSA id p5sm2136752wma.16.2022.01.08.09.35.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Jan 2022 09:35:43 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sat,  8 Jan 2022 18:35:40 +0100
Message-Id: <d49d32ca841b59900f9b719023bb92ecbd77be10.1641663315.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1641663315.git.yann.morin.1998@free.fr>
References: <cover.1641663315.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] core/pkg-utils: properly indent
 per-package-rsync
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Continuation lines should be indented one level more than the line the
are the continuation of.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/pkg-utils.mk | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/pkg-utils.mk b/package/pkg-utils.mk
index 38ba5bca93..6aa64a2096 100644
--- a/package/pkg-utils.mk
+++ b/package/pkg-utils.mk
@@ -213,8 +213,8 @@ define per-package-rsync
 	mkdir -p $(3)
 	$(foreach pkg,$(1),\
 		rsync -a --link-dest=$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
-		$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
-		$(3)$(sep))
+			$(PER_PACKAGE_DIR)/$(pkg)/$(2)/ \
+			$(3)
 endef
 
 # prepares the per-package HOST_DIR and TARGET_DIR of the current
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
