Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903AFC77B75
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 19:19:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3782641D2E;
	Mon,  8 May 2023 19:19:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3782641D2E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4-BZdRAQ5EAK; Mon,  8 May 2023 19:19:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2C17941D28;
	Mon,  8 May 2023 19:19:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2C17941D28
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 605751BF867
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:19:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 391E941D82
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 19:19:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 391E941D82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 48dePFiuz1h0 for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 19:19:19 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E1C3241D81
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E1C3241D81
 for <buildroot@buildroot.org>; Mon,  8 May 2023 19:19:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:7bde:4dbc:bac0:54b7])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 3F5A22003D3;
 Mon,  8 May 2023 21:19:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 May 2023 21:19:14 +0200
Date: Mon, 8 May 2023 21:19:14 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd.kuhls@t-online.de>
Message-ID: <20230508191914.GD252090@scaer>
References: <20230508164744.325731-1-bernd.kuhls@t-online.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230508164744.325731-1-bernd.kuhls@t-online.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1683573557;
 bh=ymBd37ukxzm9T3+tM61Bot3lHJcOfaAM2XH9bqwWwEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Vf3kreMCqy8PzGphelHzkPBl5/tl3kTLZvWcMumABX6fg6EBCMg6C5eQmjNSakA8l
 BC/YyRcCnKU4cfR3v3WcOOPB1HQ4FxdMqMKdpfcFffawrSCngufphODsBz+o6vcW4U
 Cyr/E+8lij/cTst8B4NETzZldiHkhcWbcjmT6X6kRHWQMjZ/t1aMI3NmhQo/z3ogRV
 oTvNjGEMgtKnbdSk2DBte11r8M88zH4ddsyYUotHmOWp+EkBlMrpV12htiDL2yQy+m
 68K17T05uiceJszHPTGWppM6D7jyCkaxANwtAiRv6Wa4khCnJETT/Lf4EaMlRZ5s7R
 wC7tKap9jU6HA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Vf3kreMC
Subject: Re: [Buildroot] [PATCH 1/1] package/dav1d: bump version to 1.2.0
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

Bernd, All,

On 2023-05-08 18:47 +0200, Bernd Kuhls spake thusly:
> Release notes:
> https://code.videolan.org/videolan/dav1d/-/blob/master/NEWS
> 
> Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/dav1d/dav1d.hash | 4 ++--
>  package/dav1d/dav1d.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/dav1d/dav1d.hash b/package/dav1d/dav1d.hash
> index cbeebc579d..1af699dbe3 100644
> --- a/package/dav1d/dav1d.hash
> +++ b/package/dav1d/dav1d.hash
> @@ -1,4 +1,4 @@
> -# From https://download.videolan.org/pub/videolan/dav1d/1.1.0/dav1d-1.1.0.tar.xz.sha256
> -sha256  fb57aae7875f28c30fb3dbae4a3683d27e2f91dde09ce5c60c22cef9bc58dfd1  dav1d-1.1.0.tar.xz
> +# From https://download.videolan.org/pub/videolan/dav1d/1.2.0/dav1d-1.2.0.tar.xz.sha256
> +sha256  231bed8bc1bb28a41d88da6b4c2c118de84b92e5f1d67caffa1b7f81aaea8c6e  dav1d-1.2.0.tar.xz
>  # Locally computed
>  sha256  b327887de263238deaa80c34cdd2ff3e0ba1d35db585ce14a37ce3e74ee389e9  COPYING
> diff --git a/package/dav1d/dav1d.mk b/package/dav1d/dav1d.mk
> index 5fe603fc1c..f8d4464cd4 100644
> --- a/package/dav1d/dav1d.mk
> +++ b/package/dav1d/dav1d.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -DAV1D_VERSION = 1.1.0
> +DAV1D_VERSION = 1.2.0
>  DAV1D_SOURCE = dav1d-$(DAV1D_VERSION).tar.xz
>  DAV1D_SITE = https://download.videolan.org/pub/videolan/dav1d/$(DAV1D_VERSION)
>  DAV1D_LICENSE = BSD-2-Clause
> -- 
> 2.39.2
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
