Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C505EB64DC
	for <buildroot@archiver.kernel.org>; Tue, 11 Jul 2023 22:43:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A948D418F8;
	Tue, 11 Jul 2023 22:43:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A948D418F8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tt8a6Vqa_zEo; Tue, 11 Jul 2023 22:43:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC0CE41902;
	Tue, 11 Jul 2023 22:43:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BC0CE41902
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B49C41BF420
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8C44183323
 for <buildroot@lists.busybox.net>; Tue, 11 Jul 2023 22:43:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8C44183323
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yrl01BuT6zYV for <buildroot@lists.busybox.net>;
 Tue, 11 Jul 2023 22:43:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9C8383281
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9C8383281
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 22:43:36 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1b8bbcfd89aso32537135ad.1
 for <buildroot@buildroot.org>; Tue, 11 Jul 2023 15:43:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689115416; x=1691707416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kZcMrY0zH+yHVtyhqbXQ4XcHgj5opipEFg55vVNSMtk=;
 b=ez9p4DucI/w1j8bjmVbSK3k7jtYxmZP7/Dh1zFKAU1RGQb68Wa3v6lHel/3D6hGcGO
 197zcqDHgXzhkZzivMQ1FHj4U1hUN8Tg+IG00IRrtVHucS61+ak8pwfstZeTh/bE8w6l
 RDyW98XtwwGeEkwmtnZOPKcd8WgK2JDSgIX5Y0tf6WOrL9b7Vt40QZqpOjCT8CChuhP8
 5whRW8jhHspi9HaYYu/WntzstdD35/ozCLjm6sariuKBA8QMfsN1S5DwFqZtNAWiwgcm
 81YFw4GhbfMM+1VEJfT0gAaix3UX8oO3n3RNb1QdNuy2eh73UReVBNiwzKtwqN2Mbyg/
 lv7Q==
X-Gm-Message-State: ABy/qLbYizqG16gXpt7yx/i8N0wn1CKrKx5EekqEhNZWXoTADxPKcEvM
 aMLlZcG6rLQLd1oGpahiOaT5orASp8YzcNwvod7TfstqmoQ=
X-Google-Smtp-Source: APBJJlGpAZeixU20y2KKp5mOiWCdXIK5iDQemzUXyGnS5HRAa0iRuxN4Z84udkPBhDxAW316zcYERg==
X-Received: by 2002:a17:903:2441:b0:1b8:1c4f:4f72 with SMTP id
 l1-20020a170903244100b001b81c4f4f72mr15761695pls.61.1689115415943; 
 Tue, 11 Jul 2023 15:43:35 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 jd10-20020a170903260a00b001b850c9af71sm2441204plb.285.2023.07.11.15.43.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 11 Jul 2023 15:43:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Tue, 11 Jul 2023 15:43:32 -0700
Message-ID: <20230711224332.1799239-2-christian@aperture.us>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230711224332.1799239-1-christian@aperture.us>
References: <20230711224332.1799239-1-christian@aperture.us>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1689115416; x=1691707416;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=kZcMrY0zH+yHVtyhqbXQ4XcHgj5opipEFg55vVNSMtk=;
 b=XusLCFkdgNPt1d8B1rDqIQRE+rzi3V9ciniWfTqux1SHNc9tbalQuCBn61SJ4SgFHW
 VNQ0qVV2BfGw25M8ayFF9Ge5APBT+M2H6eRJpkUxOylmzAHraemM7pXjylAWXJ5KVVsA
 QmowmP9Lf6VF2C/peLejATs2yk0bQZJ29e6Mw/ycpL4F3nUs3FAxmsEjVPLcZ7ms5bht
 C5rogDjuS7kXOrF2tvWbe4sSybzTyud/So8msd6LJl6j2vZHI5D5vjY5qO+Og9rTSgz5
 Oqw9opFtuaSmZLqidUU19e8HQ4W5KZ1mOz/O3QbY96eOgm5Fgbnn5/CXxav1dntpNf9v
 qlbQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=XusLCFkd
Subject: [Buildroot] [PATCH v1 2/2] package/docker-cli: bump version to
 v24.0.4
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: Christian Stewart <christian@aperture.us>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/moby/moby/releases/tag/v24.0.4

Signed-off-by: Christian Stewart <christian@aperture.us>
---
 package/docker-cli/docker-cli.hash | 2 +-
 package/docker-cli/docker-cli.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/docker-cli/docker-cli.hash b/package/docker-cli/docker-cli.hash
index dd5d598278..2ccf1d98b9 100644
--- a/package/docker-cli/docker-cli.hash
+++ b/package/docker-cli/docker-cli.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  632357aa58d7f5e16ce87dbd73641c5f65c25b6501e3917ac4f0ce553a01e0bc  docker-cli-24.0.2.tar.gz
+sha256  dc1d025fd16b113a1a7e2a5d34c30409613d9c4ec313937f17bf34991caf597f  docker-cli-24.0.4.tar.gz
 sha256  2d81ea060825006fc8f3fe28aa5dc0ffeb80faf325b612c955229157b8c10dc0  LICENSE
diff --git a/package/docker-cli/docker-cli.mk b/package/docker-cli/docker-cli.mk
index ddd3e7bf91..9b657093cb 100644
--- a/package/docker-cli/docker-cli.mk
+++ b/package/docker-cli/docker-cli.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-DOCKER_CLI_VERSION = 24.0.2
+DOCKER_CLI_VERSION = 24.0.4
 DOCKER_CLI_SITE = $(call github,docker,cli,v$(DOCKER_CLI_VERSION))
 
 DOCKER_CLI_LICENSE = Apache-2.0
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
