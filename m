Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2401EC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 12:39:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA5F460FE7;
	Sat, 23 Jul 2022 12:39:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA5F460FE7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SsE9xVskzu-e; Sat, 23 Jul 2022 12:39:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 986E560FDE;
	Sat, 23 Jul 2022 12:39:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 986E560FDE
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C46C81BF36E
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:39:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75BD460FDE
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 12:39:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75BD460FDE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jcny5twTyLBx for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 12:39:26 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BE5A860FDD
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BE5A860FDD
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 12:39:25 +0000 (UTC)
Received: (Authenticated sender: thomas.petazzoni@bootlin.com)
 by mail.gandi.net (Postfix) with ESMTPSA id 47BAF1BF205;
 Sat, 23 Jul 2022 12:39:22 +0000 (UTC)
Date: Sat, 23 Jul 2022 14:39:21 +0200
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220723143921.1e89b49f@windsurf>
In-Reply-To: <20220529131811.481017-1-romain.naour@gmail.com>
References: <20220529131811.481017-1-romain.naour@gmail.com>
Organization: Bootlin
X-Mailer: Claws Mail 4.1.0 (GTK 3.24.34; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bootlin.com; s=gm1; t=1658579962;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=02NSIuhAq5hUq7NwfZa/NKTCPO7zRwDU6LAMjp6cbHE=;
 b=kSKg0eE/9HbLKU3j9kcATSFXgEmBBfEVr0KLaXxtdV9+nSBz/hCsVnCFwAk017itCA3e1b
 rWfN9tgl5Jyy7CBBy9ks6b89WwlPkwts1Z59F/HV5L2q46j1TmCBMqIHe2TeiJICTpyZCT
 oklM+Te9r88F0+SaGdgwl54mM+793o14ZyoRJZQ20k4lUU65LZYxAIFduYSfq/Ajr01DgB
 +WlH428yL7TXwlb7zmMyhF0az3tKpNUaIRQR41+n/Lsin0uClXQAm2flecAmPd7LDJjiyQ
 4Yl9vhXoMlpwrmNokxxkCx9Qez51oCzbUt1HUfP0dbTohmvoyBhzNZhPYn6dOA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256
 header.s=gm1 header.b=kSKg0eE/
Subject: Re: [Buildroot] [PATCH for-next 01/11] arch/Config.in.riscv: add
 Zicsr and Zifencei standalone extensions
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
Cc: Mark Corbin <mark@dibsco.co.uk>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hello Romain,

On Sun, 29 May 2022 15:18:01 +0200
Romain Naour <romain.naour@gmail.com> wrote:

> Since gcc 12, default Riscv ISA spec version was bump to 20191213 [1].
> 
> This introduce a major incompatibility issue is the csr read/write
> (csrr*/csrw*) instructions and fence.i instruction has separated from
> the "I" extension, become two standalone extensions: Zicsr and
> Zifencei; so you might get error messages like that: unrecognized
> opcode "csrr" (or "fence.i").
> 
> Indeed, without Zifencei we can't build opensbi bootloader [3]:
> 
> opensbi-1.0/lib/sbi/sbi_tlb.c: Assembler messages:
> opensbi-1.0/lib/sbi/sbi_tlb.c:190: Error: unrecognized opcode `fence.i', extension `zifencei' required
> 
> As a workaround, opensbi build system has been patched [4] to use
> -march=rv64imafdc_zicsr_zifencei when needed.
> This workaround doesn't work in Buildroot due to the local patch
> 0001-Makefile-Don-t-specify-mabi-or-march.patch removing -march
> from CFLAGS.
> 
> Fix this issue by introducing two additional Kconfig option
> enabling Zicsr and Zifencei standalone extensions for gcc >= 12
> as recommanded by [2].
> 
> Select Zicsr and Zifencei for General purpose (G) architecture variant
> (BR2_riscv_g) since theses extentions were implicitely enabled
> previously.
> 
> [1] https://gcc.gnu.org/gcc-12/changes.html
> [2] https://groups.google.com/a/groups.riscv.org/g/sw-dev/c/aE1ZeHHCYf4
> [3] https://github.com/riscv-software-src/opensbi/blob/v0.9/lib/sbi/sbi_tlb.c#L173
> [4] https://github.com/riscv-software-src/opensbi/commit/5d53b55aa77ffeefd4012445dfa6ad3535e1ff2c
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Mark Corbin <mark@dibsco.co.uk>

Thanks for the patch and explanation, but I'm wondering if this isn't
perhaps too complicated.


> +	select BR2_RISCV_ISA_RVZicsr if BR2_TOOLCHAIN_GCC_AT_LEAST_12
> +	select BR2_RISCV_ISA_RVZifencei if BR2_TOOLCHAIN_GCC_AT_LEAST_12

[...]

>  	help
> -	  General purpose (G) is equivalent to IMAFD.
> +	  General purpose (G) is equivalent to IMAFD
> +	  (with Zicsr and Zifencei since gcc >= 12).
>  
>  config BR2_riscv_custom
>  	bool "Custom architecture"
> @@ -63,6 +72,16 @@ config BR2_RISCV_ISA_CUSTOM_RVD
>  config BR2_RISCV_ISA_CUSTOM_RVC
>  	bool "Compressed Instructions (C)"
>  	select BR2_RISCV_ISA_RVC
> +
> +if BR2_TOOLCHAIN_GCC_AT_LEAST_12

The problem with this is that options in arch/ now depend on the gcc
version that is selected, which is something we have tried to avoid.

Do a git grep GCC_AT_LEAST in arch/, you will see that we only use
"select BR2_ARCH_NEEDS_GCC_AT_LEAST_xyz", i.e the choice of the
architecture/variant/ABI is what drives the available gcc versions.

And here you are doing exactly the opposite: it's the selected gcc
version that drives the architecture/variant/ABI options that are
available.

At this point, I don't really see the need from a Buildroot perspective
to separate icsr and ifencei from the base BR2_RISCV_ISA_RVI
instruction set.

So what I would do is exactly what OpenSBI has done in
https://github.com/riscv-software-src/opensbi/commit/5d53b55aa77ffeefd4012445dfa6ad3535e1ff2c:
when gcc >= 12 is used, we simply use -march with a _zicsr_zifencei
suffix, and that's it.

I.e something like this:

diff --git a/arch/arch.mk.riscv b/arch/arch.mk.riscv
index f3bf2b3467..d77f88dd70 100644
--- a/arch/arch.mk.riscv
+++ b/arch/arch.mk.riscv
@@ -27,4 +27,8 @@ ifeq ($(BR2_RISCV_ISA_RVC),y)
 GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)c
 endif
 
+ifeq ($(BR2_TOOLCHAIN_GCC_AT_LEAST_12),y)
+GCC_TARGET_ARCH := $(GCC_TARGET_ARCH)_zicsr_zifencei
+endif
+
 endif

I don't think we will see RISC-V cores running Linux that support the
base I instruction, but not the csr and fence extensions... as even
OpenSBI assumes the RISC-V core supports them!

What do you think?

Thomas
-- 
Thomas Petazzoni, co-owner and CEO, Bootlin
Embedded Linux and Kernel engineering and training
https://bootlin.com
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
