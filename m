Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82C7C433F5
	for <buildroot@archiver.kernel.org>; Sat, 29 Jan 2022 15:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4ABA1408A9;
	Sat, 29 Jan 2022 15:52:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dwbRc7BKOLMb; Sat, 29 Jan 2022 15:52:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 74BFE4055D;
	Sat, 29 Jan 2022 15:52:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 119161BF32E
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 15:52:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3D9E4055D
 for <buildroot@lists.busybox.net>; Sat, 29 Jan 2022 15:52:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qONVQn2cMLQo for <buildroot@lists.busybox.net>;
 Sat, 29 Jan 2022 15:52:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id ADC494050F
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 15:52:11 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id
 l12-20020a7bc34c000000b003467c58cbdfso10426841wmj.2
 for <buildroot@buildroot.org>; Sat, 29 Jan 2022 07:52:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R7+iEHbXBjXYa5+xuFIBGYiAopAVZR5bP4uNIxtqGNQ=;
 b=Kj3XvvoDr5hFfOArmFsmDQ7qj/2mPqpihPWEZtqqPlO8Ao56zL/NB/eTEc0/xwLEHm
 1mVrFLAx/VciegvYcnsCmGh61RG6bRYSK4F/kf0xdbJiC0FgpoYF32J2RcXN+kcQraxR
 0idyUFg6b0m9aAB4z62aPlhINr4qvuQBkiV5Lr5aI/Co58IOpkwerEoQIdzyB2UiUW3o
 LnLCSnUsbKyhdYFhD22WSVGbwnkmadkONBZ1lei/P6cRvkTGhmExeatbMiNxU6htpWZn
 d+03ZsuVsTTtzvbsRuOJdUxwEtH20DNZLqeU+Xrb4MLVEmclvSEcIRel4PSZHiKqkecd
 22MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=R7+iEHbXBjXYa5+xuFIBGYiAopAVZR5bP4uNIxtqGNQ=;
 b=WtGY1elEETKobZL3n2HGsDOMM/isZBswTM0MPIIVFtwwi7gqSWiNKlz27WZqXsuaPd
 ksehruQZ0AnFNosRydRTfHd9K0HlmDkbFGPMh1pp4z8EyOBISzw9XkGKqFUAjK0j2cRY
 IA7AMMHwL4RWhKrEOkE7xnR78jtsQPtFpVMJ5evkUpWf7VWeX3iX+X0aVMV09q7e7KKP
 MpD/xtHfpGqW6fkNco3FxM65FSCdI807djaCNy73VTqF9XxD1mgirAbNNVH4oNYCj5ym
 nkrV7ML41EwKnb4Nh4qJefkPDgkpVkxEubHhOcV9YKsF9ox8Hk/ZX34mY+/YWMK5TyHE
 v6OQ==
X-Gm-Message-State: AOAM532DJ2R7pIVE8CudTGYGxw9nksqa+xGVcDJILQfXT5KQdQBGDwRo
 n0m0Q0LNnxotxh1dF0d5fuVE8kyrmBk=
X-Google-Smtp-Source: ABdhPJwFdVHD6WbxY+ueiQklN7VMcVSl711cpjA9BtgwwaRKgW2jiV6aXr7NCEk+IXe3vZkeG+iuSA==
X-Received: by 2002:a05:600c:4341:: with SMTP id
 r1mr1803044wme.99.1643471529566; 
 Sat, 29 Jan 2022 07:52:09 -0800 (PST)
Received: from kali.home (2a01cb088e0b5b002be75de2a1caa253.ipv6.abo.wanadoo.fr.
 [2a01:cb08:8e0b:5b00:2be7:5de2:a1ca:a253])
 by smtp.gmail.com with ESMTPSA id c23sm4493997wme.35.2022.01.29.07.52.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jan 2022 07:52:09 -0800 (PST)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 29 Jan 2022 16:50:19 +0100
Message-Id: <20220129155019.3819750-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2,
 1/1] package/android-tools: fastboot needs gcc >= 5
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add gcc >= 5
dependency to fastboot:

Makefile:591: *** libsepol is in the dependency chain of libselinux that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/2430ba4afb40569ed54506201494baeebf6c5d42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2:
 - Fix typo

 package/android-tools/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index a36c4db189..bc76d545c1 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -38,6 +38,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	bool "fastboot"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
 	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_ZLIB
@@ -46,8 +47,9 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	  the target, which can be used to reflash other target devices
 	  implementing the fastboot protocol.
 
-comment "fastboot needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "fastboot needs a toolchain w/ threads, dynamic library, gcc >= 5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 comment "fastboot needs headers >= 3.10 (PowerPC64), headers >= 3.16 (MIPS64)"
 	depends on !BR2_arc
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
