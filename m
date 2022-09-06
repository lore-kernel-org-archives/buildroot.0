Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FF8EECAAA1
	for <buildroot@archiver.kernel.org>; Tue,  6 Sep 2022 15:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AC69E610F0;
	Tue,  6 Sep 2022 15:57:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AC69E610F0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4fr2c28PT3tN; Tue,  6 Sep 2022 15:57:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F1F39607AA;
	Tue,  6 Sep 2022 15:57:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F1F39607AA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 911FB1BF337
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 15:57:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6C81E607AA
 for <buildroot@lists.busybox.net>; Tue,  6 Sep 2022 15:57:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6C81E607AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oFAN9Z5EDziO for <buildroot@lists.busybox.net>;
 Tue,  6 Sep 2022 15:57:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09490605EC
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 09490605EC
 for <buildroot@buildroot.org>; Tue,  6 Sep 2022 15:56:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5e76:18ec:e237:5279])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 50012B00572;
 Tue,  6 Sep 2022 17:56:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 06 Sep 2022 17:56:56 +0200
Date: Tue, 6 Sep 2022 17:56:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220906155656.GG1585594@scaer>
References: <20220904200409.3153993-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904200409.3153993-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662479818;
 bh=h2KKwB+7PfkjlXKruVwEpza6ym5yThnmtrG1IAwzpkY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=dAbrxT4kmeF7/9mrrv3v1VvMiJU9Pcfvo07NjiQHMJKAqLEDTDWF7NMlidHmh+TyQ
 JbwRrAZYLlW+ckU6AfTsTXpGmyaAzqrBlTZpcW0e+TdUEeaZaBDJ/GiWEinwd+kg/t
 47Y677mGDk6KEbdDsNOHAlWGDUu1viBDwQk8MAQBI8AEsza+slEjfpNHRNYzd+gGO+
 lh9fPdR/ev17lQp6oQnXsdDaUus9hxIsLqsXxKilCc7HeWSOMuzrg/HTp8+zx397Cx
 TdNE5krUWdwgZbFoW9JeRQj+VbrPp07X52g1K2uUJZr4K0rHyyDQ/Ca24+xijGCbAL
 4R9lC/AagRrNw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=dAbrxT4k
Subject: Re: [Buildroot] [PATCH] arch/xtensa: xtensa little endian target
 requires an overlay file
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Romain, All,

On 2022-09-04 22:04 +0200, Romain Naour spake thusly:
> Using a custom Xtensa processor configuration select little endian
> by default. But xtensa for little endian requires an xtensa overlay
> file containing a version of xtensa-config.h header for gcc setting
> XCHAL_HAVE_BE to 0.
> 
> When BR2_XTENSA_LITTLE_ENDIAN is selected, we have to check if
> an overlay file is provided. Error out if BR2_XTENSA_OVERLAY_FILE
> is empty.

Well, why don't we always check for an overlay when BR2_XTENSA_CUSTOM=y?

Indeed, whether big or little endian, if the user selects a custom
xtensa configuration, they better provide the overlay for that
configuration, otherwise that does not make sense, and they should be
using BR2_xtensa_fsf=y instead.

So, maybe just this

    diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
    index fd410f6bfa..9cf6f45678 100644
    --- a/arch/arch.mk.xtensa
    +++ b/arch/arch.mk.xtensa
    @@ -10,6 +10,9 @@
     #   endif
     ################################################################################
     BR_ARCH_XTENSA_OVERLAY_FILE = $(call qstrip,$(BR2_XTENSA_OVERLAY_FILE))
    +ifeq ($(BR_BUILDING)$(BR2_XTENSA_CUSTOM):$(BR_ARCH_XTENSA_OVERLAY_FILE),yy:)
    +$(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
    +endif
     ifneq ($(filter http://% https://% ftp://% scp://%,$(BR_ARCH_XTENSA_OVERLAY_FILE)),)
     ARCH_XTENSA_OVERLAY_URL = $(BR_ARCH_XTENSA_OVERLAY_FILE)
     ARCH_XTENSA_OVERLAY_FILE = $($(PKG)_DL_DIR)/$(notdir $(BR_ARCH_XTENSA_OVERLAY_FILE))

Thoughts?

Regards,
Yann E. MORIN.

> Fixes:
> http://autobuild.buildroot.org/results/f0b/f0ba47d2534aeb3cc2921124aa639ae3aa072b9b
> 
> xtensa-buildroot-linux-uclibc/bin/ld: ldso/ldso/ld-uClibc_so.a(ldso.oS): compiled for a big endian system and target is little endian
> 
> [1] https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=include/xtensa-config.h;hb=2ee5e4300186a92ad73f1a1a64cb918dc76c8d67#l28
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: Max Filippov <jcmvbkbc@gmail.com>
> ---
>  arch/arch.mk.xtensa | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/arch/arch.mk.xtensa b/arch/arch.mk.xtensa
> index fd410f6bfa..516d77bf91 100644
> --- a/arch/arch.mk.xtensa
> +++ b/arch/arch.mk.xtensa
> @@ -34,3 +34,11 @@ define arch-xtensa-overlay-extract
>  		$(ARCH_XTENSA_OVERLAY_FILE) | \
>  	$(TAR) --strip-components=1 -C $(1) $(TAR_OPTIONS) - $(2)
>  endef
> +
> +# By default GCC build xtensa for Big Endian. To build for Little Endian a
> +# Xtensa overlay file must be provided.
> +ifeq ($(BR2_XTENSA_LITTLE_ENDIAN),y)
> +ifeq ($(call qstrip,$(BR2_XTENSA_OVERLAY_FILE)),)
> +$(error No xtensa overlay file provided. Check your BR2_XTENSA_OVERLAY_FILE setting)
> +endif
> +endif
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
