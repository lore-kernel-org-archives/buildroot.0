Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A10AC6FD1C
	for <buildroot@archiver.kernel.org>; Thu, 23 Mar 2023 13:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 818A141E7E;
	Thu, 23 Mar 2023 13:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 818A141E7E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lDjSPF3172yV; Thu, 23 Mar 2023 13:15:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 917EB41E89;
	Thu, 23 Mar 2023 13:15:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 917EB41E89
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A398B1BF291
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 13:15:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 858E241E8D
 for <buildroot@lists.busybox.net>; Thu, 23 Mar 2023 13:15:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 858E241E8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9yxxLuATLlh2 for <buildroot@lists.busybox.net>;
 Thu, 23 Mar 2023 13:15:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDB5C41E89
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDB5C41E89
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 13:15:42 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 x8-20020a9d3788000000b0069f922cd5ceso3659068otb.12
 for <buildroot@buildroot.org>; Thu, 23 Mar 2023 06:15:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679577341; x=1682169341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=10VDjdDPrezrEq8vf9OUdRpFhJK1/hCzgNcaseJ7XeA=;
 b=zxB/ETwfzr9j79wiTpWB0BrB4Uk6q4nxiP14ucADNmEOkY51LxUb8sfR6uFbOvzPyo
 PjhtSCTQukQX1tfZCYoCLLDAtg9IspYn6mc7m4AgJtsLQGr6ItFo62t6Is9QdLLOQ0/u
 PlLHgo7M0JSkQuBU9CBW5IfsgMCrHvKGHHfTX9HxXyB5cvArE5dPSl4ld1tUzaHXiY7H
 WCIfS0A8JCnDQyKzvzhdUoYz22twmbSwlkrPBOgnqMgHm3oWWuev3Rt615SKzU7oPvOf
 wNGZ5GlXJ6zOH1VNJrUByMy+oZBcGmM7hAi+MZzcxeS2YxRsdiWZ/ML/fpMIW9A/yEIc
 x2Cg==
X-Gm-Message-State: AO0yUKUA9SSoUqtn18I/LS1td8ilrvrkSvhR5Fcj2nFnsgFRRCaNMB+V
 KbJkUVNFkqV7i9oYpissD89KU+t+kWSpsg==
X-Google-Smtp-Source: AK7set95dPrWZ5CBy86OboPw0VutefUpFMAZmnNbMUvlNrYHzGdET/yZADO3cmEqRWPwpGAqDM6CzQ==
X-Received: by 2002:a9d:3b3:0:b0:69f:8ee5:3d60 with SMTP id
 f48-20020a9d03b3000000b0069f8ee53d60mr4413558otf.0.1679577341187; 
 Thu, 23 Mar 2023 06:15:41 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b69:4c56:116d:eccf:8809])
 by smtp.gmail.com with ESMTPSA id
 g13-20020a056830160d00b0069fa35f05aesm1535840otr.28.2023.03.23.06.15.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Mar 2023 06:15:40 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 23 Mar 2023 10:15:36 -0300
Message-Id: <20230323131536.3376306-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679577341; x=1682169341;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=10VDjdDPrezrEq8vf9OUdRpFhJK1/hCzgNcaseJ7XeA=;
 b=KcoHQ3645d9erserYvQBgSZEK93N7k50mGJ80C296cXSh97KdqxaTLciHReMXE3irD
 z4D7/cuv6QFuMpRI3HyQkpESUSgM+cPkTqpSQMS/KJGzZ6y4eUoAidBb5U/TLocduWSD
 kMX9aUXT8OTIBLkn7TfG7gBSWN7FTN+bTCwvQEAWcZCUoveiqxAYOyR4pdLQAY2cQHgZ
 eiX/cTojd+IKBq5PDec7jN+vpgwG0BXMqsMk6lXQtDGscBWEcXq9JZHahjcVbVKYIHkh
 GuulyOzFpIgJ4L8t8rFbSMriFZSSoYbmM2+NXhPW9UQoOyJKe8/DwZ4I82QnZtDYvoxs
 N07A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=KcoHQ364
Subject: [Buildroot] [PATCH] configs/mx53loco: bump U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump to U-Boot 2023.01 and kernel 6.1.20 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx53loco_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/mx53loco_defconfig b/configs/mx53loco_defconfig
index 18785aa0c8d8..212a032d84aa 100644
--- a/configs/mx53loco_defconfig
+++ b/configs/mx53loco_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_cortex_a8=y
 
-# Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx53loco"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.9"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.20"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx53-qsb imx53-qsrb"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
