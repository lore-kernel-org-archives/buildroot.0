Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708F7CD80A2
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 10:48:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1148E416AD;
	Tue, 10 Oct 2023 10:48:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1148E416AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 26vK5rQ2rLbO; Tue, 10 Oct 2023 10:48:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 02B56417C5;
	Tue, 10 Oct 2023 10:48:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 02B56417C5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 00EDB1BF2C0
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:47:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CEAD881F5C
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 10:47:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CEAD881F5C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LzqGFIZ2NiZ8 for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 10:47:48 +0000 (UTC)
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 692AE81F47
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 10:47:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 692AE81F47
Received: by mail-ej1-x636.google.com with SMTP id
 a640c23a62f3a-9b6559cbd74so1000890566b.1
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 03:47:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696934866; x=1697539666;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mFPrkHvkU6NHEGDruRNzoBNTJPA2RCBFaT2DUvT9FxE=;
 b=c8UTB+HKsirc8UsZebTazwr0QW2n1FkU8Ar9x92PtvMt8I1NHyS+daPKlESN6NiA61
 P0qqAl0jpUDFcdSCP+wI53QLD6wUzlltRMjVKT9kAZerOTkPcebLiEKwlooykBsbluRO
 cTHvPxmU9SMgYgliTLKlkP0jNarApMm96DT0njLR2xnHMY+Jjulx9NbhLqeNa+dn4reT
 rsPQfMRKbjxiM+chaPLfc8w/u6k1coJlSuagLg29UXP0errLVT9722GMoiImHFywZ+PZ
 2ZCbcr3y3OHgIfOaCfpPWH9zJtDYV9W4X9oy8cv6rIMyzXkzTkuLWjsw+0oWDBrphx34
 urUQ==
X-Gm-Message-State: AOJu0Yw5+ssPiMKtrKDOEkJzaDJ6PEmDMrwPy/7+cQ/k+HCAEnPDwksE
 rUKzvZNdYtsjjZ1QQAt4UakwFfo+ipSKbmugbEvJgQ==
X-Google-Smtp-Source: AGHT+IFxs2clZXjJNXMEnWAiuOWnuJ/yus+0RyiTlBuoMqiQvOzGK3eHH9vjALPQL0XHi46c7DiWHQ==
X-Received: by 2002:a17:907:7891:b0:9b9:325f:9be9 with SMTP id
 ku17-20020a170907789100b009b9325f9be9mr14116602ejc.73.1696934866006; 
 Tue, 10 Oct 2023 03:47:46 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 g20-20020a17090613d400b009b96e88759bsm8492578ejc.13.2023.10.10.03.47.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 03:47:45 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 10 Oct 2023 12:47:34 +0200
Message-ID: <20231010104735.882133-3-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231010104735.882133-1-adam.duskett@amarulasolutions.com>
References: <20231010104735.882133-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696934866; x=1697539666;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mFPrkHvkU6NHEGDruRNzoBNTJPA2RCBFaT2DUvT9FxE=;
 b=UZJCLGLcXwUb0JW6nXC/cIGVoYM2XJFr11kXsW9MfxSrAqV2Dny/6akSJ6M9SUk7jE
 tBNBQ9UtBGXl+3iCzXdxVaSad2+YZOJfwcUv82a6hEBMTqqQBB/Zh945WYCzXOjE/Vyx
 JABNqcR8LpIS/qxyjCaLM3jJIe+gS99I/xIO8=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UZJCLGLc
Subject: [Buildroot] [PATCH v3 3/4] package/openrc: add bash-completion
 support
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
 package/openrc/openrc.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/openrc/openrc.mk b/package/openrc/openrc.mk
index e55057249d..9682296807 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -20,6 +20,12 @@ OPENRC_CONF_OPTS = \
 	-Drootprefix=/ \
 	-Dbranding="\"Buildroot $(BR2_VERSION_FULL)\""
 
+ifeq ($(BR2_PACKAGE_BASH_COMPLETION),y)
+OPENRC_CONF_OPTS += -Dbash-completions=true
+else
+OPENRC_CONF_OPTS += -Dbash-completions=false
+endif
+
 ifeq ($(BR2_PACKAGE_LIBSELINUX),y)
 OPENRC_CONF_OPTS += -Dselinux=enabled
 OPENRC_DEPENDENCIES += libselinux
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
