Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4FF9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 29 Mar 2022 18:51:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9F5CE418E2;
	Tue, 29 Mar 2022 18:51:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kxpt2Res1q4B; Tue, 29 Mar 2022 18:51:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BD681418F5;
	Tue, 29 Mar 2022 18:51:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2EBDC1BF83C
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:51:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1BBDE4016D
 for <buildroot@lists.busybox.net>; Tue, 29 Mar 2022 18:51:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NCH_wNdPHCQT for <buildroot@lists.busybox.net>;
 Tue, 29 Mar 2022 18:51:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 828ED4011D
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 18:51:24 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id
 a16-20020a17090a6d9000b001c7d6c1bb13so3838963pjk.4
 for <buildroot@buildroot.org>; Tue, 29 Mar 2022 11:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xFfzNJt5mA+aEPJx8oFHjTRM0mQSs9c9gxHn4gxXkQw=;
 b=BSDJrdzo4Jof2fwf+YzWhA1mOMkXPSDDhKY962Kegccf/WC61BdfRXN5i14C9D6x3V
 ncODokRunFFKIwga5pw4meI7srPzwtjkqtQWh8Ct8lQhBMbNnoTT8YcJ4qRXinO1yYrh
 B+GHhZDMlAt2FGhe8ik4sqXfnE7NxReSKehcoJzzZ3zDZlM/Y4qdups0yMMp6zTJfpUP
 FryJgXraLVDPWqN/naVi4wz3+gV1Olqb6LHYqosrS4I4aLTGXryQQDQLjDr1MwIip3mM
 SjmQg/+eVXdPCj3f1XXhP1MxtFohtGgBGX3SeexZKq2ZFXQi5+uU80murNDZm+QFl+zG
 VJjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xFfzNJt5mA+aEPJx8oFHjTRM0mQSs9c9gxHn4gxXkQw=;
 b=4fflfDUJx6l3VexBZsXcvs4FgTerbUPzOgRU1skDpg/Bj5MPw45/s0Bx5wkOpXI+VZ
 qYpirMYZCToP0aZpIZRuqKdM2fzhygVqVs3rJgMZqEChXrbm+4IDqttAQhwuuC9wb/KH
 CyvmvfnoPbM8bwu8cIH09kJqLg9tTtkV6Us/2DA3MjXPJ/IvhVUUUKt4KtJCz05duXH1
 quyY37hiiTbgtvHvGx4MA1BbgXKWmOlFMiqEcRDoV6hiRwDOZ7Qqe6GB718h6/lmh5nt
 gD/pHdyJAu21Ur+mJJ7sKOelUvcHH+V0FPu8KS8iFwehHnoNO2MBendhC3UZPQkv3MDS
 Twrg==
X-Gm-Message-State: AOAM531s64OuoQnn0DboLcjFgp+QR8B7Uk15tb54jzT3wjxvoCO/kAHU
 UQxE1XkG3p49oQsqWDvr/DR1Gy1WjgkKdg==
X-Google-Smtp-Source: ABdhPJzvusAKIwHQY4sskqnz5hEaZsMp1PHEFcPLjoGbLr7E+Kf0VLCaRIvq30TP+C8tzrR8bJj7YA==
X-Received: by 2002:a17:90b:17c6:b0:1c7:46bf:ba16 with SMTP id
 me6-20020a17090b17c600b001c746bfba16mr532087pjb.1.1648579883526; 
 Tue, 29 Mar 2022 11:51:23 -0700 (PDT)
Received: from mac-mini.. ([2806:1000:8003:5c6c::13])
 by smtp.googlemail.com with ESMTPSA id
 y12-20020a17090a784c00b001c6bdafc995sm4836774pjl.3.2022.03.29.11.51.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Mar 2022 11:51:23 -0700 (PDT)
From: Alsey Coleman Miller <alseycmiller@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 29 Mar 2022 18:50:58 +0000
Message-Id: <20220329185059.943889-3-alseycmiller@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20220329185059.943889-1-alseycmiller@gmail.com>
References: <20220329185059.943889-1-alseycmiller@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/4] package/libdispatch: add fix for 32-bit arm
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
Cc: Alsey Miller <alseycmiller@gmail.com>, Samuel Martin <s.martin49@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Alsey Coleman Miller <alseycmiller@gmail.com>
---
 package/libdispatch/arm-yield.patch | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 package/libdispatch/arm-yield.patch

diff --git a/package/libdispatch/arm-yield.patch b/package/libdispatch/arm-yield.patch
new file mode 100644
index 0000000000..fa7cf7cce4
--- /dev/null
+++ b/package/libdispatch/arm-yield.patch
@@ -0,0 +1,13 @@
+diff --git a/src/shims/yield.c b/src/shims/yield.c
+index 43f0017..d0c5fff 100644
+--- a/src/shims/yield.c
++++ b/src/shims/yield.c
+@@ -36,7 +36,7 @@ void *
+ _dispatch_wait_for_enqueuer(void **ptr)
+ {
+ #if !DISPATCH_HW_CONFIG_UP
+-#if defined(__arm__) || defined(__arm64__)
++#if (defined(__arm__) && defined(__APPLE__)) || defined(__arm64__)
+ 	int spins = DISPATCH_WAIT_SPINS_WFE;
+ 	void *value;
+ 	while (unlikely(spins-- > 0)) {
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
