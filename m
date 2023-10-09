Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85088E95A8E
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 14:30:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3DF6F6104D;
	Mon,  9 Oct 2023 14:30:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3DF6F6104D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id V2UYQ8rXlK_J; Mon,  9 Oct 2023 14:30:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2F2496126A;
	Mon,  9 Oct 2023 14:30:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F2496126A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id A09A71BF314
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:29:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7A4C5404C3
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 14:29:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7A4C5404C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id m4pz8MQH-6gx for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 14:29:30 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 897594015E
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 14:29:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 897594015E
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9b6559cbd74so843056666b.1
 for <buildroot@buildroot.org>; Mon, 09 Oct 2023 07:29:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696861768; x=1697466568;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hDNXuaze9TM/J8JXZ28aU/b8RXWw1lcHNgkXAG0abYo=;
 b=qye4WXO8PzSMGGN7/Cd/uKNGxNkrzUs+/SQhrv6OTGf6KyZ/ZXxS0a5yy7DlXU7wRb
 Lq8KG/ItLX3K3qHqJDhfgCnML7V3UQk487kGJtc1j+Qb4T9y5e1l4qn7DdXc/3xhxAYg
 sTSSjMLr+1bVz5Q28ft/B57hVRju8m+5Fnipkivwx9PUjSelg5BF65jw4T1nHL8cejLt
 PQOxzAvqRgnynupNm4iIHop5ixs8PKAWPiX2JR8bR2G40KOlZeE5OS8EOCWjfqsdsJJc
 38MHUV3EjDRW+n6HEqva9xiYYKXkXQ2fWwpK/lB+n06JNk/Vw+Ppdl+VCCpix2pGxeQ/
 AnQQ==
X-Gm-Message-State: AOJu0YzCXOmwhfUIr/35gr8/w5GSd8LyF6Hz6od/qX3nX2Ta9wqT3S+c
 74pd4WabTCGbI8oWE4i7zgDSWuTeETlKwWuv3xgYhQ==
X-Google-Smtp-Source: AGHT+IGSwifN7Le8VrnSDjKulTbGHQbPUgPkSb3mDbdGYROHPv84JO7PQvwTn8v610rsu1X6+jl8BA==
X-Received: by 2002:a17:906:5a6b:b0:9a9:e3a9:af02 with SMTP id
 my43-20020a1709065a6b00b009a9e3a9af02mr14314482ejc.8.1696861768423; 
 Mon, 09 Oct 2023 07:29:28 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 kt13-20020a170906aacd00b009a5f1d15644sm6701412ejb.119.2023.10.09.07.29.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 07:29:28 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Mon,  9 Oct 2023 16:29:15 +0200
Message-ID: <20231009142915.1775087-4-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231009142915.1775087-1-adam.duskett@amarulasolutions.com>
References: <20231009142915.1775087-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696861768; x=1697466568;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hDNXuaze9TM/J8JXZ28aU/b8RXWw1lcHNgkXAG0abYo=;
 b=ACVrxVFRUu8paS4QbZEQwp2qCEK1FOtLUssEuCnpYVsq2SqqGsMdy2B4rR1ctYDfXW
 GjS1QluchJQN9DNLHJRXr8/kKtuVkzQZPgpZ/ENToMmKnZGlvP89ANAjHGEK/hQqIn6m
 hHniD/pTIVXob7by3+DhQl6zTaOy7qaJ1P2Mk=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ACVrxVFR
Subject: [Buildroot] [PATCH 4/4] package/openrc: add merged user support
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
index 80a9dec778..c80342a174 100644
--- a/package/openrc/openrc.mk
+++ b/package/openrc/openrc.mk
@@ -37,6 +37,12 @@ else
 OPENRC_CONF_OPTS += -Dpam=false
 endif
 
+ifeq ($(BR2_ROOTFS_MERGED_USR),y)
+OPENRC_CONF_OPTS += -Dsplit-usr=true
+else
+OPENRC_CONF_OPTS += -Dsplit-usr=false
+endif
+
 ifeq ($(BR2_PACKAGE_KBD),)
 # keymaps and save-keymaps require kbd_mode and dumpkeys, respectively, so
 # remove them if the kbd package is not selected (e.g. devices with serial
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
