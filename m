Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67711C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 17:40:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 140CC81516;
	Sat,  8 Jan 2022 17:40:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NerGs7NSJq4J; Sat,  8 Jan 2022 17:40:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 57A88814A0;
	Sat,  8 Jan 2022 17:40:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EFE5E1BF2C6
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:40:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECC20408CE
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 17:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NL82IJlRmVZZ for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 17:40:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A3E7F408CD
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 17:40:44 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4919:b1be:c8bf:308d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id E146513F879;
 Sat,  8 Jan 2022 18:40:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641663642;
 bh=uKzXLc+42fi9fOk8msScznoGUd7yMbziyD+KSEXmTME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=CuyBrriTOp8R18xmNLnxeuia0q3msJL6V39SoPQXAAgK2X13tnqoKTmGChxNBDvIw
 EoV4gOdnon/IeQJ8wV/J+LleHxp+ks+zDN/vNKFyofL3GtGdcQtr7EQzj/nlP6QF/C
 /cvN6PMbDR3wmX3xyDsoRchYDcL2d2z0yTBouqiusDummSXnPq3B/WPY93UFF8pFvQ
 3giF9Bl8PCGrbs00TEfTiNyqikDVWucKAa7TMagmN69InixLVXUZNwS1cBvkgXB3tK
 Z3ox6GzxVReSTF1WebF6XZDHSWTTJdYgC1v5Kc/QJcPRI6IHNkyXfP2QN79QNEv9yN
 buYUD54ZhwpGA==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 08 Jan 2022 18:40:37 +0100
Date: Sat, 8 Jan 2022 18:40:37 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220108174037.GB1881783@scaer>
References: <20220108165005.2737902-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220108165005.2737902-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/3] package/libpri: add Linux in comment
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

On 2022-01-08 17:50 +0100, Fabrice Fontaine spake thusly:
> Add "Linux" before kernel in comment to be consistent with other
> packages and manual
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Series of 3 patches applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libpri/Config.in | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libpri/Config.in b/package/libpri/Config.in
> index de2d96fcc4..0684d2ac83 100644
> --- a/package/libpri/Config.in
> +++ b/package/libpri/Config.in
> @@ -12,7 +12,7 @@ config BR2_PACKAGE_LIBPRI
>  
>  	  http://www.asterisk.org/downloads/libpri
>  
> -comment "libpri needs a kernel to be built"
> +comment "libpri needs a Linux kernel to be built"
>  	depends on BR2_USE_MMU
>  	depends on !BR2_LINUX_KERNEL
>  
> -- 
> 2.34.1
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
