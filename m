Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D90FAC7EE2D
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 19:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81C9983051;
	Wed, 24 May 2023 19:15:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 81C9983051
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Clzep6GaFkS; Wed, 24 May 2023 19:15:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7980382007;
	Wed, 24 May 2023 19:15:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7980382007
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 685921BF2F9
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:15:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4104541FAA
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:15:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4104541FAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v5xnPMTuX-1n for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 19:15:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6C1141F6A
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6C1141F6A
 for <buildroot@buildroot.org>; Wed, 24 May 2023 19:15:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f59a:3e7b:43a8:ebfe])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 04BABB004FF;
 Wed, 24 May 2023 21:15:46 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 24 May 2023 21:15:46 +0200
Date: Wed, 24 May 2023 21:15:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@smile.fr>
Message-ID: <20230524191546.GD2623@scaer>
References: <20230524094908.80784-1-romain.naour@smile.fr>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230524094908.80784-1-romain.naour@smile.fr>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684955751;
 bh=im2qx+x0eM1R2VszWrAkjlOPcUm6hljfbWes1y0NTWc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=bbauX11EA9UDjojiE5AkY3flbJdk7iQIu/KUO3VNwlYTi4rJvMEKrp07RVzX2tNRT
 6RiQnHTP6DqCfMLYwW5vQzMuYZFqtfJtuXfDVbosX0NZyWMGPvqNYS3/dau1YrinjL
 uMBLwdPXiHmH1WIJ2R9GR5sXRJraYJU9Rc9UW8cfz29s6vAdXSDbU9jvDGegkJIfLO
 YUGS2Rrk8idXvfGSVDUFmi92Qar7BAYfPJpTy/1118wT7bpv4i6j93PtTnenECYN2W
 XV6WxEc+xE6hKODrov2StvmsTGDkLOCFSsBepgZPKFoEbdSuA4ZMIPxEBRKoNsx8+r
 XWCwDNjSOdHaA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=bbauX11E
Subject: Re: [Buildroot] [PATCH] configs/qemu_ppc_mpc8544ds_defconfig:
 remove kernel patch
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
Cc: Sebastian Weyer <sebastian.weyer@smile.fr>,
 Jan-Benedict Glaw <jbglaw@lug-owl.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2023-05-24 11:49 +0200, Romain Naour spake thusly:
