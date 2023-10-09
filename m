Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D357E95A95
	for <buildroot@archiver.kernel.org>; Mon,  9 Oct 2023 15:06:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7B03612BB;
	Mon,  9 Oct 2023 15:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7B03612BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ztFi8EZRc7J8; Mon,  9 Oct 2023 15:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E81A9612B4;
	Mon,  9 Oct 2023 15:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E81A9612B4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2AF231BF364
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:06:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 054E36126D
 for <buildroot@lists.busybox.net>; Mon,  9 Oct 2023 15:06:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 054E36126D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HlFfWMGokJLg for <buildroot@lists.busybox.net>;
 Mon,  9 Oct 2023 15:06:32 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F245361283
 for <buildroot@buildroot.org>; Mon,  9 Oct 2023 15:06:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F245361283
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:d143:e10c:f714:dfc9])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 01B1160135;
 Mon,  9 Oct 2023 17:06:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 09 Oct 2023 17:06:27 +0200
Date: Mon, 9 Oct 2023 17:06:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Adam Duskett <adam.duskett@amarulasolutions.com>
Message-ID: <20231009150627.GC14234@scaer>
References: <20231009143122.1775787-1-adam.duskett@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20231009143122.1775787-1-adam.duskett@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1696863990;
 bh=i5y3Zs3h6UlymsFQ0jHJ9Z62YuiGMU+VQ5ThIm2ltkE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=YD14U/m8c5gzNnDa3bpnQ9IBoom/aPeONmCJ7IB+1AU4BN+RgMw0Wh22ckBZEuwXv
 hyClIhohssgt9dvKQY0Vj9+MLc09E+CmWBLCOZJaeHeYbAUtZTF2UqKozakm9O777K
 tsIHP743tCILXtB1CmcAd6V747vI4zOPaZ8Ew/QZ+kJnFGy+6kDtmxRy2oUBrLQoGj
 978pg9v7WVARhqvDGk3x5f0maPpGp7h9MK42V3T6dZ1cz3YVix4gdEmst5kCoRWJYF
 px2kemOXRTADzBTGyGhAqHMXLwXHcpSmdmp9t8O1/HwBT8ZXe0iEPvTb+jWZWx4Fmq
 Kxj8M6GNvzK2g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=YD14U/m8
Subject: Re: [Buildroot] [PATCH 1/2] package/firewalld: bump version to 2.0.1
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

Adam, All,

On 2023-10-09 16:31 +0200, Adam Duskett spake thusly:
> Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>

Both patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/firewalld/firewalld.hash | 2 +-
>  package/firewalld/firewalld.mk   | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/firewalld/firewalld.hash b/package/firewalld/firewalld.hash
> index d8be3f7ba0..53bfed0347 100644
> --- a/package/firewalld/firewalld.hash
> +++ b/package/firewalld/firewalld.hash
> @@ -1,3 +1,3 @@
>  # Locally computed
> -sha256  3be5a3caa36d1026c5b72d3f61dd963dccd953791b04af03d9946b24bef8391e  firewalld-1.3.2.tar.gz
> +sha256  61022eec66fa7ea0561924dfe65d17bab5ec512b3559198a05048a32264612d1  firewalld-2.0.1.tar.gz
>  sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> diff --git a/package/firewalld/firewalld.mk b/package/firewalld/firewalld.mk
> index 13edba6d24..6b2813e54d 100644
> --- a/package/firewalld/firewalld.mk
> +++ b/package/firewalld/firewalld.mk
> @@ -4,7 +4,7 @@
>  #
>  ################################################################################
>  
> -FIREWALLD_VERSION = 1.3.2
> +FIREWALLD_VERSION = 2.0.1
>  FIREWALLD_SITE = $(call github,firewalld,firewalld,v$(FIREWALLD_VERSION))
>  FIREWALLD_LICENSE = GPL-2.0
>  FIREWALLD_LICENSE_FILES = COPYING
> -- 
> 2.41.0
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
