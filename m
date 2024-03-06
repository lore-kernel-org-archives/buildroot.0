Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FDBDC5475B
	for <buildroot@archiver.kernel.org>; Wed,  6 Mar 2024 21:36:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61A8D40701;
	Wed,  6 Mar 2024 21:36:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Yd-mIgPJbF62; Wed,  6 Mar 2024 21:36:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C865740775
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C865740775;
	Wed,  6 Mar 2024 21:36:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DF82C1BF5E6
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CCAE0606ED
 for <buildroot@lists.busybox.net>; Wed,  6 Mar 2024 21:36:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id V3HxrQvT6QbG for <buildroot@lists.busybox.net>;
 Wed,  6 Mar 2024 21:36:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.100;
 helo=smtpdh16-1.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6533D606D5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6533D606D5
Received: from smtpdh16-1.aruba.it (smtpdh16-1.aruba.it [62.149.155.100])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6533D606D5
 for <buildroot@buildroot.org>; Wed,  6 Mar 2024 21:36:10 +0000 (UTC)
Received: from localhost.localdomain ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id hyvnrMrp4EG7Lhyvnr90RF; Wed, 06 Mar 2024 22:36:08 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Wed,  6 Mar 2024 22:35:58 +0100
Message-Id: <20240306213606.2149683-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
References: <20240306213606.2149683-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4xfI8iPsfuUPb8XObtzfkFMbAGHNhaEKUfjsn+iPFST2kCxJvuJyf7Pd+7aZCuzuI6RWszdZX94cO5Qi8DjftE8D3UNGy620ZoIZ8e2j2cVfRXAyI3I5i3
 bG0c07xYQtgoS+s014i9XmorybQKEDj33yByhKhtPcHY5xZXejKvT5FDRBBSzxN2jU3+9ILsc5bjbzvB4qNV4rw/ZDbheydjE95cyxyvSqrOjBr6cPGL/KJU
 XKHDOYVbN8/88dCYEFNPOaV3WMFsVqQjkMstsCW94Gx23WjTdnD+QQzZl5y/F1bozNZO/VhDqNNbsWBaXV1CkEkhQyBTqK59Spkonj6DE5dV2t+tslhyYWGG
 Kc3uglese84Kf8zSHzN7iWz+Y2/hb7KSltdeVNs9yLTDV0misq0DTp0a1gVNsZv+B5csg9qE/s/qcjRjC0J0FJcHLeukVAJecFsrzLmP+vRPUvp/W9DL30F+
 6KGWZx3m5uMbJpkMF9FppY3fzgwjia9XhgKlEihrxLm+5bzTF4NVJ7Jwx2b3rr32Ulw3COVMQTdXfLRIuQSPuVrR4nUH0JC0BUUewxCp4DX0Nq6jdQuDagqw
 sC0=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1709760968; bh=Wwch1hFRAmyWBWpAYwNuP4B3hJXCkd41KDo3LuF2bro=;
 h=From:To:Subject:Date:MIME-Version;
 b=P0D2MRopipVKdHsdEhhmSE3M4GaUrfJ5Ho6ncjk44/F6cjMpeLOceNxlszsKkzMni
 kdC7imKxqAgxAgUuXq4kaWrfyLoDHkQ2Aow2QRopR2BLP2UFSE5BNEIVg0Hp18PbhD
 pOAwpou8PECmYGpSqfJs4g6Jz5KPicEgX0/q8p7PSS29iIPDPVM0ruXcPUMp7JQNZC
 c8f6IuDz2W3WA9iDi+fp7n5U1lD/ARy/5qal5WnCdU72/3McavwFIom6DNpINQnnZ3
 hbs3aei75yXp01omjxq0jAtW3Wd6w9gD1jLSvJKsftLhzKQrgq9PYk5fWwCPVGEED+
 DKADRWweJHM5A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=P0D2MRop
Subject: [Buildroot] [PATCH v3 1/9] toolchain/toolchain-external: drop
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
 Dominik Michael Rauh <dmrauh@posteo.de>, Maxim Kochetkov <fido_max@inbox.ru>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
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
