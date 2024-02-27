Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31C54C5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:31:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F355740996;
	Tue, 27 Feb 2024 16:31:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HcM8XQSBB0ja; Tue, 27 Feb 2024 16:31:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFFB341596
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFFB341596;
	Tue, 27 Feb 2024 16:31:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3348F1BF8B4
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2105B410E0
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lr_UFBEJij3i for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52b; helo=mail-ed1-x52b.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 30958410D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30958410D4
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 30958410D4
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:48 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id
 4fb4d7f45d1cf-565a3910f86so4899781a12.3
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051446; x=1709656246;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gm19FuITjNDQ4mviSWw5Cz0UNa9h0pPt8cqm22ZFQJo=;
 b=pw40wk9G5zAi9skEzL+6dm0CB0AsXzei/QHyIJmREREunPQcO2GQdXsbOg38Uug4Hb
 zTkIl+m21MOapNdCcDtGnKmYDKZThButsbmM7aoPLEiFDJjXpsgg/2cj157Aoc7HBV9l
 DGUubM2BSyUyTu3krwabxFwWP18DlLap6bNYqaIXYyntaLVJ9DHk+QYK1P6a8+NyvPgf
 wxZ5owuenNNzuT236yZxOzmCadXSEcBEnnm6Y8PxFfDmop4PUFMDNk1rTRCUmJsb08l6
 zvnoL/8t+5Y+K2yVitwoJcQEstkD/PjAd+oANnYP637L+eOcFAANb74Mme9v5+5NSE9K
 Gf6A==
X-Gm-Message-State: AOJu0YwunGenpfZ4qADyyBXuyBSvHtavyb20kEJSu5h61MIBfe/LzIGb
 4DOx8vaRV0DVnjyTewgGcfP1J4box7JIk26CH4gk2gSGh0mD9QSXzQXiIReX8VEAeSuMl4l+PNM
 wucA=
X-Google-Smtp-Source: AGHT+IFBEkjLoGdDCa+MIVub9POsJ9fLAG7zq+iQtjwMFjO98VlCMovvcQ0GjhwgrqPwrOS4/g2+2w==
X-Received: by 2002:a05:6402:14d4:b0:565:dce3:66fd with SMTP id
 f20-20020a05640214d400b00565dce366fdmr5023035edx.23.1709051445977; 
 Tue, 27 Feb 2024 08:30:45 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:45 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:17 +0100
Message-ID: <20240227163019.2876942-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051446; x=1709656246;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gm19FuITjNDQ4mviSWw5Cz0UNa9h0pPt8cqm22ZFQJo=;
 b=ZZUx4+iGu/5n2r2mIw+JGfHHOLBPy8K6269Q6Ick3xyfpnuq7YhCmSOQ4DBLNOikd7
 8VH/yVJtVRzIFy8DutwdDwNk3hqNQ+Rdd+sIV+EjViVN8rKpNDmJ0+J8Kk/OBt0HkqMA
 aPrOcTtK0kpAPTmZyB272vR60y3lr4wTbno58=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZZUx4+iG
Subject: [Buildroot] [PATCH v7 15/17] boot/ti-k3/ti-k3-r5-loader: install
 tiboot3.bin
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

Recent versions of U-Boot are capable of building tiboot3.bin using
Binman. In this case, let's copy it to the binaries directory.

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Replace `find' command with `cp' one.

Changes in v5:
- Replace tiboot3-*-$(TI_K3_R5_LOADER_SECTYPE)-*.bin with
  tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin

Added in v4

 boot/ti-k3-r5-loader/ti-k3-r5-loader.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
index fdb058f3b72a..cbdb653278f8 100644
--- a/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
+++ b/boot/ti-k3-r5-loader/ti-k3-r5-loader.mk
@@ -70,8 +70,12 @@ define TI_K3_R5_LOADER_BUILD_CMDS
 	$(TARGET_CONFIGURE_OPTS) $(TI_K3_R5_LOADER_MAKE) -C $(@D) $(TI_K3_R5_LOADER_MAKE_OPTS)
 endef
 
+TI_K3_R5_LOADER_SECTYPE = $(call qstrip,$(BR2_PACKAGE_TI_K3_SECTYPE))
+TI_K3_R5_LOADER_SOC = $(call qstrip,$(BR2_PACKAGE_TI_K3_SOC))
+
 define TI_K3_R5_LOADER_INSTALL_IMAGES_CMDS
 	cp $(@D)/spl/u-boot-spl.bin $(BINARIES_DIR)/r5-u-boot-spl.bin
+	cp $(@D)/tiboot3-$(TI_K3_R5_LOADER_SOC)-$(TI_K3_R5_LOADER_SECTYPE)-*.bin $(BINARIES_DIR)/tiboot3.bin
 endef
 
 $(eval $(kconfig-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
