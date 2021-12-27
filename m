Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 588B0C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 19:16:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id EAA58402D8;
	Mon, 27 Dec 2021 19:16:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JWCTRq1hSujA; Mon, 27 Dec 2021 19:16:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6409C40273;
	Mon, 27 Dec 2021 19:16:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AE5F81BF386
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 19:16:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CEFF60A80
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 19:16:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xTzKBicGtLKh for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 19:16:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 48F8560A74
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 19:16:16 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:918:ad60:2814:bc16])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 208B7B0054C;
 Mon, 27 Dec 2021 20:16:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1640632573;
 bh=pzrdEGw5RH9wIjBGjMMj9LGC55/iGPWNgYi3fvvssm8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=K2NDmqbB/B3B2yGKdJ3PqN5hkLqkm9VyMNd8sAwB+4fIi4Kuc6Omd3NhDuLrEvHuV
 wR/kLLxxj5WkfRKBZMg5Bb1WVLchC4ccXRiIpiBkEGlTvUNG/W+nMHwcvjEDHC/XgE
 HBvWEVeDn6p/dDobHWUowuMbibUhhX+cDy+IPu1LJ7QJlfTCgWJN2A365C+a7iYlh5
 PvZh4W04PuQcj7VotyaLTSknrEtWIJKJNMKqJaK3IHXjgwDAYPPnOa1fTXaKduvUZX
 Roqk+WU9P+U4tBshHHpa512+kvDFuW9wSQ5hTKGrti4hJJ9n1Qnpns3jySYxUfV+eQ
 IVtI3/H4do16Q==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 27 Dec 2021 20:16:08 +0100
Date: Mon, 27 Dec 2021 20:16:08 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20211227191608.GT2603@scaer>
References: <20211226103329.660967-1-thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211226103329.660967-1-thomas.petazzoni@bootlin.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/binutils: fix an OpenRISC binutils
 2.37 patch
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2021-12-26 11:33 +0100, Thomas Petazzoni spake thusly:
> When binutils 2.37 was introduced in commit
> 62f0232980c8168631b29f27edf612af8109c691 ("package/binutils: add
> version 2.37"), the patch
> 0008-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch was
> not properly updated. Indeed, between binutils 2.36 and 2.37, binutils
> has switched to using the standard "bool" type, so instead of using
> TRUE/FALSE, true/false must be used.
> 
> With this change, the binutils patch matches the one that was merged
> upstream.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  ...4-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch b/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
> index 779baeab63..0d18321ee1 100644
> --- a/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
> +++ b/package/binutils/2.37/0004-or1k-fix-pc-relative-relocation-against-dynamic-on-P.patch
> @@ -46,7 +46,7 @@ index 32063ab0289..67252394173 100644
>  +	      _bfd_error_handler
>  +		(_("%pB: pc-relative relocation against dynamic symbol %s"),
>  +		 input_bfd, name);
> -+	      ret_val = FALSE;
> ++	      ret_val = false;
>  +	      bfd_set_error (bfd_error_bad_value);
>  +	    }
>  +	  break;
> -- 
> 2.31.1
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
