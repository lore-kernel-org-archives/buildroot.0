Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2CCCC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 16:48:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9458D83365;
	Sat,  1 Oct 2022 16:48:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9458D83365
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9dcFPmQKzUyl; Sat,  1 Oct 2022 16:48:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A79D082ACD;
	Sat,  1 Oct 2022 16:48:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A79D082ACD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9F5691BF59C
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:48:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B341408E8
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 16:48:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B341408E8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EjxDweBPfsMV for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 16:48:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6401340BCF
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6401340BCF
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 16:48:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9961:1217:61e8:73cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id AEBB7780357;
 Sat,  1 Oct 2022 18:48:50 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 01 Oct 2022 18:48:49 +0200
Date: Sat, 1 Oct 2022 18:48:49 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andreas Ziegler <br015@umbiko.net>
Message-ID: <20221001164849.GJ30794@scaer>
References: <20220929105215.2984-1-br015@umbiko.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220929105215.2984-1-br015@umbiko.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664642932;
 bh=de5JPMQt8EaHgcRSnFyNweRkUw2Jf7FB/nR2g18OcNs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=g8dPbxQNvqrkAu1zt0D3ydTEWmYNO41DsgDfLieInmU565jsNFpl/OuTeROvd9KaU
 Pd63U5nyam8I+aS0IQHFk62c8bz6I5ip/E5G9TjuLqhIIu8C+PvJMAAPHwsvBOfPfh
 E5vKygpYOVTbPMwvM2ZOEJnxoFbsfeWuqB5PZs4YqdMkyDl2hPEd2ltwfmRLCh2gdL
 t04KixKLgMpG34Cyuszn1R+xk8+HncPaxodpo6wapCsG1V7MPF6Fq58odUZh/k2s0Z
 xl7quvV0P78dhdsTXu7pdM2vh5EiXZDXWGzleZuWK+XlBv1+bL+fujNXiVEw88mWSn
 Rhl6QF55seUvQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=g8dPbxQN
Subject: Re: [Buildroot] [PATCH] package/mpd: update to version 0.23.9
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

Andreas, All,

On 2022-09-29 12:52 +0200, Andreas Ziegler spake thusly:
> Mostly internal refactoring and some minor enhancements /fixes in features
> cdio_paranoia, ffmpeg (support version 5.1), pipewire, replay gain.
> 
> Improve iconv detection.
> 
> Fix bogus volume levels with multiple partitions.
> For partition support, version 0.23.9 or later is recommended.
> 
> Full change log:
> 	https://raw.githubusercontent.com/MusicPlayerDaemon/MPD/v0.23.9/NEWS
> 
> Tested on:
>   i386    (build, run)
>   x86_64  (build)
>   aarch64 (build, run)
> 
> Signed-off-by: Andreas Ziegler <br015@umbiko.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/mpd/mpd.hash | 2 +-
>  package/mpd/mpd.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/mpd/mpd.hash b/package/mpd/mpd.hash
> index e5f587fefc..fca0ee8539 100644
> --- a/package/mpd/mpd.hash
> +++ b/package/mpd/mpd.hash
> @@ -1,3 +1,3 @@
>  # Locally calculated after checking pgp signature
> -sha256  86bb569bf3b519821f36f6bb5564e484e85d2564411b34b200fe2cd3a04e78cf  mpd-0.23.8.tar.xz
> +sha256  2becaba980402e8dc7972ccc3476e493b7ae2eeb720d31fa6712472ed48e9f2d  mpd-0.23.9.tar.xz
>  sha256  ab15fd526bd8dd18a9e77ebc139656bf4d33e97fc7238cd11bf60e2b9b8666c6  COPYING
> diff --git a/package/mpd/mpd.mk b/package/mpd/mpd.mk
> index c21426b873..5c15953984 100644
> --- a/package/mpd/mpd.mk
> +++ b/package/mpd/mpd.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  MPD_VERSION_MAJOR = 0.23
> -MPD_VERSION = $(MPD_VERSION_MAJOR).8
> +MPD_VERSION = $(MPD_VERSION_MAJOR).9
>  MPD_SOURCE = mpd-$(MPD_VERSION).tar.xz
>  MPD_SITE = https://www.musicpd.org/download/mpd/$(MPD_VERSION_MAJOR)
>  MPD_DEPENDENCIES = host-pkgconf boost fmt
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
