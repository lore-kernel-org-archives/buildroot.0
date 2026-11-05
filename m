Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B931B606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 15:58:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=T9Yjf9VW
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B9468115D;
	Fri,  6 Nov 2026 15:58:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lW1m8OtZx5cJ; Fri,  6 Nov 2026 15:58:31 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org F2C0080F5D
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793980711;
	b=Bh7p95QFoleIP8hu0zDxVWLy/k3IyhuMgi7fZYfY1wLE3aODVy6R6aHFRbj6Ux7+kFTr
	 CXt794gPWqK5LJPKtjfRyLb+8GU+PJ5sJqigdEQS5GSzKgPdaTsVGPsH9pINUEPZ0wDrR
	 20CAVKQVJmi2WbTT5FsoiW33xvTdgdL4tNu/+HlESK6Zs5++4NI3kttGI58jC9guFSP39
	 m5iP6H6yxXXpykits3HYksBOpNrDC/HJql/OngAFQKAPWJEOMWRP0xdSawFIOs8B8M/9j
	 3/uf7Z2z0GLwvJgUv14r8mSBiolwqff3vB2QwQwuPq4WPUJyKJxbzzwbUenZLjuWm7w==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793980711;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=U3aNUQK7R5oMT17GOk4MJejSxuvWcjNKdoICfRIEfb8=;
	b=GqXMu/0IphFwMxZcVzI8uY/mckM885NpDcRPegjsLeF2WZ4/nwzdyeGSBaBwG7YkgqkG
	 ty8amYcLebFdVgm374XKfY3cr4wzuMJuah57UwbVIE/OGptMxFbyaXtZBXVw/+WCGMBN4
	 U/ofivxdjIqb4dHSUF/Ne6UYLrjAMzHZhQfcATHKXDHPJsg349PtXgN+VZ1DXLAxAzOXn
	 JY2v56uBtmQRgY4x3GFs7uuxm09QQQeOoRofy509DVnwB60D63YMd+LWMTgrujHcet/Gy
	 P/AyYk7p+rTASMDtvQBkQfwslrKDbVc3PbORv1EUxX6Xk3ZlqctPAFfTD9ZctWan4vQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793980711;
	bh=U3aNUQK7R5oMT17GOk4MJejSxuvWcjNKdoICfRIEfb8=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=T9Yjf9VWVqN54zneJFWcNsJDx29p6btYAGoZbu0uRgVLJXZoxTOCoz7VablzZbCYa
	 cAZs9DWE5JIb8+YnnS4QiSn+emO66juYyCqmbyR0ltwqeoNDFeP0YyCDyfbA8jspCy
	 JtcxSsi7YCYSddeW/OILNEkpIz8aDujuw8bRTV98+FYERGKl8gXuvO58Zoc64oyZDP
	 xyJ6DrPc1BKM+aqm5kzGVXPz5RKVIvXhdMqMlH6vlUdbBbfYgrqMcki4DwuqGlRCRy
	 Pc6BPJPB7A8nahtpPGsWx7bgN1JePhLRVoAf0DTb+toOC28ql01E/Cz+VVlIKZ3foZ
	 SbW5pCmDptRqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id F2C0080F5D;
	Fri,  6 Nov 2026 15:58:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 76DF74B8
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6966440925
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xCVHEFpI4aGJ for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp4.osuosl.org 649B040913
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 649B040913
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 15:58:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 9CFF79E0A8; Fri,  6 Nov 2026 15:56:55 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 11:33:50 +0100
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: 0e0616428cf5a5e7dc7f2e7581f94e966a09d8fe
X-Git-Newrev: 6f03f11d1e19c2f433494f0b563ee9954b1a7314
X-Patchwork-Hint: ignore
Message-Id: <20261106155655.9CFF79E0A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x]
 toolchain/toolchain-external/toolchain-external-bootlin: regenerate after
 ARMv7 EABIhf toolchain fix
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=-19.8 required=3.0 tests=BAYES_00,DATE_IN_PAST_24_48,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_PASS,
	UPPERCASE_50_75 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/6f03f11d1e19c2f433494f0b563ee9954b1a7314
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2025.02.x

The gen-bootlin-toolchains script has been fixed to generate more
correct conditions for the ARMv7 EABIhf toolchains (both little and
big endian). This change will make sure the toolchain cannot be
selected in a BR2_arm=y, BR2_ARM_CPU_ARMV8A=y, BR2_ARM_EABI=y
configuration.

Fixes:

  https://autobuild.buildroot.org/results/3ce1dbd480c71b782ef722c39034cb039a036523/

Reported-by: Julien Olivain <ju.o@free.fr>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit d5990da7b19454852fd0cc2f530962f29ba89401)
[thomas: backport]
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 .../toolchain-external-bootlin/Config.in.options   | 40 ++++++++++++++--------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
index 2dac422796..27533a9053 100644
--- a/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
+++ b/toolchain/toolchain-external/toolchain-external-bootlin/Config.in.options
@@ -8,8 +8,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARCH_SUPPORTS
 	default y if BR2_arcle && BR2_archs38
 	default y if BR2_arm && BR2_ARM_CPU_ARMV5 && BR2_ARM_EABI
 	default y if BR2_arm && BR2_ARM_CPU_ARMV6 && BR2_ARM_EABIHF
-	default y if BR2_arm && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
-	default y if BR2_armeb && (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	default y if BR2_arm && BR2_ARM_EABIHF && (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
+	default y if BR2_armeb && BR2_ARM_EABIHF && (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	default y if BR2_arm && BR2_ARM_CPU_ARMV7M && BR2_BINFMT_FLAT
 	default y if BR2_m68k_m68k
 	default y if BR2_m68k_cf
@@ -818,7 +818,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf glibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -844,7 +845,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	bool "armv7-eabihf glibc stable 2024.05-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -869,7 +871,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armv7-eabihf musl bleeding-edge 2024.05-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -895,7 +898,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 	bool "armv7-eabihf musl stable 2024.05-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -920,7 +924,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf uclibc bleeding-edge 2024.05-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -946,7 +951,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 	bool "armv7-eabihf uclibc stable 2024.05-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
@@ -971,7 +977,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armebv7-eabihf glibc bleeding-edge 2024.05-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -997,7 +1004,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 	bool "armebv7-eabihf glibc stable 2024.05-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -1022,7 +1030,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armebv7-eabihf musl bleeding-edge 2024.05-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -1048,7 +1057,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 	bool "armebv7-eabihf musl stable 2024.05-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
@@ -1073,7 +1083,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armebv7-eabihf uclibc bleeding-edge 2024.05-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1099,7 +1110,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
 	bool "armebv7-eabihf uclibc stable 2024.05-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_19
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
