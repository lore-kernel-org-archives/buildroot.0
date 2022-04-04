Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EA40C433EF
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 10:37:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E54E82735;
	Tue,  5 Apr 2022 10:37:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KjtF7tqGbCC5; Tue,  5 Apr 2022 10:37:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 25DFB8272A;
	Tue,  5 Apr 2022 10:37:37 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BC0701BF2C4
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 10:37:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AB04C8272A
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 10:37:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yzcneorXMZnk for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 10:37:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 504D882725
 for <buildroot@busybox.net>; Tue,  5 Apr 2022 10:37:34 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id r64so7665713wmr.4
 for <buildroot@busybox.net>; Tue, 05 Apr 2022 03:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=brb9VGigojlD0+4jklBhUVsYoppjX2q8ll9UP4IzJZg=;
 b=cv+khpwVv/sRO0hdrAfmguTYEZeUYAsxx4alKFURpxvu2Etnqg7nkIF9vmuWJ9zNLz
 1VwZBqvHhTOP1+xQEl41IqT5+FXVVZESR/N4n09mef/p+ojTvSK24wJsPColvWaGeBK0
 vXx2cf2L5Y7yPqy+/+S5R+K7cJg+0sm9X7Ll5LnRlvyvBcS2sV19GSvyPKihzh3m3skU
 uKzbq4MIBo2KP7LI+4lZeQtfAJER21shbTnTlbH0otX86t7S5loN2mZ22x70c+S5pt33
 EySttsxxUJ5TexK4zm3qGnl1YcO46+Jt0CxmFPjZOpJFUXspTE/NmZwqHuMKhJ1FHWLs
 //+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=brb9VGigojlD0+4jklBhUVsYoppjX2q8ll9UP4IzJZg=;
 b=BAQqYTnByXdmVYsakt2GnpdHne3WdLb+CkkRitzWfbklSZCjoWfqOX98URZlESVC5d
 dIctOMR9NS5JXN/e2BMCqj8b2WNOkLX2jC86/6kbGIXJt2oVww/bY0/vlKgpw3d5vSiL
 elICgL6anpEiZWLGbQRpXDgwuYPDmClLobF0vashKGBfizMlkCKhgeJMVEFs6VTlQdJr
 uNzHqKGElGrN8pDIC8KCrVF2fFKLLbrpZ6K1vK4/k0HBTEu2Ptu4y0HbAlGArTYWNE5O
 GiFUnoIXjZUktMt8+/8Z9PDB1+dQENKPW2MH1dGjkX7sX2M+jE1E8QiVmdI7apnMmMjB
 HlHg==
X-Gm-Message-State: AOAM533h+awS5WFXfA78U6R3Cv8w16VuUcvhj5Sgsh6+HG+YPwRo9GkK
 FabM6zqVGmjCwOiD3F3PNoMhFXjpgjA=
X-Google-Smtp-Source: ABdhPJwS8f4xWPIrVflREH2C0r6F5c/zS16CXJlKXXjWCq5KdXL+hHGCPp+k89TQcUw5WTn5hwpprA==
X-Received: by 2002:a7b:c5d1:0:b0:37f:a8a3:9e17 with SMTP id
 n17-20020a7bc5d1000000b0037fa8a39e17mr2453076wmk.109.1649155052281; 
 Tue, 05 Apr 2022 03:37:32 -0700 (PDT)
Received: from v2021.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 10-20020a5d47aa000000b00204012e4373sm13253184wrb.101.2022.04.05.03.37.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 03:37:31 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  4 Apr 2022 20:35:04 +0200
Message-Id: <20220404183504.2392930-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
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

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_a20_olinuxino_lime2_defconfig | 8 ++++----
 configs/olimex_a20_olinuxino_lime_defconfig  | 8 ++++----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index b46cf3743..2f9594921 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -4,8 +4,8 @@ BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+# Linux headers same as kernel, a 5.15 LTS series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Toolchain
 # glibc is needed for sunxi-mali-utgard package.
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.32"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 698137e46..e24857e0c 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -4,8 +4,8 @@ BR2_cortex_a7=y
 BR2_ARM_EABIHF=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.14 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_14=y
+# Linux headers same as kernel, a 5.15 LTS series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 
 # Toolchain
 # glibc is needed for sunxi-mali-utgard package.
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.14.13"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.32"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.32.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
