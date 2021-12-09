Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82232C433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Dec 2021 21:48:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3C15B860E2;
	Thu,  9 Dec 2021 21:48:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lA0UZlSS49fg; Thu,  9 Dec 2021 21:48:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 89D38860A2;
	Thu,  9 Dec 2021 21:47:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2FDE11BF868
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 21:47:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 22C3840179
 for <buildroot@lists.busybox.net>; Thu,  9 Dec 2021 21:47:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 10eWkSPw6dDz for <buildroot@lists.busybox.net>;
 Thu,  9 Dec 2021 21:47:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 141F642515
 for <buildroot@buildroot.org>; Thu,  9 Dec 2021 21:47:56 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id x10so6679493edd.5
 for <buildroot@buildroot.org>; Thu, 09 Dec 2021 13:47:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cYzmAZDefEudaxAN7QTyuakqDKZ9mR196rShDwxlGfY=;
 b=FHqN5lQDz7koxg7AIZEdUNCypfkb9TDmVOqeMPsp5K4wk2Us74vu3/KAYLWHVqed6D
 y+cSnGxfaJNFwBbTQfAtnNNJu/4qFCrOm2xV7jZPsIEJJY0y3UNu0uuvECMmAmyG17vN
 FtW7X6f136N/tiBT/oXTfndDkHqU3vSASnFnQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cYzmAZDefEudaxAN7QTyuakqDKZ9mR196rShDwxlGfY=;
 b=KimfN7K7svrPdRCeZdFoIKqpJuLFiaZ2RXPUxMYnfT8R7fraJiSwekoJo11lBihglf
 yejBTKGF8HozrwLnd9eAjrs+C5zyDAeFzhm+Y7O6dgnSU3++mtywwDW/dggYm678kZ8x
 TR5OATz4NFYANVnjOjgmJWd4z0hh8bZPr5umnLq7ZA5/NnG8cKffE9j7DfOxz+pFXr9k
 8GRbSvIHO4++SyAGeJcqoL81AXGF4Z/Tdvw9vBs7FHnuYec+nfhHp68X7siWx63zFloH
 GqiRwedoaWKu+8CH1/hNMINnd3lIrV7G+56LPrRhfwKDGhQF45gHOEY4uyFAcuzEcYlo
 kCIw==
X-Gm-Message-State: AOAM533W0t93jiMn/Vp4vWbwvbXd5pIRvkUrxTh9BjmmeAxLEVMpfFP6
 08xmU2kdWlFuRX3xah6EfXEwDqZBjbc5jg==
X-Google-Smtp-Source: ABdhPJybPKGd8mB5EdoLicU3R/6Td8/+umghWD4Je5/SEuRFECOyKrXLf5TkWcHstKze27l70pmQbA==
X-Received: by 2002:a17:906:741:: with SMTP id
 z1mr19046737ejb.421.1639086475371; 
 Thu, 09 Dec 2021 13:47:55 -0800 (PST)
Received: from localhost.localdomain (host185036130019.static.fidoka.tech.
 [185.36.130.19])
 by smtp.gmail.com with ESMTPSA id eg8sm431206edb.75.2021.12.09.13.47.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Dec 2021 13:47:54 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu,  9 Dec 2021 22:47:51 +0100
Message-Id: <20211209214751.459313-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cups-filters: bump to version 1.28.10
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
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/cups-filters/cups-filters.hash | 2 +-
 package/cups-filters/cups-filters.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/cups-filters/cups-filters.hash b/package/cups-filters/cups-filters.hash
index 3b65e702c5..aefb67f651 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 5bad0b931f8293082f8773b34d5c4fed66415d2bf268b0798889e5f593c0ba61  cups-filters-1.28.9.tar.gz
+sha256 8cb40355287d65ea03e90dfa7e2d34f0d46752957c8a6d4e96ab6fe6c581e5d2  cups-filters-1.28.10.tar.gz
 sha256 38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index bc69b3832d..63b85f0b8b 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.28.9
+CUPS_FILTERS_VERSION = 1.28.10
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
