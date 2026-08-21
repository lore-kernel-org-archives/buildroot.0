Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB41FC5DF93
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:08:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CE8A81414;
	Fri, 21 Aug 2026 15:08:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RkK8lmUDBnU6; Fri, 21 Aug 2026 15:08:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787324897;
	bh=ZqssSYZ9q1AMCwF0iBtakferSJKsPqpSGGqf9x+InG8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=J22Uxi2FZuvEIm9dN1uOuU6ZJVMTGytm//8qHiP92wos4szqc4k9SYG3urVdp/NVV
	 aJNIjY5feTCWW4FDcR+nuNzXCg2IEt3WY0SnY2ndNtXvfg7YYWuMkeUPhk3MXMmCM7
	 y5gb46yIY35oe1dkxdONaD7nybnEvak3siSX3653T4XL8E5QS0CMMwIGcAe3hJtrHY
	 OE8yT52D05Wd3Tt57FGtfpVeHfv999y9Nv3FTuc12Te2/1hUnKspI8trsN/8qFnuQQ
	 RxkKRAD/sZFPj92bfTqvhx4UZtXZCbIVgBNz+/r1gXnTM1okSsHKL+ghrjQlDMlJN2
	 54t56sTLb40nQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14544813F8;
	Fri, 21 Aug 2026 15:08:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3F6E529B
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2D7DE40026
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6m_Mi9UBLnsN for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:07:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8A27E4041C
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:07:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A5398E127; Fri, 21 Aug 2026 15:06:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 21 Aug 2026 17:04:28 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 2dfa94ec02e8547489017e52f46b97e423248f20
X-Git-Newrev: 2a57b580a71fa3bb4df9af6c9f94be48e66f5416
X-Patchwork-Hint: ignore
Message-Id: <20260821150615.0A5398E127@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 toolchain/toolchain-external: drop Synopsys ARC toolchain
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2a57b580a71fa3bb4df9af6c9f94be48e66f5416
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

This toolchain is from 2024.06 and has not been updated since then. It
was marked as broken in commit 11a8cdd2bbbd0ef4adf600e4792d75f6f2122ec8
in January 2025.

A warning was sent to Synopsys ARC people in December 2025, and
despite a reply that some effort would be made [1], no contributions
were actually done. Also, Alexey Brodkin is no longer at
Synopsys. Time to remove Synopsys ARC specific toolchain and toolchain
components.

[1] https://lore.kernel.org/buildroot/SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com/

Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 22c38bbc1e48dc696a9639fa3d76b21cbf73e436)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy                                   |  7 ++++
 toolchain/toolchain-external/Config.in             |  6 ----
 .../toolchain-external-synopsys-arc/Config.in      | 18 ----------
 .../Config.in.options                              | 42 ----------------------
 .../toolchain-external-synopsys-arc.hash           |  7 ----
 .../toolchain-external-synopsys-arc.mk             | 29 ---------------
 6 files changed, 7 insertions(+), 102 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 1b9bae78bb..649daaac72 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02.17"
 
+config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
+	bool "Synopsys ARC toolchain removed"
+	select BR2_LEGACY
+	help
+	  The Synopsys ARC external toolchain has been removed, as it
+	  was no longer maintained in Buildroot.
+
 config BR2_PACKAGE_TS4900_FPGA
 	bool "ts4900-fpga removed"
 	select BR2_LEGACY
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e91aa16326..6469dd63d9 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -16,9 +16,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in"
 
-# ARC
-source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
-
 # ARM (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in"
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
@@ -113,9 +110,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64/Config.in
 source "toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config.in.options"
 
-# ARC
-source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
-
 # ARM
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
deleted file mode 100644
index 07688a1416..0000000000
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in
+++ /dev/null
@@ -1,18 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-	bool "Synopsys ARC 2024.06 toolchain"
-	depends on BR2_arc750d || BR2_arc770d || \
-		BR2_archs38_64mpy || BR2_archs38_full || \
-		BR2_archs4x_rel31 || BR2_archs4x
-	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
-	# The toolchains have libncurses and libexpat in their
-	# sysroot, confusing Buildroot and causing build
-	# issues. Disable until the toolchains get fixed.
-	depends on BR2_BROKEN
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-	help
-	  Toolchain for the ARC cores, from
-	  https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
deleted file mode 100644
index 4b4482106c..0000000000
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
+++ /dev/null
@@ -1,42 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
-
-choice
-	prompt "Synopsys toolchain variant"
-
-config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700
-	bool "Linux/uClibc ARC 700"
-	depends on BR2_arc750d || BR2_arc770d
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-
-config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC
-	bool "Linux/uClibc ARC HS"
-	depends on BR2_archs38_64mpy || BR2_archs38_full || \
-		BR2_archs4x_rel31 || BR2_archs4x
-	select BR2_TOOLCHAIN_EXTERNAL_UCLIBC
-	select BR2_USE_WCHAR
-	select BR2_TOOLCHAIN_HAS_THREADS
-	select BR2_TOOLCHAIN_HAS_THREADS_NPTL
-	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-
-config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC
-	bool "Linux/glibc ARC HS"
-	depends on BR2_archs38_64mpy || BR2_archs38_full || \
-		BR2_archs4x_rel31 || BR2_archs4x
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_FORTRAN
-
-endchoice
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "arc-linux"		 if BR2_arcle
-	default "arceb-linux"		 if BR2_arceb
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-synopsys-arc"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
deleted file mode 100644
index 52273871ab..0000000000
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.hash
+++ /dev/null
@@ -1,7 +0,0 @@
-# From https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/tag/arc-2024.06-release
-sha256  080bbf8c0747d221314d04b0fcef89f91dc82710afa1aa66a88f04c93719663a  arc_gnu_2024.06_prebuilt_uclibc_le_arc700_linux_install.tar.bz2
-sha256  37ad59b2624608cd126fab3a83a188edc18ad9e2bba8bbb778d46cdd49ad2ffe  arc_gnu_2024.06_prebuilt_glibc_le_archs_linux_install.tar.bz2
-sha256  6867bc6f895c29b053020423923ead2054b8474816f1d067f2726b13e8ee16c0  arc_gnu_2024.06_prebuilt_uclibc_le_archs_linux_install.tar.bz2
-sha256  6efd9025e4b226bf1b4a4d448670e00f928e61e0051a0b209b7adaa327945a32  arc_gnu_2024.06_prebuilt_uclibc_be_arc700_linux_install.tar.bz2
-sha256  ae2ffb5fbe8d6002341dd87d005400010e85dfc1df1e8db070a19ab7300d738f  arc_gnu_2024.06_prebuilt_glibc_be_archs_linux_install.tar.bz2
-sha256  892a576acdf962afafde345d2c830317cb14ff8ef95da7cadc79177c226db269  arc_gnu_2024.06_prebuilt_uclibc_be_archs_linux_install.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk b/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
deleted file mode 100644
index c88ca35c43..0000000000
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/toolchain-external-synopsys-arc.mk
+++ /dev/null
@@ -1,29 +0,0 @@
-################################################################################
-#
-# toolchain-external-synopsys-arc
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION = 2024.06
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SITE = https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/releases/download/arc-$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)-release
-
-ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC700),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = arc700
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = uclibc
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_UCLIBC),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = archs
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = uclibc
-else ifeq ($(BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE = archs
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC = glibc
-endif
-
-ifeq ($(BR2_arcle),y)
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS = le
-else
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS = be
-endif
-
-TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_SOURCE = arc_gnu_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_VERSION)_prebuilt_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_LIBC)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_ENDIANESS)_$(TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC_CORE)_linux_install.tar.bz2
-
-$(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
