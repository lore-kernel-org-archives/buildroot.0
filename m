Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4919DC3DA45
	for <buildroot@archiver.kernel.org>; Sat, 13 Jul 2024 14:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BD3F413C7;
	Sat, 13 Jul 2024 14:01:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uMfWKXmtQkPd; Sat, 13 Jul 2024 14:01:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D177413EC
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1D177413EC;
	Sat, 13 Jul 2024 14:01:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 5B8CC1BF861
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:01:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 46BDF413CB
 for <buildroot@lists.busybox.net>; Sat, 13 Jul 2024 14:01:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rvSiijHX2n02 for <buildroot@lists.busybox.net>;
 Sat, 13 Jul 2024 14:01:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8048741387
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8048741387
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8048741387
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 14:01:37 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4266f3e0df8so19306125e9.2
 for <buildroot@buildroot.org>; Sat, 13 Jul 2024 07:01:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720879296; x=1721484096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YazTdFTYFHjGOMyUAoFvnFyzKCzypOWk9ETA54FxqBM=;
 b=NHDN0W/Zu7O8Rpn0xX9EltLim+j50XK7zstn/cQSHxs0bVAbp+tvIFnzpiQaU3EyIi
 9I7KSrgR7FY9jTCvbGtoVOFnC3XNKvGfuejar5l8jXIub2hvy8WAio0UvLTPvKipLo42
 fl3tHkSStLQwL58+VRwI+b4tEQ+tJ4IhQDbqsLWR91Q0FDIDwhCaiJOLMUHPnx5uQvmN
 QOqQU8vNLBk6kc+Y54+XOG9GXRjlfiQ+/pNme/N0m3qklpyzNLy8N2AjEuWxfWhP0jpM
 XoEv3F/Feirgfqg0I5LXqVBgcSLnw6CdZ9CAy3g/JU9aTQo7r+/onFH0R/7of/T2sUmD
 QILw==
X-Gm-Message-State: AOJu0Yy3D2OwIayRNsQ5PrIVnFR5VngXoIqYISJ1DkiUbdPz18fXIqz8
 hIW3Yx/b4FXphD2a3cN/UFkLeWfxz/V8Oc9skDpFp/CIJZ82E/WtCDqnT9S5aTY4n/CZec7Bbir
 mMZo=
X-Google-Smtp-Source: AGHT+IGsQ+xHM5Az3HpuGXhOfu+9xTDfh/QXbXy/Xa+DjjarZod8UTFnIK8EYPBB+TS7f9uuEt3hMw==
X-Received: by 2002:a05:600c:41d1:b0:426:59fc:cdec with SMTP id
 5b1f17b1804b1-426707e1fd1mr94348365e9.21.1720879295865; 
 Sat, 13 Jul 2024 07:01:35 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800f9c8f4430ffd1bed.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:f9c8:f443:ffd:1bed])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4279f27877dsm55342055e9.26.2024.07.13.07.01.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 13 Jul 2024 07:01:35 -0700 (PDT)
To: buildroot@buildroot.org
Date: Sat, 13 Jul 2024 16:01:29 +0200
Message-ID: <20240713140133.2107977-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1720879296; x=1721484096; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=YazTdFTYFHjGOMyUAoFvnFyzKCzypOWk9ETA54FxqBM=;
 b=LDbMxWGMzK3g6Fwei5i4YcmRW2D01PrCev34/WRuN3w9ggagKPNIycjdYH9JzAvUIz
 9vWvm6/R6g1Dpvk0kSgsIbQU4PHASKqJBB+Vhnwtbq+8C0cu3H3d4z81l8hzbcp36Aou
 BSh6KzmDGcGjX5kllMWA5mOjTkxQTPkdyT4/Q=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=LDbMxWGM
Subject: [Buildroot] [PATCH 1/5] configs/beagleboneai_defconfig: move board
 files to board/beagleboard/beagleboneai
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
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The beagleboneai board files from beagleboard.org project should be
moved to board/beagleboard directory.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .checkpackageignore                                         | 4 ++--
 DEVELOPERS                                                  | 2 +-
 board/{ => beagleboard}/beagleboneai/genimage.cfg           | 0
 .../beagleboneai/patches/linux-headers/linux-headers.hash   | 0
 .../{ => beagleboard}/beagleboneai/patches/linux/linux.hash | 0
 .../beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch  | 0
 .../{ => beagleboard}/beagleboneai/patches/uboot/uboot.hash | 0
 board/beagleboard/beagleboneai/post-build.sh                | 4 ++++
 board/{ => beagleboard}/beagleboneai/readme.txt             | 0
 board/{ => beagleboard}/beagleboneai/uEnv.txt               | 0
 board/beagleboneai/post-build.sh                            | 4 ----
 configs/beagleboneai_defconfig                              | 6 +++---
 12 files changed, 10 insertions(+), 10 deletions(-)
 rename board/{ => beagleboard}/beagleboneai/genimage.cfg (100%)
 rename board/{ => beagleboard}/beagleboneai/patches/linux-headers/linux-headers.hash (100%)
 rename board/{ => beagleboard}/beagleboneai/patches/linux/linux.hash (100%)
 rename board/{ => beagleboard}/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch (100%)
 rename board/{ => beagleboard}/beagleboneai/patches/uboot/uboot.hash (100%)
 create mode 100755 board/beagleboard/beagleboneai/post-build.sh
 rename board/{ => beagleboard}/beagleboneai/readme.txt (100%)
 rename board/{ => beagleboard}/beagleboneai/uEnv.txt (100%)
 delete mode 100755 board/beagleboneai/post-build.sh

