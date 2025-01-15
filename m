Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65799C282D0
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 21F3D7076E;
	Fri, 28 Feb 2025 16:59:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W8jfDYmnqMYK; Fri, 28 Feb 2025 16:59:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE02370767
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BE02370767;
	Fri, 28 Feb 2025 16:59:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1806F711
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:39:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7824A4257F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2UUaU7VT7KO0 for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4B6D142E14
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4B6D142E14
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 459C88118C; Fri, 28 Feb 2025 16:30:12 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed, 15 Jan 2025 21:30:52 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a24bb5f703fd05a5fbdf0e5963ab26fa80711047
X-Git-Newrev: 6775ccc5a199d574ad70b5f79ec58cce97a07c6f
X-Patchwork-Hint: ignore
Message-Id: <20250228163012.459C88118C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] arch/nios2: drop architecture
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6775ccc5a199d574ad70b5f79ec58cce97a07c6f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The nios2 architecture was deprecated in gcc-14 and has been removed
in the upcoming gcc-15 [1][2].

This commit removes nios2 from the architecture entry.

[1] https://sourceware.org/pipermail/binutils/2024-April/133675.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e876acab6cdd84bb2b32c98fc69fb0ba29c81153

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 Config.in            |  2 --
 Config.in.legacy     |  7 +++++++
 DEVELOPERS           |  1 -
 arch/Config.in       | 14 --------------
 arch/Config.in.nios2 | 14 --------------
 5 files changed, 7 insertions(+), 31 deletions(-)

diff --git a/Config.in b/Config.in
index 28d34c8721..c0c1a6079d 100644
--- a/Config.in
+++ b/Config.in
@@ -808,8 +808,6 @@ config BR2_PIC_PIE_ARCH_SUPPORTS
 	default y
 	# Microblaze glibc toolchains don't work with PIC/PIE enabled
 	depends on !BR2_microblaze
-	# Nios2 toolchains produce non working binaries with -fPIC
-	depends on !BR2_nios2
 
 config BR2_PIC_PIE
 	bool "Build code with PIC/PIE"
diff --git a/Config.in.legacy b/Config.in.legacy
index 54c251be1f..e091fd8c0a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_nios2
+	bool "nios2 architecture removed"
+	select BR2_LEGACY
+	help
+	  The nios2 architecture was removed, by lack of toolchain
+	  support.
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
 	bool "Bootlin nios2 glibc bleeding-edge toolchain removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 9cc27025f8..2d8ae8289b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -950,7 +950,6 @@ F:	package/tcf-agent/
 N:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 F:	board/ci20/
 F:	configs/ci20_defconfig
-F:	arch/Config.in.nios2
 F:	package/fio/
 F:	package/iptraf-ng/
 F:	package/jimtcl/
diff --git a/arch/Config.in b/arch/Config.in
index 6254cb6467..6b54c65df9 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -143,16 +143,6 @@ config BR2_mips64el
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
-config BR2_nios2
-	bool "Nios II"
-	depends on BR2_BROKEN
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
-	select BR2_USE_MMU
-	help
-	  Nios II is a soft core processor from Altera Corporation.
-	  http://www.altera.com/
-	  http://en.wikipedia.org/wiki/Nios_II
-
 config BR2_or1k
 	bool "OpenRISC"
 	select BR2_USE_MMU
@@ -395,10 +385,6 @@ if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
 source "arch/Config.in.mips"
 endif
 
-if BR2_nios2
-source "arch/Config.in.nios2"
-endif
-
 if BR2_or1k
 source "arch/Config.in.or1k"
 endif
diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
deleted file mode 100644
index a5d7e66d40..0000000000
--- a/arch/Config.in.nios2
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_ARCH
-	default "nios2"
-
-config BR2_NORMALIZED_ARCH
-	default "nios2"
-
-config BR2_ENDIAN
-	default "LITTLE"
-
-config BR2_READELF_ARCH_NAME
-	default "Altera Nios II"
-
-# vim: ft=kconfig
-# -*- mode:kconfig; -*-
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
