Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BF20CD1288
	for <buildroot@archiver.kernel.org>; Sat, 30 Mar 2024 16:03:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D22938237F;
	Sat, 30 Mar 2024 16:03:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Bj4GtxD1wlLi; Sat, 30 Mar 2024 16:03:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1ACF982386
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1ACF982386;
	Sat, 30 Mar 2024 16:03:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4E3A51BF3DF
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:03:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 43DD58228A
 for <buildroot@lists.busybox.net>; Sat, 30 Mar 2024 16:03:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Wdol59fCl6L for <buildroot@lists.busybox.net>;
 Sat, 30 Mar 2024 16:03:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::132; helo=mail-lf1-x132.google.com;
 envelope-from=dario.binacchi@amarulasolutions.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 19F04822EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 19F04822EE
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 19F04822EE
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 16:03:06 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-513e10a4083so3253179e87.1
 for <buildroot@buildroot.org>; Sat, 30 Mar 2024 09:03:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711814584; x=1712419384;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n+3SWr47v51ZAM0KYqCPrdVViq1f+5/r+XqUK2tVNLY=;
 b=Es/cPD718pPBLemo7wFsBjx2FqTCuQUZpvOnw3Z4MKUVeJqbwB3HZIPX/DnonmWjk+
 UY5Z5/7PWAVCQm3FagarXqsXQd5VDpunv3Yshfo9tXAS+hXP5T1S6WI00DUWqyagDOHL
 7YweOHu8D0qvfM4YJTNWBQ6qC5XVf1py/EL16uHhS1Pz9UUiDUxn41iHh9bcoS+j0Ekv
 OmlHtBY3bldRbzsM/vKsq2Stru3vxzAFyDsvyPRzsk4W7RgmA1yftZ7ZgwrPDVC1RiRb
 UwRGxS9e+Q6169jmt1QSu994y2EQDWeG26co0ytOs0X9rurrYF93JOHvWjO7H/LdBJfH
 0gvA==
X-Gm-Message-State: AOJu0YxqZaNRnd8lc/MOZ+NVPakV28RN9K0RzVXWFgSRVf9xru32mqOP
 CRDllreunyFLxeG472BjM7LhEytJ4cIRttx/L8TQTghqPYtD9fP2Ma3jKAVtxiYyLbsa1IAvOW8
 AG2g=
X-Google-Smtp-Source: AGHT+IF/aDlzjk8B7ftVSm3WxYkrlVncxgm3ZnyB1Ka7VRUbxtCHnGGv99E/7BE3LzqVUEFu05eutg==
X-Received: by 2002:ac2:51bb:0:b0:516:a320:3fb9 with SMTP id
 f27-20020ac251bb000000b00516a3203fb9mr309340lfk.56.1711814583992; 
 Sat, 30 Mar 2024 09:03:03 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.homenet.telecomitalia.it
 (host-87-8-99-67.retail.telecomitalia.it. [87.8.99.67])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a056402004d00b0056c633354c6sm2127107edu.45.2024.03.30.09.03.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Mar 2024 09:03:03 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Sat, 30 Mar 2024 17:02:44 +0100
Message-ID: <20240330160244.3214733-13-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
References: <20240330160244.3214733-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1711814584; x=1712419384;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=n+3SWr47v51ZAM0KYqCPrdVViq1f+5/r+XqUK2tVNLY=;
 b=FhduUSfOjp+ScRNm3aapsA6zWPxk4jnk2veq/FdY94emVt0HSsUzzXrmB6ylyy6ls5
 lXmQl+Nkl9oxQFGKbJvqNyrs4MSckwkFdT0PvZEqg5Grimnd9pAZOypCasfi76h/k/G9
 voloc678pb7KJnrIws6U7cIn4UYpVpgqfQdaM=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=amarulasolutions.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FhduUSfO
Subject: [Buildroot] [PATCH v10 12/12] configs/ti_am64x_sk_defconfig: bump
 Linux version to 6.6.18
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
 Alexander Sverdlin <alexander.sverdlin@gmail.com>,
 "Yann E . Morin" <yann.morin.1998@free.fr>, bryce@redpinelabs.com,
 Anand Gadiyar <gadiyar@ti.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

Added in v8

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
---
 configs/ti_am64x_sk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/ti_am64x_sk_defconfig b/configs/ti_am64x_sk_defconfig
index 9b92b645dd21..6c1b5d824a7d 100644
--- a/configs/ti_am64x_sk_defconfig
+++ b/configs/ti_am64x_sk_defconfig
@@ -1,11 +1,11 @@
 BR2_aarch64=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_4=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/common/am6xx/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/ti/common/am6xx/post-image.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c ttyS2,115200n8 -d k3-am642-sk.dtb -l am64x-sk-buildroot -r /dev/mmcblk1p2 -x earlycon=ns16550a,mmio32,0x02800000"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.4.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.18"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/k3-am642-sk"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
