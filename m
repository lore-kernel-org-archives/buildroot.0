Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7D4EC433EF
	for <buildroot@archiver.kernel.org>; Wed, 13 Apr 2022 20:51:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 323F841822;
	Wed, 13 Apr 2022 20:51:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LrcVxZL_JQTQ; Wed, 13 Apr 2022 20:51:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1F0924181E;
	Wed, 13 Apr 2022 20:51:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE49D1BF38D
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:51:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CA6CE4181E
 for <buildroot@lists.busybox.net>; Wed, 13 Apr 2022 20:51:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBOXBk-znHNr for <buildroot@lists.busybox.net>;
 Wed, 13 Apr 2022 20:51:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [IPv6:2001:4b98:dc4:8::225])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B1013417E0
 for <buildroot@buildroot.org>; Wed, 13 Apr 2022 20:51:50 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 2DC721C0005;
 Wed, 13 Apr 2022 20:51:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
 t=1649883108;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=u56Kun1jUqvYo6/HC7TAFNQp7fCL9UDk9gxZPxOKGq8=;
 b=OHV/HPpn9GGNwaKdUfPDZstbFV8q1f5pZrq1WHvX6s3HKgDoSaolNECqNCXN2N6WHDm4AM
 XD8YlE0IkSo0olo/6X1JNJlp/Ej9usJbnCnaAaNTHhfGi9u0hdv28x21lOabvIxf3pWlUO
 Eg22gc6YEP7Hvw7GjCK/EUyDj4xg28pMiZe2RhTX7AsDDLgxr0X0knj7rnq+Gxq2FffvRs
 3CC1bN2Ht2rqYCTAsGh3I0bBBQlY8nO50kyRZmxU5tla9gbqTnqwL5fi0HV1rzjOpLgXVF
 VGfI3RMcTstvEDLCLd+HI/eLlDi0I0Y1S5JXFLhFKNKe1EkFD3mrGyx0H0+/Ow==
Date: Wed, 13 Apr 2022 22:51:47 +0200
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220413225147.48bd5442@windsurf>
In-Reply-To: <20220409020719.3126086-1-james.hilliard1@gmail.com>
References: <20220409020719.3126086-1-james.hilliard1@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Subject: Re: [Buildroot] [PATCH 1/1] package/binutils: disable 2.32 on
 unuspported FLAT platforms
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello James,

On Fri,  8 Apr 2022 20:07:19 -0600
James Hilliard <james.hilliard1@gmail.com> wrote:

> These architectures are unsupported in config.bfd:
> https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=bfd/config.bfd;h=0e1ddb659c3ab7160aab0a7c173b85052f870e65;hb=a9d9a104dde6a749f40ce5c4576a0042a7d52d1f
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/332/33277d4687ca9a04dbfb02c50e5755ff9e55b0b4
>  - http://autobuild.buildroot.net/results/5e3/5e34d11393e14fc36fd6e72b69679bc4fd1e3798
>  - http://autobuild.buildroot.net/results/63d/63d01d33ae30f86b63b9f42a9fea116f2f3e9005
>  - http://autobuild.buildroot.net/results/45b/45bc90fd2dde7bb201d7f999db1a8024cf889a06
>  - http://autobuild.buildroot.net/results/d1b/d1b1dfe449f82944bd48215da3cdffd05797e2e9
>  - http://autobuild.buildroot.net/results/a3e/a3eb1ff6bf6357242ec7993db63e57d4afeccc7b
>  - http://autobuild.buildroot.net/results/f4d/f4d52cabee61ee0f234b03c1ec1bd02e85e7bb20
> 
> Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> ---
>  package/binutils/Config.in.host | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
> index ea1f020989..e1c59bfbd0 100644
> --- a/package/binutils/Config.in.host
> +++ b/package/binutils/Config.in.host
> @@ -15,6 +15,13 @@ choice
>  config BR2_BINUTILS_VERSION_2_32_X
>  	bool "binutils 2.32"
>  	depends on !BR2_csky
> +	depends on !(BR2_aarch64 && BR2_BINFMT_FLAT)
> +	depends on !(BR2_aarch64_be && BR2_BINFMT_FLAT)
> +	depends on !(BR2_sh2a && BR2_BINFMT_FLAT)
> +	depends on !(BR2_sh4 && BR2_BINFMT_FLAT)
> +	depends on !(BR2_sh4a && BR2_BINFMT_FLAT)
> +	depends on !(BR2_sh4aeb && BR2_BINFMT_FLAT)
> +	depends on !(BR2_sh4eb && BR2_BINFMT_FLAT)

I'm not sure that how we want to handle this. Indeed, even with newer
binutils versions, I really doubt supporting aarch64 with the FLAT
binary format makes a lot of sense.

