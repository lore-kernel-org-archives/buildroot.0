Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0013C433F5
	for <buildroot@archiver.kernel.org>; Tue, 25 Jan 2022 19:08:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 61BFE402C3;
	Tue, 25 Jan 2022 19:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4kqpVwIJGzSJ; Tue, 25 Jan 2022 19:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4F62E40377;
	Tue, 25 Jan 2022 19:08:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0A43B1BF2FA
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:08:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EC10B81413
 for <buildroot@lists.busybox.net>; Tue, 25 Jan 2022 19:08:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jcc38UB7WQX2 for <buildroot@lists.busybox.net>;
 Tue, 25 Jan 2022 19:08:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24D9781402
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 19:08:45 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w11so9516310wra.4
 for <buildroot@buildroot.org>; Tue, 25 Jan 2022 11:08:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IK1xYUw9Tp5eEIy7tUibA3/JfzAb2CE/RZnCCZNc7Ec=;
 b=QKWSvbpAXVMQoXtGITvwFifm/DCqh1NVVxsG8zFfyTOpUNlBzr7UVNwVrS/02NEK3b
 Vc1YCk616uSs1NK/m10mQJAOeKms4RH1qj+SxXs8J1+/v5fDskT+9VodlmqeBfFNtMfv
 yfLdxXUeo7JVEjsuVcjqQFIxyeSafcD2qCUuF6s+yAl3cp6xXq+kTpeyfk/dDEBkbwnP
 WKke5Tpt5vDgVeBX5F3SPLn3QMaK31JocqXJYUhe/cF9AkwpbZnNg5G/cNmLE96V00Km
 fEoHuf0HKSeo5zepZNnCnEPHEBKReg3l9i48NQi7ZQyI+VCNAQLDoibZF+7U1Bs9uaZP
 ys8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IK1xYUw9Tp5eEIy7tUibA3/JfzAb2CE/RZnCCZNc7Ec=;
 b=FNtNiJcWiDLflfsSYbMAox+p/ZCQDEuvXAOmfB15JZsG4YJPo4uYP6V9Su1DkKFOKi
 Iasm2Yj/i+xbbai4BSKoecsPy107ueuRQ2S7mLgJpdD4CAVq4LJDB6Oez2ggZEzUwXBl
 GZ/Eg7FoI2Sg1n2Rv8TpdBUD42THMRmD7cQODcK8qjTV6CFbn/AEQvw4A7guMjBV7uWb
 nvNXUWiHeB1pbKTKq2ZnpihD7sOKBSVZatl4v5ztYJkySe+4gAvZJGDOwgcyEsnfGgr6
 DIDeN4mHBS6OD+Of5D3MJlxWBOpYFOylYRUyzfjPDxSnkFN0eu7Q9VpYYgGuLAOeV+Ex
 2roA==
X-Gm-Message-State: AOAM5311r6mlJ5igwHwvnh6NoiBS/aLWrQJcfrVLKZ4fdrjGSl/4D+9j
 ZwliPpCLN0Mz+DsVjZ0nEN2PUFmr8cY=
X-Google-Smtp-Source: ABdhPJyp8xGr2FecjfLJ3DtbgiWRGDrlrtr6wCiubpGf6MGyCUQutRVm1RsLqg+w3szzTiNpAnfWhg==
X-Received: by 2002:a05:6000:1688:: with SMTP id
 y8mr18002979wrd.378.1643137723206; 
 Tue, 25 Jan 2022 11:08:43 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id d7sm3564842wri.117.2022.01.25.11.08.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jan 2022 11:08:42 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 25 Jan 2022 20:06:49 +0100
Message-Id: <20220125190650.107677-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/xvisor: drop arm support
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
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Support for old 32-bit ARM boards (i.e. ARMv5, ARMv6, ARMv7a) without
virtualization has been dropped since
https://github.com/xvisor/xvisor/commit/9fcd69692484e0f6aa5036c27196f55c797582c5
resulting in the following build failure since bump to version 0.3.1 in
commit c4f8b8968770ecbf6444a5921c6472f126717626:

*** Can't find default configuration "/home/giuliobenetti/autobuild/run/instance-3/output-1/build/xvisor-0.3.1/arch/arm/configs/generic-v6-defconfig"!

*** Can't find default configuration "/home/giuliobenetti/autobuild/run/instance-0/output-1/build/xvisor-0.3.1/arch/arm/configs/generic-v7-defconfig"!

Fixes:
 - http://autobuild.buildroot.org/results/1211bf6ff10c75815fa3ac320532fab5fe649a2b
 - http://autobuild.buildroot.org/results/2bcbbb270df71d2489b7bc83e56c898c58cc90d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/xvisor/Config.in | 6 +-----
 package/xvisor/xvisor.mk | 2 +-
 2 files changed, 2 insertions(+), 6 deletions(-)

diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index eb7475b86d..55c43e6959 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -2,8 +2,7 @@ config BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
 	bool
 	default y
 	depends on BR2_USE_MMU
-	depends on BR2_arm || BR2_aarch64 || BR2_x86_64
-	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV7M
+	depends on BR2_aarch64 || BR2_x86_64
 
 menuconfig BR2_PACKAGE_XVISOR
 	bool "xvisor"
@@ -32,9 +31,6 @@ endchoice
 
 config BR2_PACKAGE_XVISOR_DEFCONFIG
 	string "Defconfig name"
-	default "generic-v5" if BR2_ARM_CPU_ARMV5
-	default "generic-v6" if BR2_ARM_CPU_ARMV6
-	default "generic-v7" if BR2_ARM_CPU_ARMV7A
 	default "generic-v8" if BR2_aarch64
 	default "x86_64_generic" if BR2_x86_64
 	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
diff --git a/package/xvisor/xvisor.mk b/package/xvisor/xvisor.mk
index dc49258400..4ceb5ed7cb 100644
--- a/package/xvisor/xvisor.mk
+++ b/package/xvisor/xvisor.mk
@@ -30,7 +30,7 @@ XVISOR_KCONFIG_EDITORS = menuconfig
 
 ifeq ($(BR2_x86_64),y)
 XVISOR_ARCH = x86
-else ifeq ($(BR2_arm)$(BR2_aarch64),y)
+else ifeq ($(BR2_aarch64),y)
 XVISOR_ARCH = arm
 endif
 
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
