Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8076EB64DD
	for <buildroot@archiver.kernel.org>; Thu, 27 Jul 2023 22:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 444D241FF9;
	Thu, 27 Jul 2023 22:26:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 444D241FF9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G4hsvaDAuSU3; Thu, 27 Jul 2023 22:26:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 129D54200C;
	Thu, 27 Jul 2023 22:26:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 129D54200C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2546E1BF3D4
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F2D9784070
 for <buildroot@lists.busybox.net>; Thu, 27 Jul 2023 22:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F2D9784070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XQoRY4KKN-8X for <buildroot@lists.busybox.net>;
 Thu, 27 Jul 2023 22:25:53 +0000 (UTC)
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 1AAB88406A
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 22:25:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1AAB88406A
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-3fbc244d384so15965975e9.0
 for <buildroot@buildroot.org>; Thu, 27 Jul 2023 15:25:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690496751; x=1691101551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h8topF0OWgh7Gz00GUTA8JeQVt7wrQzmWC8PfhS5spM=;
 b=ji1pmC2zcKqvl/m5yOCRVRkZsoSS40RrDP0UmfS9uEJXBkndfHiYCosYi33HxuTOv7
 oZ/PDIKYMDUfFgSqwAV5Nrst/roslUe0JXi7hmepUU1FW8WFIA/eCmtXE1jG+FjsgW9l
 wRESNuQ0FjhRoeFC49nlBBYnm9oWxzm5Q20bYoldNuRx7upTfniICu0p5xHzXMX4lCsz
 nMFkQTp9ajjVp6nIPOaUvditdETg95Xd49zwtL9oUbWo/kaWBJEWf/r4pKRlHlH3lqgK
 n1Qe9iuKfzCKgHZ0M7L0D804umaCLWjTXcF31dg8rVdGZolkHvgdspXL9lm83L2xRte4
 DTMg==
X-Gm-Message-State: ABy/qLZ1+wr7w09N7AAjkAxBPHHUlQsuYDlBe7zC8x04bKnRMCifvET6
 OpJgZ/z7p6j7zZOXSnc3Nm3LFkMUAlY=
X-Google-Smtp-Source: APBJJlF7miwrtI8IURfJGaROwv1cvLrcblpLSgnD1dds4wlRqcsls53TgpL0kVxu7DFJSxeNNb+ALQ==
X-Received: by 2002:a05:600c:a388:b0:3fb:b008:1ff6 with SMTP id
 hn8-20020a05600ca38800b003fbb0081ff6mr296207wmb.0.1690496751177; 
 Thu, 27 Jul 2023 15:25:51 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e00eeca726b991c1980.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:eeca:726b:991c:1980])
 by smtp.gmail.com with ESMTPSA id
 s18-20020a5d5112000000b00313e59cb371sm3218163wrt.12.2023.07.27.15.25.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 15:25:50 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 28 Jul 2023 00:25:42 +0200
Message-ID: <20230727222544.196562-6-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230727222544.196562-1-romain.naour@gmail.com>
References: <20230727222544.196562-1-romain.naour@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1690496751; x=1691101551;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h8topF0OWgh7Gz00GUTA8JeQVt7wrQzmWC8PfhS5spM=;
 b=BTMiS+CfjfgETTvRnIMzhZqLn/l6iBZmCpPV+Yfs8jQop/7AFU0by7ViMUvKYoPkXS
 5uCar07wKkdbxDjFIm3UuJRBy4OWw8RDBMUagIaaGP2m1T58NxlBgBmbEYWZu7y4uzaj
 DSMN6VkCchxGrm+MkbZLeES6iZ11DdO7Sgji3EkfADPuUILleHE0HcKYEUvj7ie32nzb
 kLEGV3s/XTACW9KjLdes0b/VKfrRFHizMZV4V3lmP7wkhipCDbdtSWWGk568wKriWs7q
 hLMZBOQ9GdU8Csk9l12X1daJeXr2eQh9Ss8DoL6HZ+rBTWa0LrKsERUx6hmJBnLRG2FM
 fn5Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=BTMiS+Cf
Subject: [Buildroot] [PATCH v2 6/8] configs: remove qemu_sparc_ss10_defconfig
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since gcc 11 [1] the sparc architecture is disabled since
it produce a non working image. Buildroot now provide gcc
13.x, 12.x and 11.x and we are going to remove gcc 10
that was the last working release (thanks to a local patch).

First remove qemu_sparc_ss10_defconfig since it will no longer
be possible to build it with the internal toolchain backend.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
v2: remove this defconfig
---
 configs/qemu_sparc_ss10_defconfig | 28 ----------------------------
 1 file changed, 28 deletions(-)
 delete mode 100644 configs/qemu_sparc_ss10_defconfig

diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
deleted file mode 100644
index 7d1a424eef..0000000000
--- a/configs/qemu_sparc_ss10_defconfig
+++ /dev/null
@@ -1,28 +0,0 @@
-# Architecture
-BR2_sparc=y
-BR2_sparc_v8=y
-
-# System
-BR2_SYSTEM_DHCP="eth0"
-
-# Filesystem
-BR2_TARGET_ROOTFS_EXT2=y
-# BR2_TARGET_ROOTFS_TAR is not set
-
-# Image
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
-
-# Linux headers same as kernel
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
-
-# Linux kernel
-BR2_LINUX_KERNEL=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.26"
-BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
-BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
-
-# host-qemu for gitlab testing
-BR2_PACKAGE_HOST_QEMU=y
-BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
