Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7FDA606A844
	for <buildroot@archiver.kernel.org>; Wed,  4 Nov 2026 22:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=UtKOufE4
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B577181188;
	Wed,  4 Nov 2026 22:33:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id evm-ObLX4N_c; Wed,  4 Nov 2026 22:33:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 9AB54811AA
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793831583;
	b=YAkK/5HIUDVbP8H2JWvVi+OBijWUWkj6H5M1rJlgW3Hrjo5UXh06u+igp4bKGeA8YcCq
	 /ig+f/zifbSrd0KAU2EGcaYfuKP477mupT5Qb2QhQ/O82TNPYZM6XtGBhMqKsmKFW8AVo
	 2WMPnGnlgODjqHDKye0f40DEMXmqppzo8r4KEPvigUl//fnNmbt/XCzDkA5NzmzXX5eFv
	 juJx1J4vp+rtgUjgXj6rLbU45PMUxS+96KU0qvCRQnbNzesCYmqlNIVPs7exUjWpRVM92
	 iraKp4+zeIF9Bg2PeFrosWZnVuUt/z08d2S0iPRzNchl2+KCHFkr6uHxr++BYmf91/w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793831583;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=WSLRwueeiB6SjMsHiJXiOXlXFHkbTeInEKGSg8tP6fc=;
	b=ZQGRhK6lvdDWGy3bxJYURz2s1alP+ytWSIL0NT9YJQGg+lqBcH5m0vfR5QNx9zcyQDNO
	 tWUsi+LXOB6wMv4to//iJxJLos8B1fnWEhgl305kl0FDsqElIU6cuYNMhagYp5KTaXaI4
	 fB9Xr18YQMrPOyf2MwGeE1LgMkJ2puw5XMIYR/NrFjG8IdymTQosP0TSxA7tkiiAHQ/4N
	 /wX5y1JI4V1u8QK1D7LAw66EDc3eRUDJ7hRh21uwXF1DTnqLoWUsklFrQL0HefR9I03Ua
	 QgmI8fksTM9poS33Gmrjxnxx8EAV0cvQV+MDY/ukdGb/piKICNWGms5RwXdQqXLdgKQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793831583;
	bh=WSLRwueeiB6SjMsHiJXiOXlXFHkbTeInEKGSg8tP6fc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=UtKOufE4WpDlWEoxWX6l2nBnobSHONM2UzRLBshQuGn9AG+B+3QqGoW6s7NPYbyQd
	 jh7A2mIIKOY2HSYBXn14lpcl3x+gDNUXRCA7fJ3Mfd3QfPFf5l+5Hv0rxgakl+WstG
	 gOhQ9JcWI3QYY/Ufh+znOyml3HHtSsL4o06X6UAn3m5wtIP6Rb0yemdN2RSamlNP2Y
	 T6Si+U5vhywsyYYmvSADsdhT9fxDxNEeGWEbxMfwbyJmnaf3Qf22CUUTj2klx/nwab
	 3gLIh9GD93ORvf/oHsD8N5VCgwUAlHX9cg/IIyKDQdqVXFlYUi5cYeHO9Kyhjf/Dc5
	 U6RXl6R39V5Hg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9AB54811AA;
	Wed,  4 Nov 2026 22:33:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2064E362
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:32:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 11E0640867
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:32:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2EWYBJXfUIaL for <buildroot@buildroot.org>;
 Wed,  4 Nov 2026 22:32:58 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org EF95B40866
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF95B40866
 for <buildroot@buildroot.org>; Wed,  4 Nov 2026 22:32:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EE96B9DF1A; Wed,  4 Nov 2026 22:31:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 4 Nov 2026 23:32:09 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 169eb3eeeafafb7dc5d98f5631a3ccedb17cbf0a
