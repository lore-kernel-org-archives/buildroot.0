Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A210C4167B
	for <buildroot@archiver.kernel.org>; Fri,  8 Dec 2023 21:35:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DEA466FA18;
	Fri,  8 Dec 2023 21:35:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DEA466FA18
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zqafzdWANtV7; Fri,  8 Dec 2023 21:35:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D5666FA41;
	Fri,  8 Dec 2023 21:35:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D5666FA41
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D70181BF417
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 21:35:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B067683C86
 for <buildroot@lists.busybox.net>; Fri,  8 Dec 2023 21:35:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B067683C86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 06-hEMU8nIfe for <buildroot@lists.busybox.net>;
 Fri,  8 Dec 2023 21:35:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id C2AF58164A
 for <buildroot@buildroot.org>; Fri,  8 Dec 2023 21:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C2AF58164A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id ACE5187976; Fri,  8 Dec 2023 21:35:13 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Fri, 8 Dec 2023 22:34:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 0dd599d171df7852ae801173c8212976e50b09e1
X-Git-Newrev: 7b4b3c2c78034fb3b16ad9658057f05066dcc4dd
X-Patchwork-Hint: ignore
Message-Id: <20231208213513.ACE5187976@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-arm-aarch64: bump to
 version 13.2-rel1
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

commit: https://git.buildroot.net/buildroot/commit/?id=7b4b3c2c78034fb3b16ad9658057f05066dcc4dd
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated to gcc 13.2, gdb 13, binutils 2.41, glibc 2.38.

The x86_64 host variant prebuilt toolchain is built on RHEL7
(glibc 2.17) and is likely also be useable on OS versions like
RHEL8, Ubuntu 18.04 or later.

The AArch64 host variant prebuilt toolchain is built on Ubuntu 18.04
(glibc 2.27) is likely also be useable on OS versions like RHEL8,
Ubuntu 18.04 or later.

Tested with qemu_aarch64_virt_defconfig.

Release note:
https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

Signed-off-by: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in | 4 ++--
 .../toolchain-external-arm-aarch64.hash                               | 4 ++--
 .../toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk  | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index fc62b759e5..2565707def 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,5 +1,5 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 12.2.rel1"
+	bool "Arm AArch64 13.2.rel1"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
@@ -7,7 +7,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index 6c4847831e..9de90d4b06 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,2 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
-sha256  6e8112dce0d4334d93bd3193815f16abe6a2dd5e7872697987a0b12308f876a4  arm-gnu-toolchain-12.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/13.2.rel1/binrel/arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
+sha256  12fcdf13a7430655229b20438a49e8566e26551ba08759922cdaf4695b0d4e23  arm-gnu-toolchain-13.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index 9cdf58305b..f9adda8921 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 12.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 13.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
