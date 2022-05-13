Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 378B7C433EF
	for <buildroot@archiver.kernel.org>; Fri, 13 May 2022 16:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D56E083F2B;
	Fri, 13 May 2022 16:34:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JQ1KEplZPw1t; Fri, 13 May 2022 16:34:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E529783F04;
	Fri, 13 May 2022 16:34:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 291161BF86B
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:34:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 173AC41941
 for <buildroot@lists.busybox.net>; Fri, 13 May 2022 16:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rYlOMvVj1KkI for <buildroot@lists.busybox.net>;
 Fri, 13 May 2022 16:34:52 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp4.osuosl.org (Postfix) with ESMTPS id DDFDC4192E
 for <buildroot@buildroot.org>; Fri, 13 May 2022 16:34:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:71f3:9479:94db:16e0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 8BAA813F8C4;
 Fri, 13 May 2022 18:34:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1652459688;
 bh=veJsTKUQRw9sclJWw6IRaBD4sX5GhN+Iry6MFGggAWA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XlG2dkB/7vZKsA6jy4FQ+o6fTETdvelkE7YZvFD5t3eSPj+c827YFpZjEVD0jXWeR
 tG8Pm++f+BXwMisLb3b68ctzaooRzYhEOuW8mEwKo9g+Ktmp3RtcrOqkZCTAFkiQFt
 AaieU3cfTFmu5P7vlcIMAKTFNZNip4B110hExVnQYcNgpU1VehGTXgJ15dqZjS1/V0
 4j1iYrCEdb6Y+PBvZW3kVspiMXkcw/xoo3jx5vhZ9/NG2Pt41sUjnijd6lrkjmitaN
 enuRWO8z63Qqo5VMK8/dvnZTeJpi1RSaYa+/nSthV3VDaWhvFWgJRYf/q0l5mRlCDI
 VXRnlaiGydz6w==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 13 May 2022 18:34:46 +0200
Date: Fri, 13 May 2022 18:34:46 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Korsgaard <peter@korsgaard.com>
Message-ID: <20220513163446.GQ1597494@scaer>
References: <20220513144215.2598981-1-peter@korsgaard.com>
 <20220513144215.2598981-4-peter@korsgaard.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220513144215.2598981-4-peter@korsgaard.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 4/4] {linux,
 linux-headers}: default to 5.17.x
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

Peter, All,

On 2022-05-13 16:42 +0200, Peter Korsgaard spake thusly:
> 5.15.x is getting quite old, so default to 5.17.x instead.

But 5.15 is a longterm kernel, while 5.17 will probably not be.

Also, see below...

> Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
> ---
[--SNIP--]
> diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
> index 5ff616fb34..859f772624 100644
> --- a/package/linux-headers/Config.in.host
> +++ b/package/linux-headers/Config.in.host
[--SNIP--]
> @@ -56,10 +56,6 @@ config BR2_KERNEL_HEADERS_5_15
>  	bool "Linux 5.15.x kernel headers"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_15
>  
> -config BR2_KERNEL_HEADERS_5_16
> -	bool "Linux 5.16.x kernel headers"
> -	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_16

Did you forget to squash this hunk...

>  config BR2_KERNEL_HEADERS_5_17
>  	bool "Linux 5.17.x kernel headers"
>  	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_17
> @@ -389,7 +385,6 @@ config BR2_DEFAULT_KERNEL_HEADERS
>  	default "5.4.193"	if BR2_KERNEL_HEADERS_5_4
>  	default "5.10.115"	if BR2_KERNEL_HEADERS_5_10
>  	default "5.15.39"	if BR2_KERNEL_HEADERS_5_15
> -	default "5.16.20"	if BR2_KERNEL_HEADERS_5_16

... and this one in the previous patch?

Regards,
Yann E. MORIN.

>  	default "5.17.7"	if BR2_KERNEL_HEADERS_5_17
>  	default BR2_DEFAULT_KERNEL_VERSION if BR2_KERNEL_HEADERS_VERSION
>  	default "custom"	if BR2_KERNEL_HEADERS_CUSTOM_TARBALL
> -- 
> 2.30.2
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
