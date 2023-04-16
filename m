Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A37C77B73
	for <buildroot@archiver.kernel.org>; Sun, 16 Apr 2023 16:22:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2788E84034;
	Sun, 16 Apr 2023 16:22:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2788E84034
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vbc_ww8MruYT; Sun, 16 Apr 2023 16:22:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3AFBC84003;
	Sun, 16 Apr 2023 16:22:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3AFBC84003
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4C28F1C3DB1
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 16:22:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2546E40567
 for <buildroot@lists.busybox.net>; Sun, 16 Apr 2023 16:22:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2546E40567
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OTYDFksr-GK5 for <buildroot@lists.busybox.net>;
 Sun, 16 Apr 2023 16:22:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 196BF417CA
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 196BF417CA
 for <buildroot@buildroot.org>; Sun, 16 Apr 2023 16:22:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C9A105FF3F;
 Sun, 16 Apr 2023 18:22:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 16 Apr 2023 18:22:00 +0200
Date: Sun, 16 Apr 2023 18:22:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Ben Wolsieffer <ben.wolsieffer@hefring.com>
Message-ID: <20230416162200.GC2819@scaer>
References: <20220819151734.926106-1-Ben.Wolsieffer@hefring.com>
 <20220819151734.926106-5-Ben.Wolsieffer@hefring.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220819151734.926106-5-Ben.Wolsieffer@hefring.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1681662128;
 bh=Iy7x55Gxk9owZdj8u5Fg87raHTCaLVr+L4r1ZMG5oSQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=X1FeX7TCxP4lcajTGp4M7qgWRXVTCihDuhNMjL39hk0ltuSli3cCgtAZj4lJ9ki3a
 PDbwDHaGs65EW2ZdW+2qL6KfSS/nBZWxYpnzqhkwO+nKrcbuJVDmcHCMDTuQ2kAwa9
 YZCer9OsmIV9XDKmN4qzfkGsNB/8cCWLjGvOGT8iou2eAltuB+IyFgoFniCq20X8xH
 fBnSyUY/BGLLR4//RAwolad4NwLJo5UqEenoP1vFd6GN28GEA3crc05WVBQLp3wg/q
 nnt6pw1kXlRaCxINKVSRoOr3ZYnXxLHaGoIGJXm7mHYFUH2w91OHng03rUwrnrbgXE
 A8vh0UDQsZkrQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=X1FeX7TC
Subject: Re: [Buildroot] [PATCH v3 4/8] arch/arm: add support for FDPIC
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
Cc: Vladimir Murzin <vladimir.murzin@arm.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Ben, All,

Sorry for the overly long delay, but as you can imagine, it is not
something that is trivial to review. Even so, here's an long overdue
review...

On 2022-08-19 11:17 -0400, Ben Wolsieffer spake thusly:
> Linux on ARM supports FDPIC binaries intended for use on no-MMU systems.
> This patch enables support for building a toolchain that produces FDPIC
> binaries.
> 
> The target name for an FDPIC toolchain must be
> arm-<vendor>-uclinuxfdpiceabi, which doesn't follow the standard format
> and requires a special case.
> 
> According to the kernel help for CONFIG_BINFMT_ELF_FDPIC, "It is also
> possible to run FDPIC ELF binaries on MMU linux," so FDPIC support is
> available on all ARM platforms, not just no-MMU.
> 
> Signed-off-by: Ben Wolsieffer <Ben.Wolsieffer@hefring.com>
> ---
>  arch/Config.in      | 1 +
>  package/Makefile.in | 6 ++++++
>  2 files changed, 7 insertions(+)
> 
> diff --git a/arch/Config.in b/arch/Config.in
> index 4cd58041a4..c639738f5f 100644
> --- a/arch/Config.in
> +++ b/arch/Config.in
> @@ -39,6 +39,7 @@ config BR2_arceb
>  
>  config BR2_arm
>  	bool "ARM (little endian)"
> +	select BR2_ARCH_HAS_FDPIC_SUPPORT
>  	# MMU support is set by the subarchitecture file, arch/Config.in.arm
>  	help
>  	  ARM is a 32-bit reduced instruction set computer (RISC)
> diff --git a/package/Makefile.in b/package/Makefile.in
> index ff60f85092..81a7028275 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -37,7 +37,13 @@ $(error BR2_TOOLCHAIN_BUILDROOT_VENDOR cannot be 'unknown'. \
>  endif
>  
>  # Compute GNU_TARGET_NAME
> +# FDPIC on ARM requires a special target name: it has no OS field and must
> +# use the suffix -uclinuxfdpiceabi.
> +ifeq ($(BR2_arm)$(BR2_armeb):$(BR2_BINFMT_FDPIC),y:y)
> +GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-uclinuxfdpiceabi

This looks weird: it looks like they coalesced OS and ABI, and dropped
the LIBC part...

> +else
>  GNU_TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)-$(LIBC)$(ABI)
> +endif

I am not too fond of this special casing. What about something along the
lines of (existing comments stripped):

    TARGET_NAME = $(ARCH)-$(TARGET_VENDOR)-$(TARGET_OS)$(LIBC)$(ABI)))
    # Note no dash between OS and LIBC  --------------^^

    ifeq ($(BR2_arm)$(BR2_armeb)$(BR2_BINFMT_FDPIC),yy)
    # For ARM FDPIC, there is no separation between OS and ABI
    TARGET_OS = uclinux
    else ifeq ($(BR2_BINFMT_FLAT):$(BR2_RISCV_64),y:)
    TARGET_OS = uclinux-
    else
    TARGET_OS = linux-
    endif

    ifeq ($(BR2_TOOLCHAIN_USES_UCLIBC),y)
    # For ARM FDPIC, there's no LIBC part
    ifneq ($(BR2_arm)$(BR2_armeb)$(BR2_BINFMT_FDPIC),yy)
    LIBC = uclibc
    endif
    else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
    LIBC = musl
    else ifeq ($(BR2_TOOLCHAIN_USES_GLIBC),y)
    LIBC = gnu
    else ifeq ($(BR_BUILDING),y)
    $(error No C library enabled, this is not possible.)
    endif

    ifeq ($(BR2_arm)$(BR2_armeb),y)
    ifeq ($(LIBC),uclibc)
    ABI = $(if $(BR2_BINFMT_FDPIC),fdpic,gnu)eabi
    else
    ABI = eabi
    endif

    ifeq ($(BR2_ARM_EABIHF),y)
    # FDPIC is always HF, so don't append the hf suffix (FIXME!)
    ABI := $(ABI)$(if $(BR2_BINFMT_FDPIC),,hf)
    endif
    endif

Note that this is not perfect, as there are a few assumptions hard-coded
in there, but I'm afraid we can't do much much better...

Note that I have no idea about the HF part, so I wrote something for
illustration purposes only...

Regards,
Yann E. MORIN.

>  # FLAT binary format needs uclinux, except RISC-V 64-bits which needs
>  # the regular linux name.
> -- 
> 2.37.0
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
