Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C482C433EF
	for <buildroot@archiver.kernel.org>; Sat, 28 May 2022 21:33:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC21C4184A;
	Sat, 28 May 2022 21:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HQVao9do6BZ3; Sat, 28 May 2022 21:33:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C6940A03;
	Sat, 28 May 2022 21:33:15 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 103991BF5A0
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:33:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F030B61108
 for <buildroot@lists.busybox.net>; Sat, 28 May 2022 21:33:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iqxBAuWiCY3p for <buildroot@lists.busybox.net>;
 Sat, 28 May 2022 21:33:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5AA6610FD
 for <buildroot@buildroot.org>; Sat, 28 May 2022 21:33:12 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:882a:25de:8723:774f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id D079F19F55C;
 Sat, 28 May 2022 23:33:06 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1653773590;
 bh=x75gpF26DH5P9qKsTaZvvPwaOrP9TJjX5imVsORItfc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ibh7Y1afZHfOxe95ckEvZOQ5Qta61PXhrPGVUrcjzavj8fAfQkhy6dFodIrDH6TnY
 xanC8+fE6p5X3xHrsA6/RBJWw2w+Y8NPTx78zqB59Ygieimp737qRNfii0OQhUj8KM
 1NdW7qQQuyH2pMtq/EyMIn2w+w/2+4GRUcvn1N9G1kOSGDbCKybKI45E+lqaPlKLat
 L/vsiWdBbq0ZxWt9H2NtQgO2gVUkx9RCB57xHEULBDKowgkanPE9qP3pz8Fk0mDeyF
 /CXmcq8G2cC+dUO+R7OGbo6VDTr+Z5vdo3T8sh4I9IuPNKPlM3mTjCAbig5ofejQQ5
 JK97I57loKHkA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 28 May 2022 23:33:06 +0200
Date: Sat, 28 May 2022 23:33:06 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Andrey Nechypurenko <andreynech@gmail.com>
Message-ID: <20220528213306.GL301044@scaer>
References: <20220329145904.63900-1-andreynech@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220329145904.63900-1-andreynech@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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

Andrey, All,

On 2022-03-29 16:59 +0200, Andrey Nechypurenko spake thusly:
> Version 3.20 is the first one where the following issue is fixed:
> https://gitlab.kitware.com/cmake/cmake/-/issues/18299
> Was affected by this bug and decide to bump the version to the
> latest stable

I was about to apply this, but you did not sign-off your change, so I
can't apply it.

Please, resent with your sign-off.

Regards,
Yann E. MORIN.

> ---
>  package/cmake/cmake.hash | 4 ++--
>  package/cmake/cmake.mk   | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> index da514a6d6b..1749db8c27 100644
> --- a/package/cmake/cmake.hash
> +++ b/package/cmake/cmake.hash
> @@ -1,5 +1,5 @@
> -# From https://cmake.org/files/v3.18/cmake-3.18.6-SHA-256.txt
> -sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600  cmake-3.18.6.tar.gz
> +# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
> +sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0  cmake-3.22.3.tar.gz
>  
>  # Locally calculated
>  sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d  Copyright.txt
> diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> index 4177b119ab..053658fad6 100644
> --- a/package/cmake/cmake.mk
> +++ b/package/cmake/cmake.mk
> @@ -4,8 +4,8 @@
>  #
>  ################################################################################
>  
> -CMAKE_VERSION_MAJOR = 3.18
> -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
> +CMAKE_VERSION_MAJOR = 3.22
> +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
>  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
>  CMAKE_LICENSE = BSD-3-Clause
>  CMAKE_LICENSE_FILES = Copyright.txt
> -- 
> 2.32.0
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
