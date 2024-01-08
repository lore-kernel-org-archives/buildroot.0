Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF72EC3DA6E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jan 2024 20:39:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 96FA341902;
	Mon,  8 Jan 2024 20:39:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 96FA341902
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Y0MjA3W-43g1; Mon,  8 Jan 2024 20:39:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB1F4417E3;
	Mon,  8 Jan 2024 20:39:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DB1F4417E3
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C5A601BF2BA
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:39:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EA63821D4
 for <buildroot@lists.busybox.net>; Mon,  8 Jan 2024 20:39:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EA63821D4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QpyQU8XLvggQ for <buildroot@lists.busybox.net>;
 Mon,  8 Jan 2024 20:39:46 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A71C8821BB
 for <buildroot@busybox.net>; Mon,  8 Jan 2024 20:39:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71C8821BB
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8290:3800:4dc2:634f:d1a7:1769])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id C24525FF95;
 Mon,  8 Jan 2024 21:39:42 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 08 Jan 2024 21:39:42 +0100
Date: Mon, 8 Jan 2024 21:39:42 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Baruch Siach <baruch@tkos.co.il>
Message-ID: <ZZxdjnTzr-aoHgRz@landeda>
References: <955dd511a8904b18bce9c2ac8e27ad07c160e2b2.1704718771.git.baruch@tkos.co.il>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <955dd511a8904b18bce9c2ac8e27ad07c160e2b2.1704718771.git.baruch@tkos.co.il>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1704746385;
 bh=2YbI9i+/KG/OnW5DyfRpEC7o9TfikOopXNNDIUt+t+g=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Tkh3WXGMRTjZ2hp821Yb2F6G5YYmxv6g1Q/I39eF7vnHbjrbTKb1YSwrIDAaV29/R
 sW10hrJ/VmR3/wGip+KU7EsvbIwOiFejMbFMND2BfBo7v5D9aqf6y/jwigYHrIEkI7
 6NYN//sTzzWee9lFugPu2wc47heMPGwAYUH7g+cc1dHiI6rxYC9AfGoiwzDSeEa3FH
 03sllsrQlyOqyxxM7fY2keG3fxcIn+0nrBE3Hs1ABuu+U0d6mJpl7KfTfi5CSN9Y9R
 Ch5tYfE+9cS04efYIHqk0MRpO9uTjDK/MgTo59jm9wBU/wGALou58mCaYqtmRyrvHk
 bsHwHhWHWk3mA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Tkh3WXGM
Subject: Re: [Buildroot] [PATCH 1/2] package/rng-tools: update help text
 website reference
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

Baruch, All,

On 2024-01-08 14:59 +0200, Baruch Siach via buildroot spake thusly:
> We switched to new upstream since commit f9e9c6349afe0
> ("package/rng-tools: bump to 6.7"). Update the website URL as well.
> 
> Signed-off-by: Baruch Siach <baruch@tkos.co.il>

Both cleanups applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/rng-tools/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/rng-tools/Config.in b/package/rng-tools/Config.in
> index be3f078a0bce..7f08fa25fbf7 100644
> --- a/package/rng-tools/Config.in
> +++ b/package/rng-tools/Config.in
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_RNG_TOOLS
>  	help
>  	  Daemon to use hardware random number generators.
>  
> -	  http://sourceforge.net/projects/gkernel/
> +	  https://github.com/nhorman/rng-tools
>  
>  if BR2_PACKAGE_RNG_TOOLS
>  
> -- 
> 2.43.0
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
