Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FD67C00528
	for <buildroot@archiver.kernel.org>; Sun, 23 Jul 2023 14:01:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D300760BEC;
	Sun, 23 Jul 2023 14:01:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D300760BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b99W3UGqZgHU; Sun, 23 Jul 2023 14:01:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1D24360B6A;
	Sun, 23 Jul 2023 14:01:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1D24360B6A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 51CF31BF575
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:01:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2B1EC400B9
 for <buildroot@lists.busybox.net>; Sun, 23 Jul 2023 14:01:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2B1EC400B9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FtqID2zRH-bd for <buildroot@lists.busybox.net>;
 Sun, 23 Jul 2023 14:01:05 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3ACE4400A6
 for <buildroot@buildroot.org>; Sun, 23 Jul 2023 14:01:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3ACE4400A6
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:46bc:e175:93d0:2fb4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 327775FFA7;
 Sun, 23 Jul 2023 16:01:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 23 Jul 2023 16:00:59 +0200
Date: Sun, 23 Jul 2023 16:00:59 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bernd Kuhls <bernd@kuhls.net>
Message-ID: <20230723140059.GD2503916@scaer>
References: <20230723083152.3147145-1-bernd@kuhls.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230723083152.3147145-1-bernd@kuhls.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1690120862;
 bh=tE0m71Qc7Lk/QnBBNRYtPNoa/JoaAxgMNe6Alx2nV/4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VvBRise/JLhDK6xy2MP0z19RzJF+gtYZ0DbmLNDj/Oig9iaduTQBZ2BoNJlZeHlZE
 ExoZCB8G0stE8UoXjZKdWzXYevT1hIzentVwk2cL3B6qYnOUU6/G0MUZeZCmJq/UVV
 F8IV2WiG7bCQLBF4xqvvzuwMUSG3vC8hJJf/iGjPYcyy3TXfl9HBGbjsbXXyRxFAbO
 3atH3Fkwwfet/v8eMG+VAK+d5xkvdjC+Ivf4wMcxE0cl6fZmBgCwGDB6hF86NLyEjD
 B1RYtvGQ/Hed+MPDUlj7nfLwJUEo8vsdtTFc+/sNJOSwphIe3Aqv1JQgmYrjY1q7xn
 k0myS/Ikyrd5g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VvBRise/
Subject: Re: [Buildroot] [PATCH 1/2] package/transmission: fix comment
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

Bernd, All,

On 2023-07-23 10:31 +0200, Bernd Kuhls spake thusly:
> The wrong condition was added with buildroot commit
> 80793107a65d95f8dfd0317a726d3a737c78ef67.
> 
> Signed-off-by: Bernd Kuhls <bernd@kuhls.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/transmission/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/transmission/Config.in b/package/transmission/Config.in
> index 84bd85eeff..fd4c897497 100644
> --- a/package/transmission/Config.in
> +++ b/package/transmission/Config.in
> @@ -49,4 +49,4 @@ comment "transmission needs a toolchain w/ dynamic library, threads, C++, gcc >=
>  	depends on BR2_USE_MMU
>  	depends on !BR2_BINFMT_FLAT
>  	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP || \
> -		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || !BR2_STATIC_LIBS
> +		!BR2_TOOLCHAIN_GCC_AT_LEAST_7 || BR2_STATIC_LIBS
> -- 
> 2.39.2
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