X-Git-Newrev: 47d9c8aa1b873dc7c0fa751dc856d8138dccf60c
X-Patchwork-Hint: ignore
Message-Id: <20261104223126.EE96B9DF1A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: bump CIP kernel to version
 6.12.114-cip34
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-21.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/47d9c8aa1b873dc7c0fa751dc856d8138dccf60c
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Move the CIP SLTS option from the 5.10 series to 6.12, the latest CIP
SLTS kernel.

CIP does not provide a separate real-time kernel for its 6.12 SLTS
series, as PREEMPT_RT is part of mainline Linux since 6.12: the CIP RT
releases stop at the 6.1 and 5.10 series. So remove the CIP RT option,
and point its users to the CIP kernel with CONFIG_PREEMPT_RT enabled.
The microblaze build fix only applied to the CIP RT kernel and goes
away with it.

Linux supports loongarch64 since 5.19, so the CIP option no longer
needs to exclude it.

Signed-off-by: Angelo Compagnucci <angelo.compagnucci@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                                   | 10 ++++++
 .../0001-arch-microblaze-mm-init.c-fix-build.patch | 37 ----------------------
 linux/5.10.254-cip72-rt32/linux.hash               |  1 -
 linux/{5.10.254-cip72 => 6.12.114-cip34}           |  0
 linux/Config.ext.in                                |  1 -
 linux/Config.in                                    | 28 ++++------------
 linux/before-6.17/linux.hash                       |  3 +-
 linux/linux.mk                                     |  2 +-
 package/linux-headers/5.10.254-cip72-rt32          |  1 -
 .../{5.10.254-cip72 => 6.12.114-cip34}             |  0
 package/linux-headers/linux-headers.mk             |  2 +-
 11 files changed, 20 insertions(+), 65 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a238369785..970b587a94 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,16 @@ endif
 
 comment "Legacy options removed in 2026.11"
 
+config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	bool "Latest CIP RT SLTS version has been removed"
+	select BR2_LEGACY
+	help
+	  The CIP RT SLTS kernel option has been removed. CIP does not
+	  provide a separate real-time kernel for its 6.12 SLTS series,
+	  as PREEMPT_RT is part of mainline Linux since 6.12. Use the
+	  latest CIP SLTS version and enable CONFIG_PREEMPT_RT in the
+	  kernel configuration instead.
+
 config BR2_PACKAGE_HTPDATE
 	bool "htpdate has been removed"
 	select BR2_LEGACY
