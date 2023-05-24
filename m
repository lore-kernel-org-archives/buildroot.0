Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7ECFC77B73
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 09:49:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D6386159D;
	Wed, 24 May 2023 09:49:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5D6386159D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OVPYE7aX9hNR; Wed, 24 May 2023 09:49:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52EA46119B;
	Wed, 24 May 2023 09:49:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 52EA46119B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DB8941BF38C
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 09:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B4A536119B
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 09:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B4A536119B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CrOoRkd3zW06 for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 09:49:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C6FF61174
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C6FF61174
 for <buildroot@buildroot.org>; Wed, 24 May 2023 09:49:13 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-3f6094cb2ebso6124195e9.3
 for <buildroot@buildroot.org>; Wed, 24 May 2023 02:49:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684921751; x=1687513751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RGZAfauUvrrHOFTNQLIEFPH0J1y4u6Rfl0K5imoeiOI=;
 b=N8JUP8Liw72foznmI0C2yPk3TaWYRWGdg/1Ok6/8YW3Ejbr5iNWkkaROqb1RcZ57ht
 5EMBbqueD+y35hMXJjZMeZlqU1B7NgkHWadPLGe85FgQBAz4w6ghRdqkJvoAyKMCQTKf
 C6WLoIDplL0ZGzTI5UPmYABRON8WtvPT/viOvrBJr0vgT4hu2U6ZsgkFBEPdbUUNl09K
 6/XY7LzJY4fxzqhJZyfzGirmv8DumFWDV98VacIa03Op+5hXjKQUOy5Q45JO4AM0U2WU
 pRUxacqgjJ+EwBRttMEnaEJDsLnMtojqR5ESe5MlEQF6HPtOwQmol6Z95QU6n86d3EHy
 E4Fg==
X-Gm-Message-State: AC+VfDzl+iPobDycEKaowmeF2ifNBVb6qplgGwZtynr3wdAPPhRQAzRw
 OBOIVMNYS8XxZsInwPFQOPCv6NufoCi4BK5vcSQ=
X-Google-Smtp-Source: ACHHUZ4upfar6hGCXjdVo7cPCeK3NalgwTzOEwmRQnnL+SHzQPinMeuvgar+hnuO+fVLNa8XVizWfQ==
X-Received: by 2002:a05:600c:3784:b0:3f6:69f:75e0 with SMTP id
 o4-20020a05600c378400b003f6069f75e0mr6837528wmr.25.1684921751417; 
 Wed, 24 May 2023 02:49:11 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05945b7e009bdc688723a24f31.ipv6.abo.wanadoo.fr.
 [2a01:cb05:945b:7e00:9bdc:6887:23a2:4f31])
 by smtp.gmail.com with ESMTPSA id
 k10-20020a7bc40a000000b003f606869603sm1760601wmi.6.2023.05.24.02.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 02:49:11 -0700 (PDT)
From: Romain Naour <romain.naour@smile.fr>
To: buildroot@buildroot.org
Date: Wed, 24 May 2023 11:49:08 +0200
Message-Id: <20230524094908.80784-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.34.3
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile-fr.20221208.gappssmtp.com; s=20221208; t=1684921751; x=1687513751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RGZAfauUvrrHOFTNQLIEFPH0J1y4u6Rfl0K5imoeiOI=;
 b=Jawv/P28eEb/XtBC7I7dbl4a8uFLRRXxjL9MyYk+ORPSvhBC3t2pF1BIPrHfpysMAZ
 gjRBtAYqv3RD4sy4teTJ33/2EN4/HnZlSMuLD92X8LDrv07M8ld1SxUVee0LCgKH/Med
 SEbV4KSoS0JyBLpSmSzJi2TfJN9XpEEQY0ovWRdOPWmfsTw6+lQq/ANYnHu4WC1rb6xz
 yJKmNXZKBWEjhiIVnfs3kX38efICxPGxSg01WyP4bB/vaNiIBFiPQmk6YHxNAOZ99g7B
 1BEK2+5pJYbQAf0DFiZLIcBiVsfYgH7/ZU/+bHEHRayWEVT/BA/2RdjIFrXHKaoy559p
 KY2Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=smile-fr.20221208.gappssmtp.com
 header.i=@smile-fr.20221208.gappssmtp.com header.a=rsa-sha256
 header.s=20221208 header.b=Jawv/P28
Subject: [Buildroot] [PATCH] configs/qemu_ppc_mpc8544ds_defconfig: remove
 kernel patch
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
Cc: Romain Naour <romain.naour@smile.fr>,
 Sebastian Weyer <sebastian.weyer@smile.fr>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The ppc-mpc8544ds is the only qemu configuration that requires a kernel patch:
