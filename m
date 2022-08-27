Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D55EECAAD2
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 13:41:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A78540533;
	Sat, 27 Aug 2022 13:41:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A78540533
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rQVByVlm1DTo; Sat, 27 Aug 2022 13:41:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 556FE40516;
	Sat, 27 Aug 2022 13:41:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 556FE40516
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BB64A1BF588
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96C3940516
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 13:41:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 96C3940516
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jo4auUd4bixl for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 13:41:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 93AA940286
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [IPv6:2a01:e0c:1:1599::15])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 93AA940286
 for <buildroot@buildroot.org>; Sat, 27 Aug 2022 13:41:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:e2dc:5f1b:7f23:232])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 75EC97804FF;
 Sat, 27 Aug 2022 15:41:05 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 27 Aug 2022 15:41:05 +0200
Date: Sat, 27 Aug 2022 15:41:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220827134105.GX37358@scaer>
References: <20220824114153.229484-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220824114153.229484-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661607668;
 bh=05G5fPtXuuMjZnPpEM6QCXDzXKWGdcEJbmklb6Ipqf0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=AipBKCmYYK3guj5er0RlxusJBEtIFesVZCjN4x1eLCWDbE6/QUkVC3qJLSmdTR1eU
 BBmaGeJ1NFSd+Etdi+NP31ddDkfKaLnV321bm/UjwmyTW/Z2mEBqw6EBmBx1f2m7ui
 S07nhhR27Dob74pVEPeb+jZNWlqsswALI8KXwV54mXpR2l6XlXbf+fq6U1+Mn1T+sU
 SDH+4r5fy22GpibFfqTLHl+WFX+VyBBZlFcwSvG+VfjhYx5crp1+0ZaQP5P0RmvhIl
 0eUq+wpFj74NO4M51ElN5d12aj3bZgaFUhf3aw0Rj/uxMUT+BfMKJZeNMaa8ZJN4j3
 7SSqRHIZxHHTQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=AipBKCmY
Subject: Re: [Buildroot] [PATCH 1/1] package/libwpe: security bump to
 version 1.12.3
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

On 2022-08-24 14:41 +0300, Adrian Perez de Castro spake thusly:
> This update fixes a potential memory allocation issue. There is no
> associated advisory, though. Release notes:
> 
>   https://wpewebkit.org/release/libwpe-1.12.1.html
>   https://wpewebkit.org/release/libwpe-1.12.2.html
>   https://wpewebkit.org/release/libwpe-1.12.3.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libwpe/libwpe.hash | 8 ++++----
>  package/libwpe/libwpe.mk   | 2 +-
>  2 files changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/package/libwpe/libwpe.hash b/package/libwpe/libwpe.hash
> index 2ebe4f19bd..2bbe1f0749 100644
> --- a/package/libwpe/libwpe.hash
> +++ b/package/libwpe/libwpe.hash
> @@ -1,7 +1,7 @@
> -# From https://wpewebkit.org/releases/libwpe-1.12.0.tar.xz.sums
> -md5  5a3f11789535d826370ba465ea141393  libwpe-1.12.0.tar.xz
> -sha1  91aa47a593a5db511d667b3bdbaa76dee4301311  libwpe-1.12.0.tar.xz
> -sha256  e8eeca228a6b4c36294cfb63f7d3ba9ada47a430904a5a973b3c99c96a44c18c  libwpe-1.12.0.tar.xz
> +# From https://wpewebkit.org/releases/libwpe-1.12.3.tar.xz.sums
> +md5  e538eb8e521d92f2bde3c4cd864abaa1  libwpe-1.12.3.tar.xz
> +sha1  9d94c411a502a10e68f69bd1fa273539cc6af2ca  libwpe-1.12.3.tar.xz
> +sha256  b84fdbfbc849ce4fdf084bb28b58e5463b1b4b6cc8f200dc77b41f8545d5329d  libwpe-1.12.3.tar.xz
>  
>  # Hashes for license files:
>  sha256  35bef295cedbbf179eaee14328002587a0e7dc08ebf3f15ea080a6f2815f0d7b  COPYING
> diff --git a/package/libwpe/libwpe.mk b/package/libwpe/libwpe.mk
> index fe3c4b16d7..ac533642d9 100644
> --- a/package/libwpe/libwpe.mk
> +++ b/package/libwpe/libwpe.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -LIBWPE_VERSION = 1.12.0
> +LIBWPE_VERSION = 1.12.3
>  LIBWPE_SITE = https://wpewebkit.org/releases
>  LIBWPE_SOURCE = libwpe-$(LIBWPE_VERSION).tar.xz
>  LIBWPE_INSTALL_STAGING = YES
> -- 
> 2.37.2
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
