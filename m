Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A708C433F5
	for <buildroot@archiver.kernel.org>; Mon, 31 Jan 2022 08:12:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AF5A401B4;
	Mon, 31 Jan 2022 08:12:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dUgKYmgmVKY4; Mon, 31 Jan 2022 08:12:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6FD4E4019E;
	Mon, 31 Jan 2022 08:12:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 38D061BF313
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 08:12:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 26FEB60BE3
 for <buildroot@lists.busybox.net>; Mon, 31 Jan 2022 08:12:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FIxO7wNRWzi0 for <buildroot@lists.busybox.net>;
 Mon, 31 Jan 2022 08:12:21 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6CED760BA3
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 08:12:21 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id p27so25177937lfa.1
 for <buildroot@buildroot.org>; Mon, 31 Jan 2022 00:12:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xLR8XuVHcBbyjtF+UlzZQz76YiHqoYOuVN/w0TrYrow=;
 b=KRXTmIi+6BJ4y0wuBP/xoYJ8XOOIXgj3Q1F/MhO0IhpWq6PP7+j7AzrVPcUZoUqgjT
 FCXxqXLaQ8I0Oix95Bxc/+nGgstxUfSSszK0rbw3rn+dycZ77Ff+TI/uUJJOKtAqnLjb
 B10d9fYYyDSaoKIuyb6kxLGyMN1PsV3W6xfHkwFOha3EGPxMr0dN6AqQVEwNcBsXkHW/
 dLGqibsVd3MiBKDDxybOISPB94QOGKgaSBeTyzpAIXvs7IBC0Znb8OJiSM2fLjwbG7uo
 y1Imk0HaCTE2+CkmKvfYSMjBl8qM27ut0EJncqz6XeCnP399xNWRyp0IrdzkI2YcKZ38
 PzUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xLR8XuVHcBbyjtF+UlzZQz76YiHqoYOuVN/w0TrYrow=;
 b=5S8WkujmntiwSUEh3juakbkS4mMwwN99uqSNCiQy4jHek7nelj3A/Koh5h07X4Yq2z
 JnlwHbzxmXyTmzOlEkLyt9P1lKnQ1dhVNryUvuByvoZT0twX1evnwltp2tIK8CSyIK8+
 Ybmk8rfH3B3X5laLjZVfmaB/Qsy1zo57r72AK6IPQWKAJSaYT/JAqwb7kyc0LLx/8917
 lgwyOU6LDwHZoC7S/ExIcjZCFOI5frCCfFdl3YC++1MuEjRzQglJL+hbBMIQjODLp1uf
 EpFVhW5YsdGWfu6j56aBPx/bzTjwkeY2sSRUIhtHiP3tVB7w7vx4DwEI0wJdtX7UQYUs
 bYDA==
X-Gm-Message-State: AOAM5311DRtPc376aYJOisZ+dtabsZbXK2A54NWFI4VWzlVIhws/+sro
 V8+igdy/EVDxVCQ2DjkB8SBnNGy2c0Q=
X-Google-Smtp-Source: ABdhPJwCfwJMrWOMHdw5RiCDu6jNwftZEdpWQ65jYMJaGsS2oomf+0RfoeFq9VRiugTT/pdl+GAqRg==
X-Received: by 2002:a19:5f58:: with SMTP id a24mr13996283lfj.46.1643616739045; 
 Mon, 31 Jan 2022 00:12:19 -0800 (PST)
Received: from localhost.localdomain ([5.188.167.245])
 by smtp.googlemail.com with ESMTPSA id j17sm815095lfu.14.2022.01.31.00.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Jan 2022 00:12:18 -0800 (PST)
From: Sergey Matyukevich <geomatsi@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 31 Jan 2022 11:12:12 +0300
Message-Id: <20220131081214.12773-4-geomatsi@gmail.com>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220131081214.12773-1-geomatsi@gmail.com>
References: <20220131081214.12773-1-geomatsi@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/5] configs/snps_archs38_hsdk: bump kernel and
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

Signed-off-by: Sergey Matyukevich <sergey.matyukevich@synopsys.com>
---
 configs/snps_archs38_hsdk_defconfig | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/configs/snps_archs38_hsdk_defconfig b/configs/snps_archs38_hsdk_defconfig
index 4a1ac3fcff..413ca5098c 100644
--- a/configs/snps_archs38_hsdk_defconfig
+++ b/configs/snps_archs38_hsdk_defconfig
@@ -1,7 +1,7 @@
 BR2_arcle=y
 BR2_archs38_full=y
 BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_16=y
 BR2_PACKAGE_GLIBC_UTILS=y
 BR2_TOOLCHAIN_BUILDROOT_CXX=y
 BR2_TARGET_OPTIMIZATION="-mfpu=fpud_all"
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/synopsys/hsdk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.3"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.16"
 BR2_LINUX_KERNEL_DEFCONFIG="hsdk"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/synopsys/hsdk/linux.fragment"
 BR2_TARGET_ROOTFS_EXT2=y
@@ -21,10 +21,11 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2018.05"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="hsdk"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_FORMAT_ELF=y
+BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-- 
2.35.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
