Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0121D59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 16:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6E13C816D8;
	Sat, 13 Dec 2025 16:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id r81sK0A_TrTx; Sat, 13 Dec 2025 16:40:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 479F981772
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765644022;
	bh=S8iFoikP3bqIPpB6vtx2vbubqlmx9GFRndNTYjl6Wlg=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=Kh6ezwhVm4M7rjAQAjXp9+lQIIBS+s5B4XJTRoSySaFODUAlNFP9EtMjBDHwg+i12
	 bNyFUH679vMlhkCVfEd8XyNBYGbjK/tsNoMEOYj9KRzgGDcepGjHhqboRiqNCVJWbB
	 25Y9NBpDGKeXx/bCDdNPFz43xT1H2YSd/kSq7y+IMr770Cnz5dTk5jVtSMTPqjkty+
	 VxyIp3bdyqXVd2Zt49/elhE1miz0KRTyppt5ZtEFHtKasYqHwRvW+BMZFogxVKMx61
	 joK9QOT9ot7goMdl/QjzvBgdG/m43V/o49F9QcBXFsAcTyJoDTGRMabJfD6xlKPmSB
	 IXkS+Vrw1/V7A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 479F981772;
	Sat, 13 Dec 2025 16:40:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 56D1013D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:40:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3D39C60860
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:40:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ModQ3rpdLtpk for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 16:40:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0972160859
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0972160859
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 16:40:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EAB6086D80; Sat, 13 Dec 2025 16:40:18 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 17:39:02 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0f303f3abc4dff953f249eb137edfc389e774320
X-Git-Newrev: 2d570f8369342590836378e86e3d2a65f7fb6fc3
X-Patchwork-Hint: ignore
Message-Id: <20251213164018.EAB6086D80@busybox.osuosl.org>
Subject: [Buildroot] [git commit] arch: drop support for ARC big-endian
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

commit: https://git.buildroot.net/buildroot/commit/?id=2d570f8369342590836378e86e3d2a65f7fb6fc3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Alexey Brodkin from Synopsys says in [1]:

  I think indeed, we may remove all the big-endian support for ARC.
  Reasons are since introduction of ARC HS4x processors we no longer
  support big-endian in any new processor IP, and even for older IP
  which used to support big-endian it was rarely used... so basically
  there's no good justification to spend any cycles on big-endian
  support looking forward in this project.  I.e. BE support in uClibc
  could also be removed if it makes any difference.

Therefore, let's removed support for ARC big-endian.

[1] https://lore.kernel.org/buildroot/SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com/

