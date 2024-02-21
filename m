Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA9CC48BEB
	for <buildroot@archiver.kernel.org>; Wed, 21 Feb 2024 21:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2648F60FA1;
	Wed, 21 Feb 2024 21:40:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 17zgC6gSNw-z; Wed, 21 Feb 2024 21:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5228660FA5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5228660FA5;
	Wed, 21 Feb 2024 21:40:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 77E061BF947
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6438960687
 for <buildroot@lists.busybox.net>; Wed, 21 Feb 2024 21:40:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PSs63Jnv2M1a for <buildroot@lists.busybox.net>;
 Wed, 21 Feb 2024 21:40:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.158.101;
 helo=smtpcmd02101.aruba.it;
 envelope-from=giulio.benetti@benettiengineering.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E6AD0605EE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6AD0605EE
Received: from smtpcmd02101.aruba.it (smtpcmd02101.aruba.it [62.149.158.101])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E6AD0605EE
 for <buildroot@buildroot.org>; Wed, 21 Feb 2024 21:40:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cuJyrqwWLMMFBcuJzrhA44; Wed, 21 Feb 2024 22:40:07 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed, 21 Feb 2024 22:39:57 +0100
Message-Id: <20240221214005.176433-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240221214005.176433-1-giulio.benetti@benettiengineering.com>
References: <20240218230524.639348e6@windsurf>
 <20240221214005.176433-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfIry4oDHVBJMSk3f+p3aZ7EnqYLm4M2ugcOIivsRjseQWlWBf5cIDR+aTUIciXDTEMGMzEs/q82v8QYVBBOtjd7JkXT2ypjwemRDRc1r8q9wT9FGGrK1
 2piI3dwsLQIMadeodfTPHyn+OXgxd1k40y6QexRgEnrIGUYogKHBB9ly0hkSsLVrtzjP21I06JBZQk92fBk6Cw38x+ZukyLx7qxp2nhsgmuupBRXn4TzLkHd
 7C3qKbFlMS3/MGRtOGKo0iMFaYDFykNNiCxIkf8ybA0Rre5unX9+5NGieMtBy5GuvEXYRuFn9QQ3k1Y8pttvvrkqELMQkJCuJUBgvOvrfKi7D5zIkA+h2ZAa
 JMOfn34qmNSIVKPzWrfm/VlksNhZdH42zNoL9dq3PoWHdR/qo0E0soVGQlZ29PzT4SqmSMAWYurg5YBfd/97px6GWdX/ZZcmCew+kqGF0bOomwvvT5TobesV
 lbb9uMUJW9r9vYNPTjl4YJAgCjPJCN02K+S28NGg8gXmSqNg6H7rgCtmrwH9C47CphJRMlFjOa1fAIRChj3XZGIbYmDzjK7vHQWZKxNYpwMCPU30sVPmsuz6
 xBag+5Z3TgQ7D99FlQd8IE9sV/5uBWSikUBQ87tjrhHozaDCii8WTfcoDq4WyTVA1cI=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1708551607; bh=Wwch1hFRAmyWBWpAYwNuP4B3hJXCkd41KDo3LuF2bro=;
 h=From:To:Subject:Date:MIME-Version;
 b=aLRUQMzXPRqDCBcFB/hUERddAIEHo1PpFJrnTrgQjU8RC+bPSAui86psndf18F1H0
 cUBjoF1/wtseE9zvDbDcdljwfOLn0nBSydJvAeTK9M3jbCXxSjkHDvfYOOu00kt/Fv
 UM/mtnGrcG1J449+biAOnvNgxvjEeLm3+YSXo63CN0GSNaUBcqllYyqsUt3vhFIcK7
 xVhicn+cELITGp0hiQZV49DaXEMlOvDUsr3SLCvW0xPkT+sWnbWd7MJmj1ktp6JQoo
 EjoQ+SZc/dupncBkfmTFvCiGGHDLTWAuxREBaYYcpHN7wtasrgrl9F7Pg6yBFbs0AE
 02rK++RvYIUoA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=aLRUQMzX
