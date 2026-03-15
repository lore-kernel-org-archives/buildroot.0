Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04784F3026D
	for <buildroot@archiver.kernel.org>; Sun, 15 Mar 2026 15:18:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9CDC882661;
	Sun, 15 Mar 2026 15:18:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YowEOUjSFWoo; Sun, 15 Mar 2026 15:18:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8862B825B1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773587929;
	bh=7mIUkaRccMMzQ3TwFwPnuqyI7WFxmi9FdqjjaBZ6DoU=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=oIUu4RBWReM6f5TUWpBvT4uAHoClfsaoGjgvxEtWbod4ficHl+oUuDw0OndU6fXkE
	 YS1ZdQXsO169qr4hP90V/G35b/Uj71BPNORGHpi3z3d0a5Juqoc9oIbEFFJ1ZwmVAz
	 o7cB6GgkTUBZ2ejJs7hd7slK3ODxb4mtVgiQarED5txaU4CemXNURETU+kt3+AZ8+F
	 HKzdF5XrSEuhV7xx+HyLeibhMkv6RiFOOWJidMAiiKmiM64XjLejn4UnTQQeWlhoIC
	 I++k60ZiX99pHO4GHgI2ujX7iDn2hIkss4NlWUXsMwR2YKsqKnxmb2NiYNsvRhPLhW
	 V7ZiZ9mD1AonQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8862B825B1;
	Sun, 15 Mar 2026 15:18:49 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D7071B4
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:18:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2ED1860AFE
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:18:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v53q6a-X0PWQ for <buildroot@buildroot.org>;
 Sun, 15 Mar 2026 15:18:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2668460AEF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2668460AEF
 for <buildroot@buildroot.org>; Sun, 15 Mar 2026 15:18:46 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 58E1884FBA; Sun, 15 Mar 2026 15:18:46 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 15 Mar 2026 14:21:59 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8d413d61792724877bfd886fe3ba519fb5259566
X-Git-Newrev: 8cb765faa68a4ea7abf6445009f0586063aa4d4a
X-Patchwork-Hint: ignore
Message-Id: <20260315151846.58E1884FBA@busybox.osuosl.org>
Subject: [Buildroot] [git commit]
 toolchain/toolchain-external/toolchain-external-arm-aarch64-be: bump to
 15.2.rel1
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/8cb765faa68a4ea7abf6445009f0586063aa4d4a
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Update the ARM aarch64-be external toolchains to the latest 15.2.rel1
release from ARM.

This involves:
- Updating the version, site URL, and source filename in .mk
- Updating the SHA256 hash in .hash
- Updating the display name and GCC version dependency in Config.in

Signed-off-by: Dowan Gullient <dowan.gullient@smile.fr>
[Julien: add newline at end of file to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../toolchain-external-arm-aarch64-be/Config.in                   | 8 ++++----
 .../toolchain-external-arm-aarch64-be.hash                        | 4 ++--
 .../toolchain-external-arm-aarch64-be.mk                          | 2 +-
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index 3a71e1356b..c3592b9d20 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -1,13 +1,13 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
-	bool "Arm AArch64 BE 14.2.rel1"
+	bool "Arm AArch64 BE 15.2.rel1"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
+	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_6_6
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
index 317fc10a09..8ba94f415d 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.hash
@@ -1,2 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
-sha256  0ea5d00d0ba4c5d16bc8e140d434c54367516b568a146d724936c589a2f56aaf  arm-gnu-toolchain-14.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/15.2.rel1/binrel/arm-gnu-toolchain-15.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz.sha256asc
+sha256  f848f5b15d49217fbe8b3d72e1cc44eac06b096e6b66fa892898fa9c710a3c05  arm-gnu-toolchain-15.2.rel1-x86_64-aarch64_be-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
index 381a591932..264e8bff71 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/toolchain-external-arm-aarch64-be.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 14.2.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION = 15.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE_VERSION)-x86_64-aarch64_be-none-linux-gnu.tar.xz
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
