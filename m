Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C6DAC76196
	for <buildroot@archiver.kernel.org>; Sat,  1 Apr 2023 17:37:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0AD6E41B93;
	Sat,  1 Apr 2023 17:37:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0AD6E41B93
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PsWek_WhztM7; Sat,  1 Apr 2023 17:37:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E1EB341C26;
	Sat,  1 Apr 2023 17:37:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1EB341C26
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9F2981BF318
 for <buildroot@lists.busybox.net>; Sat,  1 Apr 2023 17:37:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AC7341B6F
 for <buildroot@lists.busybox.net>; Sat,  1 Apr 2023 17:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7AC7341B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BfeZPWOxx_SZ for <buildroot@lists.busybox.net>;
 Sat,  1 Apr 2023 17:37:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 101DF41B93
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 101DF41B93
 for <buildroot@buildroot.org>; Sat,  1 Apr 2023 17:37:09 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id x17so32948504lfu.5
 for <buildroot@buildroot.org>; Sat, 01 Apr 2023 10:37:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680370627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i6VsH4a31QoT4RL7t61zfFgktirGLRjUUZg1SbCXw6w=;
 b=zXpIyD7jRZtFybdaoILniIb5Hlt1RbjmZTeLXAgRQ+cd1ohL3owApFqHO9ZwyfAwZK
 +X/eu0zix3EwOMiM5LD3KAuzGpUNQHIt0O84nICeAPL4FIspj4MJog1WwV0YWbXyucwN
 Q601xinR8nCVWq9kl7Llai4Lu40i1kFZv2J26g+j64mzqJjWpDyTJvOw3gOFfqMiS/PP
 dOHfUKEyP73IwXCYLptIrQfYccIzeLenTwiacA+QZBQqlu88Vj95rKt6TU+EJ/JRQTXD
 A6KJGu4k38YOrHqHeuLh96FP4T53fFeadkOj7GvQ+tSphbimagoKLRVApjErp06uUzJF
 P73g==
X-Gm-Message-State: AAQBX9fiFnvBdFMkg/LWygXZ6BmTKmxszqrj9K+6yguA58fJMN8qbYe8
 sbErWEr/ggPbNy690PMJZIRxdaOT80mW3w7Z
X-Google-Smtp-Source: AKy350Zb0xyy3o1nRb85gpdfqQiJHMFApcCzeCJfjQQ8mR6TeCyljBnbL6gT5YOmr+aYszQjPkzCOA==
X-Received: by 2002:ac2:5519:0:b0:4ea:f6f2:7a81 with SMTP id
 j25-20020ac25519000000b004eaf6f27a81mr8925599lfk.67.1680370627313; 
 Sat, 01 Apr 2023 10:37:07 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 v5-20020a056512048500b004e8451948desm892056lfq.227.2023.04.01.10.37.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 10:37:06 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  1 Apr 2023 20:37:00 +0300
Message-Id: <20230401173700.3341224-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230401173700.3341224-1-geomatsi@gmail.com>
References: <20230401173700.3341224-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1680370627;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i6VsH4a31QoT4RL7t61zfFgktirGLRjUUZg1SbCXw6w=;
 b=IsR9hlupOowl2vn4BzQ2zY5fioUxR3aHMPbhqOAtg90TU7W8ctolhOD9NlMLcesx9q
 5tE8ItxTEykjP2Fh7Tyy53Xeqq5Uvwu38udfqC19YMy4RbnCt/7nHCAjlE0U/g4i3mvh
 9CkrNGag7KvM6ecXEJXMY0l4HAxF6YdQ4WcPbJP5Sl6GgwoWtqBdegmJ6Mr85fI7tJp9
 KXenjd2DMB2VrgTcD9topwlwkK7/7JM2mUarSIFZ5Nz9CUsAoP6Eru9L2MdGlSvQ8ZDc
 O0IXrdf0ptO7lxYP4yNtcFrmmBCIAQkNkks1LnnV8WTxxFvhm9mYIfKSIJ5KmrnWlSuc
 H26Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IsR9hlup
Subject: [Buildroot] [PATCH 3/3] configs/orangepi_pc_plus: bump BSP versions
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump Linux to 6.1.14 and U-Boot to 2023.01.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_pc_plus_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/orangepi_pc_plus_defconfig b/configs/orangepi_pc_plus_defconfig
index ba946e5285..73ba934b69 100644
--- a/configs/orangepi_pc_plus_defconfig
+++ b/configs/orangepi_pc_plus_defconfig
@@ -2,13 +2,13 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_12=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_PC_Plus"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi PC Plus"
 BR2_SYSTEM_DHCP="eth0"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.12.2"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h3-orangepi-pc-plus"
@@ -21,7 +21,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.04"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_pc_plus"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
