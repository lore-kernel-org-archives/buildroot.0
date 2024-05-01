Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 197DFC4345F
	for <buildroot@archiver.kernel.org>; Wed,  1 May 2024 09:24:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C2C6A6059C;
	Wed,  1 May 2024 09:24:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gd2c0uDKueWH; Wed,  1 May 2024 09:24:44 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA34F607E3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA34F607E3;
	Wed,  1 May 2024 09:24:43 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 822361BF3A3
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 09:24:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6E76B40677
 for <buildroot@lists.busybox.net>; Wed,  1 May 2024 09:24:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLuJkxkfZVE9 for <buildroot@lists.busybox.net>;
 Wed,  1 May 2024 09:24:40 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::136; helo=mail-lf1-x136.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 249B440360
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 249B440360
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 249B440360
 for <buildroot@buildroot.org>; Wed,  1 May 2024 09:24:39 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-51d9af6bf36so504270e87.3
 for <buildroot@buildroot.org>; Wed, 01 May 2024 02:24:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714555477; x=1715160277;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vwKPFkpkPJf1MGT4CQJFqVP3qNR6bVa4AGuQi3n62Q8=;
 b=ZxE+5ZbEyK8ax7ZRljGk4o4zPzmvKCMSX5n9nBUwa5tyM3KCSMyjFCy8Ldnmi2MVaZ
 MowA7pqqny4TUNDG/ugivk2X+0TmRYFJVlabL2WdHvBDeTpxq2qw4wxlVAabLC09OydL
 0xvMRJvmsJCT1Q9FypvKfLPkTqX/PziB3I/gG1k38eHIA08oVF6ll4dxlKSC+sFY2jYK
 yGYD2i03LuJZ7mqX3pdNfEuDAYNAKSMLRwClXc5XgitAhACWGbGGKnp0MEdQlMP6Vf0N
 ox7FCnkgCqyPhPWdyB5Ey4BQRORX+XgE/tSBEXYqqWxETK1bz/YOo3WjDZnEaGSWqm7L
 2pCg==
X-Gm-Message-State: AOJu0Yx0XpiPX8GaQSHu35B7n1j+e40EgF5T/LViceRD8sk5a55PUvrg
 fgGEK6RWjkAvWNskyqOMI6AXeCLFVbxInjVAcWiJAqIhtotOX1vUZW6Vrok4
X-Google-Smtp-Source: AGHT+IEQukyjJQGJPHjNItjQLzge3KgaIl29oCGCL/IhzAgGyZQDfx6GbXXjp7jsGkF7OF5Nm4EnAA==
X-Received: by 2002:a2e:8004:0:b0:2de:1218:af30 with SMTP id
 j4-20020a2e8004000000b002de1218af30mr1376014ljg.1.1714555477170; 
 Wed, 01 May 2024 02:24:37 -0700 (PDT)
Received: from localhost.localdomain (109-252-38-243.nat.spd-mgts.ru.
 [109.252.38.243]) by smtp.gmail.com with ESMTPSA id
 s23-20020a2e81d7000000b002dfbff5667csm1446410ljg.52.2024.05.01.02.24.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 02:24:36 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  1 May 2024 12:23:27 +0300
Message-ID: <20240501092328.323236-2-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240501092328.323236-1-dm.chestnykh@gmail.com>
References: <20240501092328.323236-1-dm.chestnykh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714555477; x=1715160277; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vwKPFkpkPJf1MGT4CQJFqVP3qNR6bVa4AGuQi3n62Q8=;
 b=nVldxBvuCbRkC4096t2MVcgwab7bx/F9EJ9Xck40ad3SQFbTEHTDyF8umSAeRWo066
 e9NIX71PgeiV5ijIIa+YcF7cjoIxnHL78o4x8OkBp53DOV4n0QSTawd3orfiyXA57sOy
 shFFF2PWB04q9wF4ziRvRo1Y06JifbX8mQPIjGSAnC1cCFtv0EbIEWAMjwpceFx32Mp0
 BC+C/9e5JbwgzXGT7OjAJR9e2VRu+gqu1ff/v8LTktLjI53gu05VlozeCRpklu7iRJXo
 NXIEXiDr4upS3bbQ1AHUqS0URn8NB9Y1RrrWoG7UHFAxsLxX5vsZfupI6jvwupSgFxDp
 3qXg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=nVldxBvu
Subject: [Buildroot] [PATCH 2/3] configs/qemu_sparc_ss10_defconfig: Restore.
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With uClibc-ng-1.0.48 we can restore this config
because now sparc systems work without reverting GCC commits.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
 arch/Config.in                    |  5 -----
 configs/qemu_sparc_ss10_defconfig | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 5 deletions(-)
 create mode 100644 configs/qemu_sparc_ss10_defconfig

diff --git a/arch/Config.in b/arch/Config.in
index 9912f9fce6..e7349e83ae 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -216,11 +216,6 @@ config BR2_sh
 config BR2_sparc
 	bool "SPARC"
 	select BR2_USE_MMU
-	# uClibc-ng broken on sparc due to recent gcc changes
-	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
-	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
-	# gcc <= 10.x has been removed from Buildroot.
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	help
 	  SPARC (from Scalable Processor Architecture) is a RISC
 	  instruction set architecture (ISA) developed by Sun
diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
new file mode 100644
index 0000000000..a8e3df9180
--- /dev/null
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -0,0 +1,28 @@
+# Architecture
+BR2_sparc=y
+BR2_sparc_v8=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_AS_KERNEL=y
+
+# Linux kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.6"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
