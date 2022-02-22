Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF45AC433FE
	for <buildroot@archiver.kernel.org>; Tue, 22 Feb 2022 09:49:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DF2A81372;
	Tue, 22 Feb 2022 09:49:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P8NkrioEGKfs; Tue, 22 Feb 2022 09:49:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A43AB8133E;
	Tue, 22 Feb 2022 09:49:35 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 400DC1BF2B0
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 09:49:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2E7784099E
 for <buildroot@lists.busybox.net>; Tue, 22 Feb 2022 09:49:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5uMaZGsw5Wpv for <buildroot@lists.busybox.net>;
 Tue, 22 Feb 2022 09:49:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0AD3440998
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 09:49:27 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id s14so18125889edw.0
 for <buildroot@buildroot.org>; Tue, 22 Feb 2022 01:49:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Igqpsg74u+VBM6Q4MsQ5SuFRzkZbnPqwqmmHL2JMIGA=;
 b=EhlnmPmuHY+6KerduKgxAs1z9POpPhrf2U74sPP6CaGBgdE3CjEAcyNFaHle/BBDAl
 tTowapDt5zUm0w7wSaqBuHk4nC50HfHwlM6UBbLPnOb0Y55iEPQ88gXTjLCTEf/zZ95b
 wTefi05N/EHo3KUWVs7dVk0YvHLXURygaFT7M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Igqpsg74u+VBM6Q4MsQ5SuFRzkZbnPqwqmmHL2JMIGA=;
 b=T6rBvIhGON63fpIIP63tUP5WeCb8y1Yc74IQEYAvbJ5EgmaSs55d3Mjf9gJUpkbdIF
 XulgyK6Csb3FIXoWDtxxtl8BsJPkstji03RqI46trVceB6VrUifN6ft0GTids1k8MCfc
 pYWX4sSn2aRFmSqhDal0KUoGNCrTAFW6SjTX8vuUD6uXfShEwPC5dlNIA0QECioXh4cw
 8+RUjZocf6nQtp/ZJ2bQK0syGuZ1nAHKwUF2/7snM++H+S8lmNt00zQWYF0y/Fel+oQS
 wmE+MvGPPNQUC8i6CgKqDC56Tsn2F5//ZJkslW1w7e/7lEf8be4W/+iKPS72nzlO8j3m
 uaBQ==
X-Gm-Message-State: AOAM533MG9qbYEtM1m8zdvCfIykOSTTeJh7V4cCFL6f9fcP8O2rHfpwf
 IZCIZo4xlGddb5VYjBxXIOXV3CkMvz03Ow==
X-Google-Smtp-Source: ABdhPJyku9mjXKJXQVJSzSCpT5/JJA8OB3LBOUv1AF9hXAtUNlVrK1ENKAa9Un+KLdYAUzCgrz4vFA==
X-Received: by 2002:a05:6402:34c1:b0:412:d12c:e713 with SMTP id
 w1-20020a05640234c100b00412d12ce713mr18546592edc.312.1645523366289; 
 Tue, 22 Feb 2022 01:49:26 -0800 (PST)
Received: from localhost.localdomain (host185127038042.static.fidoka.tech.
 [185.127.38.42])
 by smtp.gmail.com with ESMTPSA id f10sm131845ejq.18.2022.02.22.01.49.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Feb 2022 01:49:25 -0800 (PST)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 22 Feb 2022 10:49:23 +0100
Message-Id: <20220222094923.2220294-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/cups-filters: bump to version 1.28.12
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
index aefb67f651..5a95b998eb 100644
--- a/package/cups-filters/cups-filters.hash
+++ b/package/cups-filters/cups-filters.hash
@@ -1,3 +1,3 @@
 # Locally computed:
-sha256 8cb40355287d65ea03e90dfa7e2d34f0d46752957c8a6d4e96ab6fe6c581e5d2  cups-filters-1.28.10.tar.gz
+sha256 3265017d2369e1130e732090165d6b4e3c0838d7ca9aa60978b087bee12247ff  cups-filters-1.28.12.tar.gz
 sha256 38192ffdaca98b718f78b2d4abc38bb087f0bbcc9a16d212c98b903b985f900f  COPYING
diff --git a/package/cups-filters/cups-filters.mk b/package/cups-filters/cups-filters.mk
index c8f2dd0aae..f8ff42f0f4 100644
--- a/package/cups-filters/cups-filters.mk
+++ b/package/cups-filters/cups-filters.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CUPS_FILTERS_VERSION = 1.28.10
+CUPS_FILTERS_VERSION = 1.28.12
 CUPS_FILTERS_SITE = http://openprinting.org/download/cups-filters
 CUPS_FILTERS_LICENSE = GPL-2.0, GPL-2.0+, GPL-3.0, GPL-3.0+, LGPL-2, LGPL-2.1+, MIT, BSD-4-Clause
 CUPS_FILTERS_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
