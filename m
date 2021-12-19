Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD3AC433F5
	for <buildroot@archiver.kernel.org>; Sun, 19 Dec 2021 08:31:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD40140374;
	Sun, 19 Dec 2021 08:31:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ckf5jOuxrypS; Sun, 19 Dec 2021 08:31:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B4B6E4016C;
	Sun, 19 Dec 2021 08:31:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 09D721BF574
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 08:31:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ED3E341627
 for <buildroot@lists.busybox.net>; Sun, 19 Dec 2021 08:31:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CQE1dIR2v0L2 for <buildroot@lists.busybox.net>;
 Sun, 19 Dec 2021 08:31:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 19A7E41512
 for <buildroot@buildroot.org>; Sun, 19 Dec 2021 08:31:52 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cb3:149f:d03e:db5a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 399B75FF96;
 Sun, 19 Dec 2021 09:31:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1639902710;
 bh=To/yzEfLAxGZGzT0Zln4nICaQp75B5pY/YLSs1DROxI=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=NgvagYJscj+zx9EVqyWVJXqp8KW1X0ZCCOZu/KevyFMEN5uNMdXWTbAcd9jNO/6E6
 s4JJUZeULyAzZJFSUJHNvtuNGTRxiaTjhoPbwhePBMSQYrkcnQojTt0liFzJglb+Y2
 4EEyEDVlr8qzGqIFxAtR4x7rX+dU9z282xfGewvTsUsfM3cGCNAsuv7zkN51C1c1lT
 B3khlIGvNKdg6SIi+rvbsYiiOSsqjff7q/THvPCTG305HVGAH4WRwMHVD5mOwQCjof
 OhZkiqr/NE1CGO5MDKgJAUxLV0YsVh8NxYHC4Ij6LFdXGC+wpVdByjX6V09Qk7leB6
 QV4PpbwZBxP/Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 19 Dec 2021 09:31:45 +0100
Date: Sun, 19 Dec 2021 09:31:45 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211219083145.GC2603@scaer>
References: <20211218231047.665943-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211218231047.665943-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] package/imagemagick: fix dependency
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

On 2021-12-19 00:10 +0100, Fabrice Fontaine spake thusly:
> BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS dependency was wrongly added to
> BR2_PACKAGE_HOST_IMAGEMAGICK by commit
> df20e4546384d1c249a6a0541183590671e83d77, indeed host-librsvg is only
> needed by BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/imagemagick/Config.in.host | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/imagemagick/Config.in.host b/package/imagemagick/Config.in.host
> index e12d82939a..671b0995dc 100644
> --- a/package/imagemagick/Config.in.host
> +++ b/package/imagemagick/Config.in.host
> @@ -1,6 +1,5 @@
>  config BR2_PACKAGE_HOST_IMAGEMAGICK
>  	bool "host imagemagick"
> -	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
>  	help
>  	  ImageMagick(R) is a software suite to create, edit, and
>  	  compose bitmap images. It can read, convert and write images
> @@ -17,6 +16,7 @@ if BR2_PACKAGE_HOST_IMAGEMAGICK
>  
>  config BR2_PACKAGE_HOST_IMAGEMAGICK_SVG
>  	bool "SVG support"
> +	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS # host-librsvg
>  	help
>  	  Say 'y' here is you need ImageMagick tools (like convert)
>  	  to support SVG.
> -- 
> 2.33.0
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
