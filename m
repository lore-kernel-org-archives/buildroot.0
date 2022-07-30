Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF0B8C04A68
	for <buildroot@archiver.kernel.org>; Sat, 30 Jul 2022 12:02:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 03D8B40B86;
	Sat, 30 Jul 2022 12:02:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 03D8B40B86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xUW3nz8I5BQW; Sat, 30 Jul 2022 12:02:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0792040217;
	Sat, 30 Jul 2022 12:02:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0792040217
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B51C01BF392
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:02:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8FAEE83F91
 for <buildroot@lists.busybox.net>; Sat, 30 Jul 2022 12:02:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8FAEE83F91
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Im2CgDuS1Sc2 for <buildroot@lists.busybox.net>;
 Sat, 30 Jul 2022 12:02:27 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63F8E83F73
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 63F8E83F73
 for <buildroot@buildroot.org>; Sat, 30 Jul 2022 12:02:27 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:ed0d:5473:88a:e206])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id D497F60130;
 Sat, 30 Jul 2022 14:02:19 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 30 Jul 2022 14:02:19 +0200
Date: Sat, 30 Jul 2022 14:02:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220730120219.GP3168@scaer>
References: <20220727184850.2857314-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220727184850.2857314-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1659182544;
 bh=Z/RhXwUzDRpzFUlj6DADjUSxIC+9EZ80OYw4m95qHyo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=G6QRdb1YyEzmEGoR9TgqvJgIRV9ioizuRRUjOKiovi3B6ihzubTvr735l3eFwbmaf
 QZZZUIjwR94mTYSMp6C4b+unZCKc9GkLTRG8w7vGgOgxszD2hMPQjC+O0pTXWmYIYZ
 C44TjPojDzURPLgU63eHGTp9+gmsCC6T/kujDYNgtpFSCQwGBc2KeIT32jvfvTfK1v
 NLyFWPC+pBFu6jGffogGEorOyEqetQrVH6RsbWUxGO/JNfuUv8JjM9CUhOYc26BSQ6
 FQNcHJ0gTP2F3vEv83BB9tfAt+u0zxJ8s4bcXFkKLGbGGmmivfYEH8E2dS1Vqm0A9S
 Fw9JLBYQmnRxQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=G6QRdb1Y
Subject: Re: [Buildroot] [PATCH 1/3] docs/manual/ccache-support.txt: expand
 explanation about ccache cache location
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
Cc: Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>,
 Buildroot List <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-07-27 20:48 +0200, Thomas Petazzoni via buildroot spake thusly:
> The manual explanation seemed to imply that the cache is always in
> ~/.buildroot-ccache/, but it's just the default value. Clarify this
> point.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  docs/manual/ccache-support.txt | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/docs/manual/ccache-support.txt b/docs/manual/ccache-support.txt
> index f6746ad7d8..ea64628615 100644
> --- a/docs/manual/ccache-support.txt
> +++ b/docs/manual/ccache-support.txt
> @@ -15,10 +15,12 @@ speed up the build process.
>  +Enable compiler cache+ in +Build options+. This will automatically
>  build +ccache+ and use it for every host and target compilation.
>  
> -The cache is located in +$HOME/.buildroot-ccache+. It is stored
> -outside of Buildroot output directory so that it can be shared by
> -separate Buildroot builds. If you want to get rid of the cache, simply
> -remove this directory.
> +The cache is located in the directory defined by the +BR2_CCACHE_DIR+
> +configuration option, which defaults to
> ++$HOME/.buildroot-ccache+. This default location is outside of
> +Buildroot output directory so that it can be shared by separate
> +Buildroot builds. If you want to get rid of the cache, simply remove
> +this directory.
>  
>  You can get statistics on the cache (its size, number of hits,
>  misses, etc.) by running +make ccache-stats+.
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
