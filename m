Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED4C7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 09:50:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E4B4813D7;
	Mon, 27 Dec 2021 09:50:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SBTerKXozaVY; Mon, 27 Dec 2021 09:50:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF2B781445;
	Mon, 27 Dec 2021 09:50:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 776411BF3FD
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:50:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 66C43813CF
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 09:50:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 61Oc-opnnwUi for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 09:50:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8354B81445
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 09:50:28 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id o20so59629491eds.10
 for <buildroot@busybox.net>; Mon, 27 Dec 2021 01:50:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oVIKXJI/9a0P2J2VC+76Qvurlr+7hDWHuZW6Uc0JW+Y=;
 b=E5lHSrRzfocYZsMfRsenqsN13mWcTCIMnePfXFx83xjixCwBvvpmUi+YvGrjSSmV8y
 m/pTfH5TIA1hnKRFM8QUoeS9LArPVx7QFn2hT9xT1+iqtvM4EWIulj0d50UG+Y0isCqH
 yiY/fTCbXx65cFOvuyKQrqnNb1DFJNPTaGkHx6+fCTTIWwnqOWNyreveh6i9k+so9LZB
 Jbyg/hg+AZSaMooiH2pnj5GHBhZbGeEmtdICT/qQvcaSyum7lAnzItjuxENR3uwO2Z77
 fb79TEbRct4bWyrbgQkIRwbJFn3TaTrBrpVVFce7NfIZmcPA3OF9fAlFt7gWbFydNq+d
 CejQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=oVIKXJI/9a0P2J2VC+76Qvurlr+7hDWHuZW6Uc0JW+Y=;
 b=aJbtUw+DD34CyeG9DeT8IRhWiSQUwCWlENzK1xAVzMCrDAA8HMPG9ENJV6lIkT5l6D
 M1cYTkdkD7sWpqh2FGOa7I2NbPgizBntap2NLPYrDNHYDAhyyLXWmUghtWV1JK97XJ7U
 A2r4ZIEXHts+fyBsr8la79OC3ehOCK0/q0UFC4Jxx+9FxGBXjZNQ+X0j2Tl//3F5l6CX
 v7eCxWmrLGSwIlP0wgKwQjPcq28XpPW745xAdd7E3KDo4WRSV8LBH137GAu/WbeDTwVG
 zxcLQbsf7PLaHKXicxSDIjzUqG0f4urmWaxHN8xk/7Sf2ynsbVTeBmXWQ0+Vr5GA3jyv
 94QA==
X-Gm-Message-State: AOAM530nKL8YL6MJiiSdHLdqwLgK2IkXq80YHzzSlehDB2X6fMKksRV+
 h3kTGVBbjqzoproO9m68KIJHxdnCu2I=
X-Google-Smtp-Source: ABdhPJwXvxWxp85TiN4onjpyTAdFt7y5M6FaaYDjYs+ArvVnTf4GdM8ftvylJ9ruBEiY7Hz1BvApPA==
X-Received: by 2002:a05:6402:1250:: with SMTP id
 l16mr16043632edw.0.1640598626797; 
 Mon, 27 Dec 2021 01:50:26 -0800 (PST)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id cw11sm4986356ejc.69.2021.12.27.01.50.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Dec 2021 01:50:26 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon, 27 Dec 2021 10:50:19 +0100
Message-Id: <20211227095019.1051401-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] package/nano: bump to version 6.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/nano/nano.hash | 4 ++--
 package/nano/nano.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/nano/nano.hash b/package/nano/nano.hash
index c2af67a0f..80529437d 100644
--- a/package/nano/nano.hash
+++ b/package/nano/nano.hash
@@ -1,5 +1,5 @@
 # Locally calculated after checking pgp signature
-# https://www.nano-editor.org/dist/v5/nano-5.9.tar.xz.asc
+# https://www.nano-editor.org/dist/v6/nano-6.0.tar.xz.asc
 # using key BFD009061E535052AD0DF2150D28D4D2A0ACE884
-sha256  757db8cda4bb2873599e47783af463e3b547a627b0cabb30ea7bf71fb4c24937  nano-5.9.tar.xz
+sha256  93ac8cb68b4ad10e0aaeb80a2dd15c5bb89eb665a4844f7ad01c67efcb169ea2  nano-6.0.tar.xz
 sha256  fc82ca8b6fdb18d4e3e85cfd8ab58d1bcd3f1b29abe782895abd91d64763f8e7  COPYING
diff --git a/package/nano/nano.mk b/package/nano/nano.mk
index fba318b03..30db3249e 100644
--- a/package/nano/nano.mk
+++ b/package/nano/nano.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-NANO_VERSION_MAJOR = 5
-NANO_VERSION = $(NANO_VERSION_MAJOR).9
+NANO_VERSION_MAJOR = 6
+NANO_VERSION = $(NANO_VERSION_MAJOR).0
 NANO_SITE = https://www.nano-editor.org/dist/v$(NANO_VERSION_MAJOR)
 NANO_SOURCE = nano-$(NANO_VERSION).tar.xz
 NANO_LICENSE = GPL-3.0+
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
