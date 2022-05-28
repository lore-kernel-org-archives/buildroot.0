Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E400C433F5
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 21:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B676141963;
	Sat, 28 May 2022 21:35:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id H1P1_PWuHQ0L; Sat, 28 May 2022 21:35:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8534F4191C;
	Sat, 28 May 2022 21:35:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E6E531BF5A0
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E00C2849C5
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:35:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RcZ-4Xneq6ES for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 21:35:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E19FC849C3
 for <buildroot@buildroot.org>; Sat, 28 May 2022 21:35:10 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id i74so8047456ioa.4
 for <buildroot@buildroot.org>; Sat, 28 May 2022 14:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2DNFue9Ebozcht+LJPr00SjvshSCQ9jF17RsSA4Pj+U=;
 b=iDnDpuxVirL0/k4uL2wE6wGCfwMZIXQ4t3QvN0SocrY6oMauCuavgXfJelccMNsKPq
 cEaJTKneo67zE815c+6lgYupqB35EezrqIegvKkzRS9ze4Atw5pC1GI9jVU5sUQuAC0G
 9wOq1Ri4wLzjb0z3Gi2wfeBhW8h7dBXMHwCfzQ8k0z/kSFLSRQE5OcjVisY/XQsumA2t
 efmsZXbTwcYMewJmJj7Sk75gXGyPtx9/J9QN5nBor9WEvpotX9T8+rpzR0BYg0t9g+mx
 jQlWy9VRBtb16Z7MC7sDsAPjTPBHCSeQc/nwU4KNGF6ts5FKeszn8dd955h+0Xxk9Xdl
 9AoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=2DNFue9Ebozcht+LJPr00SjvshSCQ9jF17RsSA4Pj+U=;
 b=6jYrmn/aytq/a5b/ZMW3tBc8PW4fK4e1BPF17CkSQrwt007BgjvNQZKb+TS3vGRvm1
 EH7EH+PjgTtAHvatbqGmGnFjP3wtarQIf2X22U/T2tSIokpr2cfXowe7z5XVkooTZInl
 dXn5GO7wlevpwzpWf3BEkh5LaLyY87t5Tcz9VQ1IA+8Y21Ex3hp9g0S2Q73IboTHn0Dj
 HbKFW0XEPnEp59/8gKehlB2MBlKk4exhICTw08D8Ip4IllwGk6QBSlhL+TFiKgj46+Om
 iu7Q0LhNwXCs5SFdBuV8N2shfx84sCPpUTkM9aid9Jekz9/5NAWw9D/G9gGRb4SV++VR
 5mBQ==
X-Gm-Message-State: AOAM530yTx4nu8f8oo3obp+Vap84Wq3FwrPI4d4Ay2YrdAj+xFuhbn35
 tzt7ykYYgJzKNiQF9l8oUpvAvyHKD5g=
X-Google-Smtp-Source: ABdhPJwSowruL75codpdp5QN+N0XYWurZcjT1+zLCxfJU6sjvgiR/XyO3f6NxSU1H14XmGzbBAiCYw==
X-Received: by 2002:a6b:d612:0:b0:664:c158:da22 with SMTP id
 w18-20020a6bd612000000b00664c158da22mr13459257ioa.143.1653773709745; 
 Sat, 28 May 2022 14:35:09 -0700 (PDT)
Received: from james-x399.localdomain (97-118-134-20.hlrn.qwest.net.
 [97.118.134.20]) by smtp.gmail.com with ESMTPSA id
 f13-20020a5ec60d000000b0065a47e16f37sm2106958iok.9.2022.05.28.14.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 May 2022 14:35:08 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 28 May 2022 15:35:07 -0600
Message-Id: <20220528213507.4149540-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] linux: update cip/cip-rt kernels to latest
 versions
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 linux/Config.in  | 8 ++++----
 linux/linux.hash | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index fd3605a559..0db94370ca 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -32,7 +32,7 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17 if BR2_KERNEL_HEADERS_AS_KERNEL
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.104-cip3)"
+	bool "Latest CIP SLTS version (5.10.115-cip7)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -52,7 +52,7 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  https://www.cip-project.org
 
 config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.104-cip3-rt3)"
+	bool "Latest CIP RT SLTS version (5.10.109-cip5-rt4)"
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
 	help
 	  Same as the CIP version, but this is the PREEMPT_RT realtime
@@ -129,8 +129,8 @@ endif
 config BR2_LINUX_KERNEL_VERSION
 	string
 	default "5.17.7" if BR2_LINUX_KERNEL_LATEST_VERSION
-	default "5.10.104-cip3" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.104-cip3-rt3" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "5.10.115-cip7" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
+	default "5.10.109-cip5-rt4" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/linux.hash b/linux/linux.hash
index 3190813a0c..b8eeceef15 100644
--- a/linux/linux.hash
+++ b/linux/linux.hash
@@ -8,8 +8,8 @@ sha256  e03b777861fae559cb7ed635500cde305bc2ca34dee4dc2fe806de0060c87bdc  linux-
 sha256  3cd6d4eeb3a5d1c906b35c08f0d602f329410c291233bee1a7a2b168c7378bbe  linux-4.14.278.tar.xz
 sha256  59bcfd094ec26b03ca506199224cff53c13325e62d22bd4e31ef4ccafe7265a2  linux-4.19.242.tar.xz
 # Locally computed
-sha256  63e6df81c4a747c60eed535ffc2f6f1ddb0c17ec349e860316d9a700c69ab38e  linux-cip-5.10.104-cip3.tar.gz
-sha256  9a45929d91ebaddbf6a0ef29750775e33d3c3f56f42f0a9e95e77e5b4eba3c6e  linux-cip-5.10.104-cip3-rt3.tar.gz
+sha256  f3559be277be9200897022282be18cfc0278d1d8baec8058305b04b9cd72002a  linux-cip-5.10.115-cip7.tar.gz
+sha256  71fba4ed5cb48fa7869e9fe271b68b77fed26775ce5cf2f50891aa8f71c388b3  linux-cip-5.10.109-cip5-rt4.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