As far as I'm aware, there's currently no practical use-case for Linux
noMMU on aarch64 and SH4, so I would simply disallow that. So on ARM, I
would only allow the MMU to be disabled on ARMv7-M, and on SuperH, for
SH2A. I.e something like the below patch.

Of course, that leaves the case of BR2_sh2a. But if binutils
2.35/2.36/2.37 are broken for the FLAT format (which is why they are
disabled), and 2.32 is disabled for SH2A/FLAT, then there's nothing
left available for SH2A/FLAT. Except that
package/binutils/Config.in.host is wrong in disabling 2.35/2.36/2.37
for all FLAT configs: the bug is only related to ARM.

However, I feel strange that sh2a/FLAT was not supported back in
binutils 2.32. sh2a/FLAT has been around for a very long time. In fact
what happens is that we have a patch to allow sh2a as an architecture
name: package/binutils/2.32/0001-sh-conf.patch. But that patch is
probably no longer sufficient, and some adjustements are also needed in
bfd/config.bfd.

Bottom line: there is more work than just this proposal, which simply
papers over the problem without really fixing it.

diff --git a/arch/Config.in b/arch/Config.in
index 98b0e40d51..e51ef60f40 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -228,7 +228,6 @@ config BR2_s390x
 
 config BR2_sh
 	bool "SuperH"
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	help
 	  SuperH (or SH) is a 32-bit reduced instruction set computer
 	  (RISC) instruction set architecture (ISA) developed by
diff --git a/arch/Config.in.arm b/arch/Config.in.arm
index 85040ac89f..16f053fba3 100644
--- a/arch/Config.in.arm
+++ b/arch/Config.in.arm
@@ -73,21 +73,27 @@ config BR2_ARM_CPU_HAS_THUMB2
 
 config BR2_ARM_CPU_ARMV4
 	bool
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 config BR2_ARM_CPU_ARMV5
 	bool
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 config BR2_ARM_CPU_ARMV6
 	bool
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 config BR2_ARM_CPU_ARMV7A
 	bool
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 config BR2_ARM_CPU_ARMV7M
 	bool
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 config BR2_ARM_CPU_ARMV8A
 	bool
+	select BR2_ARCH_HAS_MMU_MANDATORY
 
 choice
 	prompt "Target Architecture Variant"
@@ -103,23 +109,19 @@ config BR2_arm920t
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm922t
 	bool "arm922t"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV4
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_fa526
 	bool "fa526/626"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_strongarm
 	bool "strongarm sa110/sa1100"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV4
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 comment "armv5 cores"
 config BR2_arm926t
@@ -128,18 +130,15 @@ config BR2_arm926t
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_iwmmxt
 	bool "iwmmxt"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_ARMV5
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_xscale
 	bool "xscale"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV5
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 comment "armv6 cores"
 config BR2_arm1136j_s
@@ -147,34 +146,29 @@ config BR2_arm1136j_s
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm1136jf_s
 	bool "arm1136jf-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm1176jz_s
 	bool "arm1176jz-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm1176jzf_s
 	bool "arm1176jzf-s"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_arm11mpcore
 	bool "mpcore"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
 	select BR2_ARM_CPU_HAS_THUMB
 	select BR2_ARM_CPU_ARMV6
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 comment "armv7a cores"
 config BR2_cortex_a5
@@ -184,7 +178,6 @@ config BR2_cortex_a5
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a7
 	bool "cortex-A7"
 	select BR2_ARM_CPU_HAS_ARM
@@ -192,7 +185,6 @@ config BR2_cortex_a7
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a8
 	bool "cortex-A8"
 	select BR2_ARM_CPU_HAS_ARM
@@ -200,7 +192,6 @@ config BR2_cortex_a8
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a9
 	bool "cortex-A9"
 	select BR2_ARM_CPU_HAS_ARM
@@ -208,7 +199,6 @@ config BR2_cortex_a9
 	select BR2_ARM_CPU_MAYBE_HAS_VFPV3
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a12
 	bool "cortex-A12"
 	select BR2_ARM_CPU_HAS_ARM
@@ -216,7 +206,6 @@ config BR2_cortex_a12
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a15
 	bool "cortex-A15"
 	select BR2_ARM_CPU_HAS_ARM
@@ -224,7 +213,6 @@ config BR2_cortex_a15
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a15_a7
 	bool "cortex-A15/A7 big.LITTLE"
 	select BR2_ARM_CPU_HAS_ARM
@@ -232,7 +220,6 @@ config BR2_cortex_a15_a7
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_4_9
 config BR2_cortex_a17
 	bool "cortex-A17"
@@ -241,7 +228,6 @@ config BR2_cortex_a17
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_cortex_a17_a7
 	bool "cortex-A17/A7 big.LITTLE"