board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch

But this patch doesn't apply after a backport between v6.1.20 and v6.1.21

https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=da0beae2449376326086e9f57468fd2b64736d2a

So the patch 0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch doesn't
seem required anymore.

 Welcome to Buildroot
 buildroot login: root
 # uname -a
 Linux buildroot 6.1.28 #1 Wed May 24 09:08:27 UTC 2023 ppc GNU/Linux
 # cat /proc/cpuinfo
 processor	: 0
 cpu		: e500v2
 clock		: 400.000000MHz
 revision	: 3.0 (pvr 8021 0030)
 bogomips	: 800.00

 timebase	: 400000000
 platform	: MPC8544 DS
 model		: MPC8544DS
 Memory		: 128 MB

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895282
https://bugs.busybox.net/show_bug.cgi?id=15581

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>
---
 .checkpackageignore                           |  1 -
 ...x-mcpu-options-for-SPE-only-compiler.patch | 53 -------------------
 configs/qemu_ppc_mpc8544ds_defconfig          |  1 -
 3 files changed, 55 deletions(-)
 delete mode 100644 board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch

diff --git a/.checkpackageignore b/.checkpackageignore
index 947f4606aa..f2dea0dfd9 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -74,7 +74,6 @@ board/pine64/rockpro64/post-build.sh Shellcheck
 board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
 board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch Upstream
 board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch Upstream
-board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch Upstream
 board/qemu/x86/post-build.sh Shellcheck
 board/qemu/x86_64/post-build.sh Shellcheck
 board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch Upstream
diff --git a/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch b/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
deleted file mode 100644
index b8c8a72587..0000000000
--- a/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
+++ /dev/null
@@ -1,53 +0,0 @@
-From a0919e3177295f4aaa9006915adcddc31788d809 Mon Sep 17 00:00:00 2001
-From: Ben Hutchings <ben@decadent.org.uk>
-Date: Wed, 26 Dec 2018 00:00:40 +0000
-Subject: [PATCH] powerpc: Fix -mcpu= options for SPE-only compiler
-
-GCC for Debian's "powerpcspe" architecture only supports 32-bit
-SPE targets, and using -mcpu=powerpc or -mcpu=powerpc64 is a fatal
-error.
-
-* Change the test for a biarch compiler to pass both the -m32 and -m64
-  options, so that it doesn't catch 32-bit-only compilers
-* Add an ifdef CONFIG_PPC64 around the 64-bit CPU option definitions
-
-Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
-[Romain: Patch from Debian repository:
-https://salsa.debian.org/kernel-team/linux/-/blob/buster/debian/patches/bugfix/powerpc/powerpc-fix-mcpu-options-for-spe-only-compiler.patch]
-Signed-off-by: Romain Naour <romain.naour@gmail.com>
----
- arch/powerpc/Makefile | 4 +++-
- 1 file changed, 3 insertions(+), 1 deletion(-)
-
-diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
-index 5c8c06215dd4..e3dbea6d7ae0 100644
---- a/arch/powerpc/Makefile
-+++ b/arch/powerpc/Makefile
-@@ -12,7 +12,7 @@
- # Rewritten by Cort Dougan and Paul Mackerras
- #
- 
--HAS_BIARCH	:= $(call cc-option-yn, -m32)
-+HAS_BIARCH	:= $(call cc-option-yn, -m32 -m64)
- 
- # Set default 32 bits cross compilers for vdso and boot wrapper
- CROSS32_COMPILE ?=
-@@ -164,6 +164,7 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
- 
- CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
- 
-+ifdef CONFIG_PPC64
- ifdef CONFIG_PPC_BOOK3S_64
- ifdef CONFIG_CPU_LITTLE_ENDIAN
- CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power8
-@@ -175,6 +176,7 @@ endif
- else
- CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
- endif
-+endif
- 
- ifdef CONFIG_FUNCTION_TRACER
- CC_FLAGS_FTRACE := -pg
--- 
-2.17.1
-
diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
index ca1a429167..6d8a214e05 100644
--- a/configs/qemu_ppc_mpc8544ds_defconfig
+++ b/configs/qemu_ppc_mpc8544ds_defconfig
@@ -3,7 +3,6 @@ BR2_powerpc=y
 BR2_powerpc_8548=y
 
 # System
-BR2_GLOBAL_PATCH_DIR="board/qemu/ppc-mpc8544ds/patches"
 BR2_SYSTEM_DHCP="eth0"
 
 # Filesystem
-- 
2.34.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
