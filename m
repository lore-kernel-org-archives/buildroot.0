Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F1D2C433EF
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 08:12:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14A2E60BCD;
	Mon, 31 Jan 2022 08:12:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIBnz0Wb7Ny8; Mon, 31 Jan 2022 08:12:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4ADBF60D68;
	Mon, 31 Jan 2022 08:12:45 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 125D21BF313
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 08:12:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 012B560BA3
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 08:12:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2X6lnyaWGdvJ for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 08:12:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 53F4060A88
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 08:12:20 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id z20so18270917ljo.6
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 00:12:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WYx47NaoWmRjs4bDrQYKU0ygImdbnYHx1YTC5M6Q+qA=;
 b=oyKEUlWceZTA168eE7QKDOZVGuV32vii0tFb3xP4gRd8KhLV+Mzl9D16/MrXbh9scK
 zGIq+dEvD0cef24hNrQRCoPo9S18m+UZHBgJ6O40/V3tZmBM4jBrhZRonITNsIPNF5Cp
 +LVxyYxlCCFIv9vCop1pwhmnujCTOQ2KwPb3rq9RU/Lr5dGdKgRGrbeUSxreTeg0OR6M
 ccvZNJHRRJkcGapQ3eaWa5n8PPqS5jzLviQvERDP8aYZMkMAm9UmQ4sjC1wa/J9zK3SO
 xAJBbRb4qtAY+rYNPsFGei3KOKuybPPjB/yXqwyQbDs4IfiSt0BNY4gGiloLzo7+Msti
 +nIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WYx47NaoWmRjs4bDrQYKU0ygImdbnYHx1YTC5M6Q+qA=;
 b=EiT2//7Kn1udAlrOtn+C4J7yBarOVNHCJdmMrW3VXsY4FXYTCW+bWpWpa8LLAf/Inz
 dBo9IN56zdEFuIBSnwC203oIDPu7HjvOk8NuVwFN9q7hpn7UdKqpXK/QX5OtEA+BKb+C
 zBUIafdnVD1LVhxJSbn/1OqXu0ZI8/orYUEH3/5ZSsOwgru1LJ1X/4SdeolEycXZL7EY
 xjQd1nHiX2WcwcH/jMAiPRL8QyzgtMrOGqd8oZZrUJ1F4tCU9tGhacPmnYx/zUbL/LbW
 lFe45haQX0e4iW4cojFoa86zdEkTKrssTPOCKfW9KN484CGLYQpQUKEmFZi/PD3GRtgS
 S94g==
X-Gm-Message-State: AOAM533eJKM3ngDVMGrScjwNk7C86DVoyMAyyNQXr81OfhbSgmcJFYhe
 7QwxhmG7LQCPjbzXgbPtLgCm8fgPU1g=
X-Google-Smtp-Source: ABdhPJysPFFEStw1CPf1gKfztuB+DXms+DFy8cKA5Zf3ZbZCRJ4kVWeTXUfNzu4XV0qM4pxbNWRH3A==
X-Received: by 2002:a2e:874a:: with SMTP id q10mr12658975ljj.169.1643616738211; 
 Mon, 31 Jan 2022 00:12:18 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id j17sm815095lfu.14.2022.01.31.00.12.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 00:12:17 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 11:12:11 +0300
Message-Id: <20220131081214.12773-3-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131081214.12773-1-geomatsi@gmail.com>
References: <20220131081214.12773-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/5] configs/snps_archs32_axs103: bump kernel
 and u-boot versions
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
Cc: Joao Pinto <jpinto@synopsys.com>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Sergey Matyukevich <sergey.matyukevich@synopsys.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Sergey Matyukevich <sergey.matyukevich@synopsys.com>

Bump versions:
- use U-Boot 2022.01
- use Linux kernel v5.16

Add U-Boot configuration fragment increasing early malloc pool size.

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 configs/snps_archs38_axs103_defconfig | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/configs/snps_archs38_axs103_defconfig b/configs/snps_archs38_axs103_defconfig
index c5847809ba..2002520d1b 100644
--- a/configs/snps_archs38_axs103_defconfig
+++ b/configs/snps_archs38_axs103_defconfig
@@ -9,13 +9,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/synopsys/axs10x/post-build.sh"
 
-# Linux headers same as kernel, a 5.6 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+# Linux headers same as kernel, a 5.16 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
 BR2_LINUX_KERNEL_DEFCONFIG="axs103_smp"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -23,6 +23,8 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs103"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/synopsys/axs10x/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
