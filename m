Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 514E1C04A68
	for <buildroot@archiver.kernel.org>; Wed, 27 Jul 2022 07:58:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E1CCE60AB8;
	Wed, 27 Jul 2022 07:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E1CCE60AB8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3-nuMwhOX0BZ; Wed, 27 Jul 2022 07:58:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 197FD605D5;
	Wed, 27 Jul 2022 07:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 197FD605D5
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 726A51BF3A0
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:58:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A9B480B07
 for <buildroot@lists.busybox.net>; Wed, 27 Jul 2022 07:58:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A9B480B07
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2-OalgSq8b9V for <buildroot@lists.busybox.net>;
 Wed, 27 Jul 2022 07:58:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3677780AE2
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3677780AE2
 for <buildroot@buildroot.org>; Wed, 27 Jul 2022 07:58:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9946:e64:fb26:3d99])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 27E89780516;
 Wed, 27 Jul 2022 09:58:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 27 Jul 2022 09:58:26 +0200
Date: Wed, 27 Jul 2022 09:58:26 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220727075826.GB1085273@scaer>
References: <20220726163951.2111731-1-thomas.petazzoni@bootlin.com>
 <20220726163951.2111731-2-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220726163951.2111731-2-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658908709;
 bh=fHWKMAGdqQMWctfobLy9nhMVRFDHY2tbVJ8hlWnPDeM=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DjdTXYC9ieoDzsncb6ALxeHadfkYpgytA9tMPDUlxvHg5Vq+4BxsnpgmvOblESCYv
 IeAPp+r7gDgnVHqtjXptbW5h/Dl/G57vPbAYmyJp6quagEv3OrOa03NV/j2cegB7Xv
 QkzuJB9BqEyfjCKC5zMZ0MnY4SBDj1Q6d15Vlgn/snQPP3Olr3b03ZYWbGKqi5Q+7C
 ZHeeVVWwZjXZJqo5LC2ZV17EfNHW8bE76KbQjXS2Czi16p9rzdvbt8k7ZT9EIPWdfa
 UxMoZ9OtkcEzFUEvWxKIry+E9L/oe0c82pHMVja6CqVoNGlrB9c73ttvY+7VfPndih
 FVm0DsdOnChCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DjdTXYC9
Subject: Re: [Buildroot] [PATCH v2 2/4] package/Makefile.in: add detection
 for the lack of C library
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

Thomas, All,

On 2022-07-26 18:39 +0200, Thomas Petazzoni via buildroot spake thusly:
> We recently had several cases of architecture configurations for which
> no C library was available, leading to a build failure during the gcc
> build. In order to more easily detect those bogus configurations,
> let's bail out very early by detecting the lack of C library
> selection.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
> ---
>  package/Makefile.in | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/Makefile.in b/package/Makefile.in
> index 508ea7c366..f8920c87a4 100644
> --- a/package/Makefile.in
> +++ b/package/Makefile.in
> @@ -47,6 +47,12 @@ else
>  TARGET_OS = linux
>  endif
>  
> +# This happens if there is a bug in Buildroot that allows an
> +# architecture configuration that isn't supported by any library.
> +ifeq ($(BR2_TOOLCHAIN_USES_GLIBC)$(BR2_TOOLCHAIN_USES_UCLIBC)$(BR2_TOOLCHAIN_USES_MUSL),)
> +$(error No C library enabled, this is not possible.)
> +endif

I've moved this as the last else clause in the fllowing conditional
block (and added an explicit test for the else-glibc case of course).

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  LIBC = uclibc
>  else ifeq ($(BR2_TOOLCHAIN_USES_MUSL),y)
> -- 
> 2.37.1
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