> The ppc-mpc8544ds is the only qemu configuration that requires a kernel patch:
> board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
> 
> But this patch doesn't apply after a backport between v6.1.20 and v6.1.21
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux.git/commit/?id=da0beae2449376326086e9f57468fd2b64736d2a
> 
> So the patch 0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch doesn't
> seem required anymore.
> 
>  Welcome to Buildroot
>  buildroot login: root
>  # uname -a
>  Linux buildroot 6.1.28 #1 Wed May 24 09:08:27 UTC 2023 ppc GNU/Linux
>  # cat /proc/cpuinfo
>  processor	: 0
>  cpu		: e500v2
>  clock		: 400.000000MHz
>  revision	: 3.0 (pvr 8021 0030)
>  bogomips	: 800.00
> 
>  timebase	: 400000000
>  platform	: MPC8544 DS
>  model		: MPC8544DS
>  Memory		: 128 MB
> 
> Fixes:
> https://gitlab.com/buildroot.org/buildroot/-/jobs/4306895282
> https://bugs.busybox.net/show_bug.cgi?id=15581
> 
> Signed-off-by: Romain Naour <romain.naour@smile.fr>
> Cc: Jan-Benedict Glaw <jbglaw@lug-owl.de>
> Cc: Sebastian Weyer <sebastian.weyer@smile.fr>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  .checkpackageignore                           |  1 -
>  ...x-mcpu-options-for-SPE-only-compiler.patch | 53 -------------------
>  configs/qemu_ppc_mpc8544ds_defconfig          |  1 -
>  3 files changed, 55 deletions(-)
>  delete mode 100644 board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
> 
> diff --git a/.checkpackageignore b/.checkpackageignore
> index 947f4606aa..f2dea0dfd9 100644
> --- a/.checkpackageignore
> +++ b/.checkpackageignore
> @@ -74,7 +74,6 @@ board/pine64/rockpro64/post-build.sh Shellcheck
>  board/qemu/aarch64-sbsa/assemble-flash-images Shellcheck
>  board/qemu/microblazebe-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch Upstream
>  board/qemu/microblazeel-mmu/0001-net-xilinx-xemaclite-add-2.00.b-revision.patch Upstream
> -board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch Upstream
>  board/qemu/x86/post-build.sh Shellcheck
>  board/qemu/x86_64/post-build.sh Shellcheck
>  board/qmtech/zynq/patches/linux/0001-DTS-for-QMTech-Zynq-starter-kit.patch Upstream
> diff --git a/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch b/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
> deleted file mode 100644
> index b8c8a72587..0000000000
> --- a/board/qemu/ppc-mpc8544ds/patches/linux/0001-powerpc-Fix-mcpu-options-for-SPE-only-compiler.patch
> +++ /dev/null
> @@ -1,53 +0,0 @@
> -From a0919e3177295f4aaa9006915adcddc31788d809 Mon Sep 17 00:00:00 2001
> -From: Ben Hutchings <ben@decadent.org.uk>
> -Date: Wed, 26 Dec 2018 00:00:40 +0000
> -Subject: [PATCH] powerpc: Fix -mcpu= options for SPE-only compiler
> -
> -GCC for Debian's "powerpcspe" architecture only supports 32-bit
> -SPE targets, and using -mcpu=powerpc or -mcpu=powerpc64 is a fatal
> -error.
> -
> -* Change the test for a biarch compiler to pass both the -m32 and -m64
> -  options, so that it doesn't catch 32-bit-only compilers
> -* Add an ifdef CONFIG_PPC64 around the 64-bit CPU option definitions
> -
> -Signed-off-by: Ben Hutchings <ben@decadent.org.uk>
> -[Romain: Patch from Debian repository:
> -https://salsa.debian.org/kernel-team/linux/-/blob/buster/debian/patches/bugfix/powerpc/powerpc-fix-mcpu-options-for-spe-only-compiler.patch]
> -Signed-off-by: Romain Naour <romain.naour@gmail.com>
> ----
> - arch/powerpc/Makefile | 4 +++-
> - 1 file changed, 3 insertions(+), 1 deletion(-)
> -
> -diff --git a/arch/powerpc/Makefile b/arch/powerpc/Makefile
> -index 5c8c06215dd4..e3dbea6d7ae0 100644
> ---- a/arch/powerpc/Makefile
> -+++ b/arch/powerpc/Makefile
> -@@ -12,7 +12,7 @@
> - # Rewritten by Cort Dougan and Paul Mackerras
> - #
> - 
> --HAS_BIARCH	:= $(call cc-option-yn, -m32)
> -+HAS_BIARCH	:= $(call cc-option-yn, -m32 -m64)
> - 
> - # Set default 32 bits cross compilers for vdso and boot wrapper
> - CROSS32_COMPILE ?=
> -@@ -164,6 +164,7 @@ CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option, $(MULTIPLEWORD))
> - 
> - CFLAGS-$(CONFIG_PPC32)	+= $(call cc-option,-mno-readonly-in-sdata)
> - 
> -+ifdef CONFIG_PPC64
> - ifdef CONFIG_PPC_BOOK3S_64
> - ifdef CONFIG_CPU_LITTLE_ENDIAN
> - CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=power8
> -@@ -175,6 +176,7 @@ endif
> - else
> - CFLAGS-$(CONFIG_GENERIC_CPU) += -mcpu=powerpc64
> - endif
> -+endif
> - 
> - ifdef CONFIG_FUNCTION_TRACER
> - CC_FLAGS_FTRACE := -pg
> --- 
> -2.17.1
> -
> diff --git a/configs/qemu_ppc_mpc8544ds_defconfig b/configs/qemu_ppc_mpc8544ds_defconfig
> index ca1a429167..6d8a214e05 100644
> --- a/configs/qemu_ppc_mpc8544ds_defconfig
> +++ b/configs/qemu_ppc_mpc8544ds_defconfig
> @@ -3,7 +3,6 @@ BR2_powerpc=y
>  BR2_powerpc_8548=y
>  
>  # System
> -BR2_GLOBAL_PATCH_DIR="board/qemu/ppc-mpc8544ds/patches"
>  BR2_SYSTEM_DHCP="eth0"
>  
>  # Filesystem
> -- 
> 2.34.3
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
