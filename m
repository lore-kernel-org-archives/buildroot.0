Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E2B9C433F5
	for <buildroot@archiver.kernel.org>; Fri,  4 Mar 2022 04:25:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8CD3C83E27;
	Fri,  4 Mar 2022 04:25:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qu7ttca1Zjck; Fri,  4 Mar 2022 04:25:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id BB135813D9;
	Fri,  4 Mar 2022 04:25:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B87CB1BF271
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 04:25:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id AD30040164
 for <buildroot@lists.busybox.net>; Fri,  4 Mar 2022 04:25:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pT56WU61YDVQ for <buildroot@lists.busybox.net>;
 Fri,  4 Mar 2022 04:25:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com
 [209.85.215.177])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B278E400BF
 for <buildroot@buildroot.org>; Fri,  4 Mar 2022 04:25:06 +0000 (UTC)
Received: by mail-pg1-f177.google.com with SMTP id o8so6482968pgf.9
 for <buildroot@buildroot.org>; Thu, 03 Mar 2022 20:25:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=cryNa77NHnaNK/UHhs4OQ96/EaQqwy9P8Eh6zMa4M0s=;
 b=OZtNuYpNhpal2MzzDsznu9qKYoA933FEV8kqWZtPwJMG+9RWVkY4ib0gtvWFtHBAbu
 fpbjh9uwqqTt70ckw5xKCsZa1nZYEJa87JQY8rgoYBALbS3nXpVTHmIQOwXYhlFLadvh
 on1hEh4y95gIKhuUkfmbLLhGWZj1Z4T8y04ko9dKz6SO+Dob3eFClNe9Y5hAD/p8Bgta
 sYJ/9PaGtUCBKDxsLutMcmzGocMwa4pQC/W1eplMnOEyuus27AK8cEZmNOr0H0dK2LQz
 0BbexKLU1AWmp86WQVwP3SfrYI8uKUX6w5bsnPws1NXkYA/31EF1uq9pkFdY+MtL2A6c
 A7uw==
X-Gm-Message-State: AOAM5303BQn6MijaA4p7ZE/sqw+nx/EY74Yl9s7Wy3vSe+76eaX8woya
 ecYDLyGPquI6QUf7L/zEcRNA9u7GHSk=
X-Google-Smtp-Source: ABdhPJwVSouf2G4fb9jrHE+VHl1U6fF41VA1kiJAmE6k0qi3eIAVb4NVkeYn7A2aw7A6dT/JABiLuQ==
X-Received: by 2002:a05:6a00:9a9:b0:4ca:c2f1:c685 with SMTP id
 u41-20020a056a0009a900b004cac2f1c685mr41102663pfg.12.1646367905605; 
 Thu, 03 Mar 2022 20:25:05 -0800 (PST)
Received: from localhost.localdomain (ip68-6-95-5.sb.sd.cox.net. [68.6.95.5])
 by smtp.gmail.com with ESMTPSA id
 j8-20020a056a00174800b004f26d3f5b03sm4156849pfc.39.2022.03.03.20.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Mar 2022 20:25:05 -0800 (PST)
To: buildroot@buildroot.org
Date: Thu,  3 Mar 2022 20:25:02 -0800
Message-Id: <20220304042502.56629-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: security bump to 1.17.8
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@paral.in>
Cc: Christian Stewart <christian@paral.in>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

go1.17.8 includes a security fix to the regexp/syntax package, as well as bug
fixes to the compiler, runtime, the go command, and the crypto/x509, and net
packages.

https://go.dev/doc/devel/release#go1.17.minor

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.hash | 2 +-
 package/go/go.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/go/go.hash b/package/go/go.hash
index fdf342e602..85e6adfb8c 100644
--- a/package/go/go.hash
+++ b/package/go/go.hash
@@ -1,3 +1,3 @@
 # From https://golang.org/dl/
-sha256  c108cd33b73b1911a02b697741df3dea43e01a5c4e08e409e8b3a0e3745d2b4d  go1.17.7.src.tar.gz
+sha256  2effcd898140da79a061f3784ca4f8d8b13d811fb2abe9dad2404442dabbdf7a  go1.17.8.src.tar.gz
 sha256  2d36597f7117c38b006835ae7f537487207d8ec407aa9d9980794b2030cbc067  LICENSE
diff --git a/package/go/go.mk b/package/go/go.mk
index 56a21dfe55..3df16c9a68 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GO_VERSION = 1.17.7
+GO_VERSION = 1.17.8
 GO_SITE = https://storage.googleapis.com/golang
 GO_SOURCE = go$(GO_VERSION).src.tar.gz
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
