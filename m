Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E99FC87FCC
	for <buildroot@archiver.kernel.org>; Thu, 31 Jul 2025 13:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C83642951;
	Thu, 31 Jul 2025 13:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id el0B1-U0nNwz; Thu, 31 Jul 2025 13:44:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 512A942949
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 512A942949;
	Thu, 31 Jul 2025 13:44:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id D7D89168
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D52A1611B7
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8Y65HrfRoqnI for <buildroot@buildroot.org>;
 Thu, 31 Jul 2025 13:44:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=2a01:e0c:1:1599::13;
 helo=smtp4-g21.free.fr; envelope-from=ju.o@free.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E9C876118F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E9C876118F
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [IPv6:2a01:e0c:1:1599::13])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E9C876118F
 for <buildroot@buildroot.org>; Thu, 31 Jul 2025 13:44:29 +0000 (UTC)
Received: from home.juju.sh (unknown [192.214.236.6])
 (Authenticated sender: ju.o@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 0820019F5C6;
 Thu, 31 Jul 2025 15:44:20 +0200 (CEST)
To: buildroot@buildroot.org
Cc: Jiaxun Yang <jiaxun.yang@flygoat.com>, Mingcong Bai <jeffbai@aosc.io>,
 Xi Ruoyao <xry111@xry111.site>, Julien Olivain <ju.o@free.fr>
Date: Thu, 31 Jul 2025 15:44:01 +0200
Message-ID: <20250731134401.30301-1-ju.o@free.fr>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1753969466;
 bh=4Of2OuM2pnJbGgKANVkDjBvXMEPEz62P4HJV3UnbaqA=;
 h=From:To:Cc:Subject:Date:From;
 b=uAr82OcEaKBjVnTHVMxu6nqD19ox0RS6wsDcSMXcbp2OnZDSo0zZek1H5u7nX9psv
 cMvfogkgg3K9rZubADqcsZbM6uz1Pux7SEHzq3S/wEioIf5tvqYal/+DK/W86p0AAT
 L9MWLZ1JkuaK3h6Mf7rgjaa1YjMd97M7HY1HdeYFgk4UASDsAsuTpw3jKhWFEC5tZB
 sl99fNxHYGPDyRnQzEV/bnqxDsCBm0CQB4kLKh9phG3JJFmi2+z2SJfQWWXR+awY2g
 i+JXZeVYqN0OrxOqTf97pz636XsyTbsD5MKxmKSUfUBgG6U2MVlQQqLcH/+VNtzTUG
 cIlzXqkHn/Mfw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uAr82OcE
Subject: [Buildroot] [PATCH v3 1/1] arch/loongarch: Mark lp64f and lp64s as
 broken
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Jiaxun Yang <jiaxun.yang@flygoat.com>

Toolchain failed to bootstrap with LP64F and LP64S ABIs.

As reported by Julien in [1]:

Testing the "lp64f" ABI with commands:

     cat >.config <<EOF
     BR2_loongarch64=y
     BR2_LOONGARCH_FPU_32=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
     BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
     BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
     BR2_TARGET_ROOTFS_EXT2=y
     # BR2_TARGET_ROOTFS_TAR is not set
     EOF
     make olddefconfig
     make

fails in host-gcc-initial with output:

     Assembler messages:
     /tmp/ccEkwSsD.s:28: Error: register save offset not a multiple of 8
     /tmp/ccEkwSsD.s:30: Error: register save offset not a multiple of 8
     /tmp/ccEkwSsD.s:50: Error: register save offset not a multiple of 8

See also autobuilder failures such as [2].

Testing the "lp46s" ABI with commands:

     cat >.config <<EOF
     BR2_loongarch64=y
     BR2_LOONGARCH_FPU_NONE=y
     BR2_LINUX_KERNEL=y
     BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
     BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
     BR2_LINUX_KERNEL_NEEDS_HOST_LIBELF=y
     BR2_TARGET_ROOTFS_EXT2=y
     # BR2_TARGET_ROOTFS_TAR is not set
     EOF
     make olddefconfig
     make

fails in host-gcc-final with output:

     /buildroot/output/host/loongarch64-buildroot-linux-gnusf/bin/ld: cannot find crti.o: No such file or directory
     /buildroot/output/host/loongarch64-buildroot-linux-gnusf/bin/ld: cannot find -lc: No such file or directory
     /buildroot/output/host/loongarch64-buildroot-linux-gnusf/bin/ld: cannot find crtn.o: No such file or directory

See also autobuilder failures with as [3].

This commit marks those ABIs as broken at the moment to allow time
for investigation. Also, since gcc defaults to the "lp64d" ABI which
requires a 64bit FPU is present, the BR2_LOONGARCH_FPU_32 and
BR2_LOONGARCH_FPU_NONE options also needs to be marked as broken
as well. See [4].

[1] https://lore.kernel.org/buildroot/e17da108d1fb4e6abda26445dc053b35@free.fr/
[2] https://autobuild.buildroot.org/results/f98570293823867e6c43a1672e1a4b43ca1e4be5
[3] https://autobuild.buildroot.org/results/cf56c37fabcae964dbf4f96eb43a7e4d964452b6
[4] https://lore.kernel.org/buildroot/7b0f1cb629fce8a57d9b644b8beb8b2a@free.fr/

Cc: Mingcong Bai <jeffbai@aosc.io>
Cc: Xi Ruoyao <xry111@xry111.site>
Signed-off-by: Jiaxun Yang <jiaxun.yang@flygoat.com>
[Julien:
 - add link to mailing list discussion
 - add configuration to reproduce issues to help future investigations
 - add links to autobuilder failures in commit log
 - mark BR2_LOONGARCH_FPU_{32,NONE} as broken
]
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
Changes v2 -> v3:
- add link to mailing list discussion
- add configuration to reproduce issues to help future investigations
- add links to autobuilder failures in commit log
- mark BR2_LOONGARCH_FPU_{32,NONE} as broken

Note: this v3 is a follow-up of:
https://patchwork.ozlabs.org/project/buildroot/patch/20250710-loongarch-fabi-v2-2-72fcf95c8b65@flygoat.com/
---
 arch/Config.in.loongarch | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/Config.in.loongarch b/arch/Config.in.loongarch
index fa1b13bc52..4b50b98710 100644
--- a/arch/Config.in.loongarch
+++ b/arch/Config.in.loongarch
@@ -38,12 +38,16 @@ config BR2_LOONGARCH_FPU_64
 
 config BR2_LOONGARCH_FPU_32
 	bool "32"
+	# Only supported by lp64s and lp64f ABIs which are marked as broken
+	depends on BR2_BROKEN
 	help
 	  Allow the use of hardware floating-point instructions for
 	  32-bit operations only.
 
 config BR2_LOONGARCH_FPU_NONE
 	bool "none"
+	# Only supported by lp64s ABI which is marked as broken
+	depends on BR2_BROKEN
 	help
 	  Prevent the use of hardware floating-point instructions.
 endchoice
@@ -87,11 +91,15 @@ config BR2_LOONGARCH_ABI_LP64D
 config BR2_LOONGARCH_ABI_LP64F
 	bool "lp64f"
 	depends on BR2_ARCH_IS_64
+	# Failed to build host GCC initial, pending investigation
+	depends on BR2_BROKEN
 	depends on BR2_LOONGARCH_FPU_64 || BR2_LOONGARCH_FPU_32
 
 config BR2_LOONGARCH_ABI_LP64S
 	bool "lp64s"
 	depends on BR2_ARCH_IS_64
+	# GCC can't find libraries, pending investigation
+	depends on BR2_BROKEN
 endchoice
 
 config BR2_ARCH
-- 
2.50.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
