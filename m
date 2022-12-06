Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482FBC3A5A7
	for <buildroot@archiver.kernel.org>; Tue,  6 Dec 2022 23:10:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 91A0740A81;
	Tue,  6 Dec 2022 23:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 91A0740A81
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8AU9_g_KxX8Q; Tue,  6 Dec 2022 23:10:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D172F40A8A;
	Tue,  6 Dec 2022 23:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D172F40A8A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 160431BF292
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 23:10:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F273F40904
 for <buildroot@lists.busybox.net>; Tue,  6 Dec 2022 23:10:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F273F40904
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RaUGPN_1DMTv for <buildroot@lists.busybox.net>;
 Tue,  6 Dec 2022 23:10:45 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 44936405B3
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 44936405B3
 for <buildroot@buildroot.org>; Tue,  6 Dec 2022 23:10:45 +0000 (UTC)
Received: from b52572-12.ea.freescale.net.net (unknown [37.170.31.211])
 (Authenticated sender: ju.o@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B689913F86F;
 Wed,  7 Dec 2022 00:10:40 +0100 (CET)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Wed,  7 Dec 2022 00:10:34 +0100
Message-Id: <20221206231034.48408-1-ju.o@free.fr>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670368242;
 bh=LnjiTi33YtARqpFyZs+PKbu7HfpjsvMm0jxAwfraouM=;
 h=From:To:Cc:Subject:Date:From;
 b=P3G1Ljpl6KzNdw4gjLSWJlv9gXp3c0nP7n+DwKNDY/uyj8UwBv7flEwFGZ+85UTFc
 Gs3MgFFdvlOilxbbZ6F8RJBzIrNtUPnRqmurycetZTUB+Z4YlCvMlhTJXBtHUFiTmj
 6opE7IQhmeaTXiVJwzOi/HzRykCfGWtOTnqHctK1VwfESnK+N9q9znzNBcjwDPduWR
 Xtv2ZaXZIduvi+kfiPomiLK+ZADzS6HfEmmAykQWNpb610/GSMd3q7P0HyfvLWTqDI
 eJsRJMB3qsjMi/ohN4F176XV1hRkDyo7J8uBB/Z2To0FDT8AduhyXULk+DNbc4y2fG
 piOwoJXH9JMRA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=P3G1Ljpl
Subject: [Buildroot] [PATCH 1/1] package/z3: introduce _ARCH_SUPPORTS
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
Cc: Julien Olivain <ju.o@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

z3 package was initially added with a depends on !BR2_nios2. This was
detected by testing with "./utils/test-pkg -a -p z3". It turned out that
few other architectures are also not supported. The actual z3
requirement is to have a libc that provides <fenv.h> AND also provides
all the four macros: FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO,
FE_UPWARD.

Quoting glibc manual, or "man fenv":
https://www.gnu.org/software/libc/manual/html_node/Rounding.html

"fenv.h defines constants which you can use to refer to the various
rounding modes. Each one will be defined if and only if the FPU
supports the corresponding rounding mode."

This patch introduces _ARCH_SUPPORTS to limit only to the architectures
with a FPU that has those rounding modes.

Fixes:
- http://autobuild.buildroot.net/results/2809dd1ae2f3ada8ee7b3f3e388341c7cfb633fb

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/z3/Config.in | 26 ++++++++++++++++++++++++--
 1 file changed, 24 insertions(+), 2 deletions(-)

diff --git a/package/z3/Config.in b/package/z3/Config.in
index 55b0e8bb3b..8cd3128687 100644
--- a/package/z3/Config.in
+++ b/package/z3/Config.in
@@ -1,11 +1,33 @@
+# z3 supports arch for which libc fenv.h provides all four macros:
+# FE_DOWNWARD, FE_TONEAREST, FE_TOWARDZERO, FE_UPWARD
+# See for example in glibc https://sourceware.org/git/glibc.git
+# git grep -E '^[[:space:]]*#[[:space:]]*define[[:space:]]+FE_(TONEAREST|UPWARD|DOWNWARD|TOWARDZERO)' sysdeps/
+config BR2_PACKAGE_Z3_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64 || BR2_aarch64_be
+	default y if BR2_arceb || BR2_arcle
+	default y if BR2_arm || BR2_armeb
+	default y if BR2_i386
+	default y if BR2_m68k
+	# BR2_microblaze has only FE_TONEAREST
+	default y if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	# BR2_nios2 has only FE_TONEAREST
+	default y if BR2_or1k
+	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
+	default y if BR2_riscv
+	default y if BR2_s390x
+	# BR2_sh has only FE_{TONEAREST,TOWARDZERO}
+	default y if BR2_sparc || BR2_sparc64
+	default y if BR2_x86_64
+	# BR2_xtensa supports only uclibc which does not have fenv.h
+
 config BR2_PACKAGE_Z3
 	bool "z3"
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # c++17
 	# z3 needs fenv.h which is not provided by uclibc
 	depends on !BR2_TOOLCHAIN_USES_UCLIBC
-	# fenv.h lacks FE_INVALID, FE_OVERFLOW & FE_UNDERFLOW on nios2
-	depends on !BR2_nios2
+	depends on BR2_PACKAGE_Z3_ARCH_SUPPORTS
 	help
 	  Z3, also known as the Z3 Theorem Prover, is a cross-platform
 	  satisfiability modulo theories (SMT) solver.
-- 
2.38.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
