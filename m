Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E58EC5478C
	for <buildroot@archiver.kernel.org>; Tue, 27 Feb 2024 16:30:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 197B3409D3;
	Tue, 27 Feb 2024 16:30:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y78bNtKve5qP; Tue, 27 Feb 2024 16:30:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A88DF409FC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A88DF409FC;
	Tue, 27 Feb 2024 16:30:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09AB71BF30A
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EA28D40AAF
 for <buildroot@lists.busybox.net>; Tue, 27 Feb 2024 16:30:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZoolToA4P0Su for <buildroot@lists.busybox.net>;
 Tue, 27 Feb 2024 16:30:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::533; helo=mail-ed1-x533.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 46E6440012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46E6440012
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46E6440012
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 16:30:33 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-56454c695e6so7835827a12.0
 for <buildroot@buildroot.org>; Tue, 27 Feb 2024 08:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709051431; x=1709656231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wECPWhW1zoUwEYbDf+8pXLp9fMG95JWQuFsDvL0KuYQ=;
 b=fIMbuXQYEYvq+Mq/OssTdlqVH92jgc3rbmrB9pHHloavpO9RhMo+Sa26fG+LO/hhdr
 G4lRZIvZ7A9Ldr3sQUs3T1jvFuB0oGCPOEH4aBleJ6u+lvNu1RvJZ8WdISZdAuJbmPMn
 eg5IL6ZUfCRSgQtEERYUzRrtI2XnB/KRIWlJvczCflV+VwU6176eM1po8a1grAZAH1+X
 LFyXRldSq24UJONUw4t3d0BOJYc7Lq92Ge7+5YgghLI/DLoZn7EROplJf5EyEA4UPavP
 Ur02WGZhn1ZT1ZNKwyQSL1R0si5JhYqnDkHBIof7kJHBMXYplpfMZ6nF5/Egmkr6n9j4
 /Djg==
X-Gm-Message-State: AOJu0YyykLsXjP0zi8kQpzFuP483eCECNuKx4lw0P7L5ZjGH3/okpMG8
 vEbb99UIOSGno1qxHYhzKd2Z0bv68DjC2aspO0TlgY/+RFc4bCJwxfB6BDHQbMqtrwcohHm5dGi
 p2pc=
X-Google-Smtp-Source: AGHT+IHcyyaa4S6tviusbI+k3x61zUytVm+pUjpOAgC5ys+orzY/nvMIiDROtxHnK88fomWlwQayXQ==
X-Received: by 2002:aa7:d314:0:b0:565:78ff:f066 with SMTP id
 p20-20020aa7d314000000b0056578fff066mr9471511edq.5.1709051430356; 
 Tue, 27 Feb 2024 08:30:30 -0800 (PST)
Received: from dario-ThinkPad-T14s-Gen-2i..
 ([2001:b07:6474:ebbf:e567:9129:29c8:388f])
 by smtp.gmail.com with ESMTPSA id
 p16-20020a056402045000b0055edfb81384sm898404edw.60.2024.02.27.08.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Feb 2024 08:30:30 -0800 (PST)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Tue, 27 Feb 2024 17:30:04 +0100
Message-ID: <20240227163019.2876942-3-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
References: <20240227163019.2876942-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1709051431; x=1709656231;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wECPWhW1zoUwEYbDf+8pXLp9fMG95JWQuFsDvL0KuYQ=;
 b=DuFw7YQ12plIcc/WTfL5evJoNjtMeh7nloKc/DZYgJPFd8dz+rv2yxen+/MxB21JGD
 H/agdZTkTl5K/fS3nD/qV5xWvefnhSfQ98kqQs//hM7ebFb/9ljWAo6M+g5SyIB0hJHz
 mokZ9dP664ZDU2Hc4sXjnwI32iqhvixWa/BBY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=amarulasolutions.com header.i=@amarulasolutions.com
 header.a=rsa-sha256 header.s=google header.b=DuFw7YQ1
Subject: [Buildroot] [PATCH v7 02/17] configs/ti_am64x_sk_defconfig: fix
 BR2_TARGET_OPTEE_OS_PLATFORM setting
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
Cc: Dario Binacchi <dario.binacchi@amarulasolutions.com>,
 michael@amarulasolutions.com, linux-amarula@amarulasolutions.com,
 Asaf Kahlon <asafka7@gmail.com>, Xuanhao Shi <X15000177@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@smile.fr>, Andreas Dannenberg <dannenberg@ti.com>,
 Alexander Sverdlin <alexander.sverdlin@gmail.com>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Using PLATFORM=k3 can leads to a runtime boot crash on some K3 SoC (e.g.
j721e) because the optee flavor is missing.

We could use BR2_TARGET_OPTEE_OS_PLATFORM=k3 and
BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR=am64x but we actually can use
BR2_TARGET_OPTEE_OS_PLATFORM=k3-am64x as explained in the optee-os
Makefile [1]:

  # If $(PLATFORM) is defined and contains a hyphen, parse it as
  # $(PLATFORM)-$(PLATFORM_FLAVOR) for convenience

This is how meta-ti set the optee-os platform:

  meta-ti]$ git grep OPTEEMACHINE
  meta-ti-bsp/conf/machine/am437x-hs-evm.conf:OPTEEMACHINE = "ti-am43xx"
  meta-ti-bsp/conf/machine/am57xx-hs-evm.conf:OPTEEMACHINE = "ti-am57xx"
  meta-ti-bsp/conf/machine/beagleplay.conf:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/dra7xx-hs-evm.conf:OPTEEMACHINE = "ti-dra7xx"
  meta-ti-bsp/conf/machine/include/am62axx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62pxx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am62xx.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/am64xx.inc:OPTEEMACHINE = "k3-am64x"
  meta-ti-bsp/conf/machine/include/am65xx.inc:OPTEEMACHINE = "k3-am65x"
  meta-ti-bsp/conf/machine/include/j7200.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721e.inc:OPTEEMACHINE = "k3-j721e"
  meta-ti-bsp/conf/machine/include/j721s2.inc:OPTEEMACHINE = "k3-j784s4"
  meta-ti-bsp/conf/machine/include/j722s.inc:OPTEEMACHINE = "k3-am62x"
  meta-ti-bsp/conf/machine/include/j784s4.inc:OPTEEMACHINE = "k3-j784s4"

  meta-ti uses the OPTEEMACHINE to set optee-os platform [2].

[1] https://github.com/OP-TEE/optee_os/blob/4.0.0/Makefile#L37
[2] https://git.yoctoproject.org/meta-arm/tree/meta-arm/recipes-security/optee/optee-os.inc?h=4.0.3#n23

Suggested-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Changes in v6:
- Update commit message

Changes in v5:
- Drop BR2_TARGET_OPTEE_OS_PLATFORM_FLAVOR option

Added in v4

 configs/ti_am64x_sk_defconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 4bfd31f0c8d3..097175bd8f39 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -21,7 +21,7 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="k3"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_TARGET_BOARD="lite"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL32_OPTEE=y
 BR2_TARGET_OPTEE_OS=y
-BR2_TARGET_OPTEE_OS_PLATFORM="k3"
+BR2_TARGET_OPTEE_OS_PLATFORM="k3-am64x"
 BR2_TARGET_TI_K3_IMAGE_GEN=y
 BR2_TARGET_TI_K3_IMAGE_GEN_SOC_AM64X=y
 BR2_TARGET_TI_K3_R5_LOADER=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
