Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88D8AC43334
	for <buildroot@archiver.kernel.org>; Sun, 19 Jun 2022 16:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2122540875;
	Sun, 19 Jun 2022 16:36:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2122540875
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N-q5iw7mEyvo; Sun, 19 Jun 2022 16:36:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B24D4087C;
	Sun, 19 Jun 2022 16:36:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9B24D4087C
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 188A01BF4E7
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E6DAA60B15
 for <buildroot@lists.busybox.net>; Sun, 19 Jun 2022 16:36:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E6DAA60B15
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DCjVsALua1du for <buildroot@lists.busybox.net>;
 Sun, 19 Jun 2022 16:36:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2ED860746
 for <buildroot@buildroot.org>; Sun, 19 Jun 2022 16:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2ED860746
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7C0B9873F9; Sun, 19 Jun 2022 16:24:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 19 Jun 2022 18:26:44 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3d08d23b783fd22e3e153f3f2080d63ab2d36ea4
X-Git-Newrev: 18a6a38394eb582d2211c559483181fa7aa509ce
X-Patchwork-Hint: ignore
Message-Id: <20220619162408.7C0B9873F9@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-andes-nds32: remove package
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

commit: https://git.buildroot.net/buildroot/commit/?id=18a6a38394eb582d2211c559483181fa7aa509ce
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As we're about to remove the nds32 architecture support from
Buildroot, drop the toolchain-external-andes-nds32 external toolchain
package.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Reviewed-by: Yu Chien Peter Lin <peterlin@andestech.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 DEVELOPERS                                                |  1 -
 support/config-fragments/autobuild/andes-nds32.config     |  3 ---
 support/config-fragments/autobuild/toolchain-configs.csv  |  1 -
 toolchain/toolchain-external/Config.in                    |  6 ------
 .../toolchain-external-andes-nds32/Config.in              | 15 ---------------
 .../toolchain-external-andes-nds32/Config.in.options      |  9 ---------
 .../toolchain-external-andes-nds32.hash                   |  2 --
 .../toolchain-external-andes-nds32.mk                     | 10 ----------
 8 files changed, 47 deletions(-)

diff --git a/DEVELOPERS b/DEVELOPERS
index 21f2fb21a5..f4e87eec09 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -2175,7 +2175,6 @@ N:	Yu Chien Peter Lin <peterlin@andestech.com>
 F:	arch/Config.in.nds32
 F:	board/andes
 F:	configs/andes_ae350_45_defconfig
-F:	toolchain/toolchain-external/toolchain-external-andes-nds32/
 
 N:	Olaf Rempel <razzor@kopf-tisch.de>
 F:	package/ctorrent/
diff --git a/support/config-fragments/autobuild/andes-nds32.config b/support/config-fragments/autobuild/andes-nds32.config
deleted file mode 100644
index 541677e002..0000000000
--- a/support/config-fragments/autobuild/andes-nds32.config
+++ /dev/null
@@ -1,3 +0,0 @@
-BR2_nds32=y
-BR2_TOOLCHAIN_EXTERNAL=y
-BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32=y
diff --git a/support/config-fragments/autobuild/toolchain-configs.csv b/support/config-fragments/autobuild/toolchain-configs.csv
index f5e9bd8cf9..0b19051543 100644
--- a/support/config-fragments/autobuild/toolchain-configs.csv
+++ b/support/config-fragments/autobuild/toolchain-configs.csv
@@ -22,7 +22,6 @@ support/config-fragments/autobuild/br-arm-full-static.config,x86_64
 support/config-fragments/autobuild/sourcery-arm.config,x86
 
 # Toolchains used by test-pkg only when the '-a' option is passed:
-support/config-fragments/autobuild/andes-nds32.config,x86
 support/config-fragments/autobuild/arm-aarch64.config,x86_64
 support/config-fragments/autobuild/bootlin-aarch64-glibc.config,x86_64
 support/config-fragments/autobuild/bootlin-arcle-hs38-uclibc.config,x86_64
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 1a67e5645f..97cdc26df9 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -23,9 +23,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config
 # ARC
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in"
 
-# Andes
-source "toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in"
-
 # ARM (use ARM toolchain by default)
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in"
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in"
@@ -130,9 +127,6 @@ source "toolchain/toolchain-external/toolchain-external-linaro-aarch64-be/Config
 # ARC
 source "toolchain/toolchain-external/toolchain-external-synopsys-arc/Config.in.options"
 
-# Andes
-source "toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options"
-
 # ARM
 source "toolchain/toolchain-external/toolchain-external-arm-arm/Config.in.options"
 source "toolchain/toolchain-external/toolchain-external-linaro-arm/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
deleted file mode 100644
index ecd50cc805..0000000000
--- a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in
+++ /dev/null
@@ -1,15 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
-	bool "Andes nds32"
-	depends on BR2_nds32
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_17
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HAS_SSP
-	help
-	  nds32 toolchain for the nds32 architecture. It uses GCC
-	  8.2.1, GDB 8.1.1, glibc 2.28, Binutils 2.30. It generates
-	  code that runs on ae300 platform
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options b/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
deleted file mode 100644
index 7d11ae2098..0000000000
--- a/toolchain/toolchain-external/toolchain-external-andes-nds32/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_ANDES_NDS32
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "nds32le-linux"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-andes-nds32"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash
deleted file mode 100644
index 4314bb1f55..0000000000
--- a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# From https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521/nds32le-linux-glibc-v3-upstream.tar.gz
-sha256 6050601df85ad93a4c211c1d57ed3773edb62aa505f7e07d7d555652e83af2cc  nds32le-linux-glibc-v3-upstream.tar.gz
diff --git a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk b/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk
deleted file mode 100644
index fa29490b4f..0000000000
--- a/toolchain/toolchain-external/toolchain-external-andes-nds32/toolchain-external-andes-nds32.mk
+++ /dev/null
@@ -1,10 +0,0 @@
-################################################################################
-#
-# toolchain-external-andes-nds32
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_ANDES_NDS32_SITE = https://github.com/vincentzwc/prebuilt-nds32-toolchain/releases/download/20180521
-TOOLCHAIN_EXTERNAL_ANDES_NDS32_SOURCE = nds32le-linux-glibc-v3-upstream.tar.gz
-
-$(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
