Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41D2CC77B73
	for <buildroot@archiver.kernel.org>; Wed, 24 May 2023 19:09:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8966882312;
	Wed, 24 May 2023 19:09:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8966882312
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Cni_QPTX2V4V; Wed, 24 May 2023 19:09:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A971283192;
	Wed, 24 May 2023 19:09:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A971283192
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A00951BF2F9
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:09:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7998761257
 for <buildroot@lists.busybox.net>; Wed, 24 May 2023 19:09:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7998761257
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z88KlK6MZRIm for <buildroot@lists.busybox.net>;
 Wed, 24 May 2023 19:09:03 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CA45C610A7
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CA45C610A7
 for <buildroot@buildroot.org>; Wed, 24 May 2023 19:09:02 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:f59a:3e7b:43a8:ebfe])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 4681FB00565;
 Wed, 24 May 2023 21:08:56 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 24 May 2023 21:08:56 +0200
Date: Wed, 24 May 2023 21:08:56 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230524190856.GA2623@scaer>
References: <20230523173142.2003235-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230523173142.2003235-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1684955339;
 bh=yZrK7TWAS3VFEcFhflCKqnxlU95uRtT1AnwQOACThtE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e9V6XwWLcMjCvRMAiHUEtSpx77mGqY17C3j3J41IEqfdr8obV2Ea5nwCxCOWKPQn6
 Kd+uz1wZoelLpWIdSXT+7bQBYNrf4ea3xuSosk8AapbgropwVspcZGoXXXAGeqndnB
 Eom8CWauOfWEEkxnjipjUQK7IRuZHDJ9kgZlqJPLUCnVoiguT9esvLkMeWd5dIjwgw
 iaoT2SHZ3ArQLQFkuLxs3UCRZyixHFPM3m4Rv/VZY+RW7jaI9c5Q/oCGH/hFHSGZKV
 LIkrzNy6bOWVW9pkIGC/79qU9Dr97aDUrxAxE9fCJ3TQsqbevakFqgo8mo9ZdcMb5L
 Mcq7xO7BGYArA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e9V6XwWL
Subject: Re: [Buildroot] [PATCH 1/1] package/libmnl: fix build failure
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
Cc: Dario Binacchi <dariobin@libero.it>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Dario, All,

On 2023-05-23 19:31 +0200, Dario Binacchi spake thusly:
> The rtnl-link-can application requires kernel headers of at least
> version 4.11. Since the `make check` command compiles all examples, their
> compilation is enabled only if the condition regarding the kernel headers
> is satisfied.
> 
> Fixes:
> - http://autobuild.buildroot.net/results/36c1619c8b02efeaf9caebae8bb5c3eb8a26238b/
> - http://autobuild.buildroot.net/results/15f6dc103eec7bdeb5020acbc0ae99dc97c00e4e/
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libmnl/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libmnl/Config.in b/package/libmnl/Config.in
> index b4a4195751ec..434778bf5547 100644
> --- a/package/libmnl/Config.in
> +++ b/package/libmnl/Config.in
> @@ -10,7 +10,11 @@ if BR2_PACKAGE_LIBMNL
>  
>  config BR2_PACKAGE_LIBMNL_EXAMPLES
>  	bool "install examples"
> +	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
>  	help
>  	  Install binary examples.
>  
> +comment "examples needs a toolchain w/ headers >= 4.11"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_11
> +
>  endif
> -- 
> 2.32.0
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
