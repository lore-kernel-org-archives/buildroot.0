Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 856B4C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 08:50:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 287F740928;
	Tue,  5 Apr 2022 08:50:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VTcmacU-5mF2; Tue,  5 Apr 2022 08:50:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B792540257;
	Tue,  5 Apr 2022 08:50:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 58BAB1BF336
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 08:49:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45D3040533
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 08:49:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id o8qnV7FbwC9o for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 08:49:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com
 [IPv6:2a00:1450:4864:20::629])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D4C81400D1
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 08:49:43 +0000 (UTC)
Received: by mail-ej1-x629.google.com with SMTP id p15so25184049ejc.7
 for <buildroot@buildroot.org>; Tue, 05 Apr 2022 01:49:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=RB/1yadFHDFR6KlmZW4aCTpdtp1NIRwihIXm3/YBz8Q=;
 b=kyyY4tA8p5QPWpWKwgocMh8Dk9hp6JXhaAi7nwv7IV4Vtnq2MD8gdmhNfgTa+LqI18
 Yc2e0urKM2//Fvz2ifDa7HinbHsuK9OfP764sNl3EcAtFvCCV1O1xR7HK4wkH2ySSkQz
 bq47FCv7mIgxy12CPMD0lBFjyKPH7pfrFNlwWbX6z7z/Y29sESXbuP2cLNVMEue6j17X
 ezkh9BsBge/Q3ngBquOamw1vO7V3eXEIX4Zr7G16+4ERCSe7/NxnL5d9IcyPCHA2ZSb/
 Bp2eMFf354JMR3W/n79gaB8Ifnw54fCq3Jeu2QAF+Iwe/Qn0V0BkkXYtGqE7x05nYZ/X
 YYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=RB/1yadFHDFR6KlmZW4aCTpdtp1NIRwihIXm3/YBz8Q=;
 b=7hhPwsGd9XtYVyW5ARs5ZeVLue+/1QhGXImTUlMqVWSh61tFKkHB5y0FDFXt3aXd1B
 3adw42oItmF9NJ7pxjSEG5PTEvshv722i4os9FRl8kwMAdOw2ncXqhvBpnhNJ4EUdxH+
 EecTI+RxqfSLWgphy9LEt0L23xZpYPV4uexNNS3d1jVqyKce/jfYMfDztMtohALydppK
 g2ReT5OlIBzj3JCwF66k5yVQsnFjbacqyzyoV7QkOPceQQIKCUDp/xDr9aLoZzVKnXDQ
 GpR3UQy1gu9aEROFBo1ETwLOQZN+hXZ+iHOk1L2SIhNMnyM9Se0GD2Nvij2isTdLpRrG
 fYfQ==
X-Gm-Message-State: AOAM533J/EJg/vXEG5DJCVI4GxWraVPjXQRogrkwwv/zKY0o9vQ/Ps76
 02w65KF3ko33SHqb5wlzK3sMtt9gq3U=
X-Google-Smtp-Source: ABdhPJwXeEV59uEmj2QBFm1jHu2udaysZAzh7WO8psf/fec5oE4MzJCDTzrtR3bg4FzHS2Cxfwl6VQ==
X-Received: by 2002:a17:906:6a11:b0:6e4:976b:e94 with SMTP id
 qw17-20020a1709066a1100b006e4976b0e94mr2493770ejc.142.1649148581857; 
 Tue, 05 Apr 2022 01:49:41 -0700 (PDT)
Received: from development1.visionsystems.de (mail.visionsystems.de.
 [213.209.99.202]) by smtp.gmail.com with ESMTPSA id
 t7-20020a50d907000000b0041cda2f0548sm1959083edj.10.2022.04.05.01.49.41
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Tue, 05 Apr 2022 01:49:41 -0700 (PDT)
From: yegorslists@googlemail.com
To: buildroot@buildroot.org
Date: Tue,  5 Apr 2022 10:49:29 +0200
Message-Id: <20220405084929.2755-2-yegorslists@googlemail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20220405084929.2755-1-yegorslists@googlemail.com>
References: <20220405084929.2755-1-yegorslists@googlemail.com>
Subject: [Buildroot] [PATCH 2/2] package/hostapd: enable SAE-PK option for
 WPA3
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
Cc: Matt Weber <matthew.weber@collins.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Yegor Yefremov <yegorslists@googlemail.com>

This enables a new security feature "SAE Public Key".

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
---
 package/hostapd/hostapd.mk | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/hostapd/hostapd.mk b/package/hostapd/hostapd.mk
index 99f0cdf1b8..4420142fbd 100644
--- a/package/hostapd/hostapd.mk
+++ b/package/hostapd/hostapd.mk
@@ -85,11 +85,13 @@ ifeq ($(BR2_PACKAGE_HOSTAPD_WPA3),y)
 HOSTAPD_CONFIG_ENABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
+	CONFIG_SAE_PK \
 	CONFIG_OWE
 else
 HOSTAPD_CONFIG_DISABLE += \
 	CONFIG_DPP \
 	CONFIG_SAE \
+	CONFIG_SAE_PK \
 	CONFIG_OWE
 endif
 
-- 
2.17.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
