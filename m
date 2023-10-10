Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3804CD80A2
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 10:48:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96F09417CD;
	Tue, 10 Oct 2023 10:48:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96F09417CD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RaQtvsHSiNtx; Tue, 10 Oct 2023 10:48:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7C0DF416C5;
	Tue, 10 Oct 2023 10:48:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7C0DF416C5
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE0411BF2C0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 88691605BA
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:47:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88691605BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nVBwhSngnuFY for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 10:47:49 +0000 (UTC)
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 10D3D605B7
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 10D3D605B7
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bdeae1d0aso999539366b.1
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 03:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696934867; x=1697539667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YJ5qxESJVkTT2DX4YM/tewvLPQsXEMv4I4Z7cJ2ym7A=;
 b=Zes5BPUOOeXzpt+2Kq6z9Kqq9J7TIs+4tujoKMyV+hRsMiAVGYpSidmnj4U+YGoAZR
 FaJp6c6NSfebxxupTSdNo7GMF9kT0Lo2jguIqMlNzqH6ldbNCNpm+C75fDCwMFyD0GSk
 YXkZuY2soshgTERPxMoHnbYIEV9ex63OItiB1gYe51fdF2YrMKlRc5HIFW2ftI6Ca5tF
 bBLS5fvZrgJkwm3D3Ndqubl8jyY+fmxQEXa9DSJPAWfF9wcqucRnWvXrJkRnIzjMVqHW
 SQDUQnH7n09/eIw6L5sZx9U4kboKfkF3+N9vp4CPVNhW+ubucZRkamSdsH/ORDla8gWk
 eCCw==
X-Gm-Message-State: AOJu0Yz7pPw704htymzJmJX8LkqHjPD8f2L2ahQ6r6mQPGHY9IfOGl48
 WucUHaO+XE1piKBsH1L6nsRlIaxkON7fZ9hmLqU0sg==
X-Google-Smtp-Source: AGHT+IHKhhHF3zs9Vku2aoOXrJjxJQXyo1hx4YSHK3+PY8tdBfO82LFLZ2joe6AcWSj7t10N55UKnQ==
X-Received: by 2002:a17:906:224c:b0:9ae:3c2f:5a99 with SMTP id
 12-20020a170906224c00b009ae3c2f5a99mr18157105ejr.51.1696934866927; 
 Tue, 10 Oct 2023 03:47:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a17090613d400b009b96e88759bsm8492578ejc.13.2023.10.10.03.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 03:47:46 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 12:47:35 +0200
Message-ID: <20231010104735.882133-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010104735.882133-1-adam.duskett@amarulasolutions.com>
References: <20231010104735.882133-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696934867; x=1697539667;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YJ5qxESJVkTT2DX4YM/tewvLPQsXEMv4I4Z7cJ2ym7A=;
 b=kd94jLAVjTbQu7zt8RgRV/SqbYA6q7Jh1fQ3Gr4YWmMVblM41JRrgKB3n5PvM/ZW9P
 qnDBXeh6BJjmMQjuRiQtL7oYgw8eGEzxdJoKIlt5J1JS8URW6tnxu4x3XjsNlHhIxu6s
 K8ckSV/lGrTapUNQOKOptZ46PSM3KpCrvvV9M=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=kd94jLAV
Subject: [Buildroot] [PATCH v3 4/4] package/openrc: add split-user support
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

Also, introduce a new test in support/testing/tests/init/test_openrc.py that
ensures split-user support works properly.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
V2 -> V3: Fixed inverse logic [Yann.]

 package/openrc/openrc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index 9682296807..442731f900 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -40,6 +40,12 @@ else
 OPENRC_CONF_OPTS += -Dpam=false
 endif
 
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+OPENRC_CONF_OPTS += -Dsplit-usr=false
+else
+OPENRC_CONF_OPTS += -Dsplit-usr=true
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