diff --git a/.checkpackageignore b/.checkpackageignore
index 3fea2d9b39..b29f290dd8 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -10,8 +10,8 @@ board/asus/tinker/post-build.sh Shellcheck
 board/atmel/flasher.sh Shellcheck
 board/beaglebone/patches/linux/0001-keep-jtag-clock-alive-for-debugger.patch lib_patch.Upstream
 board/beaglebone/post-build.sh Shellcheck
-board/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch lib_patch.Upstream
-board/beagleboneai/post-build.sh Shellcheck
+board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch lib_patch.Upstream
+board/beagleboard/beagleboneai/post-build.sh Shellcheck
 board/beaglev/post-build.sh Shellcheck
 board/beelink/gs1/post-build.sh Shellcheck
 board/boundarydevices/common/post-build.sh Shellcheck
diff --git a/DEVELOPERS b/DEVELOPERS
index b66fda5fcb..4d13e90924 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2504,7 +2504,7 @@ F:	package/libunistring/
 
 N:	Peter Korsgaard <peter@korsgaard.com>
 F:	board/arrow/avenger96/
-F:	board/beagleboneai/
+F:	board/beagleboard/beagleboneai/
 F:	board/minnowboard/
 F:	board/nezha/
 F:	board/librecomputer/lafrite/
diff --git a/board/beagleboneai/genimage.cfg b/board/beagleboard/beagleboneai/genimage.cfg
similarity index 100%
rename from board/beagleboneai/genimage.cfg
rename to board/beagleboard/beagleboneai/genimage.cfg
diff --git a/board/beagleboneai/patches/linux-headers/linux-headers.hash b/board/beagleboard/beagleboneai/patches/linux-headers/linux-headers.hash
similarity index 100%
rename from board/beagleboneai/patches/linux-headers/linux-headers.hash
rename to board/beagleboard/beagleboneai/patches/linux-headers/linux-headers.hash
diff --git a/board/beagleboneai/patches/linux/linux.hash b/board/beagleboard/beagleboneai/patches/linux/linux.hash
similarity index 100%
rename from board/beagleboneai/patches/linux/linux.hash
rename to board/beagleboard/beagleboneai/patches/linux/linux.hash
diff --git a/board/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch b/board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch
similarity index 100%
rename from board/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch
rename to board/beagleboard/beagleboneai/patches/uboot/0001-am57xx_evm-fixes.patch
diff --git a/board/beagleboneai/patches/uboot/uboot.hash b/board/beagleboard/beagleboneai/patches/uboot/uboot.hash
similarity index 100%
rename from board/beagleboneai/patches/uboot/uboot.hash
rename to board/beagleboard/beagleboneai/patches/uboot/uboot.hash
diff --git a/board/beagleboard/beagleboneai/post-build.sh b/board/beagleboard/beagleboneai/post-build.sh
new file mode 100755
index 0000000000..384b4d8745
--- /dev/null
+++ b/board/beagleboard/beagleboneai/post-build.sh
@@ -0,0 +1,4 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+
+cp board/beagleboard/beagleboneai/uEnv.txt $BINARIES_DIR/uEnv.txt
diff --git a/board/beagleboneai/readme.txt b/board/beagleboard/beagleboneai/readme.txt
similarity index 100%
rename from board/beagleboneai/readme.txt
rename to board/beagleboard/beagleboneai/readme.txt
diff --git a/board/beagleboneai/uEnv.txt b/board/beagleboard/beagleboneai/uEnv.txt
similarity index 100%
rename from board/beagleboneai/uEnv.txt
rename to board/beagleboard/beagleboneai/uEnv.txt
diff --git a/board/beagleboneai/post-build.sh b/board/beagleboneai/post-build.sh
deleted file mode 100755
index 34a86cc746..0000000000
--- a/board/beagleboneai/post-build.sh
+++ /dev/null
@@ -1,4 +0,0 @@
-#!/bin/sh
-BOARD_DIR="$(dirname $0)"
-
-cp board/beagleboneai/uEnv.txt $BINARIES_DIR/uEnv.txt
diff --git a/configs/beagleboneai_defconfig b/configs/beagleboneai_defconfig
index a002869984..9c5c3d165a 100644
--- a/configs/beagleboneai_defconfig
+++ b/configs/beagleboneai_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_GLOBAL_PATCH_DIR="board/beagleboneai/patches"
+BR2_GLOBAL_PATCH_DIR="board/beagleboard/beagleboneai/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_10=y
 BR2_SYSTEM_DHCP="eth0"
-BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboneai/post-build.sh"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/beagleboard/beagleboneai/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboneai/genimage.cfg"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/beagleboard/beagleboneai/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.10.217"
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
