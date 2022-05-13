Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F512C433F5
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 20:31:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E8EDC410B6;
	Fri, 13 May 2022 20:31:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id spL7SwO442qZ; Fri, 13 May 2022 20:31:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C73CF409B0;
	Fri, 13 May 2022 20:31:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 40D791BF3CD
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:31:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2FB2A409B0
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 20:31:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oT0uCvwVZI_X for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 20:31:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E71EF40939
 for <buildroot@buildroot.org>; Fri, 13 May 2022 20:31:08 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id t6so12823661wra.4
 for <buildroot@buildroot.org>; Fri, 13 May 2022 13:31:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ekVfIFg/NBG2ClpdZojiyah/zsfPhBAyRVj1u/ZYnQ=;
 b=MPh4x5gnqw/Zay6n9PNWhnNkmkI2gM8rW/kKAeNXWdT62t3zDGfNF1p15KBTydSb22
 AsivR2QeKDSAd7NzaRAlvfOSB2XHEgPw4j1bW51l4kHnre3764i5McTwm2dB6F9bqods
 MNESMlSF+knNaKw7cdLA5IrkRGfy97efoWB3hvtTNgYNcC3S4ufH42lNsYWFWpYerliS
 xCmBIjF93kh/VAKjwwKw6b5m9ERo4aEpHSLManCn3dV9aRvSLKNNRGVXK0BsqiS3Il0d
 bbPsa6rARZ1LWwaCozyit+eWajOvI3zFndctDm6N+UpzkNjoaYc3Fx51uS3upIE/Vcb2
 KSHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=8ekVfIFg/NBG2ClpdZojiyah/zsfPhBAyRVj1u/ZYnQ=;
 b=Iycb8uD/qM24D4wjPDxG2YBEOj0DUZzCjw96L2I10GKgq5Ykb/ppLEtgIuxd3sbaO9
 WbAXy6cZMRN4p4RFkrqjaCojVjZWhseO2pdm+CLLARnmLQCeV1VYTzE81pKemOTFw4y5
 pCoWbQ3qWbfRgmi6JEPRI85etIeRWXv9b8xWjgwXY+zCOUB1yYakCbD4QZXnp7hqooEe
 4R6TJF7T+lVH1xLmTAgHkT0ll7FPfu1mvmVkKP028TG8+tVBYd7zdxV9UTkqmWHl7oJ7
 OnHJqmNFn0if54tSWr6lcWkBkNO85EN53FwxiJE2AQXNvnOABI7nz0klKtgRDloNaPM1
 Loog==
X-Gm-Message-State: AOAM530H29YTSJiTNXGt1YAPB4SCx9JMgp4/554w7APfCNXYfqWQNots
 9Qpp5dwuBmAPcMo16GXpzP5UT+7TuL0=
X-Google-Smtp-Source: ABdhPJxoX4ub56ChhtobPRXyhQRxLFkjT3F9SGLoaLVHCyaYVkMJn8PlWi27QAP1+uFf9m0Naen0jQ==
X-Received: by 2002:a5d:52ce:0:b0:20c:e030:b05a with SMTP id
 r14-20020a5d52ce000000b0020ce030b05amr5226607wrv.174.1652473866937; 
 Fri, 13 May 2022 13:31:06 -0700 (PDT)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id
 t6-20020a7bc3c6000000b003942a244f47sm6300055wmj.32.2022.05.13.13.31.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 May 2022 13:31:06 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 13 May 2022 22:28:55 +0200
Message-Id: <20220513202855.752024-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/alchemy: add host-pkgconf dependency
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

host-pkgconf is a mandatory dependency since the addition of the package
in commit 7f1f3f87868fa333833dbba9f4f07adc338b34ed resulting in the
following ulog build failure:

/home/buildroot/autobuild/run/instance-0/output-1/per-package/ulog/host/opt/alchemy/check.mk:36: *** 'pkg-config' is required.  Stop.

An other option would be to set TARGET_OS to baremetal but it could have
unexpected side-effects such as removing -fPIC for arm targets

Fixes:
 - http://autobuild.buildroot.org/results/c731fe0e9bdbfce0823f9c48641f1ed710fa6125

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/alchemy/alchemy.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/alchemy/alchemy.mk b/package/alchemy/alchemy.mk
index 18cdd0a645..10d1068ac4 100644
--- a/package/alchemy/alchemy.mk
+++ b/package/alchemy/alchemy.mk
@@ -8,7 +8,7 @@ ALCHEMY_VERSION = d95b3c38cd37814a1b98d0bbf813de7adaaecfbc
 ALCHEMY_SITE = $(call github,Parrot-Developers,alchemy,$(ALCHEMY_VERSION))
 ALCHEMY_LICENSE = BSD-3-Clause (Alchemy), GPL-2.0 (kconfig)
 ALCHEMY_LICENSE_FILES = COPYING README
-HOST_ALCHEMY_DEPENDENCIES = host-python3
+HOST_ALCHEMY_DEPENDENCIES = host-pkgconf host-python3
 
 ALCHEMY_HOME = $(HOST_DIR)/opt/alchemy
 ALCHEMY_SDK_BASEDIR = $(STAGING_DIR)/usr/lib/alchemy/sdk
@@ -35,6 +35,7 @@ ALCHEMY_TARGET_ENV = \
 	ALCHEMY_HOME=$(ALCHEMY_HOME) \
 	ALCHEMY_WORKSPACE_DIR="$(@D)" \
 	ALCHEMY_TARGET_OUT=alchemy-out \
+	PKGCONFIG_BIN=$(PKG_CONFIG_HOST_BINARY) \
 	TARGET_OS=linux \
 	TARGET_OS_FLAVOUR=buildroot \
 	TARGET_CROSS="$(TARGET_CROSS)" \
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
