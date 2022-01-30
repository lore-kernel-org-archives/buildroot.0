Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99ECFC433F5
	for <buildroot@archiver.kernel.org>; Sun, 30 Jan 2022 21:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 307FF402C3;
	Sun, 30 Jan 2022 21:11:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TO9QAJ7moNfb; Sun, 30 Jan 2022 21:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 22D014016B;
	Sun, 30 Jan 2022 21:11:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B3D1E1BF4DB
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:10:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A23D260E8A
 for <buildroot@lists.busybox.net>; Sun, 30 Jan 2022 21:10:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AcYEBwZDo2LT for <buildroot@lists.busybox.net>;
 Sun, 30 Jan 2022 21:10:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B9E7260E88
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 21:10:39 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so3071897wmb.0
 for <buildroot@buildroot.org>; Sun, 30 Jan 2022 13:10:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hfwZ87gW/EbEvUK+nRiDZLmw5YUdlPoM2MgY8Kt0T5E=;
 b=p0eO2/RZBVIL1XlIuHH1aVTIyf+R4R6krqDe1DD2ynqSJb+xWp2pzD8Kv8+9HNrOPS
 5Z+Eiocqsojmb41KhhtlKSj1UzuB1JUOSzgimdfRzg4IUfdnywbq8FAx9G8quoVj2uD4
 DtxRpfDoeiESuaQZCgVUArWOhlFvXo7l+mmlDp96g+TZTel+e0EAoLkD/UcIbqjk7a4u
 /vUCf16gbcI8qKEpCtTkFWt9kPgQGOzawJtmdiYuiIu42jdxUZc7YkGnqMuBuV7o92jp
 X6TCKtAMhapn6ravm9jHc8eA/w08EHka+X8Hdy7VnRgwzilrp76LXWtFoAzmp6Co92l6
 X4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hfwZ87gW/EbEvUK+nRiDZLmw5YUdlPoM2MgY8Kt0T5E=;
 b=2rGcEbcl/b+zFGry2kBcL28v458NS9OTNjgQUpFRE4E6ZwxyNnSg71jU43TfJ6G9eu
 UKW+GynVTrv8s0uUTIMDA9fQx7puwsyuUdtMu5U4tAVwz0inOvjzIWI28accmz48j6Ms
 XrFhf914HvxZZ4BrevO7LIPSypBtsnxb9DLWLlUER/aaXY4SuF8tlSphQsrGIlh1bA6P
 i8UX1WYfBeEXUJxasIrOyQOA3+KGHdLJyJRr2NBYFLkQCQcf/o137QfwlRCoGxNgr8wH
 Ler4ZtpeQhGKV/6uWNGgzouFgLAXNsvvvTI3E5KCEQoy/Q3p//3p/nlOWudO4b4iI9TH
 cUKQ==
X-Gm-Message-State: AOAM531veApycHRZlTVegzBA8P28k780eenB5jciJZlpTtRhJB27BO3z
 mvSYDm3kp4xoQeTrBapuk5LSjqFgH3w=
X-Google-Smtp-Source: ABdhPJwGnBGHQj4jKmSnrQ0usGqF4ZJLzMCb6POhTdMP7u1x8voIOkCt36EfSRp+9+1yEyXgzGYlFg==
X-Received: by 2002:a1c:4e07:: with SMTP id g7mr24516650wmh.38.1643577037991; 
 Sun, 30 Jan 2022 13:10:37 -0800 (PST)
Received: from scaer.home ([2a01:cb19:8b51:cb00:c0a1:357e:1881:7513])
 by smtp.gmail.com with ESMTPSA id 1sm7267424wmo.37.2022.01.30.13.10.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Jan 2022 13:10:37 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 30 Jan 2022 22:10:36 +0100
Message-Id: <612e38ad81bb857887cfd5bf278830754e6324f0.1643577025.git.yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1643577025.git.yann.morin.1998@free.fr>
References: <cover.1643577025.git.yann.morin.1998@free.fr>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] linux: fix build with host-gcc 10+
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
