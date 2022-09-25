Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2643C04A95
	for <buildroot@archiver.kernel.org>; Sun, 25 Sep 2022 12:06:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 368B960BCB;
	Sun, 25 Sep 2022 12:06:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 368B960BCB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id G9Ai4oK5Zb3S; Sun, 25 Sep 2022 12:06:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3F9F160BBE;
	Sun, 25 Sep 2022 12:06:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F9F160BBE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 89F941BF5A1
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 63AE04173B
 for <buildroot@lists.busybox.net>; Sun, 25 Sep 2022 12:06:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 63AE04173B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vW_oC0Ip2WL6 for <buildroot@lists.busybox.net>;
 Sun, 25 Sep 2022 12:06:50 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1648B40993
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1648B40993
 for <buildroot@buildroot.org>; Sun, 25 Sep 2022 12:06:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:139f:51c2:7bd0:4f35])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 95C3913F895;
 Sun, 25 Sep 2022 14:06:41 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Sep 2022 14:06:41 +0200
Date: Sun, 25 Sep 2022 14:06:41 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220925120641.GV1419013@scaer>
References: <20220925094403.1593562-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220925094403.1593562-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664107607;
 bh=khTP9uG/Yi25SkCKQwXvhxL3Dt9Zz2XOhhKVNvbi9Vw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=jI2mc10CsJkbclz2F22dBWtDMc424AdHL2LbhzNElbxjoySHfuV/rLsda3EqKkN77
 fHXqHPj5DdJRArOwKNYWFbZV9bsn8uqIRl6U7PCj6ue24HY2jTr4uVGaKuh5Xk2YAp
 vU+83cFriGRF/0YAiB1xc4tJIAQu36TyCGjDua4YrJ5jhjs4uEggM89af+MjP1sEsO
 OQ4VQtDt9yLywJkgxMCTcIGqBqVc9Ja8HZkdw/Q1INGnraaluv6Z+wTPb/+0JssG+G
 fItZN942RMHRuwwR+XAwAtJy6B+C0M+ARq6/k9wjHyXRmyDrJdd5LSa6R/Kd3/mPKA
 J7SKS8RNxVyaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=jI2mc10C
Subject: Re: [Buildroot] [PATCH] arch/Config.in.arm: drop support for iwmmxt
 architecture variant
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-09-25 11:44 +0200, Thomas Petazzoni spake thusly:
> This architecture variant is broken in GCC, causing build failures:
> 
> ../../../libgcc/config/arm/unwind-arm.c:467:1: error: unrecognizable insn:
>   467 | }
>       | ^
> (insn 2 4 3 2 (set (reg/v/f:SI 118 [ p ])
>         (reg:SI 0 r0 [ p ])) "../../../libgcc/config/arm/unwind-arm.c":456:1 -1
>      (nil))
> during RTL pass: vregs
> ../../../libgcc/config/arm/unwind-arm.c:467:1: internal compiler error: in extract_insn, at recog.c:2770
> 
> Reported to the GCC developers, the feedback was "iwmmxt support is
> definitely bitrotten and most likely should be removed from GCC.".
> 
> See:
> 
>   https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106972#c1
> 
> So this commit simply drops support for iwmmxt, which anyway is
> probably barely used nowadays: it's for old Marvell PXA cores that
> implemented a special SIMD instruction set. The BR2_xscale option can
> be used instead, it's just that it won't use this SIMD instruction
> set.
> 
> Fixes:
> 
>   http://autobuild.buildroot.net/results/8e4c4512902c34d8ec0c6f8dfff92b7a198e4b4a/
> 
> and the numerous other build failures at:
> 
>   http://autobuild.buildroot.net/?reason=host-gcc-initial%&subarch=iwmmxt
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy         | 10 ++++++++++
>  arch/Config.in.arm       |  5 -----
>  package/pixman/pixman.mk |  9 ++-------
>  3 files changed, 12 insertions(+), 12 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 5f7274e84b..5892dfd44f 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -146,6 +146,16 @@ endif
>  
>  comment "Legacy options removed in 2022.11"
>  
> +config BR2_iwmmxt
> +	bool "ARM iwmmxt variant removed"
> +	select BR2_LEGACY
> +	help
> +	  Support for the ARM iwmmxt architecture variant in GCC has
> +	  bitroten and is no longer maintained. GCC maintainers
> +	  recommend to no longer use it, and suggest to use "xscale"
> +	  as a replacement architecture variant. See
> +	  https://gcc.gnu.org/bugzilla/show_bug.cgi?id=106972
> +
>  config BR2_PACKAGE_GPSD_OLDSTYLE
>  	bool "gpsd oldstyle removed"
>  	select BR2_LEGACY
> diff --git a/arch/Config.in.arm b/arch/Config.in.arm
> index c391d6c72b..78621e321c 100644
> --- a/arch/Config.in.arm
> +++ b/arch/Config.in.arm
> @@ -129,10 +129,6 @@ config BR2_arm926t
>  	select BR2_ARM_CPU_MAYBE_HAS_VFPV2
>  	select BR2_ARM_CPU_HAS_THUMB
>  	select BR2_ARM_CPU_ARMV5
> -config BR2_iwmmxt
> -	bool "iwmmxt"
> -	select BR2_ARM_CPU_HAS_ARM
> -	select BR2_ARM_CPU_ARMV5
>  config BR2_xscale
>  	bool "xscale"
>  	select BR2_ARM_CPU_HAS_ARM
> @@ -817,7 +813,6 @@ config BR2_GCC_TARGET_CPU
>  	default "strongarm"	if BR2_strongarm
>  	# armv5
>  	default "arm926ej-s"	if BR2_arm926t
> -	default "iwmmxt"	if BR2_iwmmxt
>  	default "xscale"	if BR2_xscale
>  	# armv6
>  	default "arm1136j-s"	if BR2_arm1136j_s
> diff --git a/package/pixman/pixman.mk b/package/pixman/pixman.mk
> index 64302fa49a..3f65f0484d 100644
> --- a/package/pixman/pixman.mk
> +++ b/package/pixman/pixman.mk
> @@ -21,7 +21,8 @@ PIXMAN_AUTORECONF = YES
>  # don't build gtk based demos
>  PIXMAN_CONF_OPTS = \
>  	--disable-gtk \
> -	--disable-loongson-mmi
> +	--disable-loongson-mmi \
> +	--disable-arm-iwmmxt
>  
>  # The ARM SIMD code from pixman requires a recent enough ARM core, but
>  # there is a runtime CPU check that makes sure it doesn't get used if
> @@ -40,12 +41,6 @@ else
>  PIXMAN_CONF_OPTS += --disable-arm-neon
>  endif
>  
> -# disable iwmmxt support for CPU's that don't have
> -# this feature
> -ifneq ($(BR2_iwmmxt),y)
> -PIXMAN_CONF_OPTS += --disable-arm-iwmmxt
> -endif
> -
>  PIXMAN_CFLAGS = $(TARGET_CFLAGS)
>  
>  # toolchain gets confused about TLS access through GOT (PIC), so disable TLS
> -- 
> 2.37.3
> 

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
