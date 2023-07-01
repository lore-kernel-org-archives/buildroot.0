Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0674DEB64DC
	for <buildroot@archiver.kernel.org>; Sat,  1 Jul 2023 20:11:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8BB454091C;
	Sat,  1 Jul 2023 20:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8BB454091C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id h8y-Rpt0OD1e; Sat,  1 Jul 2023 20:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 988B5403BF;
	Sat,  1 Jul 2023 20:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 988B5403BF
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8F4901BF2B7
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 691A3403BF
 for <buildroot@lists.busybox.net>; Sat,  1 Jul 2023 20:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 691A3403BF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LZe-KfruuGJM for <buildroot@lists.busybox.net>;
 Sat,  1 Jul 2023 20:11:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8AC584010C
 for <buildroot@buildroot.org>; Sat,  1 Jul 2023 20:11:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8AC584010C
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 79AAD862F8; Sat,  1 Jul 2023 20:11:00 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 1 Jul 2023 22:10:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 90404e84c1c9d65b4f38cc3ebc30ef6a4da314cb
X-Git-Newrev: 0b9877a4b93c5f849c293b1c220490be5ed241ec
X-Patchwork-Hint: ignore
Message-Id: <20230701201100.79AAD862F8@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-arm-aarch64-be: bump to
 version 12.2-rel1
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

commit: https://git.buildroot.net/buildroot/commit/?id=0b9877a4b93c5f849c293b1c220490be5ed241ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Updated to gcc 12.2, gdb 12, binutils 2.39, glibc 2.36.

Upstream changed version scheme previously based on the release
date (2021.07) to a version scheme based on gcc version (12.2.rel1).

The runtime issue (Illegal instruction on some x86 host) [1] seems to
be fixed since it can't be reproduced anymore on the same host.

The x86_64 host variant prebuilt toolchain is built on RHEL7
(glibc 2.17) and is likely also be useable on OS versions like
RHEL8, Ubuntu 18.04 or later.

The AArch64 host variant prebuilt toolchain is built on Ubuntu 18.04
(glibc 2.27) is likely also be useable on OS versions like RHEL8,
Ubuntu 18.04 or later.

Use the sha256 hash that is now provided by upsteam.

[1] https://bugs.linaro.org/show_bug.cgi?id=5825#c19
[2] https://developer.arm.com/downloads/-/arm-gnu-toolchain-downloads

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/toolchain-external-arm-aarch64-be/Config.in  | 4 ++--
 .../toolchain-external-arm-aarch64-be.hash                          | 6 ++----
 .../toolchain-external-arm-aarch64-be.mk                            | 6 +++---
 3 files changed, 7 insertions(+), 9 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index eeb88579fe..62e5ea8667 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,12 +1,12 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 2021.07"
+	bool "Arm AArch64 BE 12.2.rel1"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_12
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index 1079917c98..f148d6326d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,4 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz.asc
-md5  54cbaef7db7eb3de27732500f9da9c6f  gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz
-# locally calculated
-sha256  63c34cac07ceadd74620ea87f27af1aa6a6f55c20a5bc116af21a59ddb6b6a6a  gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/12.2.rel1/binrel/arm-gnu-toolchain-12.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
+sha256  47632b5594ed6c3efda92a55c4c330263fc22f5d845d9e1c7d969ce24fcedeea  arm-gnu-toolchain-12.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index 5a6dbc60d5..d35b945b04 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2021.07
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 12.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
