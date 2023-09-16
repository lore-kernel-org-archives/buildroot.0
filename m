Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BFB2CD37BD
	for <buildroot@archiver.kernel.org>; Sat, 16 Sep 2023 14:46:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D805B607BC;
	Sat, 16 Sep 2023 14:46:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D805B607BC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GJnCOjAqdCBY; Sat, 16 Sep 2023 14:46:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03C8E60D4C;
	Sat, 16 Sep 2023 14:46:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03C8E60D4C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D68801BF40D
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ADCE2416D6
 for <buildroot@lists.busybox.net>; Sat, 16 Sep 2023 14:46:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADCE2416D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9EkK92LX3H-V for <buildroot@lists.busybox.net>;
 Sat, 16 Sep 2023 14:46:00 +0000 (UTC)
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 033E0416CC
 for <buildroot@buildroot.org>; Sat, 16 Sep 2023 14:45:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 033E0416CC
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:9162:d12f:41c1:9c3])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id E5EAB2003E8;
 Sat, 16 Sep 2023 16:45:51 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 16 Sep 2023 16:45:51 +0200
Date: Sat, 16 Sep 2023 16:45:51 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Marcin Niestroj <m.niestroj@grinn-global.com>
Message-ID: <20230916144551.GH415981@scaer>
References: <20230916140433.45104-1-m.niestroj@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230916140433.45104-1-m.niestroj@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1694875557;
 bh=11VK8bhHNISbdKDDBXUWzgHoAbP71tYFRMoW0Hxczk0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=XvZ+ncDUNAXrdCO18RCkIoueWPzawsJzIxtGIXwCpzaMZw5N5+acL0GJ0UIxt+cA2
 yubm6FBn5CtyPfQ1Xw6rv3Tf8Y+B2MuYnhlS85e63OkphsR7X3PLCPKhONk/FDMeeF
 vIflpwNb6GyWXVeG3YdasDhyxE6Uk6uC3UdXfGElx6hxwerob9IB1vB4VI1M2ctT3i
 i+o0E0/BVEVDW6kvX9a1XltZ3gH5g93LJj5pZvI4o25/h6Ygu9lUHTsE1jt8t3M51h
 vAtGbUCP8/yR1UtxiUH6F+Wq5Z9zFytEZ00i8p7Uv6RojV6qMAbZmYv0o2BcG3mHdu
 4zwnjttfo1UEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=XvZ+ncDU
Subject: Re: [Buildroot] [PATCH] board/orangepi*: update links in readme
 files
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
Cc: Jan Kraval <jan.kraval@gmail.com>, Jagan Teki <jagan@amarulasolutions.com>,
 Sergey Matyukevich <geomatsi@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Marcin, All,

On 2023-09-16 16:04 +0200, Marcin Niestroj spake thusly:
> Old links are no longer working, so use new links instead.
> 
> Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  board/orangepi/orangepi-lite2/readme.txt      | 2 +-
>  board/orangepi/orangepi-one-plus/readme.txt   | 2 +-
>  board/orangepi/orangepi-zero-plus2/readme.txt | 2 +-
>  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/board/orangepi/orangepi-lite2/readme.txt b/board/orangepi/orangepi-lite2/readme.txt
> index bed561b562..7f88250418 100644
> --- a/board/orangepi/orangepi-lite2/readme.txt
> +++ b/board/orangepi/orangepi-lite2/readme.txt
> @@ -6,7 +6,7 @@ buildroot environment for the Orangepi Lite2. With the current configuration
>  it will bring-up the board, and allow access through the serial console.
>  
>  Orangepi Lite2 link:
> -http://www.orangepi.org/Orange%20Pi%20Lite%202/
> +http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Lite-2.html
>  
>  Wiki link:
>  https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+Lite2
> diff --git a/board/orangepi/orangepi-one-plus/readme.txt b/board/orangepi/orangepi-one-plus/readme.txt
> index 87f6de8510..547f874288 100644
> --- a/board/orangepi/orangepi-one-plus/readme.txt
> +++ b/board/orangepi/orangepi-one-plus/readme.txt
> @@ -6,7 +6,7 @@ buildroot environment for the Orangepi One Plus. With the current configuration
>  it will bring-up the board, and allow access through the serial console.
>  
>  Orangepi One Plus link:
> -http://www.orangepi.org/OrangePiOneplus/
> +http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-One-Plus.html
>  
>  Wiki link:
>  https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+One+Plus
> diff --git a/board/orangepi/orangepi-zero-plus2/readme.txt b/board/orangepi/orangepi-zero-plus2/readme.txt
> index 322ba0e12a..2df6dd9b11 100644
> --- a/board/orangepi/orangepi-zero-plus2/readme.txt
> +++ b/board/orangepi/orangepi-zero-plus2/readme.txt
> @@ -6,7 +6,7 @@ buildroot environment for the Orangepi Zero Plus2. With the current configuratio
>  it will bring-up the board, and allow access through the serial console.
>  
>  Orangepi Zero Plus2 link:
> -http://www.orangepi.org/OrangePiZeroPlus2/
> +http://www.orangepi.org/html/hardWare/computerAndMicrocontrollers/details/Orange-Pi-Zero-Plus-2.html
>  
>  Wiki link:
>  https://openedev.amarulasolutions.com/display/ODWIKI/Orangepi+Zero+Plus2
> -- 
> 2.42.0
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
