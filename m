Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CE4CDB474
	for <buildroot@archiver.kernel.org>; Tue, 17 Oct 2023 13:13:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 05143404B9;
	Tue, 17 Oct 2023 13:13:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 05143404B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fXbtLxqCYeN1; Tue, 17 Oct 2023 13:13:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED323405CD;
	Tue, 17 Oct 2023 13:13:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED323405CD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E02EB1BF267
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:13:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C65C860F13
 for <buildroot@lists.busybox.net>; Tue, 17 Oct 2023 13:13:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C65C860F13
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48xrXixoxAuV for <buildroot@lists.busybox.net>;
 Tue, 17 Oct 2023 13:13:10 +0000 (UTC)
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53A4360D53
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 13:13:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 53A4360D53
Received: by mail-lf1-x143.google.com with SMTP id
 2adb3069b0e04-507a55302e0so3490417e87.0
 for <buildroot@buildroot.org>; Tue, 17 Oct 2023 06:13:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697548387; x=1698153187;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I0gisllJlnHYcWDTti1CaTOnsqmpCZsW4WZ60xl9lug=;
 b=CTGLhQoNuEpkW6C9+4YlX983usfPFuxjEF7S/ht6H5AYTR7uPP5ReEA+ZpF5/FwLj5
 E25kF7DQXo2ZwU9FmcVSruP2TyRliAtpDB2M2LXzWl757z74FNzXntujfA9vH08zrqyc
 i0883qmBhJ1n5s6c12vfjvwhLsEJiIjZUZ65nt25KW1/EX9EonFgEo+ptBkdzOyGXarC
 3BSQ9wDbqDyAUlO3kI6jrC+eUmLX7o+3RqvCvE1dJz1Sils8z8G3wW4LpxTHXGqD5mVU
 b4iyRisJQwgLMdawGBKXg6GJobIugZewqeXntKBfE+DGMqPolJzJ4dWVImNkJtrLuldg
 5Zpw==
X-Gm-Message-State: AOJu0Yw5KQmdDGkR2KbPbhP94G9XOeWaZZprFJXOCNph+aqi5/WkBfSf
 Z0q4BpX4FDVtO7rk94knlRxiQiPk4YjsWcWAYuQE6i0ZcBuKOA==
X-Google-Smtp-Source: AGHT+IG8LX5VQOi2cckTmocIZS2TYXi6oHbq2SO6H5I5nPVvnjdjoeQfJkIp6p8faO65RUjXrY+USA==
X-Received: by 2002:a05:6512:3092:b0:507:a089:caf8 with SMTP id
 z18-20020a056512309200b00507a089caf8mr1824244lfd.67.1697548387613; 
 Tue, 17 Oct 2023 06:13:07 -0700 (PDT)
Received: from localhost.localdomain (net-91-81-8-146.cust.vodafonedsl.it.
 [91.81.8.146]) by smtp.gmail.com with ESMTPSA id
 s26-20020a05600c319a00b00405588aa40asm1880730wmp.24.2023.10.17.06.13.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Oct 2023 06:13:07 -0700 (PDT)
From: Adam Duskett <adam.duskett@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 17 Oct 2023 15:12:54 +0200
Message-ID: <20231017131257.2211225-2-adam.duskett@amarulasolutions.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231017131257.2211225-1-adam.duskett@amarulasolutions.com>
References: <20231017131257.2211225-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697548387; x=1698153187;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I0gisllJlnHYcWDTti1CaTOnsqmpCZsW4WZ60xl9lug=;
 b=UUJk/9nquZaNW4/K8AHn5R6AabTBpeinGTsssbAYDuLmQCbUWOkVu7rusY8tWDFt8p
 +8tY83e4PH3ggvXthYK2I4vb6DVYzf2IVkjvDxbD6RvsZ/zsk9qQKccmbYhlaWyF0yWK
 50hO6htX4GdDYS05Q8cwYsWvObJXAzfZQwkkg=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UUJk/9nq
Subject: [Buildroot] [PATCH 2/5] package/flutter-engine: bump version to
 3.13.7
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

Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
---
 package/flutter-engine/flutter-engine.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/flutter-engine/flutter-engine.mk b/package/flutter-engine/flutter-engine.mk
index 942b07786b..086476ddcd 100644
--- a/package/flutter-engine/flutter-engine.mk
+++ b/package/flutter-engine/flutter-engine.mk
@@ -21,7 +21,7 @@
 #
 # There is no hash provided, as the gn binary (used for configuration) relies
 # on the .git directories. As such, a reproducible tarball is not possible.
-FLUTTER_ENGINE_VERSION = 3.13.4
+FLUTTER_ENGINE_VERSION = 3.13.7
 
 # There is nothing for Buildroot to download. This is handled by gclient.
 FLUTTER_ENGINE_SITE =
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
