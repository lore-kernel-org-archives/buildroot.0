Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82BCFC433EF
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 19:50:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1823884233;
	Thu,  9 Jun 2022 19:50:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VEVIXQevU0BU; Thu,  9 Jun 2022 19:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4442284223;
	Thu,  9 Jun 2022 19:50:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BF9891BF2EC
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 19:50:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF26184223
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 19:50:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yNIJ9bEZPcC1 for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 19:50:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E7C31841FB
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 19:50:17 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id v25so32568670eda.6
 for <buildroot@buildroot.org>; Thu, 09 Jun 2022 12:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T4Lpfh3WjO9EjTIMEvIa9GdpB7o52bkLr8FYWhkZ5+k=;
 b=W+c0UbA2uc5pymSK08OZWIRYdcJ8yg31gZtH46QsFIdW2XPgrnnm8iypXOlQxOHVP0
 tEEPcknScs6UmBsCeHa/zJBSbHGArBv/poTvS0cII0JKOS7CojV7Kzi3mYvOQT7KuYM5
 rYSTagl+xZCqOq8VBhZ95KXjpItKQ1mSnsQjm6b6CWgL8taxWx9FHahDmQUmFbCEQAaH
 +/Pj0NkuADEhFUZc5roTNs95kH3+9Ygx7YfQieiEHsmzCYu7l3pXVgmOwX3mEQHKM6f0
 VVeOEJ1qVC+Ei0vPf2AxRcHejM8dx4P+TJWCgd+yWmb6UzQ+M5whqnezrC6Y4tFJIxZD
 X4FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T4Lpfh3WjO9EjTIMEvIa9GdpB7o52bkLr8FYWhkZ5+k=;
 b=h2EEJ4QLPfv3mTNZmBNwA2tMUXFzxbPUo3fQO0KN03OzqMPDnXlgXsZicjcLW/BDx+
 hcjTn+viLlfpOK4N9UcYpPdjMTUJWIJvzk7c4O7Dw8/LOtj0GbcNHbUhM+9DIUsNLfLJ
 f/A52VZQKsS0HwWbOQY6EKklGQZ5BUu6qBApCfHOb65nZpsZM/WAi+TLcmRDn6VA/tbD
 KKIWtA3X1WdXvyYBGx2WwEBLulwfuIJKXGn2GyfeUJOj8djqWeAbC93mAByqwwotZLge
 mODbG30+g4oVDEB5hv1ukpeVmL4c1PzpoQg1PE0BD6usfJaAG/StbvcDwFX+AU5fTz3M
 Cekw==
X-Gm-Message-State: AOAM533oaOS7wjdSbdhmjYoh3PXM0bbOZlxD0gM5lBx5XK0UgjPkxW/Q
 fDwG80lqDA2HMRBr2OcVGqMH6lwToNk=
X-Google-Smtp-Source: ABdhPJzwVBz1S2T+i3vbbrycDCd+BcnyBGQS2cr3EiBnjTLzlQcftFE73WdaGTzZK4aM5+i/taPHjA==
X-Received: by 2002:a05:6402:908:b0:428:11f5:509d with SMTP id
 g8-20020a056402090800b0042811f5509dmr46703791edz.253.1654804215699; 
 Thu, 09 Jun 2022 12:50:15 -0700 (PDT)
Received: from t450s.fritz.box (ip4d15a215.dynamic.kabel-deutschland.de.
 [77.21.162.21]) by smtp.gmail.com with ESMTPSA id
 da7-20020a056402176700b0042e032164a4sm13816204edb.61.2022.06.09.12.50.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 12:50:15 -0700 (PDT)
From: Heiko Thiery <heiko.thiery@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  9 Jun 2022 21:50:06 +0200
Message-Id: <20220609195005.5641-1-heiko.thiery@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/kontron_pitx_imx8m_defconfig: add
 BR2_TARGET_UBOOT_NEEDS_GNUTLS
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
Cc: Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With U-Boot 2022.04 gnutls is required for building the hostool
mkeficapsule. Thus the BR2_TARGET_UBOOT_NEEDS_GNUTLS config is needed.

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2536754543

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
---
 configs/kontron_pitx_imx8m_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 81eed66ee1..7448f27980 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -40,6 +40,7 @@ BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="kontron_pitx_imx8m"
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
