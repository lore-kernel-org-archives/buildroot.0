Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8ABEC38145
	for <buildroot@archiver.kernel.org>; Thu,  8 Sep 2022 09:46:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 274124156D;
	Thu,  8 Sep 2022 09:46:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 274124156D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PT2AEYTUwHiw; Thu,  8 Sep 2022 09:46:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 313D440B20;
	Thu,  8 Sep 2022 09:46:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 313D440B20
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1BC3C1BF36A
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 09:46:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03DCE84079
 for <buildroot@lists.busybox.net>; Thu,  8 Sep 2022 09:46:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03DCE84079
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYHov2DgEXhR for <buildroot@lists.busybox.net>;
 Thu,  8 Sep 2022 09:46:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 75AFF83EF0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 75AFF83EF0
 for <buildroot@buildroot.org>; Thu,  8 Sep 2022 09:46:43 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:440f:501d:7d45:a1fe])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id AB8E15FFC1;
 Thu,  8 Sep 2022 11:46:36 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 08 Sep 2022 11:46:36 +0200
Date: Thu, 8 Sep 2022 11:46:36 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220908094636.GI1585594@scaer>
References: <20220904200409.3153993-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220904200409.3153993-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662630399;
 bh=8X61pogtlFiAEy3qljnem5rbEbedEpfggUa8XTt8Ga0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b9WadJpbGMn6/2GzxFmFcFsrkxNcfl4MD6sdZSAey2PYNUhEo00SEGg9Fqv4YAGvh
 fZk2UYleyxYnstVZo2CLdK5h8RuZardxtq/7Uh8XIlhRrKWcHQseN6RVFyVdwPdiKm
 psmhZ0MHBZ1gphTAPJMW0CI1BrGfFPuj4Nxf9qt92pCRHd/wuX6jIctKg9WamMnXFH
 ps3jnRin8/Xir54jOfwMwDh4mvE6vZKXjjDRiGluGp7A47205NOn03t6lLxA5E0MLz
 G7KThIWY6JUWf3ZMb1VjrKDVr7NKiZHuUsMnQeRD3tSUDDrlDULkxjtI6IaQEIXV7o
 bFhXc6rA5/jkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b9WadJpb
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
> 
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

Following the discussion in this thread, and the feedback from Max, I've
applied the changes I suggested, and then applied to master, thanks.

Regards,
Yann E. MORIN.

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
