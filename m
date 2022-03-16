Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FDA1C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 21:24:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1FEFD83E61;
	Wed, 16 Mar 2022 21:24:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tu78gHC06gnW; Wed, 16 Mar 2022 21:24:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C22A84123;
	Wed, 16 Mar 2022 21:24:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 41C051BF2C2
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:24:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3EFB583E61
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 21:24:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0eeOFHbGrehl for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 21:24:04 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 03F3D82C91
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 21:24:03 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id j26so4774980wrb.1
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 14:24:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=FJXNBWFgggh5cFDGDtjAx/0MjpMnn+OHuDz3MYkTLFE=;
 b=RMglIdY8WpzMG/GxBNFjCgxdegS/LSFgsnEmbNBzWbYZAgxw6xNpKsG0xU8A3+fhiN
 ayqB65unUQBNOT/q5wnqs8YzMJUTYQ79XXzF1zmJWImtPiSRcgvzT3TF8NRHFb7g7qB3
 K+ACMYqTvgNUPPoMC9aQEeivC4feB9z9Q4icJGuFoWZ2EiuFHX/X7oi4AcClLWBQ79lF
 jvbZ+BvYf5rYaTa2saDwkPy2yQruB0cYGyLVopM6cBcIn96DtUvgWhah6VRrF9f9jYIa
 4nsaXtyBoW39merqeoQ6UEd8+RCmcvGrO1Z60U08lQm2daBfndds9/1UihyfALmqeBDk
 HjyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=FJXNBWFgggh5cFDGDtjAx/0MjpMnn+OHuDz3MYkTLFE=;
 b=uq8jXGOgbCnNBGLGdRGtg1ARw8CLye4mRT3Ho3Wxb5OGCUxKqM2Un8tRw5f39PNeQV
 dixVbr9WoBql9ydV2VcerFQpSMw3x5PHVLTqJp1FgYz73ePK0oJALklsiKq9NI4E2KMX
 jNcBDlxo/b4fBY9E4dzYdXqjvaGK3+fnUnRE9on1THn4KsiecYdX5lSC7eNS1JZ74NwE
 iPGSeD5p1qAoodG3ucbJyGRara0Q1x9n0gCleqkqRynMrvesRNg9RvAF8ofiPemzPO7s
 khdEA2E3xmNI/OyHJdiywcbfTrF6DZVYXGx5IDhHH63L5Es/sYz5qwjuuscXOcqXHYPJ
 Kn+w==
X-Gm-Message-State: AOAM531LIvLXoE+D+moP7pCcdm/zyiwuIGLtJwAMhZux3ddpn8WgzPCu
 VWWqXLK/Rb+P79vvybSgHMUoPk3cYxk=
X-Google-Smtp-Source: ABdhPJyKHMD/M9gQMiofd8b5Cw1zN4RwbBj6iOnorb577Pa7P9hvk4WattFDZZkX0A8LXasSs3ziJw==
X-Received: by 2002:a05:6000:2c4:b0:203:72c9:ef37 with SMTP id
 o4-20020a05600002c400b0020372c9ef37mr1342685wry.387.1647465842071; 
 Wed, 16 Mar 2022 14:24:02 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 p6-20020a5d4586000000b001f0436cb325sm2440959wrq.52.2022.03.16.14.24.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Mar 2022 14:24:01 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 16 Mar 2022 22:22:19 +0100
Message-Id: <20220316212220.3437314-5-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
References: <20220316212220.3437314-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 5/6] package/zynaddsubfx: add jack{1,
 2} optional dependency
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
Cc: Julien Olivain <ju.o@free.fr>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

jack{1,2} is an optional dependency (enabled by default) since the
addition of the package in commit
18a863063735e2c658fa6947a4e540e9dda6c431

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/zynaddsubfx/zynaddsubfx.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/zynaddsubfx/zynaddsubfx.mk b/package/zynaddsubfx/zynaddsubfx.mk
index aeeb0b6405..461146aae8 100644
--- a/package/zynaddsubfx/zynaddsubfx.mk
+++ b/package/zynaddsubfx/zynaddsubfx.mk
@@ -30,4 +30,11 @@ else
 ZYNADDSUBFX_CONF_OPTS += -DAlsaEnable=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_JACK1)$(BR2_PACKAGE_JACK2),y)
+ZYNADDSUBFX_DEPENDENCIES += $(if $(BR2_PACKAGE_JACK1),jack1,jack2)
+ZYNADDSUBFX_CONF_OPTS += -DJackEnable=ON
+else
+ZYNADDSUBFX_CONF_OPTS += -DJackEnable=OFF
+endif
+
 $(eval $(cmake-package))
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
