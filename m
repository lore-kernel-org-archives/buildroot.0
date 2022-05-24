Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31412C433EF
	for <buildroot@archiver.kernel.org>; Tue, 24 May 2022 22:00:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A2ECF61298;
	Tue, 24 May 2022 22:00:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PiU6GSbArpc1; Tue, 24 May 2022 22:00:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF29560E06;
	Tue, 24 May 2022 22:00:24 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 09FA01BF215
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 22:00:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBE00402FE
 for <buildroot@lists.busybox.net>; Tue, 24 May 2022 22:00:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TUs1bza4xfU0 for <buildroot@lists.busybox.net>;
 Tue, 24 May 2022 22:00:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5361C402F6
 for <buildroot@buildroot.org>; Tue, 24 May 2022 22:00:22 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-f18e6ff0f6so23910765fac.11
 for <buildroot@buildroot.org>; Tue, 24 May 2022 15:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Yw0+UBv10oaEO8Vf49p5XAOLZ2BVUZmHQOnfcr3THU=;
 b=R1sLX8O8HU8TTpmDzeV4E1x2VPMAgC8qQ/5AxVL80VlNSQqInmZnCRxaD9PzEgCUSh
 JrLHsbRrP8MV9jtNEZKfnvcWa+p43kMQTDFaxCxC7QaHH0rsg88tbw3OBDVx1r643u9m
 XhtlHX4cYz+HauecpbKJ8kaPTOhluyh551gtk4X9/WAsNrdaw/vchy+3457vCf8JK87p
 yaV1H49fbgDvIKtmaZrFWg46ochP4NsmpRO0hCZlNrdakhn30YqIS42YNEfdFo6CT58I
 O+RSe/nAX/tibbwvlgFfX+NRKXgSAB0mJM2RCjOh/b6UtnIasnH30zd8yBCMKF8zOB4l
 rCFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=5Yw0+UBv10oaEO8Vf49p5XAOLZ2BVUZmHQOnfcr3THU=;
 b=tf8iryqtNklzKQ6VQN1APDLzBOA92SlE0oKpCg7iae0nYW3QTUPFHqPvOWJY49SCbQ
 SIg6FYSMUnpH1rv3lt7uIit5w+srXvc/lLzac0d+c5zzq+JTd1hVi6ZGe7Ld9yDXxB2L
 yGrqDXIdcrG0olHgvzD+XSVWJrYlOwPpG5jRZQPPC9YVbe7IPCzHXs5Z1CKvo9kXRkGC
 UTHT0J0k5zO4b1xC+1M0w/torW1C2gNrm2BSuGhh8/vwx1wGmDYUuDufc/ucx3VttI5i
 Q/T1yhlOJEyMO9j7NKmJBx95FzjRLYBtRiZGU73MhKEPt13e7reBEAOi32MiH4UGgHul
 1u5w==
X-Gm-Message-State: AOAM531ItkHMk2EWEAywN6i0zu8oa/DPj8p+pyHc9J5RWRujEQOZJmvM
 SFiZ9g5QWahrja8KVGqqtnNnkEE47cCVog==
X-Google-Smtp-Source: ABdhPJxxNaFVU5Sd/AhcHihh/0U6aOaW5Wvd4h2Yyrxf0wSo12rzvnRkjBbEcI5rY54FyY4sYzirCA==
X-Received: by 2002:a05:6871:87:b0:da:b3f:3208 with SMTP id
 u7-20020a056871008700b000da0b3f3208mr3869286oaa.184.1653429620953; 
 Tue, 24 May 2022 15:00:20 -0700 (PDT)
Received: from localhost.localdomain ([2804:14c:485:4b69:7038:3d4c:2793:50ad])
 by smtp.gmail.com with ESMTPSA id
 x4-20020a056870740400b000e686d1389dsm5297291oam.55.2022.05.24.15.00.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 24 May 2022 15:00:20 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 24 May 2022 19:00:06 -0300
Message-Id: <20220524220006.906954-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/imx6-sabresd: bump U-Boot and kernel
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

Bump U-Boot to 2022.04 and kernel to 5.15.41 version.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6-sabresd_defconfig     | 4 ++--
 configs/imx6-sabresd_qt5_defconfig | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/imx6-sabresd_defconfig b/configs/imx6-sabresd_defconfig
index 19986f2cbb54..c237c2dc7c5a 100644
--- a/configs/imx6-sabresd_defconfig
+++ b/configs/imx6-sabresd_defconfig
@@ -24,7 +24,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -33,7 +33,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.41"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
diff --git a/configs/imx6-sabresd_qt5_defconfig b/configs/imx6-sabresd_qt5_defconfig
index 38a86131dda3..d962ac6897b2 100644
--- a/configs/imx6-sabresd_qt5_defconfig
+++ b/configs/imx6-sabresd_qt5_defconfig
@@ -30,7 +30,7 @@ BR2_ROOTFS_OVERLAY="board/freescale/imx6-sabresd/rootfs_overlay"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6sabresd"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
@@ -39,7 +39,7 @@ BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.41"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-sabresd imx6dl-sabresd imx6qp-sabresd"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
