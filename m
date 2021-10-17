Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F864C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 17:00:10 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0084D61052
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 17:00:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0084D61052
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id ED4D2400F6;
	Sun, 17 Oct 2021 17:00:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4s6PSaIMYtne; Sun, 17 Oct 2021 17:00:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id BC3D3402F3;
	Sun, 17 Oct 2021 17:00:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E7F91BF404
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:59:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0B16A402EA
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:59:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AFnkmJZL8c3Y for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 16:59:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5065D402F5
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 16:59:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 96FE695CDE; Sun, 17 Oct 2021 16:56:50 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 18:59:25 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 547d681b45ed3dee28922838805633cf32cba5e4
X-Git-Newrev: 1abeae182424bb8d7f2b0355836e667a4ee8995e
X-Patchwork-Hint: ignore
Message-Id: <20211017165650.96FE695CDE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/binutils: remove csky version
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=1abeae182424bb8d7f2b0355836e667a4ee8995e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Binutils is the last part of the csky toolchain fork.

The csky support has been merged in binutils 2.32 [1].

[1] https://sourceware.org/git/?p=binutils-gdb.git;a=commitdiff;h=9d24df82ece4e87a0328173d6bd31cb9ff558bb4

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Guo Ren <ren_guo@c-sky.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Asked-by: Guo Ren <guoren@kernel.org>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 Config.in.legacy                | 6 ++++++
 package/binutils/Config.in.host | 7 -------
 package/binutils/binutils.hash  | 3 ---
 package/binutils/binutils.mk    | 6 ------
 4 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 26d489c232..464021fec5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2021.11"
 
+config BR2_BINUTILS_VERSION_CSKY
+	bool "binutils csky version removed"
+	select BR2_LEGACY
+	help
+	  Support for binutils csky version has been removed.
+
 config BR2_GCC_VERSION_CSKY
 	bool "gcc csky version removed"
 	select BR2_LEGACY
diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index b4c86dd473..ea1f020989 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -9,7 +9,6 @@ choice
 	prompt "Binutils Version"
 	default BR2_BINUTILS_VERSION_2_36_X if !BR2_arc && !BR2_csky
 	default BR2_BINUTILS_VERSION_ARC if BR2_arc
-	default BR2_BINUTILS_VERSION_CSKY if BR2_csky
 	help
 	  Select the version of binutils you wish to use.
 
@@ -33,7 +32,6 @@ config BR2_BINUTILS_VERSION_2_36_X
 
 config BR2_BINUTILS_VERSION_2_37_X
 	bool "binutils 2.37"
-	depends on !BR2_csky
 	# https://github.com/uclinux-dev/elf2flt/pull/16
 	# https://github.com/uclinux-dev/elf2flt/issues/12
 	depends on !BR2_BINFMT_FLAT
@@ -42,16 +40,11 @@ config BR2_BINUTILS_VERSION_ARC
 	bool "binutils arc (2.34.50)"
 	depends on BR2_arc
 
-config BR2_BINUTILS_VERSION_CSKY
-	bool "binutils csky"
-	depends on BR2_csky
-
 endchoice
 
 config BR2_BINUTILS_VERSION
 	string
 	default "arc-2020.09-release"	if BR2_BINUTILS_VERSION_ARC
-	default "c66d8bbcebfddf713b2b436e1b135e6b125a55a5" if BR2_BINUTILS_VERSION_CSKY
 	default "2.32"		if BR2_BINUTILS_VERSION_2_32_X
 	default "2.35.2"	if BR2_BINUTILS_VERSION_2_35_X
 	default "2.36.1"	if BR2_BINUTILS_VERSION_2_36_X
diff --git a/package/binutils/binutils.hash b/package/binutils/binutils.hash
index f543b49940..d1be6cbce8 100644
--- a/package/binutils/binutils.hash
+++ b/package/binutils/binutils.hash
@@ -7,9 +7,6 @@ sha512  5c11aeef6935860a6819ed3a3c93371f052e52b4bdc5033da36037c1544d013b7f12cb8d
 # Locally calculated (fetched from Github)
 sha512  76a8227a19218435319c660e4983ea17985194b7f496f163e97543e7f6fd3e9249241fdc05a16ba512fba96a1d846c1f7b080983404d821d6215f10e7f11e238  binutils-gdb-arc-2020.09-release.tar.gz
 
-# Locally calculated (fetched from https://github.com/c-sky/binutils-gdb)
-sha512  979552d4b3a4f31e9f3b9a7027321bd4eb3ac6c2d8deac1720e94e54f81d736db09c53c5d87c301010e307b64127e14400a036c7a35e5d63a954a4edd9cc8e2c  binutils-c66d8bbcebfddf713b2b436e1b135e6b125a55a5.tar.gz
-
 # locally computed
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  COPYING3
 sha256  56bdea73b6145ef6ac5259b3da390b981d840c24cb03b8e1cbc678de7ecfa18d  COPYING.LIB
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 8ec76134bc..bfad25422d 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -21,12 +21,6 @@ BINUTILS_SOURCE = binutils-gdb-$(BINUTILS_VERSION).tar.gz
 BINUTILS_FROM_GIT = y
 endif
 
-ifeq ($(BR2_csky),y)
-BINUTILS_SITE = $(call github,c-sky,binutils-gdb,$(BINUTILS_VERSION))
-BINUTILS_SOURCE = binutils-$(BINUTILS_VERSION).tar.gz
-BINUTILS_FROM_GIT = y
-endif
-
 BINUTILS_SITE ?= $(BR2_GNU_MIRROR)/binutils
 BINUTILS_SOURCE ?= binutils-$(BINUTILS_VERSION).tar.xz
 BINUTILS_EXTRA_CONFIG_OPTIONS = $(call qstrip,$(BR2_BINUTILS_EXTRA_CONFIG_OPTIONS))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