Subject: [Buildroot] [PATCH v2 1/9] toolchain/toolchain-external: drop
 external codesourcery niosII toolchain
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
Cc: Marcus Folkesson <marcus.folkesson@gmail.com>,
 Pierre Ducroquet <pinaraf@pinaraf.info>,
 Kieran Bingham <kieran.bingham@ideasonboard.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Vincent Fazio <vfazio@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This toolchain is pretty old and unlikely used. It's also affected by
binutils bug 27597, so let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 toolchain/toolchain-external/Config.in           |  6 ------
 .../toolchain-external/pkg-toolchain-external.mk |  2 +-
 .../Config.in                                    | 16 ----------------
 .../Config.in.options                            |  9 ---------
 .../toolchain-external-codesourcery-niosII.hash  |  6 ------
 .../toolchain-external-codesourcery-niosII.mk    | 13 -------------
 6 files changed, 1 insertion(+), 51 deletions(-)
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk

diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index c1c159cb8e..cb678b7886 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -33,9 +33,6 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config
 source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in"
 source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in"
 
-# NIOSII
-source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in"
-
 # Bootlin toolchains, available for virtually all architectures
 source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in"
 
@@ -137,9 +134,6 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-mips/Config
 source "toolchain/toolchain-external/toolchain-external-codescape-img-mips/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Config.in.options"
 
-# NIOSII
-source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options"
-
 # Bootlin toolchains
 source "toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options"
 
diff --git a/toolchain/toolchain-external/pkg-toolchain-external.mk b/toolchain/toolchain-external/pkg-toolchain-external.mk
index ddf1d70ab4..aa5365b5bd 100644
--- a/toolchain/toolchain-external/pkg-toolchain-external.mk
+++ b/toolchain/toolchain-external/pkg-toolchain-external.mk
@@ -13,7 +13,7 @@
 #  * Toolchains provided by Linaro for the ARM and AArch64
 #    architectures
 #  * Sourcery CodeBench toolchains (from Mentor Graphics) for the ARM,
-#    MIPS, PowerPC, x86_64 and NIOS 2 architectures. For the MIPS
+#    MIPS, PowerPC, and x86_64 architectures. For the MIPS
 #    toolchain, the -muclibc variant isn't supported yet, only the
 #    default glibc-based variant is.
 #  * Synopsys DesignWare toolchains for ARC cores
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
deleted file mode 100644
index cf3ce69a68..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in
+++ /dev/null
@@ -1,16 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-	bool "Sourcery CodeBench Nios-II 2018.05"
-	depends on BR2_nios2
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_8
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_15
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_7
-	help
-	  Sourcery CodeBench toolchain for the Nios-II architecture,
-	  from Mentor Graphics. It uses gcc 7.3, binutils 2.28,
-	  glibc 2.27, gdb 8.0.1 and kernel headers 4.15.5.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
deleted file mode 100644
index 07cc5ede94..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "nios2-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-codesourcery-niosII"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
deleted file mode 100644
index 47893ab7e2..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.hash
+++ /dev/null
@@ -1,6 +0,0 @@
-# From https://sourcery.mentor.com/GNUToolchain/release3374
-md5  4f536b3b9b4e00f483e82e304c0a27ae  sourceryg++-2018.05-5-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-md5  be42ab83da2e8db7b73dc890c2549570  sourceryg++-2018.05-5-nios2-linux-gnu.src.tar.bz2
-# Locally calculated
-sha256  c19afb432b5b23f8d5d639831d3a423a3ea3c9cc62e0015020d20ea2eb36dd1b  sourceryg++-2018.05-5-nios2-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256  d73a6364106dd62352711f932d3be8e97fdaaa548995678b5d38d9f21e22437a  sourceryg++-2018.05-5-nios2-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
deleted file mode 100644
index cb0fe760ff..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-niosII/toolchain-external-codesourcery-niosII.mk
+++ /dev/null
@@ -1,13 +0,0 @@
-################################################################################
-#
-# toolchain-external-codesourcery-niosII
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION = 2018.05-5
-
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_SOURCE = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
-TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_ACTUAL_SOURCE_TARBALL = sourceryg++-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_NIOSII_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
-
-$(eval $(toolchain-external-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
