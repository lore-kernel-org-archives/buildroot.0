Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2785CD80A3
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 10:48:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7586141684;
	Tue, 10 Oct 2023 10:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7586141684
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uNiUQNb2ETa8; Tue, 10 Oct 2023 10:48:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F22ED41715;
	Tue, 10 Oct 2023 10:48:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F22ED41715
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6CC431BF97D
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:47:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4521F415DA
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4521F415DA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UuI5_jy5LAWy for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 10:47:47 +0000 (UTC)
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 369FA415CE
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:47:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 369FA415CE
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5334d78c5f6so9479865a12.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 03:47:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696934865; x=1697539665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VF4CN7hT2oEBPo9JGol5W3PrwMLoVs18tOyg72JOrtM=;
 b=gM+UKMMnu3un7YH3NPP55P/3UC76utfhoci9Uz9Zczjx9QCB9H+RVb9AUXpNoBKweU
 oTKeIAO6zTaO3T85ec8+JpcXa+mD/59jOmt1ZwwRJxb39XfDk1644BGZBoD6ONHt6cAa
 TEZoFfkYR1NOBqRsmNbM3RSqvsEyHZNBToEc6ucVmSM7A4C0R/uH0N+II3ZppMKlnhVG
 psGXpVndfSJboGezTxqluWjj4LbpkEOotUMujG2Y2Y340nsuujOsKGfClMkurmazV8Lv
 5RogWdTFVtxsYUvmWuafClKhtdYiG7OkmuKINCg1kG23d0ePkxkdT63wJb50b1h0lh1r
 p7eA==
X-Gm-Message-State: AOJu0Yw6pKHEcTGAVhiBezaUOJqtH6GqasV3FWsDqAx6GCIE1Rfq/HvN
 Mn8wbGkpfpqgtIsmKv4uzQjzkTtZNKpMY2zvAIQvSA==
X-Google-Smtp-Source: AGHT+IFevcurlxbuzuVpLqoX6IvwTr2QnWWbiFZbzxo85f+EcOs7Z9vDbG/2RXvCr01o3GAQeaJBYQ==
X-Received: by 2002:a17:906:104c:b0:9b2:74a1:6b30 with SMTP id
 j12-20020a170906104c00b009b274a16b30mr14348265ejj.33.1696934865064; 
 Tue, 10 Oct 2023 03:47:45 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a17090613d400b009b96e88759bsm8492578ejc.13.2023.10.10.03.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 03:47:44 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 12:47:33 +0200
Message-ID: <20231010104735.882133-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010104735.882133-1-adam.duskett@amarulasolutions.com>
References: <20231010104735.882133-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696934865; x=1697539665;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VF4CN7hT2oEBPo9JGol5W3PrwMLoVs18tOyg72JOrtM=;
 b=cItReimawKrASlzwgic0tghtA++RZ1W47wdMdO7PdSVdC5XFC2+B2bsTGsFVVzPAG7
 fJzpA2YFLrDdynK3gv/YMB9kLqyS4n57WqAE+Uvfj7yTc6E4cxv3wGHltai+GDNd6EQd
 3NHEQoqpKl5dpVVPjQIWoJ3ToeeS0HO0Rig70=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=cItReima
Subject: [Buildroot] [PATCH v3 2/4] package/openrc: add linux-pam support
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adam Duskett <adam.duskett@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/openrc/openrc.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 234fa6de2f..e55057249d 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -27,6 +27,13 @@ else
 OPENRC_CONF_OPTS += -Dselinux=disabled
 endif
 
+ifeq ($(BR2_PACKAGE_LINUX_PAM),y)
+OPENRC_CONF_OPTS += -Dpam=true
+OPENRC_DEPENDENCIES += linux-pam
+else
+OPENRC_CONF_OPTS += -Dpam=false
+endif
+
 define OPENRC_INSTALL_SYSV_RCS_SCRIPT
 	$(INSTALL) -D -m 0755 $(OPENRC_PKGDIR)/sysv-rcs \
 		$(TARGET_DIR)/etc/init.d/sysv-rcs
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
