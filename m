Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EC5AC433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 08:12:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F155D60A88;
	Mon, 31 Jan 2022 08:12:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id c9xOMZbfQ4i4; Mon, 31 Jan 2022 08:12:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 23BD860BEF;
	Mon, 31 Jan 2022 08:12:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9BEB11BF313
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 08:12:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8AE3940909
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 08:12:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bd4h1l1ywEcm for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 08:12:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D7A92408F8
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 08:12:19 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id i34so4808493lfv.2
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 00:12:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/BkM9YfXhsyN7CPC6TAKNijjzxRenFfqjhfLg5niYx4=;
 b=kVbvJKd9MoWf2YmN2t0tkf3XlLLLFlwY4NK/yInoliuZNcgZAWL9XLhX1GNd8veVel
 3E2O2Sj18Kr4xsaq6lCeGgqMqPAGfANoD3KeYHET2LrkmwaKjv0azKB68HlA6rf8F0Hp
 AQnDfI6wTtcVJjzuwiSdOsKdWaC3hN169uAnnVsaCpKOHh60MRFPA+QgLjot5HN/1Gkm
 QX6PFl18Y2xQ4dZ/UfXemA3NQgvNd8nj5OZNXdqU5iOqR4oMrPaBNUIK84glyHoWbLqV
 fLSVlD5Tjo9CIXIcscUnxWQiuCjsOe3si7ljyuxldq6Uycm2lbeV8yHBQDHj9CJXyxdQ
 b/zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/BkM9YfXhsyN7CPC6TAKNijjzxRenFfqjhfLg5niYx4=;
 b=icN3Q0/3TLz1PAn8BJzfoxGfSgO1mJHl/KhZa8tk9pxQWlc/9O8ZH5A7aZoOqfuFQz
 S4ChyjaP/wSZLS5rcXtRi6YQgYQIdamqDcm61EDj43Tv2NagSw0R/O/hHfNkl/qjfm+6
 qG5p+nysL5sYXiqVhhz2fZtrkPPFjb1QwqBT2fQzUCTVQVaEsmfmx7wLEWsZpWRIt9Le
 F2ZWFi8IWCE6FwHPB86CVjaaykByH8FCJ9ZJ19vzEToK/7i8jD2mJJYtzeatZ4wV95b1
 ZB/6cF88iwANjGeArfdFM4eyxsreGC8QtSyGvJGTyvDBwJVAHb83vrSxcCd2WPVlxVCM
 HgqQ==
X-Gm-Message-State: AOAM5301nv3W+XcqmRDIR0n057MVhtmQ4FOUWjqFxgD5Znfr5yk5QYYU
 hq9TyLkda4pKzm2j2+JFmOWKJB2FcOI=
X-Google-Smtp-Source: ABdhPJydUKmPgtsIdz0EPahOYiHxZrwEg/eDG3G2lyue2+vOoNsj471ZSuNq7w8dRCiLsdjuAYxkPA==
X-Received: by 2002:a05:6512:441:: with SMTP id
 y1mr14326729lfk.315.1643616737508; 
 Mon, 31 Jan 2022 00:12:17 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id j17sm815095lfu.14.2022.01.31.00.12.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 00:12:17 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 11:12:10 +0300
Message-Id: <20220131081214.12773-2-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131081214.12773-1-geomatsi@gmail.com>
References: <20220131081214.12773-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/5] configs/snps_arc700_axs101: bump kernel and
 u-boot versions
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
 board/synopsys/axs10x/uboot-fragment.config |  1 +
 configs/snps_arc700_axs101_defconfig        | 10 ++++++----
 2 files changed, 7 insertions(+), 4 deletions(-)
 create mode 100644 board/synopsys/axs10x/uboot-fragment.config

diff --git a/board/synopsys/axs10x/uboot-fragment.config b/board/synopsys/axs10x/uboot-fragment.config
new file mode 100644
index 0000000000..92fe20f463
--- /dev/null
+++ b/board/synopsys/axs10x/uboot-fragment.config
@@ -0,0 +1 @@
+CONFIG_SYS_MALLOC_F_LEN=0x0500
diff --git a/configs/snps_arc700_axs101_defconfig b/configs/snps_arc700_axs101_defconfig
index 080250e92b..3a6bd5c0d3 100644
--- a/configs/snps_arc700_axs101_defconfig
+++ b/configs/snps_arc700_axs101_defconfig
@@ -8,13 +8,13 @@ BR2_TARGET_ROOTFS_INITRAMFS=y
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
 BR2_LINUX_KERNEL_DEFCONFIG="axs101"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -22,6 +22,8 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="axs101"
+BR2_TARGET_UBOOT_CONFIG_FRAGMENT_FILES="board/synopsys/axs10x/uboot-fragment.config"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