diff --git a/linux/5.10.254-cip72-rt32/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/5.10.254-cip72-rt32/0001-arch-microblaze-mm-init.c-fix-build.patch
deleted file mode 100644
index d1124f4cda..0000000000
--- a/linux/5.10.254-cip72-rt32/0001-arch-microblaze-mm-init.c-fix-build.patch
+++ /dev/null
@@ -1,37 +0,0 @@
-From 1fc03e1fdc8bb606d1c95e9fa557a9e5f6df17ec Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 25 Feb 2023 17:26:56 +0100
-Subject: [PATCH] arch/microblaze/mm/init.c: fix build
-
-Fix the following build failure on microblaze raised since
-https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/commit/arch/microblaze/mm/init.c?h=v5.10.168-cip27-rt11&id=32ac92b5a39e2ef91308929bf5ed0804094b4183:
-
-arch/microblaze/mm/init.c:71:2: error: #endif without #if
-   71 | #endif /* CONFIG_HIGHMEM */
-      |  ^~~~~
-
-Fixes:
- - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33
-
-Upstream: sent to Sebastian Andrzej Siewior <bigeasy@linutronix.de>
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- arch/microblaze/mm/init.c | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
-index 1f4b5b34e600..a444778e59de 100644
---- a/arch/microblaze/mm/init.c
-+++ b/arch/microblaze/mm/init.c
-@@ -49,6 +49,7 @@ unsigned long lowmem_size;
- EXPORT_SYMBOL(min_low_pfn);
- EXPORT_SYMBOL(max_low_pfn);
- 
-+#ifdef CONFIG_HIGHMEM
- static void __init highmem_init(void)
- {
- 	pr_debug("%x\n", (u32)PKMAP_BASE);
--- 
-2.39.1
-
diff --git a/linux/5.10.254-cip72-rt32/linux.hash b/linux/5.10.254-cip72-rt32/linux.hash
deleted file mode 120000
index cde5626c0a..0000000000
--- a/linux/5.10.254-cip72-rt32/linux.hash
+++ /dev/null
@@ -1 +0,0 @@
-../before-6.17/linux.hash
\ No newline at end of file
diff --git a/linux/5.10.254-cip72 b/linux/6.12.114-cip34
similarity index 100%
rename from linux/5.10.254-cip72
rename to linux/6.12.114-cip34
diff --git a/linux/Config.ext.in b/linux/Config.ext.in
index 3b72d3cf60..f598326121 100644
--- a/linux/Config.ext.in
+++ b/linux/Config.ext.in
@@ -50,7 +50,6 @@ config BR2_LINUX_KERNEL_EXT_RTAI
 	bool "RTAI Real-time patch"
 	depends on !BR2_LINUX_KERNEL_LATEST_VERSION
 	depends on !BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	depends on !BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
 	select BR2_PACKAGE_RTAI
 	help
 	  RTAI Kernel part.
diff --git a/linux/Config.in b/linux/Config.in
index ebd4287e48..4991eb7cba 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -74,10 +74,8 @@ config BR2_LINUX_KERNEL_LATEST_5_10
 	select BR2_LINUX_KERNEL_LATEST_SERIES
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	bool "Latest CIP SLTS version (5.10.254-cip72)"
-	# Support was introduced in Linux 5.19
-	depends on !BR2_loongarch64
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
+	bool "Latest CIP SLTS version (6.12.114-cip34)"
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_12 if BR2_KERNEL_HEADERS_AS_KERNEL
 	select BR2_LINUX_KERNEL_LATEST_SERIES
 	help
 	  CIP launched in the spring of 2016 to address the needs of
@@ -91,23 +89,12 @@ config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	  implementation of software building blocks that meet
 	  these requirements.
 
-	  The CIP community plans to maintain 5.10 for security and
+	  The CIP community plans to maintain 6.12 for security and
 	  bug fixes for more than 10 years.
 
-	  https://www.cip-project.org
-
-config BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
-	bool "Latest CIP RT SLTS version (5.10.254-cip72-rt32)"
-	# Support was introduced in Linux 5.19
-	depends on !BR2_loongarch64
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_10 if BR2_KERNEL_HEADERS_AS_KERNEL
-	select BR2_LINUX_KERNEL_LATEST_SERIES
-	help
-	  Same as the CIP version, but this is the PREEMPT_RT realtime
-	  variant.
-
-	  The CIP community plans to maintain 5.10 for security and
-	  bug fixes for more than 10 years.
+	  CIP does not provide a separate real-time kernel for 6.12:
+	  PREEMPT_RT is part of mainline Linux since 6.12, enable
+	  CONFIG_PREEMPT_RT in the kernel configuration to use it.
 
 	  https://www.cip-project.org
 
@@ -189,8 +176,7 @@ config BR2_LINUX_KERNEL_VERSION
 	default "6.1.191" if BR2_LINUX_KERNEL_LATEST_6_1
 	default "5.15.224" if BR2_LINUX_KERNEL_LATEST_5_15
 	default "5.10.273" if BR2_LINUX_KERNEL_LATEST_5_10
-	default "5.10.254-cip72" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
-	default "5.10.254-cip72-rt32" if BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION
+	default "6.12.114-cip34" if BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	default BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE \
 		if BR2_LINUX_KERNEL_CUSTOM_VERSION
 	default "custom" if BR2_LINUX_KERNEL_CUSTOM_TARBALL
diff --git a/linux/before-6.17/linux.hash b/linux/before-6.17/linux.hash
index eb8307fe8f..1dfc00d6df 100644
--- a/linux/before-6.17/linux.hash
+++ b/linux/before-6.17/linux.hash
@@ -6,8 +6,7 @@ sha256  02f15b77d213e15607923832ef9382e2414ea90df6c007f15a910e139645c35d  linux-
 sha256  2757f8ad099cf77499ebab0896b5d31a467b74d5bb18c32b62da059d33b30711  linux-5.15.224.tar.xz
 sha256  02ec2bcda2f6227fa69fd7a4e8cc04e6e948c9120932880663c6215b4632979d  linux-5.10.273.tar.xz
 # Locally computed
-sha256  bd5db7fe3b0475cce4fc72db7a7f7df1c22b970aabe5ebff6ddd48098973bdf2  linux-cip-5.10.254-cip72.tar.gz
-sha256  97d7d5139900c10ff7435779be4857dda531e7cf6abba52c12a5f39aae195411  linux-cip-5.10.254-cip72-rt32.tar.gz
+sha256  c4c21ee6722dd5d6a199099e5e68e2f0ef002c34e6e23ac0aa7ce92ba7710a8d  linux-cip-6.12.114-cip34.tar.gz
 
 # Licenses hashes
 sha256  fb5a425bd3b3cd6071a3a9aff9909a859e7c1158d54d32e07658398cd67eb6a0  COPYING
diff --git a/linux/linux.mk b/linux/linux.mk
index 75294cff18..49325a3a07 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -29,7 +29,7 @@ LINUX_SITE_METHOD = hg
 else ifeq ($(BR2_LINUX_KERNEL_CUSTOM_SVN),y)
 LINUX_SITE = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
 LINUX_SITE_METHOD = svn
-else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)$(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION),y)
+else ifeq ($(BR2_LINUX_KERNEL_LATEST_CIP_VERSION),y)
 LINUX_SOURCE = linux-cip-$(LINUX_VERSION).tar.gz
 LINUX_SITE = https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/snapshot
 else ifneq ($(findstring -rc,$(LINUX_VERSION)),)
