Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A61C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85C5F60E8E;
	Wed, 24 Aug 2022 11:19:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 85C5F60E8E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id i2G3WWNuoUWw; Wed, 24 Aug 2022 11:19:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9301560E85;
	Wed, 24 Aug 2022 11:19:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9301560E85
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A41E1C116E
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A351C40FC2
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:10:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A351C40FC2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Gji8kIyf9XIz for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:10:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 735FC40DC2
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:10:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 735FC40DC2
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1F76187CF6; Wed, 24 Aug 2022 10:55:12 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 24 Aug 2022 13:04:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f4a78565db49b90d96b5e28cd06e6b07cb0a7e61
X-Git-Newrev: 22d10e294cc9cd30fa8adc3672a337167e6241a3
X-Patchwork-Hint: ignore
Message-Id: <20220824105512.1F76187CF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] toolchain/toolchain-external:
 update Arm ARM32 toolchain 11.2-2022.02
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=22d10e294cc9cd30fa8adc3672a337167e6241a3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Updated to gcc 11.2, gdb 11, binutils 2.37, glibc 2.34.

See https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/toolchain-external-arm-arm/Config.in  |  8 ++++----
 .../toolchain-external-arm-arm.hash                          | 12 +++++-------
 .../toolchain-external-arm-arm/toolchain-external-arm-arm.mk |  6 +++---
 3 files changed, 12 insertions(+), 14 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index 28c6541406..c595b1c133 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -3,7 +3,7 @@ comment "Arm toolchains available for Cortex-A with NEON + EABIhf"
 	depends on !BR2_ARM_CPU_ARMV7A || !BR2_ARM_EABIHF || !BR2_ARM_CPU_HAS_NEON
 
 config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
-	bool "Arm ARM 2021.07"
+	bool "Arm ARM 2022.02"
 	depends on BR2_arm
 	depends on BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A
 	depends on BR2_ARM_CPU_HAS_NEON
@@ -13,12 +13,12 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
-	  Arm toolchain for the ARM architecture. It uses GCC 10.3,
-	  GDB 10.2, glibc 2.33, Binutils 2.36.1. It generates code
+	  Arm toolchain for the ARM architecture. It uses GCC 11.2,
+	  GDB 11, glibc 2.34, Binutils 2.37. It generates code
 	  that runs on all Cortex-A profile devices. The code
 	  generated uses the hard floating point calling convention,
 	  and uses the NEON FPU instructions.
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
index 1fc2c5de57..3c07237e1d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.hash
@@ -1,7 +1,5 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz.asc
-md5  87ec580b290df2febc7c476f59484635  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz.asc
-md5  0f1c5c90f5c62e1d1066f75fb3e51e21  gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz
-# locally calculated
-sha256  aa074fa8371a4f73fecbd16bd62c8b1945f23289e26414794f130d6ccdf8e39c  gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf.tar.xz
-sha256  fccd7af76988da2b077f939eb2a78baa9935810918d2bf3f837bc74f52efa825  gcc-arm-10.3-2021.07-aarch64-arm-none-linux-gnueabihf.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  c254f7199261fe76c32ef42187502839bda7efad0a66646cf739d074eff45fad  gcc-arm-11.2-2022.02-x86_64-arm-none-linux-gnueabihf.tar.xz
+
+# From https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-aarch64-arm-none-linux-gnueabihf.tar.xz.sha256asc
+sha256  c5603772af016008ddacb7e475dc226d0cccdf069925dfded43e452a59774fc3  gcc-arm-11.2-2022.02-aarch64-arm-none-linux-gnueabihf.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
index 8731a4f0e5..1bab088830 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/toolchain-external-arm-arm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2021.07
-TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION = 2022.02
+TOOLCHAIN_EXTERNAL_ARM_ARM_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/11.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_ARM_SOURCE = gcc-arm-11.2-$(TOOLCHAIN_EXTERNAL_ARM_ARM_VERSION)-$(HOSTARCH)-arm-none-linux-gnueabihf.tar.xz
 
 $(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
