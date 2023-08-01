Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9415EB64DD
	for <buildroot@archiver.kernel.org>; Tue,  1 Aug 2023 09:38:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5260281F02;
	Tue,  1 Aug 2023 09:38:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5260281F02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4vpg_ESY3OvQ; Tue,  1 Aug 2023 09:38:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9240281E7C;
	Tue,  1 Aug 2023 09:38:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9240281E7C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4711D1BF2EC
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 09:38:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0BE4B81EC7
 for <buildroot@lists.busybox.net>; Tue,  1 Aug 2023 09:38:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0BE4B81EC7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aQuCOblAtMa3 for <buildroot@lists.busybox.net>;
 Tue,  1 Aug 2023 09:38:06 +0000 (UTC)
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1B6FE81266
 for <buildroot@buildroot.org>; Tue,  1 Aug 2023 09:38:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B6FE81266
Received: by mail-wr1-x433.google.com with SMTP id
 ffacd0b85a97d-31765792c7cso5679388f8f.0
 for <buildroot@buildroot.org>; Tue, 01 Aug 2023 02:38:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690882684; x=1691487484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mzjxgDFzlYHXJKadrywJnnKkM2gGgStuhUbUG/h0lG4=;
 b=ZUeS7wc63Etr/7EbjrpioA/kpPS3/db0VcnDihAjK84YsHucRQttyuquwe6aSEfpss
 LiGwLhoSr3mzo/3YQuFOQel9hBeDVINEqHJMdwQI5DQ3/tXWFYEUe3EAeWBfNbrI/BWQ
 PTQXV0rwspXRM11knVeHEUZVrGYOAee2BvWQvW6ZN0X566lqLjSe8Ke18GtaAbt6Aqd/
 Gk7ZOPETdwfeEBG3feG+aDew6Mc8GKyx/uk+/AkDgGJbEjrMMCOB5LB2UEqA+gyFDY1E
 /OiSRiUUXWMGcgB+yvMPGsRSp2nrhH2iOP6DWaM7AL3UQ9uGBbmGererGQeR0VEF7UUt
 qN0g==
X-Gm-Message-State: ABy/qLYNcGWtSRXwThigzXsI498sqCebd+HZA8vl99Jm9AiMJFiDQcmK
 KzsQmc6sijQEoNI0b3bISi257RUzkrY=
X-Google-Smtp-Source: APBJJlG7R7G2IbhCTKF1LfqgZinTErPPXy9own+NLhURSPYnlm8Q+TnQ58o2vKujfXeQLu5oj7zBdw==
X-Received: by 2002:adf:e509:0:b0:314:3344:72f6 with SMTP id
 j9-20020adfe509000000b00314334472f6mr1980830wrm.32.1690882683628; 
 Tue, 01 Aug 2023 02:38:03 -0700 (PDT)
Received: from ncarrier.spectracom.local
 ([2a02:8428:7321:aa01:1304:3364:4203:42ea])
 by smtp.gmail.com with ESMTPSA id
 p9-20020a5d48c9000000b0031433443265sm15605866wrs.53.2023.08.01.02.38.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Aug 2023 02:38:02 -0700 (PDT)
From: carrier.nicolas0@gmail.com
To: buildroot@buildroot.org
Date: Tue,  1 Aug 2023 11:37:35 +0200
Message-Id: <20230801093737.1648437-1-carrier.nicolas0@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690882684; x=1691487484;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mzjxgDFzlYHXJKadrywJnnKkM2gGgStuhUbUG/h0lG4=;
 b=W9TxYVrux1M43jLkdFbtxNmmPKQseXMQZXcDGfeD1vm4eWFGtZ9NkHHebl6TNRAeRt
 WBt7IIJhTK8IqTOQEtFnhjURzXe02xUfnxVgPSYAzIPO+7I73oWwgVN9kP5qeI8z7b8D
 cqcmXNzZVm6a+X1EDA2zWPNH/S+aEwT5BD3VfgI7na41jYnA2CxHMo+0YkcNtDp7Y0Sh
 y82qE9puRZBKFzGDBsiCFsKlKoEJtz0Pv/B9tWREpQqdj8dVO1dS1j6RESqzqxneizRE
 uladFyCxuZbmoJq2SyDZL5rnNsqlGZZSlSQLFmkXlNZCuqj7WfV789UWm8jQcj0+itG3
 sFmg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=W9TxYVru
Subject: [Buildroot] [PATCH] package/less: install the lessecho command
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
Cc: Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Nicolas Carrier <nicolas.carrier@nav-timing.safrangroup.com>

it is required by, for example the s command, allowing to write to a file
---
 package/less/less.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/less/less.mk b/package/less/less.mk
index 91ce08f4f0..ed9d8f0f90 100644
--- a/package/less/less.mk
+++ b/package/less/less.mk
@@ -13,6 +13,7 @@ LESS_DEPENDENCIES = ncurses
 
 define LESS_INSTALL_TARGET_CMDS
 	$(INSTALL) -m 0755 $(@D)/less $(TARGET_DIR)/usr/bin/less
+	$(INSTALL) -m 0755 $(@D)/lessecho $(TARGET_DIR)/usr/bin/lessecho
 endef
 
 $(eval $(autotools-package))
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
