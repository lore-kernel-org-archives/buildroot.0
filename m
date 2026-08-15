Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3F20C5DF67
	for <buildroot@archiver.kernel.org>; Sat, 15 Aug 2026 15:09:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1686680EAE;
	Sat, 15 Aug 2026 15:09:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NcJSE8TpP7N2; Sat, 15 Aug 2026 15:09:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AD5A80EB5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1786806586;
	bh=W/wyMPIfwG6qtoxfue4RdjfXhLIQy09SbdEqEf5IBYM=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=IgRFMCvY6WVJYiSRhPA7ym9Ou+pP7Q74aRni19pEy94kPXlQZagwO+Fv6afj9StPL
	 duBNQ3+R51Z/4B/7Xg4WXx98YZqzBGoaRGvXb8ZoDqqGYU2jnuE51A1WlF4ea0hmbk
	 /z9dO6TbM02WNLXKOvGpqfMYDmjh+iW0SKe4mhnXS/GB6rpNLJkM+dJIypIz0ayRG+
	 MqvLHBaxd/juO/A4xBlT0Zy9/r+oMmdOrXkEfUl8K4XzkVHf/2G+Iigd3eV4v/gG0T
	 XiXa0vMSjZ4OUSj57QwW9Wg4r3Lc22IPGSR4iOiAAMEbIn7+tXBzatrHoEVJPn2qSf
	 AMmUHWsz0Mmqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AD5A80EB5;
	Sat, 15 Aug 2026 15:09:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7A177392
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:09:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6C6CF40827
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:09:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZTlo1Ko53c04 for <buildroot@buildroot.org>;
 Sat, 15 Aug 2026 15:09:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23A344082F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 23A344082F
 for <buildroot@buildroot.org>; Sat, 15 Aug 2026 15:09:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 93FF3886F9; Sat, 15 Aug 2026 15:08:49 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Aug 2026 17:07:04 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 22c38bbc1e48dc696a9639fa3d76b21cbf73e436
X-Git-Newrev: 2dff645d3eca54202319ca647b0225e801dfdce1
X-Patchwork-Hint: ignore
Message-Id: <20260815150849.93FF3886F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcc: drop ARC-specific version
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/2dff645d3eca54202319ca647b0225e801dfdce1
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

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
---
 Config.in.legacy             | 9 +++++++--
 package/gcc/Config.in.host   | 9 ---------
 package/gcc/gcc.hash         | 2 --
 package/gcc/gcc.mk           | 6 ------
 package/harfbuzz/harfbuzz.mk | 4 ----
 5 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index da69682f93..2c8a0f1a04 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2026.08"
 
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
@@ -6269,8 +6276,6 @@ config BR2_GCC_VERSION_4_8_ARC
 	help
 	  The option that selects the gcc version for the ARC
 	  architecture has been renamed to BR2_GCC_VERSION_ARC.
-# Note: BR2_GCC_VERSION_4_8_ARC is still referenced from
-# package/gcc/Config.in.host
 
 config BR2_KERNEL_HEADERS_4_0
 	bool "kernel headers version 4.0.x are no longer supported"
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index bc3223eb59..2ca1320346 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -2,19 +2,11 @@ comment "GCC Options"
 
 choice
 	prompt "GCC compiler Version"
-	default BR2_GCC_VERSION_ARC if BR2_GCC_VERSION_4_8_ARC # legacy
-	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_POWERPC_SPE if BR2_POWERPC_CPU_HAS_SPE
 	default BR2_GCC_VERSION_15_X
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
 	default "14.4.0"    if BR2_GCC_VERSION_14_X
 	default "15.3.0"    if BR2_GCC_VERSION_15_X
 	default "16.2.0"    if BR2_GCC_VERSION_16_X
-	default "arc-2024.12-release" if BR2_GCC_VERSION_ARC
 
 config BR2_EXTRA_GCC_CONFIG_OPTIONS
 	string "Additional gcc options"
diff --git a/package/gcc/gcc.hash b/package/gcc/gcc.hash
index a1230d758e..49f87e25bb 100644
--- a/package/gcc/gcc.hash
+++ b/package/gcc/gcc.hash
@@ -7,8 +7,6 @@ sha512  0de9e296153b52c021b1c7e63c9c62151d7a0ac03f23ce6e9f772c1b0eb783f6acdd81cc
 # From https://gcc.gnu.org/pub/gcc/releases/gcc-16.2.0/sha512.sum
 sha512  c51c30ca7422d0cbecf504b2e0f33c3aca31e0f90a76b65217f465163fa6fa17b3f5de39e145c47e5bab90ac0ce7fff3b03c8d553ae36e01faaea5a50f8648d1  gcc-16.2.0.tar.xz
 
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
