Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD7A9C77B61
	for <buildroot@archiver.kernel.org>; Mon, 10 Apr 2023 17:50:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 30ABD417E5;
	Mon, 10 Apr 2023 17:50:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30ABD417E5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ks0wPPCEpEEw; Mon, 10 Apr 2023 17:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 22C244175F;
	Mon, 10 Apr 2023 17:50:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 22C244175F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0A8421BF3DA
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3D8F409FE
 for <buildroot@lists.busybox.net>; Mon, 10 Apr 2023 17:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3D8F409FE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MVE5GA1_Ud80 for <buildroot@lists.busybox.net>;
 Mon, 10 Apr 2023 17:50:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E595E40074
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E595E40074
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 17:50:26 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id n22so4210793ljq.8
 for <buildroot@buildroot.org>; Mon, 10 Apr 2023 10:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681149024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6psA8MSfVWPG1JErdyI2HGjn1seJ3gntGrPQ8ehb62w=;
 b=17Flgl2+qv5ga7tob6te8v9E77xwenMYL/ylLGYQ1Q5vNZXZJoqs+w/3TmGHP4t912
 F3k/7aiEFEdkP8clNSUVkh99IijXD9C7TjwecXJmjeRnqb20hU2xxrnM/WzLJJGG8son
 QikkIIX0jK5B2l8F7ClmNoH9lxmPsDzsDpMOEqn9ox6SSwbOk1uaqsDrDmeb8ZoCMbAO
 0lNvvj0nE5XYSlYEM38Wav+JpHDhmagbk4Oj6Zqa6Ne2uBKKgsqM3Qwi4/+awOel7tSH
 CWXwVq+X+wIY48nB3Seo/c2RoWR+2pAsjpzzyf0N4pan31nhbl49Mo6zhBlIQxLYC+pn
 s8GA==
X-Gm-Message-State: AAQBX9fH0PZFduZhonhDg64QRUXI2CSsyhjU05NxZxju0jXlbA7pDJhq
 Yj8e2OWQbpkGOHWbyTXLI1FtaQKb1S8cyA==
X-Google-Smtp-Source: AKy350bhb8o60+kMm0T6Of3XOj3O4SB6LBik+RTiM5ge2Yu65EogFq2LfDEyFX3xcIy/zS7OWqvh4A==
X-Received: by 2002:a2e:838b:0:b0:299:5d3a:4f29 with SMTP id
 x11-20020a2e838b000000b002995d3a4f29mr2729506ljg.31.1681149024476; 
 Mon, 10 Apr 2023 10:50:24 -0700 (PDT)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 a8-20020a2e9808000000b00295b842c2dbsm2343994ljj.133.2023.04.10.10.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Apr 2023 10:50:23 -0700 (PDT)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 10 Apr 2023 20:50:17 +0300
Message-Id: <20230410175018.2283807-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.40.0
In-Reply-To: <20230410175018.2283807-1-geomatsi@gmail.com>
References: <20230410175018.2283807-1-geomatsi@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1681149024;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6psA8MSfVWPG1JErdyI2HGjn1seJ3gntGrPQ8ehb62w=;
 b=HmVtFZ5xWiRQoKHCnamGjtH4d9RyF4drmuvN+kqsyF1wZaQiwAKokJvDzj8hY9xFDK
 h4ac/KCKZqPn0CBwU4tFLvY6YVuRAYH9En4glD6qHC2kXSyScoBvkJLK0cEV80kNQ+U5
 9D7NqApnIAIn1NgWsH8E0V+nzqynTxxz+fss4ekeB0olaynM2w77ty3zbypzXhM3qdrH
 C6zZtkzQE6ZZttaXHoUxdp9Crzhbh6gLlKz5lGDqOaHu4sdQ/3AlqAB1/WwySaH0vjx1
 BBVg09zucSd65xsM9Q6V9kJHKZCKQUaWp+l/lf9xrmTiGYjbTOeog8lz4HZ8/AvqKXRV
 FwwQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=HmVtFZ5x
Subject: [Buildroot] [PATCH 2/3] configs/orangepi_zero: bump BSP versions
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

Bump Linux to 6.1.14 and U-Boot to 2023.01

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/orangepi_zero_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/orangepi_zero_defconfig b/configs/orangepi_zero_defconfig
index 464e075e5c..40269db233 100644
--- a/configs/orangepi_zero_defconfig
+++ b/configs/orangepi_zero_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Zero"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Zero"
 BR2_GLOBAL_PATCH_DIR="board/orangepi/orangepi-zero/patches"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 BR2_SYSTEM_DHCP="eth0"
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.16"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.14"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun8i-h2-plus-orangepi-zero"
@@ -31,7 +31,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_zero"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
