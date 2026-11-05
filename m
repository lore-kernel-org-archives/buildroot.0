Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF580606A329
	for <buildroot@archiver.kernel.org>; Fri,  6 Nov 2026 16:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=SKSG+w25
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A5A4F812B9;
	Fri,  6 Nov 2026 16:08:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id roAlh6yDi4AE; Fri,  6 Nov 2026 16:08:20 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp1.osuosl.org 18C578129F
Authentication-Results: smtp1.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1793981300;
	b=NiUYQZXp7GNa6nnx3epuZn9lft/3Og4UxgRc9+KAUvO3Lfnb1ZneyteCZBTqs7AZlTi2
	 WwSQx6RcWbz2OxqZ5woQoD407hJvPJTngJZuXEMeDN5CnrTPaMmLcjmMEjJnyi496+0FH
	 kFjpHSbDy5Xv+Q+kaUQHSby6lcqgO6MCndT4Kjyjcy6qLwKzmGSoBxVNmpII2YqkM4a4p
	 NFnKB0mQaB0/Ww7nQP9sxpuUm+eICPwipzfHYHZJEXklHDqcYKetvXZ/BjYMqG0UKGuAZ
	 741VoNFcOkQsUSlEii+DeltZC4zgozmfrej3Tu0lwlTSwg5uX+0SkmjdRVxLxWf8tVw==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1793981300;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:Received:ARC-Filter:X-Comment:Received:
	 Received:To:Date:X-Git-Refname:X-Git-Oldrev:X-Git-Newrev:
	 X-Patchwork-Hint:Message-Id:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:From:Reply-To:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Errors-To:Sender;
	bh=SCwQkFcm45qUSNKXvDKRVurUNo7bmgTegBhhtrol0W0=;
	b=lCENwf0PD0nYH4GJdT2GpA4t+IQPQnqyyaYX2mGb6WtGQ6/0MkcjouZCOLisnPZ/yMdZ
	 xRWF/WO8LeXXstiqAgVtATYoXcDWqTgvdHs0C+Evj6wNILmO1fq4PqnCMH/umouydyom5
	 xILTkXnhgo8L/Mco4bwEEo68Y2AvjxR0f7SwGVtK769b++q5jJRign2QAT5NLxXQxUWVH
	 hVPyg3ftno/AWyOSZEzqKF+5gV5cBLFiYHWVA+jFbVD6IBakG+QeIlptlCAoCBnU2Tp45
	 nZhh0pEiO1UzPcQg3/0iueRiTdjcEPZysqUwh/fbD0p1vJ1SFobmsylwuv08V0fsCTQ==
ARC-Authentication-Results: i=1; smtp1.osuosl.org; 
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1793981300;
	bh=SCwQkFcm45qUSNKXvDKRVurUNo7bmgTegBhhtrol0W0=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=SKSG+w258k9/e4QRE62JvyFFC3mQ0KIiBmJdu7QPoMQHoobO95VlwEACVLxlPmbSm
	 VmX0AdZC8gsndes29a/mUrpOLcDE+XBrIv8KNVbbmggrNifz+mQF6Obv/5CiA3L4Va
	 mow0WHGNpRP9Fdq3jPGDGXwODWn+VUVxxnz8eKhnoiC6IFumQrYrXqFNcdl8B85xN2
	 /x7ECKOvckg2F0urv2pSd4lMz4WdDsVeKkNqiTIq7WwKIWmMG6tYOZiM6TU5swSi7a
	 rYs9QmP3xfRVtjCReiuNXfxNmUvVbCyyXho6+lp6vz3Y3sXHm/BeCXzKZDC8HG/XVk
	 zPRQuVWF0foPg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 18C578129F;
	Fri,  6 Nov 2026 16:08:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3CAEF2E5
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2AE766061F
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xAbUmbeN3Lau for <buildroot@buildroot.org>;
 Fri,  6 Nov 2026 16:08:12 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org 94997605D0
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 94997605D0
 for <buildroot@buildroot.org>; Fri,  6 Nov 2026 16:08:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BCFCB9E0B0; Fri,  6 Nov 2026 16:06:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 5 Nov 2026 11:36:14 +0100
X-Git-Refname: refs/heads/2026.08.x
X-Git-Oldrev: 784fd9c091a928154d18fb97b1159f50fa176bee
X-Git-Newrev: 38f964a949500b6da6e39086edb009aedfc59403
X-Patchwork-Hint: ignore
Message-Id: <20261106160639.BCFCB9E0B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2026.08.x]
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/38f964a949500b6da6e39086edb009aedfc59403
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/2026.08.x

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
index f59c6aed5e..c82d5895b7 100644
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
 	default y if BR2_m68k_m68k && BR2_USE_MMU
 	default y if BR2_m68k_cf
@@ -758,7 +758,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV6_EABIHF_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf glibc bleeding-edge 2025.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -782,7 +783,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 	bool "armv7-eabihf glibc stable 2025.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -805,7 +807,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armv7-eabihf musl bleeding-edge 2025.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -829,7 +832,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 	bool "armv7-eabihf musl stable 2025.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -852,7 +856,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armv7-eabihf uclibc bleeding-edge 2025.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -876,7 +881,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 	bool "armv7-eabihf uclibc stable 2025.08-1"
 	depends on BR2_arm
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
@@ -899,7 +905,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMV7_EABIHF_UCLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 	bool "armebv7-eabihf glibc bleeding-edge 2025.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -923,7 +930,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 	bool "armebv7-eabihf glibc stable 2025.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -946,7 +954,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_GLIBC_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 	bool "armebv7-eabihf musl bleeding-edge 2025.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
@@ -970,7 +979,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 	bool "armebv7-eabihf musl stable 2025.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	depends on BR2_USE_MMU
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
@@ -993,7 +1003,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_MUSL_STABLE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 	bool "armebv7-eabihf uclibc bleeding-edge 2025.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_16
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
@@ -1017,7 +1028,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_BLEEDING_EDGE
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_ARMEBV7_EABIHF_UCLIBC_STABLE
 	bool "armebv7-eabihf uclibc stable 2025.08-1"
 	depends on BR2_armeb
-	depends on (BR2_ARM_CPU_ARMV7A && BR2_ARM_EABIHF) || BR2_ARM_CPU_ARMV8A
+	depends on BR2_ARM_EABIHF
+	depends on (BR2_ARM_CPU_ARMV7A || BR2_ARM_CPU_ARMV8A)
 	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_4
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
