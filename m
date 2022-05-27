Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA2FEC433F5
	for <buildroot@archiver.kernel.org>; Fri, 27 May 2022 10:34:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 72EC942527;
	Fri, 27 May 2022 10:34:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id k0Ev7BvqwARw; Fri, 27 May 2022 10:33:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7E4B0424BE;
	Fri, 27 May 2022 10:33:55 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A8EB91BF841
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:33:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A4BE08493A
 for <buildroot@lists.busybox.net>; Fri, 27 May 2022 10:33:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nBPIyJbkyCOA for <buildroot@lists.busybox.net>;
 Fri, 27 May 2022 10:33:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 64E4B84AD4
 for <buildroot@buildroot.org>; Fri, 27 May 2022 10:33:52 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id n22so1929340eda.5
 for <buildroot@buildroot.org>; Fri, 27 May 2022 03:33:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X1uVG2ZK1db9bcmETSTwZQDAUARxsLqk5vgng16ZX6o=;
 b=iPv9hx0UGHT8oLm1F+U/dfVsp61jmDVhwQ5OAXr+ljjwnMyzD3uYlPVx4wVgQwONry
 mLoHEvAkWiYM6Of7jRJpsZ1v7sHZbzrvU/oll1ETSvvN9FX01G2OqzR6NTOvD62yW00j
 3SHOiyvoqwzR7eWKG1pJgq6DulUmEcPF/G8z4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=X1uVG2ZK1db9bcmETSTwZQDAUARxsLqk5vgng16ZX6o=;
 b=cxhJl1W2BQZ/PYryyRGXtV9htvktSesV4dJVC5Z22nBy0aEXYWn2i/r9qio+jRL3hN
 i/dCWdGcZPBTcq9V2ixcqAjT1NOtjb4Uhtj9tyoLfdhBkwL63stqh3UC2IoC4yEnyxKW
 cIN7fZ5SGASZGe38MVyqMbh/7xXAGBW1FM0Lkkewa9iL6Y6hoIahQKf8LIIJKA8WHKJO
 lxVIyWrbtNJIQSvK2HtmrzVAwCGMREaBiXgSRpVMwagvM3KGPt597xucB0YASAHWBTbX
 c3j3QFRGvJqUEAVUS2LqtPXrl+Bv8AAqtn8ytefGPZd1z0I+Mgmb5xRJ1t6AWIjQTeO4
 6zzA==
X-Gm-Message-State: AOAM532+gv1daxzAz2ZihPEx4cPrc+ymZmgZLFcWHPjitmPh69flFNPn
 jxY5zII2R8bStRczZGvbTcRWQXFv/4xxLg==
X-Google-Smtp-Source: ABdhPJzkimr/74IQrqVngOSJ0l+o+oHYOQVbqAywNZydZEvdBEosM2XhEZYwZLe1l76XfCB7SKec7w==
X-Received: by 2002:a05:6402:2805:b0:42a:ea9b:e6a0 with SMTP id
 h5-20020a056402280500b0042aea9be6a0mr43627616ede.102.1653647630552; 
 Fri, 27 May 2022 03:33:50 -0700 (PDT)
Received: from localhost.localdomain (host185251138155.static.fidoka.tech.
 [185.251.138.155]) by smtp.gmail.com with ESMTPSA id
 e8-20020a1709061e8800b006f3ef214e34sm1313306ejj.154.2022.05.27.03.33.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 03:33:50 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Fri, 27 May 2022 12:33:31 +0200
Message-Id: <20220527103335.1968203-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 0/4] Better wifi handling
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
Cc: jagan@amarulasolutions.com,
 Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

While adding and testing for a new wifi driver, I could notice the sad
state of wifi interface bringup in buildroot, so I tried to have
something simple enough to work on the most common cases.

What problems we had:
* Wrong syntax for wpa_supplicant.conf when using default build
  options.
* Lack of a proper ifup/ifdown support to have wpa_supplicant
  automatically started.
* Due to this, the recommended way of configuring a wifi via
  the "interfaces" file wasn't working at all.

The series adds also a new wifi driver which I tested.

Angelo Compagnucci (4):
  package/wpa_supplicant: fixing "Invalid configuration line"
  package/wpa_supplicant: adding ifupdown support
  package/busybox: make udhcp discover faster
  package/rtl8723ds: new package

 package/Config.in                          |  1 +
 package/busybox/busybox.config             |  2 +-
 package/rtl8723ds/Config.in                | 10 +++
 package/rtl8723ds/rtl8723ds.mk             | 23 +++++++
 package/wpa_supplicant/ifupdown.sh         | 71 ++++++++++++++++++++++
 package/wpa_supplicant/wpa_supplicant.conf |  1 -
 package/wpa_supplicant/wpa_supplicant.mk   | 10 +++
 7 files changed, 116 insertions(+), 2 deletions(-)
 create mode 100644 package/rtl8723ds/Config.in
 create mode 100644 package/rtl8723ds/rtl8723ds.mk
 create mode 100755 package/wpa_supplicant/ifupdown.sh

-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
