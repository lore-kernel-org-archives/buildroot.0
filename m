Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 318D7C001DB
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 16:09:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C6F3A814B3;
	Sun, 13 Aug 2023 16:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C6F3A814B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vIb5j05acUuo; Sun, 13 Aug 2023 16:09:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1C40781497;
	Sun, 13 Aug 2023 16:09:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C40781497
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1B5541BF293
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 16:09:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0206781497
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 16:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0206781497
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pueYlIRVzsRM for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 16:09:05 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0288181489
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 16:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0288181489
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:13dc:fe9:8e15:e643])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 4A99A780331;
 Sun, 13 Aug 2023 18:09:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 13 Aug 2023 18:09:00 +0200
Date: Sun, 13 Aug 2023 18:09:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Vincent Fazio <vfazio@gmail.com>
Message-ID: <20230813160900.GA421096@scaer>
References: <20230813045912.10404-1-vfazio@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230813045912.10404-1-vfazio@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691942943;
 bh=LWSBR6Qj1daRY/x96xWbtkNgQPZG3jakIQAROWkPvbU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XmVFJI+Ab1GveKstvGRa+/0Tn/4vIco2TnM82WI3qGPnkH0mVxDZyuIFvewXxqjK9
 RbMfsZy9G1R9HgUlYwJz4K3V323lOTGwuTZ6EURO2VfzWnW02PsAGv5fHSWGW8R4Gb
 dcWT+5VD3jYItr4F8mVXn9K+iKE/Jq5vsyqWawM64ZG0U6BlnbJXuAC1fj5pxlpDoC
 gR5XoiCCC/fTIhID4bEJMFuAJR1x5JB7oHuvn2l0PZJE72fvSEK5hyIupCpeN22YUz
 VoGc/5CbJXkCnVPxYyxi9zBAN88zRjMwm/HtiYcoqW8Lvst6rY2Aebr1szm+672zbZ
 CydNtxTswpB0w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XmVFJI+A
Subject: Re: [Buildroot] [PATCH 1/1] support/scripts/gen-bootlin-toolchains:
 generate BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Vincent, All,

On 2023-08-12 23:59 -0500, Vincent Fazio spake thusly:
> Previously, gen-bootlin-toolchains did not add a `depends` guard to
> limit the available toolchains based on the minimum required GCC version
> for the user selected CPU tuning.
> 
> Now, the proper BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard will be added based
> on the version of GCC provided by the toolchain.
> 
> Signed-off-by: Vincent Fazio <vfazio@gmail.com>

s for the other external toolchains, this is a fix, so I applied to
master.

I did regenerate the toolchains, after adding a litle temporary kludge
so that the latest Bootlin toolchain version was ignored.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  support/scripts/gen-bootlin-toolchains | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
> index 23ebfbdce9..4344221213 100755
> --- a/support/scripts/gen-bootlin-toolchains
> +++ b/support/scripts/gen-bootlin-toolchains
> @@ -338,6 +338,8 @@ class Toolchain:
>                  m = re.match("^BR2_TOOLCHAIN_EXTERNAL_GCC_([0-9_]*)=y$", frag)
>                  assert m, "Cannot get gcc version for toolchain %s" % self.fname_prefix
>                  selects.append("BR2_TOOLCHAIN_GCC_AT_LEAST_%s" % m[1])
> +                # respect the GCC requirement for the selected CPU/arch tuning
> +                depends.append("!BR2_ARCH_NEEDS_GCC_AT_LEAST_%s" % str(int(m[1]) + 1))
>  
>              # kernel headers version
>              if frag.startswith("BR2_TOOLCHAIN_EXTERNAL_HEADERS_"):
> -- 
> 2.25.1
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
