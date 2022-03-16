Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67927C433EF
	for <buildroot@archiver.kernel.org>; Wed, 16 Mar 2022 22:20:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 230C5841C7;
	Wed, 16 Mar 2022 22:20:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2EU5scfqP-Tv; Wed, 16 Mar 2022 22:20:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32A0F81AAC;
	Wed, 16 Mar 2022 22:20:15 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B6EA31BF3DB
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:20:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B164A40116
 for <buildroot@lists.busybox.net>; Wed, 16 Mar 2022 22:20:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SopRJx50rSMd for <buildroot@lists.busybox.net>;
 Wed, 16 Mar 2022 22:20:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 856B240018
 for <buildroot@buildroot.org>; Wed, 16 Mar 2022 22:20:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:6da3:2756:3f87:4127])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D3CCD13F86E;
 Wed, 16 Mar 2022 23:20:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1647469211;
 bh=/7d5Z6RN4/WhCx5oz+anPr1VoMTrwvWwuPButTdZ4A8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=mejbaJLofhZQFo87OZggIy/UCaVSLrgg73TPiuxPQaZlmoCL6D1ZkXtwSpaR8x9ao
 Vf9LckXA4pa4NV7emQ+fEb0GrdWq0PohdlhEvcZ8D83XOL70ljggr9jLHHYt/qQY2F
 xTCTK+1WSCEZS+fHz4GJ7q1WAX+sjK51Lh66TWKYwz5LDJN1giR3DpM3N9ZyI1+mEM
 6EhMzmwQ0c+zjIOKkutgbvnXfAnUvYkXW+5dQoyerNcirauBy9Z97x/sIwmCnsQn+w
 HBkfa8wClDvnno7YO+1Oc/5ijlbyIcJ7QVNiydmEX0wgZOeiALRRCQeCJN/6zIBbMv
 ODZKeRAnX+aow==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 16 Mar 2022 23:20:07 +0100
Date: Wed, 16 Mar 2022 23:20:07 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220316222007.GH283544@scaer>
References: <20220316203922.3081843-1-fontaine.fabrice@gmail.com>
 <20220316203922.3081843-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220316203922.3081843-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 2/2] package/libminiupnpc: drop dependencies
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-03-16 21:39 +0100, Fabrice Fontaine spake thusly:
> libminiupnpc can be statically built with or without binfmt flat since
> version 1.7 and
> https://github.com/miniupnp/miniupnp/commit/c183a72c46cae9e37ddf635318dfb0bdcd56ed9d
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
[--SNIP--]
> diff --git a/package/transmission/Config.in b/package/transmission/Config.in
> index aaed7ec111..eb51ccf862 100644
> --- a/package/transmission/Config.in
> +++ b/package/transmission/Config.in
> @@ -2,8 +2,8 @@ config BR2_PACKAGE_TRANSMISSION
>  	bool "transmission"
>  	depends on BR2_TOOLCHAIN_HAS_THREADS
>  	depends on BR2_USE_MMU # fork()
> -	depends on !BR2_BINFMT_FLAT # libminiupnpc, libnatpmp
> -	depends on !BR2_STATIC_LIBS # libminiupnpc, libnatpmp
> +	depends on !BR2_BINFMT_FLAT # libnatpmp
> +	depends on !BR2_STATIC_LIBS # libnatpmp

This does not apply to current master;

    error: patch failed: package/transmission/Config.in:2
    error: package/transmission/Config.in: patch does not apply
    hint: Use 'git am --show-current-patch' to see the failed patch
    Applying: package/libminiupnpc: drop dependencies
    Patch failed at 0001 package/libminiupnpc: drop dependencies
    When you have resolved this problem, run "git am --continue".
    If you prefer to skip this patch, run "git am --skip" instead.
    To restore the original branch and stop patching, run "git am --abort".

Care to have a look and respin, please?

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_ZLIB
>  	select BR2_PACKAGE_DHT
>  	select BR2_PACKAGE_OPENSSL
> -- 
> 2.35.1
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
