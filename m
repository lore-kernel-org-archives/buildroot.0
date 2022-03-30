Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C47BC433F5
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 14:55:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E9312611F0;
	Wed, 30 Mar 2022 14:55:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1MScXavAZ4fa; Wed, 30 Mar 2022 14:55:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B7C76120D;
	Wed, 30 Mar 2022 14:55:25 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 737821BF59F
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 14:55:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 61107404F4
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 14:55:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ba6Xm_hSKGYH for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 14:55:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BA2AE404CF
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 14:55:22 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id u3so29716036wrg.3
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 07:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=rxtXMMa2puf4RVMemw1h9LvaliJRGptcc/GWBO5ZLWc=;
 b=IfBU5vmtaGGTK1dQ5KBFwysfyKvbCusOHBvDNu4XtttLjOwYhFFLwHRxTvHyO2oUhy
 85uUDD2gK9MKNAEoL236NBsq0UoMdk5ZKJalE3//l+XLRHfYN5qH9SrSv9pr6ycYmvSW
 skuWy8s5V4lQ5r+cu//2c379tRxo9KFSkc14QTqOZNXkpbcElBQxyIEi5nA8D+JaP5Jc
 AtXW6gLA7NR9fSWO+HcmN1WrggMeZk0ade5g8P7Xh+q9s9WatWxGde/cdYFSq2EEMMTS
 +P/42S0krQGCDxWt/ZoDOhJ7+B8dNUjyM3kjByBsirsUtqc5vTGQsykdpaf5UyYqgiuD
 YsdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=rxtXMMa2puf4RVMemw1h9LvaliJRGptcc/GWBO5ZLWc=;
 b=EWuaTYC4W94DfLu5yKOxcKwtd2/oAEtC33hUwn03IwDd8pG5uIm38IErnrLwaUR+MA
 kzr/cs/698HuXvu7INZM8Yhi8vSI6L9OkGhp9r4E5H9atI9E93ZFy6L1naR2P+hTEHwK
 ZjgiQ3TRmh11mpNtwr/xJD/1jIM4okzFpYCRp9lBA2LyjrDnEZ09jclGh5pKZUDi1xaU
 tqAm8vBwVre1Q/Xq4qovoqQVmfyXjmGJvujxgBw5BcY7mbNbNSbm5oAOLn1hT+LF/M5S
 Z74yngl0XNtHObn32mXrrD3ZF3yoso4HOsZyPGNzjKBM4nUE/ZFeFWroM7bNHnItaD5c
 LY/A==
X-Gm-Message-State: AOAM533Ggf2p5dnUY4D2+We3wUBhD1RkE80+/3aaNLyrqMBQ6O2/DXrc
 C59s5l6WrHHDm5T6VwNOVrcnSzXZqCuOuw==
X-Google-Smtp-Source: ABdhPJwuuUdpjHPBD4eh/57s2I+LkIe+GEMYNNZQrdaAvAFlAkIE7ZTDJaHt+tz95cnJp+C56LIH0A==
X-Received: by 2002:a5d:5886:0:b0:204:85e:5a3a with SMTP id
 n6-20020a5d5886000000b00204085e5a3amr3039wrf.434.1648652120682; 
 Wed, 30 Mar 2022 07:55:20 -0700 (PDT)
Received: from localhost.localdomain
 (i19-lef01-ix2-176-180-85-92.dsl.dyn.abo.bbox.fr. [176.180.85.92])
 by smtp.gmail.com with ESMTPSA id
 r4-20020a1c2b04000000b0038a0e15ee13sm5217370wmr.8.2022.03.30.07.55.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Mar 2022 07:55:20 -0700 (PDT)
From: David GOUARIN <dgouarin@gmail.com>
X-Google-Original-From: David GOUARIN <david.gouarin@thalesgroup.com>
To: buildroot@buildroot.org
Date: Wed, 30 Mar 2022 18:04:36 +0200
Message-Id: <20220330160436.16357-1-david.gouarin@thalesgroup.com>
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

When building with BR2_ENABLE_DEBUG, cargo packages are first built with --debug,
then the installation step rebuilds the sources in release mode with cargo install.
This is because cargo install forces a rebuild when the --path option is used.

This patch adds a --debug to the cargo install command line as a workaround when
necessary, but it does not address the root cause, which is that cargo install
will rebuild the sources, possibly with different build options.
For example, when one use PKG_CARGO_BUILD_OPTS = --features myfeature, one must
also use PKG_CARGO_INSTALL_OPTS = --features myfeature.

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
