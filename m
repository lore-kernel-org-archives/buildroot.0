Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5CBCFC5E2
	for <buildroot@archiver.kernel.org>; Thu, 10 Oct 2024 16:32:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1632981EB9;
	Thu, 10 Oct 2024 16:32:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E3f8lgVT8i8i; Thu, 10 Oct 2024 16:32:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 21B4A81EBA
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 21B4A81EBA;
	Thu, 10 Oct 2024 16:32:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C572A1BF4D6
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 16:32:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B4A9B81EBA
 for <buildroot@lists.busybox.net>; Thu, 10 Oct 2024 16:32:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eWm97_3am--0 for <buildroot@lists.busybox.net>;
 Thu, 10 Oct 2024 16:32:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32c; helo=mail-wm1-x32c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 98AAC81EB9
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 98AAC81EB9
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 98AAC81EB9
 for <buildroot@busybox.net>; Thu, 10 Oct 2024 16:32:37 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-43115887867so7784955e9.0
 for <buildroot@busybox.net>; Thu, 10 Oct 2024 09:32:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728577955; x=1729182755;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/hUhWVEbIhZrHc+RfxW0hLoKwmjQS/fg0VCKLLBALqE=;
 b=oYZrN1oQAuh2nlDmGTP5c7s/JmILRJARjufrOPCR2a9u70Rd3emrfLW7TE0vqDk1vU
 wXCCbiAdcIWuAAUBf2bpytKh2ghKdmb5sFhCt0EV0JsNH8Z93uIBsKMQfnFxOcHMMkqv
 PykWO44bhrMQMTRVschxItyGpkCl3iKCEU7Ys6z/Rcs6VpslJJilb8NesYbNnszp3lEI
 +JOVy7mSihdUXf/DaaY5PYx6NSKnn3J82fOWEBLxNJX7zUiDemWaOUiWvdauQXJ4GkpM
 Ej03K89MlMq4+oMhTsfWQXGGGiHc2oO6BiyVLjsUQBNjDabhnWSTdlcVc8m38UDd2TpH
 wcfw==
X-Gm-Message-State: AOJu0YyBqUs0otb7L4LIgrN6KUPfi482Dkj2e1SOuSYMQ/fWLnTJRf6B
 39hafrtWWJb+SpM64ldkU7ez2mX0YcTTLQ9HUSm1rBdnOH9O92eQIjh179PSmHqbsqXylAhOxKH
 KFA==
X-Google-Smtp-Source: AGHT+IGQHlNpnB4W1IF0IhYJWw8Cg5KmUkVSiQwFcI2TGS4xwtLQYM7VmyBjiOsaHP0TEVdm0HktIg==
X-Received: by 2002:a05:600c:3106:b0:431:136b:8bef with SMTP id
 5b1f17b1804b1-43115aa52a6mr35765755e9.7.1728577955309; 
 Thu, 10 Oct 2024 09:32:35 -0700 (PDT)
Received: from vm-2404.. (206.34.66.37.rev.sfr.net. [37.66.34.206])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-37d4b6a8a5asm1940259f8f.12.2024.10.10.09.32.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 10 Oct 2024 09:32:34 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Thu, 10 Oct 2024 18:31:59 +0200
Message-ID: <20241010163200.249090-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1728577955; x=1729182755; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/hUhWVEbIhZrHc+RfxW0hLoKwmjQS/fg0VCKLLBALqE=;
 b=e6BvssoXyA76tIO3qnSNWxXqrhm1ivGJJEyzWxK6ytFkXY/oAG7rWmww10JpB6PSJe
 GC3ek55qYvqEedNt4sBLYhT5rAbjWgSDMUiWzfcMMkRI5O3ULqsuwK6nf1eksPNlezK8
 ybIhAYLPHFPMV5ucRTM8gPRZbdtm7gyVjWrrI2f5ZIWHroI4P8To4y/c7d8Fc9GEcl7J
 wRzroJnoW0jJDzSuxqU/eaEKUUPaT95ENvE29QRH1L7OnWt42ObEFVTK7HgpYhxbMnaj
 GxjMzbqO072amuF7lNHHqvIeikmqnN2YrKpddk9S20LlYxzosz/I2g+MUN5C6wAw9Ee3
 LI6w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=e6BvssoX
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump Linux
 and U-Boot
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

now, U-Boot needs gnutls (mkeficapsule)

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
 board/olimex/a20_olinuxino/patches/uboot/uboot.hash | 2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig        | 5 +++--
 configs/olimex_a20_olinuxino_lime_defconfig         | 5 +++--
 4 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index 8ffd3e4fbc..4769129ac1 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  b9676828b737e8fb8eaa5198303d35d35e8df019550be153c8a42c99afe0cdd5  linux-6.6.36.tar.xz
+sha256  5fae869d6a24055c16ffc2d92669e3fb2b258e34d36c850bb8cf9def417ecfa0  linux-6.6.54.tar.xz
diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
index 7269980104..8491435683 100644
--- a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
+++ b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  f591da9ab90ef3d6b3d173766d0ddff90c4ed7330680897486117df390d83c8f  u-boot-2024.07.tar.bz2
+sha256  b28daf4ac17e43156363078bf510297584137f6df50fced9b12df34f61a92fb0  u-boot-2024.10.tar.bz2
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 765504d1fa..98879e327a 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -27,7 +27,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.54"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -49,12 +49,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 27cd87d9a1..57caa74a63 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -27,7 +27,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.54"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -49,12 +49,13 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
+BR2_TARGET_UBOOT_NEEDS_GNUTLS=y
 BR2_TARGET_UBOOT_FORMAT_BIN=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
