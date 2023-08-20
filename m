Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A327EE4993
	for <buildroot@archiver.kernel.org>; Sun, 20 Aug 2023 13:35:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A16D8416D5;
	Sun, 20 Aug 2023 13:35:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A16D8416D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hd6uD5WBvgZE; Sun, 20 Aug 2023 13:35:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 968F940942;
	Sun, 20 Aug 2023 13:35:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 968F940942
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B1AB31BF46D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 13:35:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 89AC84093D
 for <buildroot@lists.busybox.net>; Sun, 20 Aug 2023 13:35:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89AC84093D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id u4V-8Tt6_gNW for <buildroot@lists.busybox.net>;
 Sun, 20 Aug 2023 13:35:40 +0000 (UTC)
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 04F1F40936
 for <buildroot@buildroot.org>; Sun, 20 Aug 2023 13:35:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04F1F40936
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:73e4:5f06:f514:c64d])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id A2D1819F5B4;
 Sun, 20 Aug 2023 15:35:32 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 20 Aug 2023 15:35:31 +0200
Date: Sun, 20 Aug 2023 15:35:31 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Bartosz Bilas <b.bilas@grinn-global.com>
Message-ID: <20230820133531.GJ1778688@scaer>
References: <20230818063521.6191-1-b.bilas@grinn-global.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230818063521.6191-1-b.bilas@grinn-global.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1692538536;
 bh=4irdQAAyXAA0CzQgcdDyNBdPq7z3viUwFLysL9quhnc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=VX93rRaTWOuJ0kjnllW0O6o5IOdzbAjD7UNC9G/OzWHcOrIpKXK287oeNXXdg/L74
 JyYartG9VHdJlInWtFFnFDZM4uyVQYkTJMcUdKwOE7VuUciOOCMDFOthT31dnGaaNi
 /U6eoQ2N4zNCWkjWPtGbF3bZPI7FC+0I69nA7V6DiuQwf6jQznTwq9Rb7t9B7xlG4U
 K8YPuYOZB9Mk1MncbKtltargDrM0QE6lRJss9+5tbyBtgpwa/RbcW34D4w30f5wxSe
 F7EOGBLVNR3fIKFgXtG5AcpEoiIbS6SgbIpn399jKIZSoEXf6P3B5Rzsm7TiLzYBbm
 JyXvu1YflXWag==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=VX93rRaT
Subject: Re: [Buildroot] [PATCH] package/host-gdb: disable source-highlight
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
Cc: thomas.petazzoni@bootlin.com, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bartosz, All,

On 2023-08-18 08:35 +0200, Bartosz Bilas spake thusly:
> This is the follow-up commit to the 4de60e4 which disables
> sourcehighlight dependency for the target GDB package.
> Do the same for the host variant to be sure that this
> won't be picked up from the host system.
> 
> Signed-off-by: Bartosz Bilas <b.bilas@grinn-global.com>
> ---
>  package/gdb/gdb.mk | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
> index cee7b37bcd..d9bfb39a41 100644
> --- a/package/gdb/gdb.mk
> +++ b/package/gdb/gdb.mk
> @@ -255,7 +255,8 @@ HOST_GDB_CONF_OPTS = \
>  	--with-system-zlib \
>  	--with-curses \
>  	--without-mpfr \
> -	$(GDB_DISABLE_BINUTILS_CONF_OPTS)
> +	$(GDB_DISABLE_BINUTILS_CONF_OPTS) \
> +	--disable-source-highlight

We like it better (but do not have clear rules bouat it) when the
unconditional options are passed first, and conditional ones last.

So I've inverted the order, and applied to master, thanks.

Regards,
Yann E. MORIN.

>  ifeq ($(BR2_PACKAGE_HOST_GDB_TUI),y)
>  HOST_GDB_CONF_OPTS += --enable-tui
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
