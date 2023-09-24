Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13651CE7A8A
	for <buildroot@archiver.kernel.org>; Sun, 24 Sep 2023 09:56:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8DFE541795;
	Sun, 24 Sep 2023 09:56:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DFE541795
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id W6dmLnMFsxbs; Sun, 24 Sep 2023 09:56:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7473541797;
	Sun, 24 Sep 2023 09:56:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7473541797
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 196BC1BF403
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 09:56:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E63B2408C0
 for <buildroot@lists.busybox.net>; Sun, 24 Sep 2023 09:56:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E63B2408C0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zfPG2LzBFogH for <buildroot@lists.busybox.net>;
 Sun, 24 Sep 2023 09:56:27 +0000 (UTC)
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0434340297
 for <buildroot@buildroot.org>; Sun, 24 Sep 2023 09:56:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0434340297
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:bf8d:df06:37bc:41df])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id D3937780375;
 Sun, 24 Sep 2023 11:56:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 24 Sep 2023 11:56:19 +0200
Date: Sun, 24 Sep 2023 11:56:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jens Maus <mail@jens-maus.de>
Message-ID: <20230924095619.GG1469982@scaer>
References: <20230923160411.3662885-1-mail@jens-maus.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230923160411.3662885-1-mail@jens-maus.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1695549384;
 bh=cfmBt/mNebZjaBQCEER9+kbZTbHRP3Y8RN91+hQoDws=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=usbdtwkX6r3D3C3/rlzdjvgwJEfsQr4aZr3Bghe4C5VhHraODdbWkzUmCF+eP8Khe
 XJWktTm+zcbq+aKW1OGzIcuZPzYWGoDVbqUeWa6zVEKQ9X8SAwoU6M+ggj1Ax1qpsQ
 7ukYVIK6wMDRXRspGODgDQowAKmAYmw5ZYeM/kYHSCqwA4wu3iDptfslBGNYl/W1jE
 VSMiidwjRDU41Bn2velfgHomPwRyolHP5nJVlDRmRdsq4HZQqOL18fnmFEW/+ZG0ph
 uv37JUl4m0S/nu9sJ6S9HDvEvczYb52TeOJxj2qN6RTQebF831t3OWIcWwXY9jq5ss
 pDInQUDBci9tQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=usbdtwkX
Subject: Re: [Buildroot] [PATCH v2] package/nodejs: fix parallel build
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
Cc: Daniel Price <daniel.price@gmail.com>, Martin Bark <martin@barkynet.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jens, All,

On 2023-09-23 18:04 +0200, Jens Maus via buildroot spake thusly:
> In ninja-based nodejs builds performing parallel builds using "make -jX"
> is not working during buildroot initiated builds because the JOBS
> variable is not set in the MAKE_OPTS variables in nodejs.mk. This commit
> remedies the issue by setting JOBS to BR2_JLEVEL.

I was very confused that nodejs would not build in parallel; that would
have made for very, very,very long builds. And indeed, it does build in
parallel, in fact.

However, what it does, is use as many CPUs as are available, without
accounting for the value set by the user in BR2_JLEVEL, thus
overshooting the limits set by the user.

So, I reworded the whoe commit log to explain that.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> Signed-off-by: Jens Maus <mail@jens-maus.de>
> 
> ---
> Changes v1 -> v2:
>   - removed unrelated v8-qemu-wrapper.in change (Yann)
>   - revised change summary (Yann)
>   - removed unnecessary top-level Makefile modifications (Yann)
> 
> Signed-off-by: Jens Maus <mail@jens-maus.de>
> ---
>  package/nodejs/nodejs.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/nodejs/nodejs.mk b/package/nodejs/nodejs.mk
> index fe629ada21..4e70bd71a3 100644
> --- a/package/nodejs/nodejs.mk
> +++ b/package/nodejs/nodejs.mk
> @@ -46,14 +46,16 @@ HOST_NODEJS_MAKE_OPTS = \
>  	CXXFLAGS="$(HOST_NODEJS_CXXFLAGS)" \
>  	LDFLAGS.host="$(HOST_LDFLAGS)" \
>  	NO_LOAD=cctest.target.mk \
> -	PATH=$(@D)/bin:$(BR_PATH)
> +	PATH=$(@D)/bin:$(BR_PATH) \
> +	JOBS=$(BR2_JLEVEL)
>  
>  NODEJS_MAKE_OPTS = \
>  	$(TARGET_CONFIGURE_OPTS) \
>  	NO_LOAD=cctest.target.mk \
>  	PATH=$(@D)/bin:$(BR_PATH) \
>  	LDFLAGS="$(NODEJS_LDFLAGS)" \
> -	LD="$(TARGET_CXX)"
> +	LD="$(TARGET_CXX)" \
> +	JOBS=$(BR2_JLEVEL)
>  
>  # nodejs's build system uses python which can be a symlink to an unsupported
>  # python version (e.g. python 3.10 with nodejs 14.18.1). We work around this by
> -- 
> 2.34.1
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
