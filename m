Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28AB5C433F5
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:54:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D069A84E38;
	Wed, 26 Jan 2022 22:54:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DueB7sAAFYzK; Wed, 26 Jan 2022 22:54:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 180F584E31;
	Wed, 26 Jan 2022 22:54:04 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC7F91BF48B
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:54:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CB04861035
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:54:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0DyA2T_IwDqM for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:54:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 76D0161029
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 22:54:00 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id s18so1499382wrv.7
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 14:54:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T9nuuFGfAtoqka5tnod/GDnOPvVJBGrXv7LLnC72BFk=;
 b=fiVoKLTmMOhcEBeCgmKHFpXE3Ya+I+9Usu9O1iLNqqwajyOqHHGo5h10JovJJV/xfR
 dgTcbNswcbu3Q/HlIDHuni+Z0D559ybchAhW7NA+nUgEmcwQSAmUMjoGsxmraXgzZ5mt
 CXTdf/z2ebmK/bZF4swacbbnOSK7pCdGYegS7wG8m6nq5zGFQXcQHjP3n+0q3sHNuYj3
 VNcXaHAQymBhNgdNBj07woC0gB+HI+lDpu4GNON2KZRiZEFrv4vOeZ0N9klCLsVH4Xo7
 pkww3OP1tWaM6UrCWFNj9jFodxVxKZHqFBguC8POLhUFoayDs5vCs8nmw0O0lBP1rPkC
 XHcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=T9nuuFGfAtoqka5tnod/GDnOPvVJBGrXv7LLnC72BFk=;
 b=Pnr1z/3YpNdKBn+S3OptD2K+jt9yD6ox5uPPaY/dbV5nUHGLuux/QlqvImEt47gzB5
 gcorRAtOJyyQlJ4qhRfOZHJ9r/ZpM+yrBrkoz3pKyxa1vM0ZhNph6dU/4+9n+amo+TxE
 qbgO2wytiY0lxPcfdaL/54QyoXAaEqUJIFoWKUp0kd+6YSelnjxQM9ysn7YKyOSB27UI
 v1HIxAPqxKELnftt+fEiQEl4avy7713ybEcYFrL9CDhY5NqY9Pgo3tzl5A5fxEB4UsR8
 Aqj7A8kF14J9zeq74GgzdHzGH9CwikIOZcX4pgXauL1pWJxMc+L5yaiKyODByo1fl2n7
 uhyA==
X-Gm-Message-State: AOAM532vGnJTrGseO0+iddALeWaiSyIdAuHqZotPTSd/DMHYCnlEvQ1d
 bHBGcH73ZylN/ekilHtU0xt0RQmkfHI=
X-Google-Smtp-Source: ABdhPJzyjfFmC6NsffUStYAY2Fwyci1cLY0FHU8hvQHx6Ox7f5gdKehcdsP3Xh5D45sRKZrFEI+6Lw==
X-Received: by 2002:a5d:544c:: with SMTP id w12mr535248wrv.357.1643237638467; 
 Wed, 26 Jan 2022 14:53:58 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id g20sm5720248wmq.9.2022.01.26.14.53.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 14:53:57 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 26 Jan 2022 23:51:58 +0100
Message-Id: <20220126225159.1567622-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/2] package/xvisor: drop ARM32 without virtualization support
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

As spotted by Thomas Petazzoni in
https://patchwork.ozlabs.org/project/buildroot/patch/20220125190650.107677-1-fontaine.fabrice@gmail.com,
"ARM32 cores that support the ARMv7ve instruction set are still
supported by Xvisor. This means that Cortex-A7, Cortex-A12, Cortex-A15
and Cortex-A17, which are all ARM32 cores, are still supported"

Fixes:
 - http://autobuild.buildroot.org/results/1211bf6ff10c75815fa3ac320532fab5fe649a2b
 - http://autobuild.buildroot.org/results/2bcbbb270df71d2489b7bc83e56c898c58cc90d2

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Keep ARM32 with virtualization

 package/xvisor/Config.in | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/package/xvisor/Config.in b/package/xvisor/Config.in
index eb7475b86d..71628e633e 100644
--- a/package/xvisor/Config.in
+++ b/package/xvisor/Config.in
@@ -1,9 +1,9 @@
 config BR2_PACKAGE_XVISOR_ARCH_SUPPORTS
 	bool
-	default y
+	default y if BR2_aarch64
+	default y if BR2_cortex_a7 || BR2_cortex_a12 || BR2_cortex_a15 || BR2_cortex_a17
+	default y if BR2_x86_64
 	depends on BR2_USE_MMU
-	depends on BR2_arm || BR2_aarch64 || BR2_x86_64
-	depends on !BR2_ARM_CPU_ARMV4 && !BR2_ARM_CPU_ARMV7M
 
 menuconfig BR2_PACKAGE_XVISOR
 	bool "xvisor"
@@ -32,9 +32,7 @@ endchoice
 
 config BR2_PACKAGE_XVISOR_DEFCONFIG
 	string "Defconfig name"
-	default "generic-v5" if BR2_ARM_CPU_ARMV5
-	default "generic-v6" if BR2_ARM_CPU_ARMV6
-	default "generic-v7" if BR2_ARM_CPU_ARMV7A
+	default "generic-v7-ve" if BR2_ARM_CPU_ARMV7A
 	default "generic-v8" if BR2_aarch64
 	default "x86_64_generic" if BR2_x86_64
 	depends on BR2_PACKAGE_XVISOR_USE_DEFCONFIG
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
