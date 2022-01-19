Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2E3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 19 Jan 2022 21:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A3B9F4032C;
	Wed, 19 Jan 2022 21:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 23ebOKPNDMes; Wed, 19 Jan 2022 21:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6A974021C;
	Wed, 19 Jan 2022 21:48:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BE2861BF3FC
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:48:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id ACD0181778
 for <buildroot@lists.busybox.net>; Wed, 19 Jan 2022 21:48:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Jp9B_pIM0dI6 for <buildroot@lists.busybox.net>;
 Wed, 19 Jan 2022 21:48:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C8951816F5
 for <buildroot@busybox.net>; Wed, 19 Jan 2022 21:48:18 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:7065:fa25:c80a:5e5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1348219F54D;
 Wed, 19 Jan 2022 22:48:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642628897;
 bh=qXM0LRl7rGzHXEErJQF5HIyZqBlRxcmflAPTQGJuT60=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=gWeM/bxDrFOVyyeI51V+djgmd+J6bsBbK+Xh2cpt1bF7OsHerbvfZT/Uv1EmZ/Itd
 pBT3CHIChYjXdzLnCSLaobTLwWeBM/G07dnX37MV07c1SlFiw16MCWW7c/tR5Xr8zx
 rXqN43/nzpNSmAaja+EiiTAntscRkjyhKUZBDMnBCd7cfFa5ujmDLdYCEhsWX+hX/8
 IzjMsFrS6MUZmuoFUHPxueZDsCP0Q9Zn5DfIpfMNu7KpmOCHY/8q+nEBywo/Y8yGeb
 P8WAT/B8VxNzIiYTQqU29ucsi6nHATRwHLjak7wMZTDlBRmyR8zOm1pIZ5zwyo+RpS
 dJd/Cecq0j+uw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 19 Jan 2022 22:48:14 +0100
Date: Wed, 19 Jan 2022 22:48:14 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Michael Fischer <mf@go-sys.de>
Message-ID: <20220119214814.GI3095239@scaer>
References: <20220118081331.30088-1-mf@go-sys.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220118081331.30088-1-mf@go-sys.de>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/gnuplot: bump version to 5.4.3
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
Cc: buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Michael, All,

On 2022-01-18 09:13 +0100, Michael Fischer spake thusly:
> Signed-off-by: Michael Fischer <mf@go-sys.de>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/gnuplot/gnuplot.hash | 6 +++---
>  package/gnuplot/gnuplot.mk   | 2 +-
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/gnuplot/gnuplot.hash b/package/gnuplot/gnuplot.hash
> index fc166205d0..1cc14973d1 100644
> --- a/package/gnuplot/gnuplot.hash
> +++ b/package/gnuplot/gnuplot.hash
> @@ -1,6 +1,6 @@
>  # From https://sourceforge.net/projects/gnuplot/files/gnuplot/5.4.2/
> -md5  2050ca477199a591543bc968aba7d899  gnuplot-5.4.2.tar.gz
> -sha1  2e076b29f38bfcb841cb5eb3377fd1a469ced1ac  gnuplot-5.4.2.tar.gz
> +md5  9bb03cfa77e38924e08ffbb9eb59d8b1  gnuplot-5.4.3.tar.gz
> +sha1  c4b60fd7a700b22fa62b14829cbb0e17911627c9  gnuplot-5.4.3.tar.gz
>  # Locally computed
> -sha256  e57c75e1318133951d32a83bcdc4aff17fed28722c4e71f2305cfc2ae1cae7ba  gnuplot-5.4.2.tar.gz
> +sha256  51f89bbab90f96d3543f95235368d188eb1e26eda296912256abcd3535bd4d84  gnuplot-5.4.3.tar.gz
>  sha256  895928ec0735cca1c8cec42656c7e314a065d0242813bb8693c0c1bf61fd4e4d  Copyright
> diff --git a/package/gnuplot/gnuplot.mk b/package/gnuplot/gnuplot.mk
> index 436d3e5f92..6cf36a0997 100644
> --- a/package/gnuplot/gnuplot.mk
> +++ b/package/gnuplot/gnuplot.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -GNUPLOT_VERSION = 5.4.2
> +GNUPLOT_VERSION = 5.4.3
>  GNUPLOT_SITE = http://downloads.sourceforge.net/project/gnuplot/gnuplot/$(GNUPLOT_VERSION)
>  GNUPLOT_LICENSE = gnuplot license (open source)
>  GNUPLOT_LICENSE_FILES = Copyright
> -- 
> 2.20.1
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
