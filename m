Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2045C433F5
	for <buildroot@archiver.kernel.org>; Sun, 27 Mar 2022 17:41:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9DDF381CE1;
	Sun, 27 Mar 2022 17:41:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BIyYuUdYILPA; Sun, 27 Mar 2022 17:41:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D2B9081B17;
	Sun, 27 Mar 2022 17:41:36 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FDB81BF3F6
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 17:41:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4C75540923
 for <buildroot@lists.busybox.net>; Sun, 27 Mar 2022 17:41:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tyV6hrA1Aae2 for <buildroot@lists.busybox.net>;
 Sun, 27 Mar 2022 17:41:33 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com
 [IPv6:2607:f8b0:4864:20::d32])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1601340920
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 17:41:33 +0000 (UTC)
Received: by mail-io1-xd32.google.com with SMTP id z6so14595267iot.0
 for <buildroot@buildroot.org>; Sun, 27 Mar 2022 10:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6vrZZ11RVD2rWcPwYBm0QL0unbuRRLeZJK4GR9ng34A=;
 b=Rc12okiDxYDiyCtZk+3OKyo6IqrylUyo5n7QeXsG8kWhBQY5KpG3ZesyWDGJGrnKIv
 Gwl6XhtSAMa6IpFtGEl3dA+OKZ4GceVoMK0erBiKsCzBp/59Fz+1/aRmsmVjZ2dBmEbz
 TJT8A3NQIo0ZpBYVkCrOpcHt2dWX6LjwCRg7DPjAZ2c0Bff9F4ev7lbrPa2oO9L31QB4
 KKLTmJDnpWkqolgMQuHdOPlwWzeZnTgD42CHbDEvpXE2YmGI36Bh63VlPDPiR9kAaWry
 eqml6Y1l5wqHk3PxR0/YDiUPuB0Vtlxy+e9UgDnJ18UjXslmU7DtZbdkwRMznjwERIq/
 1tsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=6vrZZ11RVD2rWcPwYBm0QL0unbuRRLeZJK4GR9ng34A=;
 b=CeUofWjMnIAC+bO6cL7qOgKRecAc+pKH3Arm/YCE7gEWJhYmHgKNvfDSYMUcYv1Uzk
 X20yzYBVtUrVVV7qKhl6AQ2tZBPacl3eIzTKLkSdnMkbYBHQ07u8E+yz32tj26dqo74c
 CmvdpOz/OVwFcE3mamRuLpNF9FOy7OYi+pODVR3p5EasNaF5bvxL+TTs0+glevaWuMaX
 qNp70HWiTiXJRFrUZB6GDSscUfTJQu+nXHc6SvsrCULJ72isitPUSrIhEZdBzseMtYKc
 BHGPb6f7PgDdxMQ757O9+NtF0gyvrrd9MmeRlvgFON8aDRx/MUV6Nn6ZffZUB40b9j2y
 AK9A==
X-Gm-Message-State: AOAM530JuX9FgSI/cGcPLC+3O1f+gH4/MWmq1C3CSaxgFaWQ8MJSmomw
 XA39lv7/CPRuMNPWGZTmCPlD0/mVAjJY5g==
X-Google-Smtp-Source: ABdhPJzuVxtyElUuA2i1Ts9jtvU0wPi7h1vtMEP4Cu8/LGxl9Lk1T8Q4Z1Z4qoYpN9eRwpOMtIEf7A==
X-Received: by 2002:a05:6638:cd2:b0:321:3df1:98fc with SMTP id
 e18-20020a0566380cd200b003213df198fcmr6965487jak.30.1648402891838; 
 Sun, 27 Mar 2022 10:41:31 -0700 (PDT)
Received: from james-x399.localdomain (71-218-122-133.hlrn.qwest.net.
 [71.218.122.133]) by smtp.gmail.com with ESMTPSA id
 l15-20020a056e021aaf00b002c8028ec95esm6199930ilv.87.2022.03.27.10.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Mar 2022 10:41:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Mar 2022 11:41:30 -0600
Message-Id: <20220327174130.2577520-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/meson: bump to version 0.62.0
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/meson/meson.hash | 4 ++--
 package/meson/meson.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/meson/meson.hash b/package/meson/meson.hash
index 8389adb243..38fa43f6dc 100644
--- a/package/meson/meson.hash
+++ b/package/meson/meson.hash
@@ -1,4 +1,4 @@
 # Locally calculated after checking pgp signature
-# https://github.com/mesonbuild/meson/releases/download/0.61.4/meson-0.61.4.tar.gz.asc
-sha256  4e3733ddc66bac38e38c63b739c9b8b8fc5a866de5333396b0c85c2b144ddee9  meson-0.61.4.tar.gz
+# https://github.com/mesonbuild/meson/releases/download/0.62.0/meson-0.62.0.tar.gz.asc
+sha256  06f8c1cfa51bfdb533c82623ffa524cacdbea02ace6d709145e33aabdad6adcb  meson-0.62.0.tar.gz
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  COPYING
diff --git a/package/meson/meson.mk b/package/meson/meson.mk
index e9c3145183..13adc2f2b1 100644
--- a/package/meson/meson.mk
+++ b/package/meson/meson.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESON_VERSION = 0.61.4
+MESON_VERSION = 0.62.0
 MESON_SITE = https://github.com/mesonbuild/meson/releases/download/$(MESON_VERSION)
 MESON_LICENSE = Apache-2.0
 MESON_LICENSE_FILES = COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
