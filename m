Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5ACC433F5
	for <buildroot@archiver.kernel.org>; Wed,  8 Dec 2021 21:29:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C6C681775;
	Wed,  8 Dec 2021 21:29:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Kcwk6TQtNi3G; Wed,  8 Dec 2021 21:29:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 902AA8105C;
	Wed,  8 Dec 2021 21:29:15 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C6D271BF38E
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 21:29:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C3915403AC
 for <buildroot@lists.busybox.net>; Wed,  8 Dec 2021 21:29:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cTSXAzceVL_w for <buildroot@lists.busybox.net>;
 Wed,  8 Dec 2021 21:29:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ua1-x92f.google.com (mail-ua1-x92f.google.com
 [IPv6:2607:f8b0:4864:20::92f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A8C0940331
 for <buildroot@buildroot.org>; Wed,  8 Dec 2021 21:29:11 +0000 (UTC)
Received: by mail-ua1-x92f.google.com with SMTP id y5so7170931ual.7
 for <buildroot@buildroot.org>; Wed, 08 Dec 2021 13:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kExU2Vxub79cqfQg2nkZxtD7kjMFF0hq34Lu808T//4=;
 b=ayIYs6IJwno6yTqhvR68LPRKTaKTxOJVJ3UAU4qsVyPKDXWUmyMNVep7MmWLhdtAu+
 zgF3fAGfVNFiLGplt8Lp3Kj94Nf5nyWaFP/23sq60Egzz7VeSLrNLDJolkCso2Dj7U0n
 XaugmtM+Peuci+iiqfxqnzC2iRy+yJ/6UsSz7qR4PSvdvfMRDu0or6PfOL3T6DPW94oS
 st9XRpRpewFzDTXMQ0L+jZztwK8mu/yK0+jqaL7iBJVwfFKRfvzXrh6GDOo52BpSImuK
 ATEY6oauMrub28Og2WFNb8rLoI7B2/4VG3DuYPLMK9PxhW4WFCAkyGRuLcejrqvNJ6Nj
 MW5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=kExU2Vxub79cqfQg2nkZxtD7kjMFF0hq34Lu808T//4=;
 b=Zx6Q7y6eSsRI9wbSev49fIt0bELi1r4ZKWdpk1TK1axK2vhkovNejz7pf/ON2Pi7/j
 NwdlMlTFmxLKcY2uEc4kGXGNm+46Qp9q2n32ipcWTU0ljg7clX/VnLdOvC1JOCEnx8ho
 eGTCWwuddXvA9uPY+2JXACYbU8zCSiFOX9T1vkzS53n7S9gDELVab2TV0bul4yzinyg5
 Yr60wjNsE20l3Hx0CMDeCfx49BY+4pDWdhstmq4oMDRRFt6yE16pvTbgTqs0rhyTwjHA
 JWaYlS47xMwuIIJ56mC4EwydHHKqTrGKXDUvcuYIKg6J+gJl8g1TxBjUZszApprcKqmV
 OKxg==
X-Gm-Message-State: AOAM533659Tmt57/XaDCXB79Jr91tzjxZmRw955WQvb8MYHT0dtUK3UT
 /gKuJ3HMfb+JR5OnWUb/c90Q6+7eqOc=
X-Google-Smtp-Source: ABdhPJzPJk59oJWY6IuCLTrdH/qpYroeFInwgWssbUmRDr810y7WxRSN+NUlEBcqOMKrhIesTvyEtA==
X-Received: by 2002:a05:6102:e8e:: with SMTP id
 l14mr1640855vst.80.1638998950104; 
 Wed, 08 Dec 2021 13:29:10 -0800 (PST)
Received: from localhost.localdomain ([2804:14c:485:504a:c3e6:fc47:f272:572b])
 by smtp.gmail.com with ESMTPSA id
 j17sm2566140vkp.27.2021.12.08.13.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Dec 2021 13:29:09 -0800 (PST)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  8 Dec 2021 18:29:01 -0300
Message-Id: <20211208212901.2323564-1-festevam@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/mx6udoo: bump the kernel version
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

Bump the kernel version to 5.10.84.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/mx6udoo_defconfig | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/configs/mx6udoo_defconfig b/configs/mx6udoo_defconfig
index 60436e8616c1..5092ef0fd148 100644
--- a/configs/mx6udoo_defconfig
+++ b/configs/mx6udoo_defconfig
@@ -4,8 +4,8 @@ BR2_ARM_ENABLE_NEON=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_FPU_VFPV3=y
 BR2_GLOBAL_PATCH_DIR="board/udoo/mx6qdl/patches"
-# Linux headers same as kernel, a 5.8 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_8=y
+# Linux headers same as kernel, a 5.10 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc1"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/udoo/common/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/freescale/common/imx/post-image.sh"
@@ -20,7 +20,7 @@ BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="SPL"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.8.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.84"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6q-udoo imx6dl-udoo"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
