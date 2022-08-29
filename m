Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FD31ECAAD5
	for <buildroot@archiver.kernel.org>; Mon, 29 Aug 2022 07:01:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 17C2B81911;
	Mon, 29 Aug 2022 07:01:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17C2B81911
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XtZZIgc5DBEV; Mon, 29 Aug 2022 07:01:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 30BF58142F;
	Mon, 29 Aug 2022 07:01:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 30BF58142F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63D061BF32A
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 07:01:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4C4DA400C1
 for <buildroot@lists.busybox.net>; Mon, 29 Aug 2022 07:01:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4C4DA400C1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id plQuqviaDgKH for <buildroot@lists.busybox.net>;
 Mon, 29 Aug 2022 07:01:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D2A5840111
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D2A5840111
 for <buildroot@buildroot.org>; Mon, 29 Aug 2022 07:01:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c66a:3d95:4f85:baec])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 8C923780508;
 Mon, 29 Aug 2022 09:01:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 29 Aug 2022 09:01:20 +0200
Date: Mon, 29 Aug 2022 09:01:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220829070120.GS37358@scaer>
References: <20220829061842.40771-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220829061842.40771-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661756482;
 bh=z3DdboRhzz6SttGu8pkdzHppvF32btD6y+ub2B6SsfE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=b09Ml2JcbZjrhK/q1CeshhknHLah2nN/kRfq+hraSmViGirIwUC7ifLC8cfd1Qjg5
 TVzwGo6CpEN1pfWDQlo9QhITUKE6QWNOq/J5XgmiS5BAbriJNN78+R8UEUw/YTIz5W
 d/w+frsnimigmNJjSg3hV9nAT3Bh96qZSLz4m6cDAe8CvGwlaI3jolgrqfcWCjMwXj
 sFHKKZBGE3Y7t5Jv6zFVpxQDf6SfWqWKxXYbD/H4y2/lB8WEE6eLdtTfUGq7i+gQog
 dZIY9xj5yzWmLjvFFqOnc8W1kG1BKi2kZgZLzlTjkiPVEt3Zrt0aD4hEBL+hY4bD2q
 EiDx2jyobDxVg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=b09Ml2Jc
Subject: Re: [Buildroot] [PATCH 1/1] package/tcpreplay: security bump to
 version 4.4.2
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

Fabrice, All,

On 2022-08-29 08:18 +0200, Fabrice Fontaine spake thusly:
> Fix CVE-2022-25484, CVE-2022-27416, CVE-2022-27418, CVE-2022-27939,
> CVE-2022-27940, CVE-2022-27941, CVE-2022-27942, CVE-2022-28487,
> CVE-2022-37047, CVE-2022-37048, CVE-2022-37049
> 
> https://github.com/appneta/tcpreplay/releases/tag/v4.4.2
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/tcpreplay/tcpreplay.hash | 4 ++--
>  package/tcpreplay/tcpreplay.mk   | 2 +-
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/package/tcpreplay/tcpreplay.hash b/package/tcpreplay/tcpreplay.hash
> index 32bfd219d4..97c2e7ee34 100644
> --- a/package/tcpreplay/tcpreplay.hash
> +++ b/package/tcpreplay/tcpreplay.hash
> @@ -1,5 +1,5 @@
>  # Locally calculated after checking pgp signature
> -# https://github.com/appneta/tcpreplay/releases/download/v4.4.1/tcpreplay-4.4.1.tar.xz.asc
> +# https://github.com/appneta/tcpreplay/releases/download/v4.4.2/tcpreplay-4.4.2.tar.xz.asc
>  # using key 84E4FA215C934A7D97DC76D5E9E2149793BDE17E
> -sha256  51f70ed14be5913f19c25cdfa530e98c14cedab1c76fbdd26eca7b61b57344f2  tcpreplay-4.4.1.tar.xz
> +sha256  91585c247b108ed3c10d3546d18f6a467d44229c9988c97736f953af69a6f438  tcpreplay-4.4.2.tar.xz
>  sha256  07cf5e92d475287a7d1663b33097f40cae5adf03ed8920fcd4374e3dfb48c8ad  docs/LICENSE
> diff --git a/package/tcpreplay/tcpreplay.mk b/package/tcpreplay/tcpreplay.mk
> index f228882ecc..65eb908932 100644
> --- a/package/tcpreplay/tcpreplay.mk
> +++ b/package/tcpreplay/tcpreplay.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -TCPREPLAY_VERSION = 4.4.1
> +TCPREPLAY_VERSION = 4.4.2
>  TCPREPLAY_SITE = https://github.com/appneta/tcpreplay/releases/download/v$(TCPREPLAY_VERSION)
>  TCPREPLAY_SOURCE = tcpreplay-$(TCPREPLAY_VERSION).tar.xz
>  TCPREPLAY_LICENSE = GPL-3.0
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
