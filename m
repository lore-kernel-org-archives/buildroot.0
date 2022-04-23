Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ADC74C433F5
	for <buildroot@archiver.kernel.org>; Sat, 23 Apr 2022 21:13:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 31C9A404BD;
	Sat, 23 Apr 2022 21:13:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eTPTfIx_dZpQ; Sat, 23 Apr 2022 21:13:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50108403D6;
	Sat, 23 Apr 2022 21:13:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 05A1F1BF29A
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 21:13:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2DF78301F
 for <buildroot@lists.busybox.net>; Sat, 23 Apr 2022 21:13:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4Ml1jUwGn_XS for <buildroot@lists.busybox.net>;
 Sat, 23 Apr 2022 21:13:41 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0CB478301D
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 21:13:40 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 u9-20020a05600c00c900b00393e729e655so660531wmm.0
 for <buildroot@buildroot.org>; Sat, 23 Apr 2022 14:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Al4p/0Nz+K9z5OC8OymfQlZI90TvPXWjSnJVrVrfz8=;
 b=YELZ7fw6hxmi5jQSnkHPXsFZJILa2eYpy7cmzWnlA1+UsuxOU/S/uKEkWLcjpVjy5Y
 p/KYysCjIowFoGg/xgZJOr9IeyDhzDUCfR0bmKJK/Kkfp9aHBDVcnch7YR2YRw4YvsC4
 33IEyLnuICcU8Thl3fuohNA5mtl8AQI/d5dVZmfa3Tzj6+1oqbEoJNtTBjQ9NLqB/UXY
 WEcMh36uPS9KCOXbeI1igr+85DAaefE9nvWnSNl78IrMN7ipfOZnYLpqQLJzip/tn7QS
 XuDn+WuhwRPRpxHdBUMQfLtcHzYIOYbMjg+fvKh+AEXW17FASJRr0m7uYNkGZ7WFZOfp
 yFiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9Al4p/0Nz+K9z5OC8OymfQlZI90TvPXWjSnJVrVrfz8=;
 b=ja3RgYpY7XU71VxKHmFPaUAOVopZ5WQGBxyfY/hM6QaQO0kFaCD/3KymtlE9V2Q+So
 pXmmGVlkm+uTgShDP+dLpyVXb+EgjdAOYseMo1YL8U4wvTf/AihpRYCEmtXfUXOT9jGk
 ACeQh+fh6HqH1JJKaUJmq46kXnuaL6JuaWrK/v8+l8SqZ81BbS6nvilX+FJZ5h01l898
 1yvpgx7eWPt/N3zLYqtwXusDgDXpL/oMoeTKt+3RofqIBVvP8EGEN4Ck8SBa6J22lF/B
 M5Y7WK0Bn61o7zLdbEgvL4XunoneyZ+kuSbwzmpwszHHL7rVkTUqiYglQq8KmorZ6Y72
 c0Gw==
X-Gm-Message-State: AOAM531MIRCclEsz6RzRK7vsvfEnaL9Eb1E5odahq/PisD/GfEfYlGHB
 TZrFy/7euFreSDbQZ+cw0JspUt1ljuE=
X-Google-Smtp-Source: ABdhPJyiIg8WUd0FiOd3Qi+LhKwi5RivA1epHXi8P0q2dSU8rfE1jvr3KTLBzQ5eWQlQ4yXumXNjEQ==
X-Received: by 2002:a7b:c5d1:0:b0:37f:a8a3:9e17 with SMTP id
 n17-20020a7bc5d1000000b0037fa8a39e17mr18561292wmk.109.1650748418845; 
 Sat, 23 Apr 2022 14:13:38 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a05600c190800b00393e80a7970sm593227wmq.7.2022.04.23.14.13.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 23 Apr 2022 14:13:38 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 23 Apr 2022 23:11:41 +0200
Message-Id: <20220423211141.1704835-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/aubio: add host-pkgconf dependency
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add host-pkgconf dependency to fix the following build failure raised
since the addition of the package in commit
280bb6807619e2e858836435f44aad0cccd27a40 and
https://github.com/aubio/aubio/commit/e57859fd1f2c3c8b18b3f5ede122071c66166a8f:

Checking for program 'pkg-config'        : not found
Could not find the program ['pkg-config']

Fixes:
 - http://autobuild.buildroot.org/results/e6f0e9b09e4b611daf5bb37091610d8de80f1f4d

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/aubio/aubio.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/aubio/aubio.mk b/package/aubio/aubio.mk
index b79beccd97..b2eb2b5e6d 100644
--- a/package/aubio/aubio.mk
+++ b/package/aubio/aubio.mk
@@ -11,6 +11,7 @@ AUBIO_LICENSE = GPL-3.0+
 AUBIO_LICENSE_FILES = COPYING
 AUBIO_INSTALL_STAGING = YES
 
+AUBIO_DEPENDENCIES = host-pkgconf
 AUBIO_CONF_OPTS = \
 	--disable-docs \
 	--disable-atlas
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
