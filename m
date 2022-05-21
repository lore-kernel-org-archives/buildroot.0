Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F0FCC433F5
	for <buildroot@archiver.kernel.org>; Sat, 21 May 2022 03:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 99E3F8470E;
	Sat, 21 May 2022 03:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MPyMVVmkQqXF; Sat, 21 May 2022 03:52:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 739F8846AD;
	Sat, 21 May 2022 03:51:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8319B1BF59A
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 03:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71AE2426CB
 for <buildroot@lists.busybox.net>; Sat, 21 May 2022 03:51:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id uDlxBOoBZOqi for <buildroot@lists.busybox.net>;
 Sat, 21 May 2022 03:51:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
 [209.85.215.175])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61C38426C8
 for <buildroot@buildroot.org>; Sat, 21 May 2022 03:51:56 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id t28so1634598pga.6
 for <buildroot@buildroot.org>; Fri, 20 May 2022 20:51:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=PRnR5isawUQ1wWlRNIhee70k9sNsOD2uB7utOaglN9I=;
 b=PUVpS01fPNQbj24fSIMU6zqGVlIb864iZLUMUN5qqUUBW95lMumxCmiZdGh4jCF9ct
 hvinqBwHXC8iC0JT9UMldtXvVIHkP7jTOJTB4vSgEDOWB0zuLIjy0Wt0Ahav7hpOPpL5
 newU9pFhFZdtNK1B7yE7lFFV3ms2xewTn8lRLkmuPwxaK7aacIV41JOB9tAdhUZcQAfm
 x1nJDBcGjLJttECZE594T73Z4B539Fj2fUu6u1YaOIZapCgJvOymRrCHwvmSVP9Z3dPB
 G8XEoJXLYB/PORUIsPDScPbZFJtIswuD1/7nm9mk1DKyu5TAiLWnyKPMMIwgR8SsDiwN
 L52g==
X-Gm-Message-State: AOAM532s3GAhqM6JXpknACh/iwdCwcAVqJAY9WDjwBHdbpVnGQJqVkkk
 kyfCPs2hD65HmA1GdzWMVhnqOqxhOKf4GQ==
X-Google-Smtp-Source: ABdhPJwE/GLMiyNsvx9sqommQTUv80LzgueebOutyIO3tpGioSykG4qSzMtBQI6iRfv/1mMPrJDh6A==
X-Received: by 2002:a63:583:0:b0:3f2:3f20:ec1a with SMTP id
 125-20020a630583000000b003f23f20ec1amr11079813pgf.460.1653105115416; 
 Fri, 20 May 2022 20:51:55 -0700 (PDT)
Received: from localhost.localdomain (ip184-189-231-225.sb.sd.cox.net.
 [184.189.231.225]) by smtp.gmail.com with ESMTPSA id
 7-20020a621807000000b005183434ec84sm2632637pfy.145.2022.05.20.20.51.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 May 2022 20:51:54 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 20 May 2022 20:51:30 -0700
Message-Id: <20220521035129.493797-1-christian@paral.in>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/go: set goos variable to linux
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

This commit fixes a build error when the host environment has GOOS set to
something other than "linux." For example,

cd ./buildroot
GOOS="js" make

This will cause a build failure. Override GOOS to be either empty for host
packages or set to "linux" for target packages.

Signed-off-by: Christian Stewart <christian@paral.in>
---
 package/go/go.mk | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/package/go/go.mk b/package/go/go.mk
index 305a4926ee..f9445c7dd3 100644
--- a/package/go/go.mk
+++ b/package/go/go.mk
@@ -73,6 +73,7 @@ endif
 HOST_GO_TOOLDIR = $(HOST_GO_ROOT)/pkg/tool/linux_$(GO_GOARCH)
 HOST_GO_TARGET_ENV = \
 	$(HOST_GO_COMMON_ENV) \
+	GOOS="linux" \
 	GOARCH=$(GO_GOARCH) \
 	GOCACHE="$(HOST_GO_TARGET_CACHE)" \
 	CC="$(TARGET_CC)" \
@@ -95,6 +96,7 @@ endif
 HOST_GO_CROSS_ENV = \
 	CC_FOR_TARGET="$(TARGET_CC)" \
 	CXX_FOR_TARGET="$(TARGET_CXX)" \
+	GOOS="linux" \
 	GOARCH=$(GO_GOARCH) \
 	$(if $(GO_GO386),GO386=$(GO_GO386)) \
 	$(if $(GO_GOARM),GOARM=$(GO_GOARM)) \
@@ -109,6 +111,7 @@ endif # BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 # For the convenience of host golang packages
 HOST_GO_HOST_ENV = \
 	$(HOST_GO_COMMON_ENV) \
+	GOOS="" \
 	GOARCH="" \
 	GOCACHE="$(HOST_GO_HOST_CACHE)" \
 	CC="$(HOSTCC_NOCCACHE)" \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
