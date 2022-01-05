Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7585DC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 21:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D4EDA409B7;
	Wed,  5 Jan 2022 21:38:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SL6CHTJ2WC36; Wed,  5 Jan 2022 21:38:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id E83ED400D0;
	Wed,  5 Jan 2022 21:38:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3931F1BF3A3
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 27AA84032C
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hHnAB9g8kjUO for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 21:38:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3003A4030B
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 21:38:22 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id 19so761119ioz.4
 for <buildroot@buildroot.org>; Wed, 05 Jan 2022 13:38:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=toTWCRjGKSzDbXfa+oXyDMP5PZ3oMaQEg3GVMO02WK0=;
 b=LZ7gziZ+At3SQZfazIKl1XonBd3fFoR4mtQ8xTxxvjlWkxj6/VENrFbh4/tvjzq9eR
 Ed2upuisLUZkz6IsBAzdqh98feZJYv+wHZF4wMw0vw29Se0FHrDDsgnPnOfUmk8Hb3p3
 9nOay8RjhUqkO+LAelWdEfvm20kPns/1/uGks8ePZf8DrMgW0a+rDU3P/FS7cAHfQjHM
 OUWAR2tZ8t9GrY5pVnyNtZDAm54Uv64/tfuupmxcR+4yafO0EFaLce69d/t7vEZoWHIF
 S6mTsSWOgBvo1zRWVSS5uOpJysYOoaMLPGjvgwsEwlDnOFnJG4aZwHiwhxhZdr4rhso1
 OlwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=toTWCRjGKSzDbXfa+oXyDMP5PZ3oMaQEg3GVMO02WK0=;
 b=3q5YGwcsW3HDr96HA21bvPWh9xk/P55D+mrJz80SYe80JSbQz7+xNHmxC1wNpWQBDS
 JggqxBfJ54CTTEtC2USks6JT/2n7ddfTwhlJbH0r+z1kta8NEMf674dXValhcGcC9Upp
 FWxzZQVW8UTd1/ndAumlnSH+FtakZGl8gV0XFwjR3kGNSxllS6Octz40Bfuywh5w7owd
 MzN9cKtjxlTM0JGEmgzRYNwBhu8MY9n1OtVo2THrsUJpx8HHCe6bua20qd/4ssAYNDdh
 JT+jwk+BUH9uqP7U4D2c2O6CrwQa1jicqA3j6Kx2ow/kT48O7L1tC6yUSwMJyZtObasV
 aQBQ==
X-Gm-Message-State: AOAM532B7LlIb8XNp/1c8l8nHeZZiIXldV9PSgWLQteoaoCnCwcyO3n6
 6Ey8QsUI/lD2olM202FKdeSw5rNZmVk=
X-Google-Smtp-Source: ABdhPJyVG1d4nvQ8/g7DgjXEa03eHEPC5Gcth7B0POQSQDQNfuSMkYHTYV0UZa7ay13a6+YdfzBlww==
X-Received: by 2002:a05:6638:6:: with SMTP id
 z6mr26543821jao.182.1641418701136; 
 Wed, 05 Jan 2022 13:38:21 -0800 (PST)
Received: from james-x399.localdomain (71-218-242-12.hlrn.qwest.net.
 [71.218.242.12])
 by smtp.gmail.com with ESMTPSA id s6sm30773ild.5.2022.01.05.13.38.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 13:38:20 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jan 2022 14:38:18 -0700
Message-Id: <20220105213818.331826-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] Makefile: only check _FINAL_DEPENDENCIES
 are selected
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

_FINAL_ALL_DEPENDENCIES includes _FINAL_PATCH_DEPENDENCIES which may
not need to be selected in kconfig in cases where building is not
desired, so only check that _FINAL_DEPENDENCIES are selected.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index ac98b84425..7a2da3b043 100644
--- a/Makefile
+++ b/Makefile
@@ -589,7 +589,7 @@ endif
 endef
 
 $(foreach pkg,$(call UPPERCASE,$(PACKAGES)),\
-	$(foreach dep,$(call UPPERCASE,$($(pkg)_FINAL_ALL_DEPENDENCIES)),\
+	$(foreach dep,$(call UPPERCASE,$($(pkg)_FINAL_DEPENDENCIES)),\
 		$(eval $(call CHECK_ONE_DEPENDENCY,$(pkg),$(dep))$(sep))))
 
 endif
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