@@ -250,14 +236,12 @@ config BR2_cortex_a17_a7
 	select BR2_ARM_CPU_HAS_VFPV4
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_pj4
 	bool "pj4"
 	select BR2_ARM_CPU_HAS_ARM
 	select BR2_ARM_CPU_HAS_VFPV3
 	select BR2_ARM_CPU_ARMV7A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 
 comment "armv7m cores"
 config BR2_cortex_m3
@@ -286,7 +270,6 @@ config BR2_cortex_a32
 	select BR2_ARM_CPU_HAS_THUMB2
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a35
 	bool "cortex-A35"
@@ -295,7 +278,6 @@ config BR2_cortex_a35
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a53
 	bool "cortex-A53"
@@ -304,7 +286,6 @@ config BR2_cortex_a53
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a57
 	bool "cortex-A57"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -312,7 +293,6 @@ config BR2_cortex_a57
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_cortex_a57_a53
 	bool "cortex-A57/A53 big.LITTLE"
 	select BR2_ARM_CPU_HAS_ARM if !BR2_ARCH_IS_64
@@ -320,7 +300,6 @@ config BR2_cortex_a57_a53
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a72
 	bool "cortex-A72"
@@ -329,7 +308,6 @@ config BR2_cortex_a72
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_cortex_a72_a53
 	bool "cortex-A72/A53 big.LITTLE"
@@ -338,7 +316,6 @@ config BR2_cortex_a72_a53
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_cortex_a73
 	bool "cortex-A73"
@@ -347,7 +324,6 @@ config BR2_cortex_a73
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_cortex_a73_a35
 	bool "cortex-A73/A35 big.LITTLE"
@@ -356,7 +332,6 @@ config BR2_cortex_a73_a35
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_cortex_a73_a53
 	bool "cortex-A73/A53 big.LITTLE"
@@ -365,14 +340,12 @@ config BR2_cortex_a73_a53
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_emag
 	bool "emag"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_exynos_m1
 	bool "exynos-m1"
@@ -381,63 +354,54 @@ config BR2_exynos_m1
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_falkor
 	bool "falkor"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_phecda
 	bool "phecda"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_qdf24xx
 	bool "qdf24xx"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_6
 config BR2_thunderx
 	bool "thunderx (aka octeontx)"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 config BR2_thunderxt81
 	bool "thunderxt81 (aka octeontx81)"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderxt83
 	bool "thunderxt83 (aka octeontx83)"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderxt88
 	bool "thunderxt88"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderxt88p1
 	bool "thunderxt88p1"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_xgene1
 	bool "xgene1"
@@ -446,7 +410,6 @@ config BR2_xgene1
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_5
 
 comment "armv8.1a cores"
@@ -455,21 +418,18 @@ config BR2_thunderx2t99
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_thunderx2t99p1
 	bool "thunderx2t99p1"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 config BR2_vulcan
 	bool "vulcan"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_7
 
 comment "armv8.2a cores"
@@ -478,21 +438,18 @@ config BR2_cortex_a55
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_cortex_a75
 	bool "cortex-A75"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_cortex_a75_a55
 	bool "cortex-A75/A55 big.LITTLE"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 config BR2_cortex_a76
 	bool "cortex-A76"
@@ -501,7 +458,6 @@ config BR2_cortex_a76
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_cortex_a76_a55
 	bool "cortex-A76/A55 big.LITTLE"
@@ -510,7 +466,6 @@ config BR2_cortex_a76_a55
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_neoverse_n1
 	bool "neoverse-N1 (aka ares)"
@@ -519,14 +474,12 @@ config BR2_neoverse_n1
 	select BR2_ARM_CPU_HAS_THUMB2 if !BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 config BR2_tsv110
 	bool "tsv110"
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_9
 
 comment "armv8.4a cores"
@@ -535,7 +488,6 @@ config BR2_saphira
 	depends on BR2_ARCH_IS_64
 	select BR2_ARM_CPU_HAS_FP_ARMV8
 	select BR2_ARM_CPU_ARMV8A
-	select BR2_ARCH_HAS_MMU_OPTIONAL
 	select BR2_ARCH_NEEDS_GCC_AT_LEAST_8
 endchoice
 
diff --git a/arch/Config.in.sh b/arch/Config.in.sh
index c1ba449dd5..94b034c158 100644
--- a/arch/Config.in.sh
+++ b/arch/Config.in.sh
@@ -7,14 +7,19 @@ choice
 
 config BR2_sh2a
 	bool "sh2a (SH2A big endian)"
+	select BR2_ARCH_HAS_MMU_OPTIONAL
 config BR2_sh4
 	bool "sh4 (SH4 little endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4eb
 	bool "sh4eb (SH4 big endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4a
 	bool "sh4a (SH4A little endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 config BR2_sh4aeb
 	bool "sh4aeb (SH4A big endian)"
+	select BR2_ARCH_HAS_MMU_MANDATORY
 endchoice
 
 config BR2_ARCH


-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
