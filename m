Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F4F1C77B75
	for <buildroot@archiver.kernel.org>; Sun,  7 May 2023 19:33:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C4C80E80;
	Sun,  7 May 2023 19:33:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 06C4C80E80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FGeUcO6CfvOp; Sun,  7 May 2023 19:33:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id DC1EC80E5E;
	Sun,  7 May 2023 19:33:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DC1EC80E5E
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 61AB51BF2CD
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:33:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 399C14160A
 for <buildroot@lists.busybox.net>; Sun,  7 May 2023 19:33:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 399C14160A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5yoCiSpaO7FW for <buildroot@lists.busybox.net>;
 Sun,  7 May 2023 19:33:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9CA1A41604
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9CA1A41604
 for <buildroot@buildroot.org>; Sun,  7 May 2023 19:33:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:5f9f:2ea:ec9d:3930])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 7ABAA19F5B2;
 Sun,  7 May 2023 21:33:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 07 May 2023 21:33:20 +0200
Date: Sun, 7 May 2023 21:33:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Alistair Francis <alistair23@gmail.com>
Message-ID: <20230507193320.GJ252090@scaer>
References: <20230503023711.586439-1-alistair.francis@wdc.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230503023711.586439-1-alistair.francis@wdc.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683488004;
 bh=C6LXhCVtckCIRvesxFnGNLbUfwvK0Kti5F0gdhFlc5k=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UXZSMuiCBxXgGCi16TjNyUg8nFxI0VVeHJvzq7cXWdfVVDHEcqXsFzInEnQAcF8BI
 E/+rRPR9LVCY6OnXGijumBB8W9h1o0+UOMmQ8Z1m0a/izPXBiz8KNv9PFgPFn2/LsM
 l3n+Yozgz2X8INr5tyziKoIT8LGf24JsCCplp9JqRZfzvT5uFwE9jhyEwGDeHMZ8+/
 H0S+js5+ktlGE5PH20B9uNmdb/ZIbIC/3Z0i+F12Fcn+5QhuXn6SQiCEPKHmwVeAk6
 SbIcZtIEIdbZgavu9dmlzYvkPJ/ZFYLd42cmSCgcB3V3qMwMk6oLEA4zt9kbQyQUqN
 E2QC87ra4xC9A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UXZSMuiC
Subject: Re: [Buildroot] [PATCH 1/2] boot/opensbi: Bump to version 1.2
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Alistair Francis <alistair.francis@wdc.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Alistair,  All,

On 2023-05-03 12:37 +1000, Alistair Francis spake thusly:
> Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ---
>  ...Makefile-Don-t-specify-mabi-or-march.patch | 37 -------------
>  ...Makefile-unconditionally-disable-SSP.patch | 53 -------------------

Since those two patches are removed, they must also be dropped from the
ignore list, in .checkpackageignore.

Applied to master with the above fixed, thanks.

Regards,
Yann E. MORIN.

