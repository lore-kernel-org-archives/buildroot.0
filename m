Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7650BC5DF89
	for <buildroot@archiver.kernel.org>; Fri, 21 Aug 2026 15:12:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 379A081C19;
	Fri, 21 Aug 2026 15:12:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZiKrkjlR4PBt; Fri, 21 Aug 2026 15:12:07 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1787325127;
	bh=6OYBAVlKvQ6MHs89GFD2KHgFRNjo3zNxMsRp2ncy3RU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=WCZBRp0cFFUljjfTjTKpGHXXgKze5+I5q2pfXZdSPtqzLnxt5FRkjjWPq/QspmfqD
	 ihes+/keGyorI43m1WxHYYFZcQf9AmsCAsZcCPB3SAQBo0DvwYgihX6Wp9hFDq+OSF
	 5+TxdXxd4fTnDqMfuyprupG/TcBhfrQcDAvg9wwuXnSiaFks8KN7iMKLiG/0OJmxk3
	 Nh1JDwxQAN4INtAs3sbkgmtQzHv9uDoC53GNzmxuMoG+yeGKUXv3bahxbyJtDL6otq
	 +MQJbHZs2KgeCMh/ZJgaO3KrGkM0d1jvEFrnncxXeE8A5F1/CRiGS6rtn8RyDA2cxX
	 9REnGSVfDJ+iw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E3CC81DF0;
	Fri, 21 Aug 2026 15:12:07 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id F0F07EA3
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EE41C40BD1
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MdgHH8t50gVU for <buildroot@buildroot.org>;
 Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 343F140A1E
 for <buildroot@buildroot.org>; Fri, 21 Aug 2026 15:11:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A72308DE49; Fri, 21 Aug 2026 15:10:17 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 20 Aug 2026 14:30:08 +0200
X-Git-Refname: refs/heads/2026.05.x
X-Git-Oldrev: d90bf5c8c15111975d24b4ea958f6d856b7e88cb
X-Git-Newrev: 8243a69bdbaf6c12f4f6097ccb815cd13e3ac841
X-Patchwork-Hint: ignore
Message-Id: <20260821151017.A72308DE49@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.05.x] package/gcc: drop
 ARC-specific version
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8243a69bdbaf6c12f4f6097ccb815cd13e3ac841
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.05.x

A warning was sent to Synopsys ARC people in December 2025 that the
ARC support in Buildroot was poorly maintained and in particular the
ARC-pspecific toolchain components. Despite a reply that some effort
would be made [1], no contributions were actually done. Also, Alexey
Brodkin is no longer at Synopsys. Time to remove Synopsys ARC specific
toolchain and toolchain components.

This commit removes the ARC-specific gcc version.

[1] https://lore.kernel.org/buildroot/SJ2PR12MB818487232470DA4456967C73A1A3A@SJ2PR12MB8184.namprd12.prod.outlook.com/

Fixes:

  https://autobuild.buildroot.org/results/9f2d41d503916d11f3e23b64fe0656ce9ee7f778/

Cc: ARC Maintainers <arc-buildroot@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2dff645d3eca54202319ca647b0225e801dfdce1)
Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 Config.in.legacy             | 9 +++++++--
 package/gcc/Config.in.host   | 9 ---------
 package/gcc/gcc.hash         | 2 --
 package/gcc/gcc.mk           | 6 ------
 package/harfbuzz/harfbuzz.mk | 4 ----
 5 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 46ae5dafee..abe92af765 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.05.2"
 
+config BR2_GCC_VERSION_ARC
+	bool "ARC-specific gcc version removed"
+	select BR2_LEGACY
+	help
+	  Support for the ARC-specific gcc version was removed, as it
+	  was no longer maintained in Buildroot.
+
 config BR2_TOOLCHAIN_EXTERNAL_SYNOPSYS_ARC
 	bool "Synopsys ARC toolchain removed"
 	select BR2_LEGACY
