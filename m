Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E899EC433EF
	for <buildroot@archiver.kernel.org>; Tue,  4 Jan 2022 22:14:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A23BA60E47;
	Tue,  4 Jan 2022 22:14:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vUCHKhgj60n0; Tue,  4 Jan 2022 22:14:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 07FAB60C08;
	Tue,  4 Jan 2022 22:14:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E3731BF2BE
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:14:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 98D0740377
 for <buildroot@lists.busybox.net>; Tue,  4 Jan 2022 22:14:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id h7XQca80qNBg for <buildroot@lists.busybox.net>;
 Tue,  4 Jan 2022 22:14:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4F6A2405B6
 for <buildroot@buildroot.org>; Tue,  4 Jan 2022 22:14:15 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:dd8f:11a1:7592:f85e])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 6143220036C;
 Tue,  4 Jan 2022 23:14:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641334452;
 bh=zE2w8Q63VfbQDMVlGWQ1l1OgkzaWjoJkhBI29OLg49I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uno6tccyWcM4vSqnzZ92HYMyVSHlMiKgsfleH1OnKDF/NSHEhmO1EsVpZsqAL41GH
 GiNe54W94n0gB7iNbryanELZLbT6PBtFtoyAQXK+qEDiR1jjqU8OMN/iCDXENkAR8w
 b6KVBlKKKn2x9sCGo0efWImTKlgy3jldnuv9eJd+SKFl0375Z3ify3zdi0W1uhTHkn
 Lc4pP0sSYKsV/GYTELMaLbKI6SHpWJXXV7WLm62Ja3R359QDFKBXr9Ew4KXSjbzc7j
 ZOuXFRE7KUwTAyaeE9EUsyfGr91zW8Q3PcbLYiYSxVC2O18Fm4u12u8oNy5yo5NCa5
 BfEE7Sckft3rw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 04 Jan 2022 23:14:07 +0100
Date: Tue, 4 Jan 2022 23:14:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Arnout Vandecappelle (Essensium/Mind)" <arnout@mind.be>
Message-ID: <20220104221407.GC614810@scaer>
References: <20220104171128.956397-1-arnout@mind.be>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220104171128.956397-1-arnout@mind.be>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] Config.in.legacy: fix removed bootlin
 riscv64 toolchains
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

Arnout, All,

On 2022-01-04 18:11 +0100, Arnout Vandecappelle (Essensium/Mind) spake thusly:
> commit b3c66481e1f1503fcbf193d0c780271e880ad500 replaced RISC-V LP64
> bootlin toolchains by RISC-V LP64D. However, Config.in.legacy was added
> for BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE, which never
> existed (the stable version was only added after the switch to LP64D).
> Conversely, BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE,
> which was removed, was not mentioned in Config.in.legacy.
> 
> Correct the symbol name and its comment in Config.in.legacy.

Thanks for spotting what I missed. How did you notice, so that I can add
that to my check-list?

> Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  Config.in.legacy | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Config.in.legacy b/Config.in.legacy
> index 5994d94487..e5349e58ac 100644
> --- a/Config.in.legacy
> +++ b/Config.in.legacy
> @@ -153,8 +153,8 @@ config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_BLEEDING_EDGE
>  	  The RISC-V 64-bit LP64 Bootlin toolchains have been removed,
>  	  in favor of RISC-V 64-bit LP64D toolchains.
>  
> -config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_GLIBC_STABLE
> -	bool "Bootlin riscv64 glibc bleeding-edge toolchain removed"
> +config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_RISCV64_MUSL_BLEEDING_EDGE
> +	bool "Bootlin riscv64 musl bleeding-edge toolchain removed"
>  	select BR2_LEGACY
>  	help
>  	  The RISC-V 64-bit LP64 Bootlin toolchains have been removed,
> -- 
> 2.31.1
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
