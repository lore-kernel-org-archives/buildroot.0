Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D625DECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 11:49:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A633610E7;
	Fri, 26 Aug 2022 11:49:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A633610E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rynZ7teMeEkU; Fri, 26 Aug 2022 11:49:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 08BC7610D6;
	Fri, 26 Aug 2022 11:49:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 08BC7610D6
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D4F091BF289
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 11:49:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B014640D79
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 11:49:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B014640D79
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kqM6zk8fu04f for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 11:49:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8C95440192
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8C95440192
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 11:49:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1C39E19F73B;
 Fri, 26 Aug 2022 13:49:01 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 26 Aug 2022 13:49:00 +0200
Date: Fri, 26 Aug 2022 13:49:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adrian Perez de Castro <aperez@igalia.com>
Message-ID: <20220826114900.GA2569@scaer>
References: <20220826105323.495057-1-aperez@igalia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826105323.495057-1-aperez@igalia.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661514544;
 bh=4iqmVPukhSj67sCKgstEsY2nW0QIRczrgRi5Dpvcguw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=ED5vh8pitlhfBJRA3lmMVMNZUJV/E4Tuua6nLeeVaKUwGIUx5H02jw9PDsTBJfeqL
 q5y0hjht8H3kw9Q8vTfM5GGBE9RjqrlucPu7Edtpax40Sxj2YpHoF1538dTnupYBOJ
 zhO9F3BUq8ive+ziKG530MrzLI0PArDdy5VbpSfBAwkrA1gCdUyozzaEz4pn2qkO/Z
 fe3eMwghX6oLLl8FuyZp6n1ueJcSoqRgR3M1ws8gDL0mKbUtqZ4nKbhfJXd07le+VU
 g+Km2ZeooGIfFkVk415albK5nYo5PGj86h5rX4GpLba6myz4ICwizXUyWNx6w3+adH
 MBkbObs/Xr3dA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=ED5vh8pi
Subject: Re: [Buildroot] [PATCH 1/1] package/wpewebkit: security bump to
 version 2.36.7
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

On 2022-08-26 13:53 +0300, Adrian Perez de Castro spake thusly:
> Bugfix release, with a security patch for CVE-2022-32893.
> Release notes:
> 
>   https://wpewebkit.org/release/wpewebkit-2.36.6.html
>   https://wpewebkit.org/release/wpewebkit-2.36.7.html
> 
> Accompanying security advisory:
> 
>   https://wpewebkit.org/security/WSA-2022-0008.html
> 
> Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>

You seemed very insistant that it should be applied quickly, so I did.
;-]

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/wpewebkit/wpewebkit.hash | 9 ++++-----
>  package/wpewebkit/wpewebkit.mk   | 2 +-
>  2 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/package/wpewebkit/wpewebkit.hash b/package/wpewebkit/wpewebkit.hash
> index 827df1e89a..6881deb8fc 100644
> --- a/package/wpewebkit/wpewebkit.hash
> +++ b/package/wpewebkit/wpewebkit.hash
> @@ -1,8 +1,7 @@
> -
> -# From https://wpewebkit.org/releases/wpewebkit-2.36.5.tar.xz.sums
> -md5  99b9b0c3c8757edf03ddf550bea448e2  wpewebkit-2.36.5.tar.xz
> -sha1  d7deb766d1ff48b7f9d685fcd67ccc23e2962288  wpewebkit-2.36.5.tar.xz
> -sha256  f2461d533cd3820ea1855e2c8b0b0624b39add1389dc3ac09c2f27891a7a8caa  wpewebkit-2.36.5.tar.xz
> +# From https://wpewebkit.org/releases/wpewebkit-2.36.7.tar.xz.sums
> +md5  a9f8d521d8171292aab842d3e8ba227e  wpewebkit-2.36.7.tar.xz
> +sha1  e9255b3592bbaac8b20af03cafa31cedfb0b4898  wpewebkit-2.36.7.tar.xz
> +sha256  f3747d72ffc562ad0cfb6218fdf6d897c78c4bdbf5618e0fa26906fba52b95c9  wpewebkit-2.36.7.tar.xz
>  
>  # Hashes for license files:
>  sha256  0b5d3a7cc325942567373b0ecd757d07c132e0ebd7c97bfc63f7e1a76094edb4  Source/WebCore/LICENSE-APPLE
> diff --git a/package/wpewebkit/wpewebkit.mk b/package/wpewebkit/wpewebkit.mk
> index a28c8321e1..62a7be11f2 100644
> --- a/package/wpewebkit/wpewebkit.mk
> +++ b/package/wpewebkit/wpewebkit.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -WPEWEBKIT_VERSION = 2.36.5
> +WPEWEBKIT_VERSION = 2.36.7
>  WPEWEBKIT_SITE = http://www.wpewebkit.org/releases
>  WPEWEBKIT_SOURCE = wpewebkit-$(WPEWEBKIT_VERSION).tar.xz
>  WPEWEBKIT_INSTALL_STAGING = YES
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
