Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A9DC83F2F
	for <buildroot@archiver.kernel.org>; Thu, 31 Aug 2023 20:17:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEEE7418EC;
	Thu, 31 Aug 2023 20:17:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CEEE7418EC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UDqoiXmSlPFj; Thu, 31 Aug 2023 20:17:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1DB5418D6;
	Thu, 31 Aug 2023 20:17:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1DB5418D6
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7F2431BF385
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 20:17:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5706683A59
 for <buildroot@lists.busybox.net>; Thu, 31 Aug 2023 20:17:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5706683A59
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iFERDTF2TzXs for <buildroot@lists.busybox.net>;
 Thu, 31 Aug 2023 20:17:42 +0000 (UTC)
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17A0883A45
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 20:17:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A0883A45
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-3fbd33a57b6so11950205e9.2
 for <buildroot@buildroot.org>; Thu, 31 Aug 2023 13:17:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693513060; x=1694117860;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zlQTLtmy0EeqrPTDuU1dgVV5yOaWCIAcLt7ZTBCD1DQ=;
 b=f+Xzhs8XVd2M38Ets6yndM0ltAIzcmjNMbcveo5p6/oC/6cM0IkOwi//sB+me0HM/X
 W15biVormQHyiU41FoD+dtham4OQM2Iusp3wI6j/rulbriPtK5pNqo23oI8+dJFTk23c
 PR/ZqMH6aR1IJT0ecKaJ2v2QoNSs1036131P0LFE8yCXbyH/QBNiayFCyb/3YLm/vUjP
 zLRunHNhiWYaELrBTipeQG9oQoWFu4oTbqWYhPLVEjr0xRQEfbxrmohoYMZCFqGJCWhj
 dMavPVG3mYgRYu7J7rHLGhfpEFTK1tVd4x1xUtl1jDkxYvzjTNCyH7M4yQa5YjTST+lI
 c7lw==
X-Gm-Message-State: AOJu0YxV0za4pCcclDGTRmvyWLjF0RPzDM4aCq9cbs5fllpK2eBfxJlA
 e9yN935ZRQrzJTFIcJjjxmH+fV/NGfg=
X-Google-Smtp-Source: AGHT+IH6yOSeTU+piJFaAeH/y8fXTekFnjdNEFbkd/PdVWmLmFWvtPWlg0T87UgDDkE+wq+uqP1QCQ==
X-Received: by 2002:a1c:4b15:0:b0:3f5:fff8:d4f3 with SMTP id
 y21-20020a1c4b15000000b003f5fff8d4f3mr285880wma.7.1693513059866; 
 Thu, 31 Aug 2023 13:17:39 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 hn8-20020a05600ca38800b003fee6e170f9sm2888409wmb.45.2023.08.31.13.17.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 31 Aug 2023 13:17:39 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 31 Aug 2023 22:17:37 +0200
Message-ID: <20230831201737.509574-1-romain.naour@gmail.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693513060; x=1694117860; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zlQTLtmy0EeqrPTDuU1dgVV5yOaWCIAcLt7ZTBCD1DQ=;
 b=AfGZw5m5mXFvIy3x/hvPh2/qo5tTndxhSQxy3Aq+fgaSX3Tv8Ethm5LsoX9roKNXB0
 WEgfFHeE01vEirIeWxDqZ8NcnWF3BLcnvJz8h8BigkX5c7LIXMwoUMZDIltYXAwhm3k5
 qQXlV/vfMIrh/fzPlqLZxlfqwIvEXwfKWQ2rVL9Lc6xwjJbqGjopodeeKuCwHCDIyPCu
 sQ9hBC43qOMWSWfqROJmYf9wTafp3c+TwGm/GhZko5exTiTGoIb4+5I29EAFPvmRPNvc
 bvpBPyjRKnf65Ca9YqK2RUCgoEHeFHx/PyorOgbaRrbIMO4cqrseIEdNFyCj5pJhfKO8
 MYtw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=AfGZw5m5
Subject: [Buildroot] [PATCH] configs/beaglev_defconfig: fix build with
 binutils >= 2.38
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
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Backport an upstream patch fixing the build with binutils >= 2.38
for riscv's for Zicsr and Zifencei.

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4987456149

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 ...iscv-Fix-build-against-binutils-2.38.patch | 58 +++++++++++++++++++
 configs/beaglev_defconfig                     |  1 +
 2 files changed, 59 insertions(+)
 create mode 100644 board/beaglev/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch

