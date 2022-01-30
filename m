Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79F00C433EF
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 21:09:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EAFF58301F;
	Sun, 30 Jan 2022 21:09:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hMKSSeDXz3TQ; Sun, 30 Jan 2022 21:09:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 207F48291D;
	Sun, 30 Jan 2022 21:09:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 896251BF4DB
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:09:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 779138291D
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:09:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qF4EjhVpgt_e for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 21:09:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7613681D67
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 21:09:54 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id v123so8867301wme.2
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 13:09:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=hfwZ87gW/EbEvUK+nRiDZLmw5YUdlPoM2MgY8Kt0T5E=;
 b=TZVZ0i4pr0Ne2saMMa88Fylj4wUYHqt6fwaFqpfxNc6CVVSFQJva+l4y3pECvZjdSe
 wK3y490J/rzwuWPdUBKQOUrie8RQOdtGWbSDvUKKPRHmFzIHFa7vueUIlFdx2GHXd6Yd
 pbfahHyRTDLb0C73lKy4X7WwM6Zg5OoenE+9ura6nAOWrRxw7+IQGRN+M4LxTCIEf4T9
 gJhiGClW/e/z6BKBBUoFIhiPuu33FGhkZagO9K6E8CP+DG7rlZBlmvD0Rufj3lKNeUPD
 2WGll0yeK44hcrR6fN0sjvHUTr7Klby8JPaqhjX3aZJxasr/RiyrAGZFZi/xXzbOC9VU
 yHKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :mime-version:content-transfer-encoding;
 bh=hfwZ87gW/EbEvUK+nRiDZLmw5YUdlPoM2MgY8Kt0T5E=;
 b=ga4Yklwz/OWawuxno1gG+u5kXj37FxKSMTHL0r5fVj/g6VrWaAC023VY+90bUGRY+t
 wyJ7q5zZIQ3CGGJFi7UO4SmjlV4ozfox6wbCShcML0eiCOn9hOMAYwXAK3pPFqzIdfFk
 d9+vWHT1/aACmCC+NEj8qWX22TgwbcNjYWySwF/8O6NcXgI+poBbhOXjIooV4zKV385A
 hUGVhRJD/Uk7jzd2hSiU+ZfoKxOv9vEibiya6io0R/7tR2lC0KXycJ3ZRIDKT6PkPrJb
 I8bRagqtJtNBWkkhFvqYYOVvgtP7CsyMhtiV5qpK5dijCC5osleYleANHXJjiqW7zvgD
 vlhg==
X-Gm-Message-State: AOAM531c474XMgnXSjnvH2B1/Pw4Q6bq3SteVQ9lKNrbbLZ6FHYaWEP3
 OiDe3gDFo9DaqIqBaEZerKDKcyqRXPU=
X-Google-Smtp-Source: ABdhPJzvSfAeqG8pWjhM1zZ4jo8glCusGFU4j9EuwYylBugCw7V+qEJ8wtMGwzW0z5Ta5Uxxfx2BnQ==
X-Received: by 2002:a05:600c:3516:: with SMTP id
 h22mr24349870wmq.143.1643576992433; 
 Sun, 30 Jan 2022 13:09:52 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:c0a1:357e:1881:7513])
 by smtp.gmail.com with ESMTPSA id j12sm9963687wru.38.2022.01.30.13.09.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 13:09:51 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 22:09:48 +0100
Message-Id: <20220130210948.3108021-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] linux: fix build with host-gcc 10+
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Some older versions of linux, or custom versions (like forks for some
boards), fail to build with host-gcc 10+, because of redefined symbols:

      HOSTLD  scripts/dtc/dtc
    /usr/bin/ld: scripts/dtc/dtc-parser.tab.o:(.bss+0x10): multiple definition
    of `yylloc'; scripts/dtc/dtc-lexer.lex.o:(.bss+0x0): first defined here
    collect2: error: ld returned 1 exit status

Since this has been fixed in recent-ish versions, we can't use an
unconditionaly patch, so we must have a conditional patch. However, a
patch may not always apply to arbitrary U-Boot versions or forks.

Upstream just dropped that line altogether:
    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=e33a814e772cdc36436c8c188d8c42d019fda639

So, we use a little sed-grep combo to do the exact same change.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Cc: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 linux/linux.mk | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/linux/linux.mk b/linux/linux.mk
index dd2eebd446..2a841ca3e6 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -268,6 +268,12 @@ endef
 
 LINUX_POST_PATCH_HOOKS += LINUX_APPLY_LOCAL_PATCHES
 
+# Older versions break on gcc 10+ because of redefined symbols
+define LINUX_DROP_YYLLOC
+	$(SED) '/^YYLTYPE yylloc;$$/d' `grep -l -r -E '^YYLTYPE yylloc;$$' $(@D)`
+endef
+LINUX_POST_PATCH_HOOKS += LINUX_DROP_YYLLOC
+
 # Older linux kernels use deprecated perl constructs in timeconst.pl
 # that were removed for perl 5.22+ so it breaks on newer distributions
 # Try a dry-run patch to see if this applies, if it does go ahead
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
