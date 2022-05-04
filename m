Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78971C433EF
	for <buildroot@archiver.kernel.org>; Wed,  4 May 2022 13:34:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 197A64188F;
	Wed,  4 May 2022 13:34:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MFVWHEw64OZq; Wed,  4 May 2022 13:34:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1850417B0;
	Wed,  4 May 2022 13:34:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B8C541BF36F
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 13:34:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A71DC60FEC
 for <buildroot@lists.busybox.net>; Wed,  4 May 2022 13:34:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4zZyUWCMjQge for <buildroot@lists.busybox.net>;
 Wed,  4 May 2022 13:34:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DCE8D60D76
 for <buildroot@buildroot.org>; Wed,  4 May 2022 13:34:22 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id d6so1711048ede.8
 for <buildroot@buildroot.org>; Wed, 04 May 2022 06:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=7QArMfuO2x4xOs1Tgr9mwpNiQT9csapdnXKjvNoU1Jw=;
 b=U/MtrnE5H60zvU0kBJrhLrUHdaUkLFJufTO9Rh9XHWIo4TKq3VV+66LlPIqc5buwiv
 HVajLU/slnVIAZIFGkh0V/2rM1crvKUl5IKbhOOH2BXn0qeSaaog8uNKHA+MBsarUVJF
 eK2vJgGFXbt6KNSGibHYR+KUdkrHXkBmn9ypW5bms+tFKs72DGiXra2IY+bsiyeZ+j0T
 kPop2NAGpKuNCVAACvzGyCuAyklPpzqTvxMXUf6MrFkNbhc9LRaIqCdX83rpmyITTE6x
 LbdRM88aAcYLFc1H5KafhVERjMsfX6zopDXLPYbH0pG5ss3OHPsIEOATdGh/AQ9Z5u7W
 MSVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=7QArMfuO2x4xOs1Tgr9mwpNiQT9csapdnXKjvNoU1Jw=;
 b=L/f4qk5yYN64udtrm0RG31fLlTOKS9kUirwSfCRBZ8m8qDIVcVkrws0xxQUmuDqHab
 gJY2YKb3jGxSo6VwZR2T9WaxkQWF5kPHNQmdf/viT/aL4/0i1SXe6dUyQ69P62nuUW9n
 kme0sGm1ipEIaM5L756LAyFbUa2X7nSix6hDoSQIVRDYPaWNPBBOdPf176jh2JNmeJM/
 vZcij/BbNdDqxU5/gjukU9xi1MtVRP3YdGRopESPjv1CwvdGuGBsV/zOeidSJbqZTDVn
 BU3vEnLIkrX9DJW47PHBT8oJzqJYnZTfh2eRIU1y0rEIf3LiA/LLtzm/7jay9fq7M/5J
 YA/g==
X-Gm-Message-State: AOAM530di5gEyN9tt0qq3JAYpT2KGqIbQJPFy2dBp33X9aXiQRACkwZN
 d8v5OVb/c8GreipQPQwHkSG/ixFLxXQ=
X-Google-Smtp-Source: ABdhPJyeuaK5HLhlrUqVO0rUhOnE2C3vVCRCVyMpGGIeTxFukEfAF9KcxHwq7IFgWNPcP1hZSvwCrA==
X-Received: by 2002:a50:baa8:0:b0:415:b0bc:6353 with SMTP id
 x37-20020a50baa8000000b00415b0bc6353mr23249286ede.220.1651671260721; 
 Wed, 04 May 2022 06:34:20 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 hx24-20020a170906847800b006f3ef214dc8sm5756149ejc.46.2022.05.04.06.34.19
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 04 May 2022 06:34:20 -0700 (PDT)
To: buildroot@buildroot.org
Date: Wed,  4 May 2022 15:34:08 +0200
Message-Id: <20220504133408.22754-1-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
Subject: [Buildroot] [PATCH] package/python-can: add missing dependencies
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
From: yegorslists--- via buildroot <buildroot@buildroot.org>
Reply-To: yegorslists@googlemail.com
Cc: Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

Since version 4.0.0 python-can requires the following additional
packages:

- packaging
- typing_extensions

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/python-can/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/python-can/Config.in b/package/python-can/Config.in
index dc9eb0ae4e..e92d9668e0 100644
--- a/package/python-can/Config.in
+++ b/package/python-can/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_PYTHON_CAN
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
 	select BR2_PACKAGE_PYTHON3_SQLITE # runtime
 	select BR2_PACKAGE_PYTHON_AENUM # runtime
+	select BR2_PACKAGE_PYTHON_PACKAGING # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_WRAPT # runtime
 	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
