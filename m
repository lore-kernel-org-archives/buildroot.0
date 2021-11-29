Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EA47C433F5
	for <buildroot@archiver.kernel.org>; Mon, 29 Nov 2021 22:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0944B4021B;
	Mon, 29 Nov 2021 22:39:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BIdzkB54A7Rr; Mon, 29 Nov 2021 22:39:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 282FE401BD;
	Mon, 29 Nov 2021 22:39:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E0A111BF384
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:39:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D070260BB2
 for <buildroot@lists.busybox.net>; Mon, 29 Nov 2021 22:39:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yk8xkdr2Lz0O for <buildroot@lists.busybox.net>;
 Mon, 29 Nov 2021 22:39:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3E95160692
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 22:39:43 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id p18so15880257wmq.5
 for <buildroot@buildroot.org>; Mon, 29 Nov 2021 14:39:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lT9eZwvy9H01ZsNvaL1BVF5OAMzPG5P4NNGKe/g+ce0=;
 b=j7ZcGz6wRUZ6YsjSUPZSb60CLe3iPYn0zuHArg0wnvdHDcR/GIbMwp2lydQA7b0+91
 3pIXwbijw0AheDfbu7wRyLb14TmWhAjfJqh7L3InHyrAejkhPio7+d0qOxmrEA7W3uDb
 b7CFSbkR3PLGOl3Ea0SnyI8FyGe0fVbMugYll47r7MNmdcI2e3M5UPjfGXoio9p6hxe6
 m1R/Q2IYuJfoovjFYR/IZQfU1gND6Vh1YlhBN/99OwR/OztmpXCy8weQOr6Hauzbsfmc
 XotJXuYc7gStMAJBjJNJVcmu4wygNJc4TV9wqJbXPJ24UFCLQfMN9uFLKaghVYP4lghC
 CFTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lT9eZwvy9H01ZsNvaL1BVF5OAMzPG5P4NNGKe/g+ce0=;
 b=X4KuqwktDKzMDe98gmV3cwb0uIbOF95CN4SuXLYLAfVUC3+xc+JfZLrezbOC14Ikp9
 tKmsmiibu9Z4cjVIHKckZEBOhbxrvupQQPFidyvnwj2gcV9oTw8N4gomYpMM3VjnK64f
 oD049nxkKzSGkdw3eAQ3TnvbggyczEhXLQWgZdsag0LR6U7Evw4HbW52dGyuwo8eaFMt
 9XxRbhnVZuY4F0aERBKIH3unucQxWoeX3Csa54oXOm/fL1M5SlrNyaufNrbiwaQJFavh
 gTspsCDHt3jHMCOcqS55JjFIuxWPhLTil+xINLKyPROEOZdkw5HJnScrE8j2mTOP76sO
 DDoQ==
X-Gm-Message-State: AOAM532ls19zCG1uSqeHDwq8wjWpv8IN/Wn//CSZ2+ByhqVw736UV+At
 IhwZeL/7Qd2iDkt0YmJ73mO+cMYzXp4=
X-Google-Smtp-Source: ABdhPJzG3bLcKQt6WAwzmQ5S6NrPXD9P6IKBHNZb+2PcAc1kRJF8gy6Z2C8uRVeACK4RoIb6t4K/oA==
X-Received: by 2002:a05:600c:4104:: with SMTP id
 j4mr857063wmi.178.1638225581359; 
 Mon, 29 Nov 2021 14:39:41 -0800 (PST)
Received: from kali.home (lfbn-ren-1-370-97.w2-10.abo.wanadoo.fr. [2.10.20.97])
 by smtp.gmail.com with ESMTPSA id s63sm614214wme.22.2021.11.29.14.39.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Nov 2021 14:39:41 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 29 Nov 2021 23:37:07 +0100
Message-Id: <20211129223707.2186581-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/flare-engine: drop spurious space
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop spurious space added by commit
419b68eef5bc98b53514eff41b56a11f66e3898a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/flare-engine/flare-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flare-engine/flare-engine.mk b/package/flare-engine/flare-engine.mk
index b91fc16af3..14d2681fda 100644
--- a/package/flare-engine/flare-engine.mk
+++ b/package/flare-engine/flare-engine.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 FLARE_ENGINE_VERSION = 1.11
-FLARE_ENGINE_SITE =  $(call github,flareteam,flare-engine,v$(FLARE_ENGINE_VERSION))
+FLARE_ENGINE_SITE = $(call github,flareteam,flare-engine,v$(FLARE_ENGINE_VERSION))
 FLARE_ENGINE_LICENSE = GPL-3.0+
 FLARE_ENGINE_LICENSE_FILES = COPYING
 
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
