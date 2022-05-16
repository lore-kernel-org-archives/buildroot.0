Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D3FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 16 May 2022 21:44:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DB57E6113F;
	Mon, 16 May 2022 21:44:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 77qlKNTXVr2W; Mon, 16 May 2022 21:44:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA4D9610F1;
	Mon, 16 May 2022 21:44:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 555FE1BF35A
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:44:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 51F5E610F1
 for <buildroot@lists.busybox.net>; Mon, 16 May 2022 21:44:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1F6hzUEcWicD for <buildroot@lists.busybox.net>;
 Mon, 16 May 2022 21:44:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5A39A60EF9
 for <buildroot@buildroot.org>; Mon, 16 May 2022 21:44:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5536:e9db:e000:2fa9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id A8386B00515;
 Mon, 16 May 2022 23:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652737481;
 bh=qdDa0TnvOK0/9ZRfejwUbu8Bh3gFXdF/hpNA5kVOztQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=eMz23Vp2q1QyzPZ9s1jDb2ibR7w49AtoYmQMiEICXqQTuTUs/yfJrFbQh62el9Cg8
 ZB5o40Ko5zn0hRWogBTbjFVFSMeNfPQVqI2duJACrHTLu0s+tM3oks8NouMUvyic23
 Y3XIOv751Y5x16dl+6YEokx7xGku42HW6khcIeDAq4BRBfDpMPF3g7LFYvwbibmjvo
 WN7I9OLMQNFM18Ex5ckcquYx0tdefgD8h/3vwRmno0wowefjDom2DSVi+57pereavD
 wduwUPl7XqQY1YHJGEIpNVAQjR9nyMDvVbFGfVq96//B4Gf3Ij0GnCMezUB0LG7IbV
 GjNfc+pG4mHSA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 May 2022 23:44:38 +0200
Date: Mon, 16 May 2022 23:44:38 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Romain Naour <romain.naour@gmail.com>
Message-ID: <20220516214438.GL1597494@scaer>
References: <20220515193633.180221-1-romain.naour@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220515193633.180221-1-romain.naour@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/gcc: restrict hs4x_rel31 to arc gcc
 fork
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
Cc: ARC Maintainers <arc-buildroot@synopsys.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On 2022-05-15 21:36 +0200, Romain Naour spake thusly:
> ARC hs4x_rel31 cpu is not supported by upstream gcc version.
> Only the generic HS48 processor (BR2_archs4x) is supported
> by upstream gcc.
> 
> Fixes:
> http://autobuild.buildroot.net/results/357a74d53af96d4b868a9d5b9f9ce9432e0c53b5
> http://autobuild.buildroot.net/results/bcdf160a3d5ffcccd4402f65aca153faca4b32c2
> 
> Signed-off-by: Romain Naour <romain.naour@gmail.com>
> Cc: ARC Maintainers <arc-buildroot@synopsys.com>
> ---
>  package/gcc/Config.in.host | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
> index f6b9b4fa9d..2b12035c4b 100644
> --- a/package/gcc/Config.in.host
> +++ b/package/gcc/Config.in.host
> @@ -31,6 +31,8 @@ config BR2_GCC_VERSION_9_X
>  	# upstream gcc. C-SKY gcc upstream support not tested
>  	# with upstream binutils and glibc.
>  	depends on !BR2_csky
> +	# ARC HS48 rel 31 only supported by gcc arc fork.
> +	depends on !BR2_archs4x_rel31

So, in the commit log, you say that BR2_archs4x is the only variant
supported by upstream gcc, yet this change still allows all the hs38
and the 7x0d variants to use the upstream gcc.

Did I misread the commit log, and you really meant:

    Of the hs48 series, only the generic HS48 processor (BR2_archs4x) is
    supported by upstream gcc, while the hs48 rel31 (hs4x_rel31) is not,
    and is only suppoerted by the ARC fork.

    All the other variants, 7x0d and hs38, are all supported in upstream
    gcc.

Thoughts?

Regards,
Yann E. MORIN.

>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_9
>  
>  config BR2_GCC_VERSION_10_X
> @@ -43,6 +45,8 @@ config BR2_GCC_VERSION_10_X
>  	# upstream gcc. C-SKY gcc upstream support not tested
>  	# with upstream binutils and glibc.
>  	depends on !BR2_csky
> +	# ARC HS48 rel 31 only supported by gcc arc fork.
> +	depends on !BR2_archs4x_rel31
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_10
>  
>  config BR2_GCC_VERSION_11_X
> @@ -54,6 +58,8 @@ config BR2_GCC_VERSION_11_X
>  	# that need to be reverted since gcc 8.4, 9.3 and 10.1.
>  	# https://gcc.gnu.org/bugzilla/show_bug.cgi?id=98784
>  	depends on !BR2_sparc
> +	# ARC HS48 rel 31 only supported by gcc arc fork.
> +	depends on !BR2_archs4x_rel31
>  	select BR2_TOOLCHAIN_GCC_AT_LEAST_11
>  
>  endchoice
> -- 
> 2.35.3
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