@@ -6228,8 +6235,6 @@ config BR2_GCC_VERSION_4_8_ARC
 	help
 	  The option that selects the gcc version for the ARC
 	  architecture has been renamed to BR2_GCC_VERSION_ARC.
-# Note: BR2_GCC_VERSION_4_8_ARC is still referenced from
-# package/gcc/Config.in.host
 
 config BR2_KERNEL_HEADERS_4_0
 	bool "kernel headers version 4.0.x are no longer supported"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5b21734c71..39885c3107 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -2,19 +2,11 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
-	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_POWERPC_CPU_HAS_SPE
 	default BR2_GCC_VERSION_14_X
 	help
 	  Select the version of gcc you wish to use.
 
-config BR2_GCC_VERSION_ARC
-	bool "gcc arc (14.2)"
-	# Only supported architecture
-	depends on BR2_arc
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
-
 config BR2_GCC_VERSION_POWERPC_SPE
 	bool "gcc powerpc spe"
 	# powerpc spe support has been deprecated since gcc 8.x.
@@ -71,7 +63,6 @@ config BR2_GCC_VERSION
 	default "13.4.0"    if BR2_GCC_VERSION_13_X
 	default "14.4.0"    if BR2_GCC_VERSION_14_X
 	default "15.3.0"    if BR2_GCC_VERSION_15_X
-	default "arc-2024.12-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index 5a41bd255f..60080d64dc 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -7,8 +7,6 @@ sha512  725ed8bdd43ef1726ffe8b5e8615a13e247fac9575b7626ae013a2975d000ea213212dc4
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-15.3.0/sha512.sum
 sha512  0de9e296153b52c021b1c7e63c9c62151d7a0ac03f23ce6e9f772c1b0eb783f6acdd81cc4567bfe4128a6f64968c2cfc8eff40b36229cba7425349f7d637c654  gcc-15.3.0.tar.xz
 
-# Locally calculated (fetched from Github)
-sha512  7f08ae335d9112be65e92c3744c095d8fa265994b8282274948f99fe37409531e627e6dadfb77b138a82fa09d012c56d8c075b482a5a5186814a57f9db63c29e  gcc-arc-2024.12-release.tar.gz
 # Locally calculated (fetched from Github)
 sha512  2de7cf47333a4092b02d3bb98f4206f14966f1d139a724d09cf3b22f8a43ae0c704f33e6477d6367a03c29b265480dc900169e9d417006c5d46f0ae446b8c6f1  gcc-or1k-musl-5.4.0-20170218.tar.gz
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index ea96286c32..9109777bd7 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -9,14 +9,8 @@
 #
 
 GCC_VERSION = $(call qstrip,$(BR2_GCC_VERSION))
-
-ifeq ($(BR2_GCC_VERSION_ARC),y)
-GCC_SITE = $(call github,foss-for-synopsys-dwc-arc-processors,gcc,$(GCC_VERSION))
-GCC_SOURCE = gcc-$(GCC_VERSION).tar.gz
-else
 GCC_SITE = $(BR2_GNU_MIRROR:/=)/gcc/gcc-$(GCC_VERSION)
 GCC_SOURCE = gcc-$(GCC_VERSION).tar.xz
-endif
 
 HOST_GCC_LICENSE = GPL-2.0, GPL-3.0, LGPL-2.1, LGPL-3.0
 HOST_GCC_LICENSE_FILES = COPYING COPYING3 COPYING.LIB COPYING3.LIB
diff --git a/package/harfbuzz/harfbuzz.mk b/package/harfbuzz/harfbuzz.mk
index 77d96febf3..d87d2c41bf 100644
--- a/package/harfbuzz/harfbuzz.mk
+++ b/package/harfbuzz/harfbuzz.mk
@@ -94,9 +94,5 @@ ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
 HARFBUZZ_CXXFLAGS += $(TARGET_CXXFLAGS) -DHB_NO_MT
 endif
 
-ifeq ($(BR2_GCC_VERSION_ARC),y)
-HARFBUZZ_CXXFLAGS += -O0
-endif
-
 $(eval $(meson-package))
 $(eval $(host-meson-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
