Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E30ED43370
	for <buildroot@archiver.kernel.org>; Fri, 12 Dec 2025 07:58:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DC2B84192;
	Fri, 12 Dec 2025 07:58:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id b9xVETlWVVI7; Fri, 12 Dec 2025 07:58:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3B2183E5C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765526279;
	bh=5nOJ++hc1hcHNzo4jrkya4pyK0nxcYbXPjTZXkctdNc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=EnNlQ6Tu15dBstdst3XwRcVEzyheMTPwmY52EjfUerZyxKrreQZIQdLv2e0uGbUHJ
	 zE/PV17hzS6DKItdenVYqdy9NAcvnWlNmCsOXNMEkaVPuiWykUk91WW01UwadZ1qIQ
	 CZlI9mY9ClGRFIFwJZARaef+jr3d7THVf2JylF1Wf0gD2jlua1lBHvFItG9bcEr35i
	 EBrnkY5gyGoXOVLd8UH5IyvMat9ahRUSPkQZn2CTYnS854xG6JDLMbl8Qie+l1tOxs
	 GbmLnrVxAXeCPMCZmAnk5appinhA58DDcBT4u0ARoFFWGKkiWPesglLtQpvgXZbazM
	 G2Wq27w9SQRdA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3B2183E5C;
	Fri, 12 Dec 2025 07:57:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F3532E7
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:56:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE2954116B
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J8bhFTSwoShP for <buildroot@buildroot.org>;
 Fri, 12 Dec 2025 07:55:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2837D4115A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2837D4115A
 for <buildroot@buildroot.org>; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2761E85C4C; Fri, 12 Dec 2025 07:55:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 5 Dec 2025 21:56:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 959a94c2ded2b8ec605fa135ede8b8f5fcec84b0
X-Git-Newrev: 00886048b27d7b86d38282a8dbd5ec3c2bcb48f0
X-Patchwork-Hint: ignore
Message-Id: <20251212075537.2761E85C4C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/versal2_vek385_defconfig: add
 optee_os support
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=00886048b27d7b86d38282a8dbd5ec3c2bcb48f0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add optee_os to the default configuration for versal2 devices including an
example with the versal2_vek385_defconfig.

Since not all versal2 optee_os features are upstream, use the downstream
Xilinx release tag xlnx_rebase_v4.5.0_2025.2 for version xilinx_v2025.2
which is based on optee_os v4.5.0.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 board/versal2/post-image.sh      | 1 +
 board/versal2/readme.txt         | 1 +
 configs/versal2_vek385_defconfig | 6 ++++++
 3 files changed, 8 insertions(+)

diff --git a/board/versal2/post-image.sh b/board/versal2/post-image.sh
index 36cd2eda19..17746271e1 100755
--- a/board/versal2/post-image.sh
+++ b/board/versal2/post-image.sh
@@ -19,6 +19,7 @@ cat <<-__HEADER_EOF > "${BINARIES_DIR}/bootgen.bif"
 	    id = 0x1c000000, name=apu_subsystem
 	    { type=raw, load=0x01000000, file=${BINARIES_DIR}/u-boot.dtb }
 	    { core=a78-0, cluster=0, exception_level=el-3, trustzone, file=${BINARIES_DIR}/bl31.elf }
+	    { core=a78-0, cluster=0, exception_level=el-1, trustzone, load=0x1800000, file=${BINARIES_DIR}/tee-raw.bin }
 	    { core=a78-0, cluster=0, exception_level=el-2, file=${BINARIES_DIR}/u-boot.elf }
 	  }
 	}
diff --git a/board/versal2/readme.txt b/board/versal2/readme.txt
index fd7d092cc4..4498392bcb 100644
--- a/board/versal2/readme.txt
+++ b/board/versal2/readme.txt
@@ -41,6 +41,7 @@ After building, you should get a tree like this:
     +-- rootfs.ext4 -> rootfs.ext2
     +-- sdcard.img
     +-- system.dtb -> u-boot.dtb
+    +-- tee-raw.bin
     +-- u-boot.dtb
     `-- u-boot.elf
 
diff --git a/configs/versal2_vek385_defconfig b/configs/versal2_vek385_defconfig
index a2d57a0976..9a70a6bcb2 100644
--- a/configs/versal2_vek385_defconfig
+++ b/configs/versal2_vek385_defconfig
@@ -26,6 +26,12 @@ BR2_TARGET_ARM_TRUSTED_FIRMWARE_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,ar
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_PLATFORM="versal2"
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_BL31_UBOOT=y
 BR2_TARGET_ARM_TRUSTED_FIRMWARE_ADDITIONAL_VARIABLES="VERSAL2_CONSOLE=cadence1"
+BR2_TARGET_OPTEE_OS=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL=y
+BR2_TARGET_OPTEE_OS_CUSTOM_TARBALL_LOCATION="$(call github,Xilinx,optee_os,xlnx_rebase_v4.5.0_2025.2)/xlnx_rebase_v4.5.0_2025.2.tar.gz"
+BR2_TARGET_OPTEE_OS_NEEDS_DTC=y
+BR2_TARGET_OPTEE_OS_NEEDS_PYTHON_CRYPTOGRAPHY=y
+BR2_TARGET_OPTEE_OS_PLATFORM="versal2"
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_TARBALL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
