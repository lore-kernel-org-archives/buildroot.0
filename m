Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53D81C636CC
	for <buildroot@archiver.kernel.org>; Sat,  4 Feb 2023 11:49:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EF6938169B;
	Sat,  4 Feb 2023 11:49:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EF6938169B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wmd7MQPaauaq; Sat,  4 Feb 2023 11:49:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0AD2E82136;
	Sat,  4 Feb 2023 11:49:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0AD2E82136
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 78F2E1BF42C
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 11:49:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5F9C6415A7
 for <buildroot@lists.busybox.net>; Sat,  4 Feb 2023 11:49:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5F9C6415A7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DsCGRHCADdf0 for <buildroot@lists.busybox.net>;
 Sat,  4 Feb 2023 11:49:20 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCD7841591
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DCD7841591
 for <buildroot@buildroot.org>; Sat,  4 Feb 2023 11:49:19 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2001:67c:1810:f055:ed24:459b:7ee:752f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7A74EB00579;
 Sat,  4 Feb 2023 12:49:15 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 04 Feb 2023 12:49:15 +0100
Date: Sat, 4 Feb 2023 12:49:15 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20230204114915.GB14083@scaer>
References: <20230203230455.1566166-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230203230455.1566166-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1675511357;
 bh=nB+4B4M+oCFj4R+lwQYxAqtzYiwBSE1rvFRHKfMArhY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gN7aoa0lpQUhFK4N8pjpfrvuZBKUMJ8coQk+Vuw29DJzEBAnlftoCRxNZVGreMDCC
 yzz3WawBrSfGMloKzKKvWwtUGiyXiepjOSZ8ryYr0ZVah28kxHZmC0SyLdi0owoXua
 5S/8fEcw0rP2DedyioP31GAHlC8FI+05+ZvSk/Va7xs+srhXpRHQqOdwzy4v/II95E
 RSWyWZga0t3rOT8d3Tzsp6AlT90/UcvBTSH0tCrH+5x7pd1k4EZ4FdTwbJXjdrYjV7
 DSvjKMLdr0SOqun4dP5hvREiaF5UsRMAZBJubqaBGytqDNDN3PcqLhswxlOpZFxasd
 4AyUkeoIa0wpw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=gN7aoa0l
Subject: Re: [Buildroot] [PATCH] package/wpewebkit: security bump to version
 2.38.4
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

Adrian, All,

On 2023-02-04 01:04 +0200, Adrian Perez de Castro spake thusly:
> Bugfix release, with many security fixes, including (but not limited to)
> patches for CVE-2023-23517, CVE-2023-23518, and CVE-2022-42826.
> 
> Release notes:
> 
>   https://wpewebkit.org/release/wpewebkit-2.38.4.html
> 
> Accompanying security advisory:
> 
>   https://wpewebkit.org/security/WSA-2023-0001.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wpewebkit/wpewebkit.hash | 8 ++++----
>  package/wpewebkit/wpewebkit.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index ccd928b3df..dcd082e045 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/wpewebkit-2.38.3.tar.xz.sums
> -md5  60f79ff8dc68280f756963af23b67d6d  wpewebkit-2.38.3.tar.xz
> -sha1  de15119a0dc29776d3a11fca1df4238b471f960f  wpewebkit-2.38.3.tar.xz
> -sha256  1dd9075eec7253a1b0d038a73f92ddbb9174394e6a7527ec07b4464fa6290498  wpewebkit-2.38.3.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.38.4.tar.xz.sums
> +md5  1c947ef5b73049fc6c102c92013009bf  wpewebkit-2.38.4.tar.xz
> +sha1  7fe9a7d98401256b0c9872f1c2b702e56840cbd3  wpewebkit-2.38.4.tar.xz
> +sha256  8c1bc113ef151fb0be2640824d323bc755dc97295ab7a1bc05e7ec589937a07b  wpewebkit-2.38.4.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index 4c50ed9955..34ee405de1 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WPEWEBKIT_VERSION = 2.38.3
> +WPEWEBKIT_VERSION = 2.38.4
>  WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
>  WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>  WPEWEBKIT_INSTALL_STAGING = YES
> -- 
> 2.39.1
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
