Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95661CD6E53
	for <buildroot@archiver.kernel.org>; Wed, 11 Oct 2023 09:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3ECB54059B;
	Wed, 11 Oct 2023 09:23:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ECB54059B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KGX2yofbcsqp; Wed, 11 Oct 2023 09:23:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 95B9A4169C;
	Wed, 11 Oct 2023 09:23:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 95B9A4169C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6524C1BF2C7
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 09:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4B33B4169C
 for <buildroot@lists.busybox.net>; Wed, 11 Oct 2023 09:23:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4B33B4169C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id H_yaqFLCQN1V for <buildroot@lists.busybox.net>;
 Wed, 11 Oct 2023 09:23:27 +0000 (UTC)
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com
 [IPv6:2a00:1450:4864:20::635])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 726084059B
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 09:23:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 726084059B
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-9b275afb6abso152130366b.1
 for <buildroot@buildroot.org>; Wed, 11 Oct 2023 02:23:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697016205; x=1697621005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sAjMJ8jVkVUIqrWgVCZQ67dIPaHyKr4VKjR2u5Iozhs=;
 b=CrHiH5l9CafPz/RhagguEkk2t+/g2wMShwUzSdyVwKgaH35/vrxv9LCaM1QfdHoCl+
 GvEYDNtLljnywQGzrQe/reKh2seRAfRL2dnbjwQJyMoazfRSoBMVGPdRw+QKm7vUkAfZ
 kX8I1q92deop8PgrxIpiuWhbwpUBkrSNWie8GdVyYQ3oOBktwumyFbhASdCWM5CEDRmO
 WmK/gIq314lQN8+M3nzay0VV7U0QbA59fAgu25zsBrDQLy+p/fau+ACwxcpZEZARzpBQ
 OdqXQ9jPKUwgSlcj9Y58dGURTYZa2rdtzHYwe+y/sZJMqS4HJRUm4dm4srMLnJz8dSMs
 yAow==
X-Gm-Message-State: AOJu0Yzddp0xDBwFvSVJ+YLZeNJ7MdPo8zl23vsGf29xq0hFxcfyBwYk
 vbMdz9agXSJUxwJSu3MOWkLwEWrDlAJtzMqvTi26+w==
X-Google-Smtp-Source: AGHT+IHB8zzON40+tu9VZMd9gUESo2hLgiZj2WAJLm3wNYO95/Dpy6LqPRKDgh+URonT/IsuJ2tPJQ==
X-Received: by 2002:a17:907:2d09:b0:9aa:206d:b052 with SMTP id
 gs9-20020a1709072d0900b009aa206db052mr15398756ejc.27.1697016185027; 
 Wed, 11 Oct 2023 02:23:05 -0700 (PDT)
Received: from localhost.localdomain ([2001:b07:6467:4426:3fb7:fc38:9be:dc4c])
 by smtp.gmail.com with ESMTPSA id
 rp19-20020a170906d97300b009b95b46bbd1sm9535825ejb.133.2023.10.11.02.23.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 02:23:04 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Wed, 11 Oct 2023 11:22:49 +0200
Message-ID: <20231011092250.3739529-1-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697016205; x=1697621005;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sAjMJ8jVkVUIqrWgVCZQ67dIPaHyKr4VKjR2u5Iozhs=;
 b=SmxjeDPwKH5VMrTik3H42D/1QOeEFZQ90fScPcinvpUuEZkc/R2rk7CZ5NGjeisM1D
 RPE0L1I8Ta6dIamYQDKzCyifWI+C1LAANo2SIkcu9ImIBsZnjZdkcanagEUEwrRVEVUK
 bCh1ByYOsFxEGrxpD1TRyW/l1LR+Tz2qt29AI=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=SmxjeDPw
Subject: [Buildroot] [PATCH 1/2] package/firewalld: enable missing kernel
 config options
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
Cc: Adam Duskett <adam.duskett@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Firewalld requires IPV6 to function. We also should enable the
other dependencies such as networking support to ensure all other
options in the giant list of kernel config options are selected
properly.

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/firewalld/firewalld.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
index 188550d449..23ba1e6c2a 100644
--- a/package/firewalld/firewalld.mk
+++ b/package/firewalld/firewalld.mk
@@ -72,9 +72,16 @@ define FIREWALLD_INSTALL_INIT_SYSV
 		$(TARGET_DIR)/etc/init.d/S46firewalld
 endef
 
+# Firewalld needs ipv6
 # Firewalld requires almost every single nftable option selected.
 define FIREWALLD_LINUX_CONFIG_FIXUPS
 	$(call KCONFIG_ENABLE_OPT,CONFIG_BRIDGE)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_INET_DIAG)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NET)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_NETFILTER_ADVANCED)
+	$(call KCONFIG_ENABLE_OPT,CONFIG_IPV6)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_FILTER)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_IPTABLES)
 	$(call KCONFIG_ENABLE_OPT,CONFIG_IP6_NF_MANGLE)
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
