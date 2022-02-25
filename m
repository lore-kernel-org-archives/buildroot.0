Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1225C4332F
	for <buildroot@archiver.kernel.org>; Fri, 25 Feb 2022 07:27:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 790DA41685;
	Fri, 25 Feb 2022 07:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id EED0TrNgZAMX; Fri, 25 Feb 2022 07:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8975041681;
	Fri, 25 Feb 2022 07:27:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id BD7511BF354
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACF054167C
 for <buildroot@lists.busybox.net>; Fri, 25 Feb 2022 07:26:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id psi6LB-iKpqc for <buildroot@lists.busybox.net>;
 Fri, 25 Feb 2022 07:26:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0C83D41679
 for <buildroot@buildroot.org>; Fri, 25 Feb 2022 07:26:29 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id d23so7831379lfv.13
 for <buildroot@buildroot.org>; Thu, 24 Feb 2022 23:26:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=KeGPh3Ex0oGej26b/mKrrEF+G2aBv3VYc8c9vtkFLBQ=;
 b=Q1RwhPfIsVUwvbfhOvkEthNIR3qguu7QPADUPskqo5qwjW8XdjRyfIaNZVVj+VB049
 xoyCt81FMma3RXxAYMHArBKL/Ta6CoFiCM03YnLu1q5f15/oa9yLXoC2TuWe1Za+zjfP
 tahm/D7YfDMrMSFton4FIdlQa+69PJwWmNErVWTClg40vhpJgQ4p579wvjiyz8B6BfX7
 C95ZAP6GiJ+SOCdOrtto5yCUFhXMK/CYDaZXXrdxhK2thGd4J4QlckOVCuc8f3W5sv5G
 IsCR5PfJBV4V8E0DiZbVU6w+MElV8gRFCSWxGe71bFBYFSInZtvI41jwjnyvNWR0DHXG
 ytXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=KeGPh3Ex0oGej26b/mKrrEF+G2aBv3VYc8c9vtkFLBQ=;
 b=MUYp+dkWYbgMSkz1Up72xzmJSXjISlI24v87XC5S9C5oNW3l0OkAzKUqCMEu9s+6fD
 PIXye6yv9hjwNBVM6KbZY7q6E325B1ILyMv1Ot5KsMp9fqWAv56QoXZ7Nn+igZ3i+AGu
 ltWEn6opYw0Oqk/whCIEwcThQeANz9aLI4dZaxaCu3y6aM6ap7kkgSDBk5HNUT/BlkUd
 nm3ZjAF1THCjinPRNWnreFM96Lj/0HdtfkM1ymEq566cHMi3kzlTaSmTC5MrXbrxEDQ+
 rz/laJPg7YNUAxsDwVlejUIghFxDqzyu/QEPSwHfmxuRy7iXNkOsYbmB14NmpZ7U5dAh
 S9jA==
X-Gm-Message-State: AOAM533naqausDL6g4TFXSfZ6E8LbHIL4ndZYgmNSu2jOuSvDgV6hjpS
 cPReOIIx2HmcvcrZovwXOGpCRJWPSdc=
X-Google-Smtp-Source: ABdhPJyLTYzeA+UcPx5JaPgbHL6YlSU3a/wBxUq7W+syAkkO2FbNuGliTFus6x3i057YvWQvWUpGXg==
X-Received: by 2002:a05:6512:220a:b0:443:1140:7ffc with SMTP id
 h10-20020a056512220a00b0044311407ffcmr3912778lfu.566.1645773987904; 
 Thu, 24 Feb 2022 23:26:27 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id
 z25-20020a2eb539000000b00244db8751a7sm184592ljm.67.2022.02.24.23.26.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Feb 2022 23:26:27 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 25 Feb 2022 10:26:21 +0300
Message-Id: <20220225072622.3584480-6-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225072622.3584480-1-geomatsi@gmail.com>
References: <20220225072622.3584480-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH v2 5/6] configs/linksprite_pcduino_defconfig:
 update Linux/U-Boot versions
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
Cc: Sergey Kuzminov <kuzminov.sergey81@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump Linux kernel to 5.16.1 and U-Boot to 2022.01. Select option
BR2_TARGET_UBOOT_NEEDS_OPENSSL since U-Boot requires openssl.
Drop redundant U-Boot options.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
---
 configs/linksprite_pcduino_defconfig | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/configs/linksprite_pcduino_defconfig b/configs/linksprite_pcduino_defconfig
index 05b25aede4..806c4f0697 100644
--- a/configs/linksprite_pcduino_defconfig
+++ b/configs/linksprite_pcduino_defconfig
@@ -19,12 +19,12 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 
 # Linux headers same as kernel, a 5.10 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16.1"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun4i-a10-pcduino"
@@ -40,13 +40,12 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2020.10"
-BR2_TARGET_UBOOT_USE_DEFCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Linksprite_pcDuino"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