Cc: Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Maxim Kochetkov <fido_max@inbox.ru>
[Julien:
 - move legacy option to 2026.02 section
 - add link to mailing list
 - remove BR2_arceb from pkg-meson.mk to fix check-symbols error
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in.legacy                                               |  9 +++++++++
 arch/Config.in                                                 | 10 +---------
 arch/Config.in.arc                                             |  8 +++-----
 linux/Config.in                                                |  2 +-
 package/dhcpcd/Config.in                                       |  2 +-
 package/fluent-bit/Config.in                                   |  2 +-
 package/kodi/kodi.mk                                           |  2 +-
 package/libspdm/Config.in                                      |  2 +-
 package/oprofile/Config.in                                     |  2 +-
 package/pkg-meson.mk                                           |  2 +-
 package/swipl/Config.in                                        |  2 +-
 package/uclibc/Config.in                                       |  3 +--
 package/z3/Config.in                                           |  2 +-
 toolchain/toolchain-external/pkg-toolchain-external.mk         |  4 ----
 .../toolchain-external-synopsys-arc/Config.in.options          |  3 +--
 15 files changed, 24 insertions(+), 31 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index b2adbc2277..da91b68087 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -159,6 +159,15 @@ config BR2_BINUTILS_VERSION_2_42_X
 	  binutils 2.42 has been removed, select a newer version
 	  instead.
 
+config BR2_arceb
+	bool "ARC big endian support removed"
+	select BR2_LEGACY
+	help
+	  Synopsys' DesignWare ARC Processor Cores are a family of
+	  32-bit CPUs that can be used from deeply embedded to high
+	  performance host applications. The big endian support was
+	  not used nor maintained, so it was removed.
+
 comment "Legacy options removed in 2025.11"
 
 config BR2_KERNEL_HEADERS_5_4
diff --git a/arch/Config.in b/arch/Config.in
index 34422c0d50..9b8ab20ffc 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -29,14 +29,6 @@ config BR2_arcle
 	  32-bit CPUs that can be used from deeply embedded to high
 	  performance host applications. Little endian.
 
-config BR2_arceb
-	bool "ARC (big endian)"
-	select BR2_USE_MMU
-	help
-	  Synopsys' DesignWare ARC Processor Cores are a family of
-	  32-bit CPUs that can be used from deeply embedded to high
-	  performance host applications. Big endian.
-
 config BR2_arm
 	bool "ARM (little endian)"
 	# MMU support is set by the subarchitecture file, arch/Config.in.arm
@@ -385,7 +377,7 @@ config BR2_BINFMT_SUPPORTS_SHARED
 config BR2_READELF_ARCH_NAME
 	string
 
-if BR2_arcle || BR2_arceb
+if BR2_arcle
 source "arch/Config.in.arc"
 endif
 
diff --git a/arch/Config.in.arc b/arch/Config.in.arc
index f367c49131..7dd564d7f7 100644
--- a/arch/Config.in.arc
+++ b/arch/Config.in.arc
@@ -59,19 +59,17 @@ config BR2_ARC_ATOMIC_EXT
 	default y if BR2_archs4x_rel31 || BR2_archs4x
 
 config BR2_ARCH
-	default "arc"	if BR2_arcle
-	default "arceb"	if BR2_arceb
+	default "arc"
 
 config BR2_NORMALIZED_ARCH
 	default "arc"
 
 config BR2_arc
 	bool
-	default y if BR2_arcle || BR2_arceb
+	default y
 
 config BR2_ENDIAN
-	default "LITTLE" if BR2_arcle
-	default "BIG"	 if BR2_arceb
+	default "LITTLE"
 
 config BR2_GCC_TARGET_CPU
 	default "arc700" if BR2_arc750d
diff --git a/linux/Config.in b/linux/Config.in
index 7b1c9b61a2..e7dc576509 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -180,7 +180,7 @@ config BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG
 	# version. This is mainly needed to fix autobuilder testing.
 	select BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL if \
 	       BR2_LINUX_KERNEL_LATEST_VERSION && \
-	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || BR2_arceb || \
+	       (BR2_aarch64 || BR2_aarch64_be || BR2_arcle || \
 	        BR2_or1k || BR2_riscv || BR2_sparc || BR2_x86_64)
 	help
 	  This option will use the default configuration for the
diff --git a/package/dhcpcd/Config.in b/package/dhcpcd/Config.in
index dda93ba1cb..0d72340ffe 100644
--- a/package/dhcpcd/Config.in
+++ b/package/dhcpcd/Config.in
@@ -16,7 +16,7 @@ config BR2_PACKAGE_DHCPCD_ENABLE_PRIVSEP
 	default y
 	depends on BR2_USE_MMU
 	# Audit headers were only added in recent kernels for some arches
-	depends on !(BR2_arceb || BR2_arcle) || \
+	depends on !BR2_arcle || \
 		BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_2
 	depends on !(BR2_microblazeel || BR2_microblazebe) || \
 		BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18
diff --git a/package/fluent-bit/Config.in b/package/fluent-bit/Config.in
index aeae034b2a..2af6279744 100644
--- a/package/fluent-bit/Config.in
+++ b/package/fluent-bit/Config.in
@@ -23,7 +23,7 @@ if BR2_PACKAGE_FLUENT_BIT
 config BR2_PACKAGE_FLUENT_BIT_WASM_ARCH
 	string
 	default "AARCH64"    if BR2_aarch64 || BR2_aarch64_be
-	default "ARC"        if BR2_arcle || BR2_arceb
+	default "ARC"        if BR2_arcle
 	default "ARM"        if BR2_arm || BR2_armeb
 	default "MIPS"       if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default "RISCV32"    if BR2_riscv && BR2_RISCV_32
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 57bfcff555..c31e789503 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -146,7 +146,7 @@ KODI_DEPENDENCIES += libiconv
 KODI_EXTRA_LIBS += -liconv
 endif
 
-ifeq ($(BR2_arceb)$(BR2_arcle),y)
+ifeq ($(BR2_arcle),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arc -DWITH_CPU=arc
 else ifeq ($(BR2_armeb),y)
 KODI_CONF_OPTS += -DWITH_ARCH=arm -DWITH_CPU=arm
diff --git a/package/libspdm/Config.in b/package/libspdm/Config.in
index 56c55f9c4d..e51634e896 100644
--- a/package/libspdm/Config.in
+++ b/package/libspdm/Config.in
@@ -1,6 +1,6 @@
 config BR2_PACKAGE_LIBSPDM_CPU_FAMILY
 	string
-	# OpenSSL doesn't support "arc" (BR2_arcle || BR2_arceb), "arm"
+	# OpenSSL doesn't support "arc" (BR2_arcle), "arm"
 	# (if BR2_arm || BR2_armeb) or "riscv32"/"riscv6"
 	# (BR2_riscv && BR2_RISCV_32/BR2_RISCV_64). So we don't
 	# support those here
diff --git a/package/oprofile/Config.in b/package/oprofile/Config.in
index eca43d7ac3..df167e278a 100644
--- a/package/oprofile/Config.in
+++ b/package/oprofile/Config.in
@@ -2,7 +2,7 @@
 config BR2_PACKAGE_OPROFILE_ARCH_SUPPORTS
 	bool
 	default y
-	depends on BR2_arceb || BR2_arcle || BR2_arm || BR2_armeb || \
+	depends on BR2_arcle || BR2_arm || BR2_armeb || \
 		BR2_aarch64 || BR2_aarch64_be || BR2_i386 || BR2_mips || \
 		BR2_mipsel || BR2_mips64 || BR2_mips64el || BR2_powerpc || \
 		BR2_powerpc64 || BR2_powerpc64le || BR2_s390x || BR2_sh || \
diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
index 30271e35e5..f2efbae2eb 100644
--- a/package/pkg-meson.mk
+++ b/package/pkg-meson.mk
@@ -30,7 +30,7 @@ NINJA		= PYTHONNOUSERSITE=y $(HOST_DIR)/bin/ninja
 NINJA_OPTS	= $(if $(VERBOSE),-v)
 
 # https://mesonbuild.com/Reference-tables.html#cpu-families
-ifeq ($(BR2_arcle)$(BR2_arceb),y)
+ifeq ($(BR2_arcle),y)
 PKG_MESON_TARGET_CPU_FAMILY = arc
 else ifeq ($(BR2_arm)$(BR2_armeb),y)
 PKG_MESON_TARGET_CPU_FAMILY = arm
diff --git a/package/swipl/Config.in b/package/swipl/Config.in
index 8bf58344b3..95f3e57770 100644
--- a/package/swipl/Config.in
+++ b/package/swipl/Config.in
@@ -5,7 +5,7 @@
 config BR2_PACKAGE_SWIPL_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_arceb || BR2_arcle
+	default y if BR2_arcle
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386
 	default y if BR2_m68k
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 4c360809c3..6b8b0d86f8 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -3,7 +3,6 @@ config BR2_PACKAGE_UCLIBC_ARCH_SUPPORTS
 	default y if BR2_aarch64
 	default y if BR2_aarch64_be
 	default y if BR2_arcle
-	default y if BR2_arceb
 	default y if BR2_arm
 	default y if BR2_armeb
 	default y if BR2_i386
@@ -126,7 +125,7 @@ config BR2_UCLIBC_INSTALL_UTILS
 config BR2_UCLIBC_TARGET_ARCH
 	string
 	default "aarch64"  if BR2_aarch64 || BR2_aarch64_be
-	default "arc"	   if BR2_arcle || BR2_arceb
+	default "arc"	   if BR2_arcle
 	default "arm"	   if BR2_arm	|| BR2_armeb
 	default "m68k"	   if BR2_m68k
 	default "microblaze"   if BR2_microblaze
diff --git a/package/z3/Config.in b/package/z3/Config.in
index 3afb8a6a22..2ef2e3eb89 100644
--- a/package/z3/Config.in
+++ b/package/z3/Config.in
@@ -5,7 +5,7 @@
 config BR2_PACKAGE_Z3_ARCH_SUPPORTS
 	bool
 	default y if BR2_aarch64 || BR2_aarch64_be
-	default y if BR2_arceb || BR2_arcle
+	default y if BR2_arcle
 	default y if BR2_arm || BR2_armeb
 	default y if BR2_i386
 	default y if BR2_m68k
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index 2c2afa76c0..270cf814ed 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -237,10 +237,6 @@ ifeq ($(BR2_mips)$(BR2_mips64),y)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_MIPS_TARGET_BIG_ENDIAN
 TOOLCHAIN_EXTERNAL_CFLAGS += -EB
 endif
-ifeq ($(BR2_arceb),y)
-TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARC_TARGET_BIG_ENDIAN
-TOOLCHAIN_EXTERNAL_CFLAGS += -EB
-endif
 
 TOOLCHAIN_EXTERNAL_CFLAGS += $(call qstrip,$(BR2_TARGET_OPTIMIZATION))
 
diff --git a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
index 4b4482106c..c60cf73460 100644
--- a/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options
@@ -33,8 +33,7 @@ config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARCHS_GLIBC
 endchoice
 
 config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "arc-linux"		 if BR2_arcle
-	default "arceb-linux"		 if BR2_arceb
+	default "arc-linux"
 
 config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
 	default "toolchain-external-synopsys-arc"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
