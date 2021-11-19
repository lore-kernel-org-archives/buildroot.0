Return-Path: <SRS0=y7vk=QG=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 78A20C433FE
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:11:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3625661A70
	for <buildroot@archiver.kernel.org>; Fri, 19 Nov 2021 17:11:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3625661A70
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04ED661C2C;
	Fri, 19 Nov 2021 17:11:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oXuIo05W0sm1; Fri, 19 Nov 2021 17:11:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4298861C09;
	Fri, 19 Nov 2021 17:10:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8004F1BF37C
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:10:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7C34C61C09
 for <buildroot@lists.busybox.net>; Fri, 19 Nov 2021 17:10:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D0QbbSZLR-pb for <buildroot@lists.busybox.net>;
 Fri, 19 Nov 2021 17:10:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7246B6063A
 for <buildroot@buildroot.org>; Fri, 19 Nov 2021 17:10:55 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:8ce3:604:2d0f:2718])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id AF0722003B4;
 Fri, 19 Nov 2021 18:10:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1637341852;
 bh=JDlJrk5eJMWBUiCUfazjzGC2vyrSGTr9G7E3YpJQoT8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GjzJ0vjAesUlzn4aysu8UdHx64/4r3oNbZb778qGqtqRjdI5zgUSPT744xtpFvrZq
 A0kA5sV3qASuj7Ars072csm2O4m+9eHvg1EEUIYqnoayEQ/SiUi8O6DihxdEiLA37f
 47ZMS4tdV7otahIOs5D3OQ1PK3sXF1eZbvbI5RK12YlLrIxntOxS8mZUEkg4C/VlSz
 7Zw+4ZyJMAPXNapVYbBvZtaOL3rw7UCY2zhZ7HZJK205/8dgwfPQuxrsZOgggcN/dr
 aVKQE1jPrlVPKWaU2EJ07NzUM89ytkrKvL62bfatDQbkYHEjsbjrVcD4g6hKHCr5MV
 NO1qkwpc3710g==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 19 Nov 2021 18:10:46 +0100
Date: Fri, 19 Nov 2021 18:10:46 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20211119171046.GQ247986@scaer>
References: <20211119165458.2410686-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211119165458.2410686-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/2] Revert "package/log4cxx: select boost
 chrono and date-time with gcc < 7"
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2021-11-19 17:54 +0100, Fabrice Fontaine spake thusly:
> This reverts commit 3c2245cb65741c965f4bb87d35ac3c64f250a1ae to move
> these selects on boost side as the build failure was raised with gcc >=
> 7.

So, if I understand correctly, if we just apply this revert, but not the
following patch, we break the build again, right? If so, then it makes
the history not bi-sectable.

Instead, the boost patch must be applied first, and once that is done,
then we can apply this revert.

If the above is correct, just say so, we can re-order the patches when
applying...

Regards,
Yann E. MORIN.

> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/log4cxx/Config.in | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/log4cxx/Config.in b/package/log4cxx/Config.in
> index 27a5f06988..6f1956f829 100644
> --- a/package/log4cxx/Config.in
> +++ b/package/log4cxx/Config.in
> @@ -12,8 +12,6 @@ config BR2_PACKAGE_LOG4CXX
>  	select BR2_PACKAGE_APR_UTIL
>  	select BR2_PACKAGE_BOOST if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	select BR2_PACKAGE_BOOST_ATOMIC if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> -	select BR2_PACKAGE_BOOST_CHRONO if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
> -	select BR2_PACKAGE_BOOST_DATE_TIME if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	select BR2_PACKAGE_BOOST_THREAD if !BR2_TOOLCHAIN_GCC_AT_LEAST_7
>  	help
>  	  Apache log4cxx is a logging framework for C++ patterned
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