>  boot/opensbi/Config.in                        |  4 +-
>  boot/opensbi/opensbi.hash                     |  2 +-
>  4 files changed, 3 insertions(+), 93 deletions(-)
>  delete mode 100644 boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
>  delete mode 100644 boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
> 
> diff --git a/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch b/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
> deleted file mode 100644
> index 5f554a6c24..0000000000
> --- a/boot/opensbi/0.9/0001-Makefile-Don-t-specify-mabi-or-march.patch
> +++ /dev/null
> @@ -1,37 +0,0 @@
> -From f5871e1f3650d6c8a032928cb5d8ca00c275c377 Mon Sep 17 00:00:00 2001
> -From: Alistair Francis <alistair.francis@wdc.com>
> -Date: Fri, 15 Feb 2019 14:57:41 -0800
> -Subject: [PATCH] Makefile: Don't specify mabi or march
> -
> -To avoid
> -    can't link double-float modules with soft-float modules
> -errors when building 32-bit openSBI don't specify mabi or march.
> -
> -Signed-off-by: Alistair Francis <alistair.francis@wdc.com>
> ----
> - Makefile | 2 --
> - 1 file changed, 2 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index ae68f55..10851fc 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -145,7 +145,6 @@ GENFLAGS	+=	$(firmware-genflags-y)
> - CFLAGS		=	-g -Wall -Werror -nostdlib -fno-strict-aliasing -O2
> - CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
> - CFLAGS		+=	-mno-save-restore -mstrict-align
> --CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> - CFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> - CFLAGS		+=	$(GENFLAGS)
> - CFLAGS		+=	$(platform-cflags-y)
> -@@ -158,7 +157,6 @@ CPPFLAGS	+=	$(firmware-cppflags-y)
> - ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
> - ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
> - ASFLAGS		+=	-mno-save-restore -mstrict-align
> --ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> - ASFLAGS		+=	-mcmodel=$(PLATFORM_RISCV_CODE_MODEL)
> - ASFLAGS		+=	$(GENFLAGS)
> - ASFLAGS		+=	$(platform-asflags-y)
> --- 
> -2.20.1
> -
> diff --git a/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch b/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
> deleted file mode 100644
> index c4edd37f1a..0000000000
> --- a/boot/opensbi/0.9/0002-Makefile-unconditionally-disable-SSP.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From e389d5fbc296e496db15368b2b621e0f178f7f34 Mon Sep 17 00:00:00 2001
> -From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -Date: Sat, 8 May 2021 21:28:10 +0200
> -Subject: [PATCH] Makefile: unconditionally disable SSP
> -
> -Though -nostdlib is passed in {C,+AS,DTSCPP}FLAGS, -fno-stack-protector
> -must also be passed to avoid linking errors related to undefined
> -references to '__stack_chk_guard' and '__stack_chk_fail' if toolchain
> -enforces -fstack-protector.
> -
> -Fixes:
> - - https://gitlab.com/kubu93/buildroot/-/jobs/1247043359
> -
> -Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> -[Upstream status: https://github.com/riscv/opensbi/pull/211]
> ----
> - Makefile | 6 +++---
> - 1 file changed, 3 insertions(+), 3 deletions(-)
> -
> -diff --git a/Makefile b/Makefile
> -index eeffe6b..1419360 100644
> ---- a/Makefile
> -+++ b/Makefile
> -@@ -203,7 +203,7 @@ GENFLAGS	+=	$(libsbiutils-genflags-y)
> - GENFLAGS	+=	$(platform-genflags-y)
> - GENFLAGS	+=	$(firmware-genflags-y)
> - 
> --CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-strict-aliasing -O2
> -+CFLAGS		=	-g -Wall -Werror -ffreestanding -nostdlib -fno-stack-protector -fno-strict-aliasing -O2
> - CFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
> - CFLAGS		+=	-mno-save-restore -mstrict-align
> - CFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> -@@ -217,7 +217,7 @@ CPPFLAGS	+=	$(GENFLAGS)
> - CPPFLAGS	+=	$(platform-cppflags-y)
> - CPPFLAGS	+=	$(firmware-cppflags-y)
> - 
> --ASFLAGS		=	-g -Wall -nostdlib -D__ASSEMBLY__
> -+ASFLAGS		=	-g -Wall -nostdlib -fno-stack-protector -D__ASSEMBLY__
> - ASFLAGS		+=	-fno-omit-frame-pointer -fno-optimize-sibling-calls
> - ASFLAGS		+=	-mno-save-restore -mstrict-align
> - ASFLAGS		+=	-mabi=$(PLATFORM_RISCV_ABI) -march=$(PLATFORM_RISCV_ISA)
> -@@ -236,7 +236,7 @@ MERGEFLAGS	+=	-r
> - MERGEFLAGS	+=	-b elf$(PLATFORM_RISCV_XLEN)-littleriscv
> - MERGEFLAGS	+=	-m elf$(PLATFORM_RISCV_XLEN)lriscv
> - 
> --DTSCPPFLAGS	=	$(CPPFLAGS) -nostdinc -nostdlib -fno-builtin -D__DTS__ -x assembler-with-cpp
> -+DTSCPPFLAGS	=	$(CPPFLAGS) -nostdinc -nostdlib -fno-stack-protector -fno-builtin -D__DTS__ -x assembler-with-cpp
> - 
> - # Setup functions for compilation
> - define dynamic_flags
> --- 
> -2.30.2
> -
> diff --git a/boot/opensbi/Config.in b/boot/opensbi/Config.in
> index 86f848f177..5e6b8d158e 100644
> --- a/boot/opensbi/Config.in
> +++ b/boot/opensbi/Config.in
> @@ -19,7 +19,7 @@ choice
>  	  Select the specific OpenSBI version you want to use
>  
>  config BR2_TARGET_OPENSBI_LATEST_VERSION
> -	bool "0.9"
> +	bool "1.2"
>  
>  config BR2_TARGET_OPENSBI_CUSTOM_VERSION
>  	bool "Custom version"
> @@ -57,7 +57,7 @@ endif
>  
>  config BR2_TARGET_OPENSBI_VERSION
>  	string
> -	default "0.9"	if BR2_TARGET_OPENSBI_LATEST_VERSION
> +	default "1.2"	if BR2_TARGET_OPENSBI_LATEST_VERSION
>  	default BR2_TARGET_OPENSBI_CUSTOM_VERSION_VALUE \
>  		if BR2_TARGET_OPENSBI_CUSTOM_VERSION
>  	default "custom"	if BR2_TARGET_OPENSBI_CUSTOM_TARBALL
> diff --git a/boot/opensbi/opensbi.hash b/boot/opensbi/opensbi.hash
> index 3b6d97c42d..dbc77e856f 100644
> --- a/boot/opensbi/opensbi.hash
> +++ b/boot/opensbi/opensbi.hash
> @@ -1,3 +1,3 @@
>  # locally computed
> -sha256  60f995cb3cd03e3cf5e649194d3395d0fe67499fd960a36cf7058a4efde686f0  opensbi-0.9.tar.gz
> +sha256  8fcbce598a73acc2c7f7d5607d46b9d5107d3ecbede8f68f42631dcfc25ef2b2  opensbi-1.2.tar.gz
>  sha256  82d13fb1bf6bb162629deeea9eb9c117e74548d3b707e478967691fe79a68e21  COPYING.BSD
> -- 
> 2.39.2
> 
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

-- 
.-----------------.--------------------.------------------.--------------------.
|  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
| +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
| +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
| http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
'------------------------------^-------^------------------^--------------------'
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