diff --git a/package/linux-headers/5.10.254-cip72-rt32 b/package/linux-headers/5.10.254-cip72-rt32
deleted file mode 120000
index 6bdea03c2e..0000000000
--- a/package/linux-headers/5.10.254-cip72-rt32
+++ /dev/null
@@ -1 +0,0 @@
-../../linux/before-6.17
\ No newline at end of file
diff --git a/package/linux-headers/5.10.254-cip72 b/package/linux-headers/6.12.114-cip34
similarity index 100%
rename from package/linux-headers/5.10.254-cip72
rename to package/linux-headers/6.12.114-cip34
diff --git a/package/linux-headers/linux-headers.mk b/package/linux-headers/linux-headers.mk
index ed37410ea6..4e697a96ac 100644
--- a/package/linux-headers/linux-headers.mk
+++ b/package/linux-headers/linux-headers.mk
@@ -17,7 +17,7 @@ LINUX_HEADERS_CUSTOM_SVN = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_SVN))
 LINUX_HEADERS_VERSION = $(call qstrip,$(BR2_LINUX_KERNEL_VERSION))
 LINUX_HEADERS_CUSTOM_TARBALL_LOCATION = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION))
 LINUX_HEADERS_REPO_URL = $(call qstrip,$(BR2_LINUX_KERNEL_CUSTOM_REPO_URL))
-LINUX_HEADERS_CIP = $(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)$(BR2_LINUX_KERNEL_LATEST_CIP_RT_VERSION)
+LINUX_HEADERS_CIP = $(BR2_LINUX_KERNEL_LATEST_CIP_VERSION)
 ifneq ($(LINUX_HEADERS_OVERRIDE_SRCDIR),)
 $(error LINUX_HEADERS_OVERRIDE_SRCDIR must not be set when BR2_KERNEL_HEADERS_AS_KERNEL=y)
 endif
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
