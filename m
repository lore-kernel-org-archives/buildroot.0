Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B70FDC4332F
	for <buildroot@archiver.kernel.org>; Sun, 11 Dec 2022 16:27:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4CA7A8144B;
	Sun, 11 Dec 2022 16:27:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4CA7A8144B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id gS_jlRs9g3gy; Sun, 11 Dec 2022 16:27:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 708718142C;
	Sun, 11 Dec 2022 16:27:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 708718142C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AFCD91BF2F2
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:27:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8B4BF8142C
 for <buildroot@lists.busybox.net>; Sun, 11 Dec 2022 16:27:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8B4BF8142C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HAzUzQZfIo7r for <buildroot@lists.busybox.net>;
 Sun, 11 Dec 2022 16:27:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 925E78142B
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 925E78142B
 for <buildroot@buildroot.org>; Sun, 11 Dec 2022 16:27:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c8de:37ee:6661:285c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 698D513F895;
 Sun, 11 Dec 2022 17:27:13 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 11 Dec 2022 17:27:13 +0100
Date: Sun, 11 Dec 2022 17:27:13 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20221211162713.GT1044805@scaer>
References: <20221208194742.763582-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208194742.763582-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670776036;
 bh=2+JdG5BM815qTIfU2FQvmI5yGPoDoGYi3ySdN59JXlc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=LQbDbRihBKreeQzWfRUPGhjhjlMlwgtYBJdTu//kaM6B/nXBgZ4Tah4AIfFexbRzo
 4Gxap5mU7K8ls10Fwav5d1yoBks1ecQeWwGwRSOthfoJ9o24eZzOZ1Vi7nCkeWIotO
 WBz69T98Ma7vIyuL678iIhusknG1KetfIWsORz+BlXN5xWZt88Kn6Pu8eE52lypdY2
 +sonqMjkEuNI7V61vrh9U9NUai0o+WpVWuDRTO0wRLnjF6iAFhITf5KjydvQv7mXr8
 pXykUDCdOSnrMDsCMZ1MWLkMm+yuLIaYAP8hnnRpI6kjc080bXeyJktoRHsMbOreZ2
 2y++21tQkOY+g==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=LQbDbRih
Subject: Re: [Buildroot] [PATCH v2] package/xr819-xradio: fix build failure
 with Linux 6.0
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-12-08 20:47 +0100, Giulio Benetti spake thusly:
> Bump to latest version to fix build failure with Linux 6.0.
> 
> Fixes:
> http://autobuild.buildroot.net/results/434c1d2a5104090366519278314bf750324d3710/
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>

Applied to master, thanks.

(yes, this one, yes...)

Regards,
Yann E. MORIN.

> ---
> V1->V2:
> * add Fixes: to commit log as suggested by Sergey Matyukevich
> ---
>  package/xr819-xradio/xr819-xradio.hash | 2 +-
>  package/xr819-xradio/xr819-xradio.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/xr819-xradio/xr819-xradio.hash b/package/xr819-xradio/xr819-xradio.hash
> index 89201a8eb7..08a3b6e8cc 100644
> --- a/package/xr819-xradio/xr819-xradio.hash
> +++ b/package/xr819-xradio/xr819-xradio.hash
> @@ -1,4 +1,4 @@
>  # Locally computed
> -sha256  0d0449a85488b990d10ecdf67ac88bfbd39fa81c2df5dfcfed583975222afd33  xr819-xradio-4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2.tar.gz
> +sha256  839fdae93eba29121d4116de335b00a026ef63874caf516747dbdf24c17f208b  xr819-xradio-58d597bcf081e44904335916e6033bc8ef28b043.tar.gz
>  # Locally computed
>  sha256  db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  LICENSE
> diff --git a/package/xr819-xradio/xr819-xradio.mk b/package/xr819-xradio/xr819-xradio.mk
> index 835e229347..8c1cb1587f 100644
> --- a/package/xr819-xradio/xr819-xradio.mk
> +++ b/package/xr819-xradio/xr819-xradio.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -XR819_XRADIO_VERSION = 4f0cfd5e869ca101e7c624d9ce05ba5d2b2a0bc2
> +XR819_XRADIO_VERSION = 58d597bcf081e44904335916e6033bc8ef28b043
>  XR819_XRADIO_SITE = $(call github,fifteenhex,xradio,$(XR819_XRADIO_VERSION))
>  XR819_XRADIO_LICENSE = GPL-2.0
>  XR819_XRADIO_LICENSE_FILES = LICENSE
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
