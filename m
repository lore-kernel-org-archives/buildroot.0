Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A424C46CD4
	for <buildroot@archiver.kernel.org>; Fri, 22 Dec 2023 08:39:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5D6461B0E;
	Fri, 22 Dec 2023 08:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5D6461B0E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id l-uI-1vt-QoX; Fri, 22 Dec 2023 08:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8EAE961AE1;
	Fri, 22 Dec 2023 08:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EAE961AE1
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B2BBC1BF2F7
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 08:38:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9671C4039D
 for <buildroot@lists.busybox.net>; Fri, 22 Dec 2023 08:38:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9671C4039D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id edHHo3X9mhAu for <buildroot@lists.busybox.net>;
 Fri, 22 Dec 2023 08:38:53 +0000 (UTC)
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by smtp2.osuosl.org (Postfix) with ESMTPS id CB3A6402A8
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 08:38:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CB3A6402A8
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1d2f1cecf89so9689165ad.1
 for <buildroot@buildroot.org>; Fri, 22 Dec 2023 00:38:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703234333; x=1703839133;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SNw9oPZLcpjr3JrNLDoTaSdcLVAlMm4GDTrgIpLiero=;
 b=gkbIPjgVZGVWIFNj5jIGE05nfvohyu0OUMu4ynC6hOOYHH2wDQaayLus6tg5VLdHP1
 egahaoIsPVC7pSrAqwID55gU+I2cqSWhabLmMeV8COwmOk+ErV+KWGmTQLzUATOmjoF0
 6qwLBKXqGqdt+2RXsblOOOmPf16mvpChWgOOAJG1MR0he3c5qN541Cldxn6RY0323Hnz
 JTU4xUGr+QtXNlp6x/yxTlt74uqxYqUIUdgslRykCg8FqZa6J6gyiEYk8fhy2MxUI8L2
 5Em0AdGnwy/wUBfQYKWZvZdqaTFcIc96hac8rjl6/A7LhTXXOO/k/9+Zyu0SKJ3v7JOW
 Z3AA==
X-Gm-Message-State: AOJu0YyfiUzzAwYB4+Zdyr19BXFX/yK2I+0YXxkdY+2mN/pbYwG+v0HW
 ldQUD/uFQEJEVE4Hq/gBNwlKOJJFOf/ykA==
X-Google-Smtp-Source: AGHT+IFgK31DakZuo/5TUweAkl4+Y3XJ/CFgwV4Un2I5JBpMNH4GInIGTiTSBlXhoAiVoZD9e4mErw==
X-Received: by 2002:a17:903:298c:b0:1d4:adb:9283 with SMTP id
 lm12-20020a170903298c00b001d40adb9283mr783940plb.21.1703234332663; 
 Fri, 22 Dec 2023 00:38:52 -0800 (PST)
Received: from localhost.localdomain (61-220-176-180.hinet-ip.hinet.net.
 [61.220.176.180]) by smtp.gmail.com with ESMTPSA id
 ja22-20020a170902efd600b001cfb99d8b82sm2937761plb.136.2023.12.22.00.38.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Dec 2023 00:38:52 -0800 (PST)
From: Nigel Wang <asd617140123@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 22 Dec 2023 16:29:34 +0800
Message-Id: <20231222082933.12183-2-asd617140123@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231222082933.12183-1-asd617140123@gmail.com>
References: <20231222082933.12183-1-asd617140123@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703234333; x=1703839133; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SNw9oPZLcpjr3JrNLDoTaSdcLVAlMm4GDTrgIpLiero=;
 b=ARNdWy89U9qHPtwXqimxOn+RQKpYtbnTfOqqKVwlnNZD4wh1pTccX7+3DrcHaI5GCt
 PxN78m/tzi5U36ND3n8CxkiirRVVP3RDub8Z2YCqRpaQGxaLZvXOCvzpEulC43mhyhKm
 +zUVjpUO+gAJGugeg8x9f3vcVa1f4aJCeNlOr7BeW8Af/sTfQjSn45Fb3MAJqaQyOVkj
 3tRsnkff3xRLw51wNnXoCYNZDZP2aQCx+HJGrhzWSRKobVY3x+UWRfJKAhqTMSNoPDPa
 6Fb1vNHPfG61rUHTGvYKA4Rniox046cGgfjUIPSyWFikbmtPxYQJHogZ4y/uQ1CtwYbL
 K8OQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ARNdWy89
Subject: [Buildroot] [PATCH 2/2] configs/cubieboard4_defconfig : add
 *_defconfig for cubieboard4.
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
Cc: nigel_wang <asd617140123@gmail.com>, giulio.benetti@benettiengineering.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: nigel_wang <asd617140123@gmail.com>

Signed-off-by: nigel_wang <asd617140123@gmail.com>
---
 configs/cubieboard4_defconfig | 42 +++++++++++++++++++++++++++++++++++
 1 file changed, 42 insertions(+)
 create mode 100644 configs/cubieboard4_defconfig

diff --git a/configs/cubieboard4_defconfig b/configs/cubieboard4_defconfig
new file mode 100644
index 0000000000..6a5f9e3fce
--- /dev/null
+++ b/configs/cubieboard4_defconfig
@@ -0,0 +1,42 @@
+# Architecture
+BR2_arm=y
+BR2_cortex_a7=y
+BR2_ARM_FPU_NEON_VFPV4=y
+
+# Linux headers same as kernel, a 5.15 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
+BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="sun9i-a80-cubieboard4"
+
+# Bootloader
+BR2_TARGET_UBOOT=y
+BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION=y
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_BOARD_DEFCONFIG="Cubieboard4"
+BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/cubietech/cubieboard4/boot.cmd"
+
+# System
+BR2_TARGET_GENERIC_HOSTNAME="Cubieboard4"
+BR2_TARGET_GENERIC_ISSUE="Welcome to Cubieboard4!"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/cubietech/cubieboard4/post-image.sh"
+BR2_PACKAGE_HOST_DOSFSTOOLS=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
