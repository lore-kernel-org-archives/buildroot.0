Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66B11C6FA83
	for <buildroot@archiver.kernel.org>; Fri, 23 Sep 2022 21:37:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04EA760F1B;
	Fri, 23 Sep 2022 21:37:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 04EA760F1B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MbiL7H--MdtH; Fri, 23 Sep 2022 21:37:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F13A60B2C;
	Fri, 23 Sep 2022 21:37:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F13A60B2C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F1BAE1BF337
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C8D7A4098D
 for <buildroot@lists.busybox.net>; Fri, 23 Sep 2022 21:36:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C8D7A4098D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Navq8g8WFZbt for <buildroot@lists.busybox.net>;
 Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75EE741A2A
 for <buildroot@buildroot.org>; Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75EE741A2A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 64FB485F1C; Fri, 23 Sep 2022 21:36:17 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Fri, 23 Sep 2022 23:35:00 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ab828e25fb3ea640cfa7e85a5dd765db208db80a
X-Git-Newrev: b0fea0b7af1a6d70bda21bb480b9df3bc313d451
X-Patchwork-Hint: ignore
Message-Id: <20220923213617.64FB485F1C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] Revert "toolchain/toolchain-external:
 update Arm AArch64 BE toolchain 11.2-2022.02"
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

commit: https://git.buildroot.net/buildroot/commit/?id=b0fea0b7af1a6d70bda21bb480b9df3bc313d451
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported to Linaro bug tracker [1] the Arm GNU Toolchain generated
since 2022.02 doesn't work on all x86_64 host.

It still not fixed with 11.3.Rel1 release (2022.08).

Fixes #15006

[1] https://bugs.linaro.org/show_bug.cgi?id=5825#c19

This reverts commit f4a78565db49b90d96b5e28cd06e6b07cb0a7e61.

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../toolchain-external/toolchain-external-arm-aarch64-be/Config.in  | 4 ++--
 .../toolchain-external-arm-aarch64-be.hash                          | 6 ++++--
 .../toolchain-external-arm-aarch64-be.mk                            | 6 +++---
 3 files changed, 9 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index dba50595f5..eeb88579fe 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,12 +1,12 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 2022.02"
+	bool "Arm AArch64 BE 2021.07"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index 99a2f1ff22..1079917c98 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,2 +1,4 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/11.2-2022.02/binrel/gcc-arm-11.2-2022.02-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
-sha256  cc834d22fd8eff98d18cf3f464e30f5e4aee0966e51f9e09514e948f1eb9884b  gcc-arm-11.2-2022.02-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-2021.07/binrel/gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz.asc
+md5  54cbaef7db7eb3de27732500f9da9c6f  gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# locally calculated
+sha256  63c34cac07ceadd74620ea87f27af1aa6a6f55c20a5bc116af21a59ddb6b6a6a  gcc-arm-10.3-2021.07-x86_64-aarch64_be-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index f98f090327..5a6dbc60d5 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2022.02
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/11.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 2021.07
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu-a/10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-11.2-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = gcc-arm-10.3-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
 
 $(eval $(toolchain-external-package))
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