diff --git a/board/beaglev/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch b/board/beaglev/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch
new file mode 100644
index 0000000000..52b496f054
--- /dev/null
+++ b/board/beaglev/patches/uboot/0001-riscv-Fix-build-against-binutils-2.38.patch
@@ -0,0 +1,58 @@
+From 0cf11f3c0478f4286adcfb09bf9137f8b00212e3 Mon Sep 17 00:00:00 2001
+From: Alexandre Ghiti <alexandre.ghiti@canonical.com>
+Date: Mon, 3 Oct 2022 18:07:54 +0200
+Subject: [PATCH] riscv: Fix build against binutils 2.38
+
+The following description is copied from the equivalent patch for the
+Linux Kernel proposed by Aurelien Jarno:
+
+>From version 2.38, binutils default to ISA spec version 20191213. This
+means that the csr read/write (csrr*/csrw*) instructions and fence.i
+instruction has separated from the `I` extension, become two standalone
+extensions: Zicsr and Zifencei. As the kernel uses those instruction,
+this causes the following build failure:
+
+arch/riscv/cpu/mtrap.S: Assembler messages:
+arch/riscv/cpu/mtrap.S:65: Error: unrecognized opcode `csrr a0,scause'
+arch/riscv/cpu/mtrap.S:66: Error: unrecognized opcode `csrr a1,sepc'
+arch/riscv/cpu/mtrap.S:67: Error: unrecognized opcode `csrr a2,stval'
+arch/riscv/cpu/mtrap.S:70: Error: unrecognized opcode `csrw sepc,a0'
+
+Signed-off-by: Alexandre Ghiti <alexandre.ghiti@canonical.com>
+Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
+Tested-by: Heinrich Schuchardt <heinrich.schuchardt@canonical.com>
+Tested-by: Heiko Stuebner <heiko@sntech.de>
+Tested-by: Christian Stewart <christian@paral.in>
+Reviewed-by: Rick Chen <rick@andestech.com>
+(cherry picked from commit 1dde977518f13824b847e23275001191139bc384)
+Upstream: https://gitlab.com/u-boot/u-boot/-/commit/1dde977518f13824b847e23275001191139bc384
+Signed-off-by: Romain Naour <romain.naour@gmail.com>
+---
+ arch/riscv/Makefile | 11 ++++++++++-
+ 1 file changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/arch/riscv/Makefile b/arch/riscv/Makefile
+index 0b80eb8d864..53d1194ffb6 100644
+--- a/arch/riscv/Makefile
++++ b/arch/riscv/Makefile
+@@ -24,7 +24,16 @@ ifeq ($(CONFIG_CMODEL_MEDANY),y)
+ 	CMODEL = medany
+ endif
+ 
+-ARCH_FLAGS = -march=$(ARCH_BASE)$(ARCH_A)$(ARCH_C) -mabi=$(ABI) \
++RISCV_MARCH = $(ARCH_BASE)$(ARCH_A)$(ARCH_C)
++
++# Newer binutils versions default to ISA spec version 20191213 which moves some
++# instructions from the I extension to the Zicsr and Zifencei extensions.
++toolchain-need-zicsr-zifencei := $(call cc-option-yn, -mabi=$(ABI) -march=$(RISCV_MARCH)_zicsr_zifencei)
++ifeq ($(toolchain-need-zicsr-zifencei),y)
++	RISCV_MARCH := $(RISCV_MARCH)_zicsr_zifencei
++endif
++
++ARCH_FLAGS = -march=$(RISCV_MARCH) -mabi=$(ABI) \
+ 	     -mcmodel=$(CMODEL)
+ 
+ PLATFORM_CPPFLAGS	+= $(ARCH_FLAGS)
+-- 
+2.41.0
+
diff --git a/configs/beaglev_defconfig b/configs/beaglev_defconfig
index 42c732b973..a76c1ffb5f 100644
--- a/configs/beaglev_defconfig
+++ b/configs/beaglev_defconfig
@@ -40,3 +40,4 @@ BR2_TARGET_UBOOT_CUSTOM_TARBALL_LOCATION="$(call github,starfive-tech,u-boot,64e
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="starfive_vic7100_beagle_v_smode"
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_JH71XX_TOOLS=y
+BR2_GLOBAL_PATCH_DIR="board/beaglev/patches"
-- 
2.41.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
