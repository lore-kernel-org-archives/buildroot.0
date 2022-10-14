Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1956C4332F
	for <buildroot@archiver.kernel.org>; Fri, 14 Oct 2022 20:08:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8A7AD60BFD;
	Fri, 14 Oct 2022 20:08:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A7AD60BFD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qkecbfFfZz_h; Fri, 14 Oct 2022 20:08:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AAD4460BE3;
	Fri, 14 Oct 2022 20:08:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AAD4460BE3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 18F151BF47A
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:08:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 01AA260BE3
 for <buildroot@lists.busybox.net>; Fri, 14 Oct 2022 20:08:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 01AA260BE3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IuV6hwmuGKN9 for <buildroot@lists.busybox.net>;
 Fri, 14 Oct 2022 20:08:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E780560BE2
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [212.27.42.2])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E780560BE2
 for <buildroot@buildroot.org>; Fri, 14 Oct 2022 20:08:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:20fb:14f0:36e1:8c])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id BF2522003CE;
 Fri, 14 Oct 2022 22:08:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 14 Oct 2022 22:08:48 +0200
Date: Fri, 14 Oct 2022 22:08:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Lang Daniel <d.lang@abatec.at>
Message-ID: <20221014200848.GF2503@scaer>
References: <VI1P190MB0493D844A699B7C2DACF6FFB9F259@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <VI1P190MB0493D844A699B7C2DACF6FFB9F259@VI1P190MB0493.EURP190.PROD.OUTLOOK.COM>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1665778130;
 bh=xGBUVO1k0vZS0ju1O6pjgBtbjTNjvggA72tKuaFQz4I=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=DdHCz2XeIF/Uuk2Jwl9zE5RoAcgawSdY2VMh9uXhrkpSjl5/QIEkP0nvPhnC2LxKQ
 d6nBRSX8C2nxNX4fUIYNbymZlW5m9axx2E4sschXVfthwfA5vGIO7xoI0Gq4+wN2Wk
 OsPvNeKdxXKLDFbNTzwFwjZ9pqdg51z61WyxE3/F+jyz/p8brGi9TqjHMUWeTyzRwH
 3fwiCyNMbHhgyQUqKX7SjTNu+xydWhujJy0PUvLXaVtv4VSNI8Q6porLH/PMP2Qjgf
 kpDuZysqVfYfg8UciurE4cuqp24y/+AORCPZdoaFIE/By2jjdl1W+fCx4EFzMZhvUU
 whq01ZjmLkHjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=DdHCz2Xe
Subject: Re: [Buildroot] [PATCH 2/2] package/iwd: no autoreconfigure
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
Cc: "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Daniel, All,

On 2022-10-13 15:03 +0000, Lang Daniel via buildroot spake thusly:
> configure.ac is no longer patched, autoreconfigure isn't needed.

I've reworded to reference ff0d53405157, when we dropped the
configure.ac patch.

> Signed-off-by: Daniel Lang <d.lang@abatec.at>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/iwd/iwd.mk | 2 --
>  1 file changed, 2 deletions(-)
> 
> diff --git a/package/iwd/iwd.mk b/package/iwd/iwd.mk
> index 8497fd1141..fe79704641 100644
> --- a/package/iwd/iwd.mk
> +++ b/package/iwd/iwd.mk
> @@ -12,8 +12,6 @@ IWD_LICENSE_FILES = COPYING
>  IWD_CPE_ID_VENDOR = intel
>  IWD_CPE_ID_PRODUCT = inet_wireless_daemon
>  IWD_SELINUX_MODULES = networkmanager
> -# We're patching configure.ac
> -IWD_AUTORECONF = YES
>  
>  IWD_CONF_OPTS = \
>  	--disable-manual-pages \
> -- 
> 2.25.1
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
