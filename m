Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB1EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 04AFF60E82;
	Sun,  3 Apr 2022 19:19:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yrT2pJRsUr4d; Sun,  3 Apr 2022 19:19:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 28A0460E90;
	Sun,  3 Apr 2022 19:19:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id BFC121BF36B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:19:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A91F04016D
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:19:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gT-CT8wYibom for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:19:25 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp2.osuosl.org (Postfix) with ESMTPS id C66BA40137
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:19:25 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:314c:79b0:cf44:9021])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id F165F13F879;
 Sun,  3 Apr 2022 21:19:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649013562;
 bh=v8a4DzB168AsFGJIyU+PuPUg8XsXyqwosxY3SUTglg8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=E/gFLZhMJfvJXvu6An4Myuapcyck/82z0cxOljXUFqOTwtCeRg5EGzsF2pl0Wdo2s
 rTaCl4MaF6mPjOd/5uvzYtUNs6tGytclxSYyIMOh0txwI069izT7Dpm8/kC71+d71B
 rlYDKT3po/rY5vlDfT2H2xqDVaUJ94fN3esYmaPcP3nyzGcfSWUi7giSwUwiX4LImY
 5/ayMXAfNmCTm2ZEPqFIXYzvXXbejapPspIhFP0KIzG7AW4hfOr59Ugn7XwyKDR1Us
 JVnh84uaoTJqXyHEiLYFQq7DfUvnGAOvBhOvTaWqMl/fBWDRE+T3xtMXpNAygEj8po
 8oyJvXMYwJ4dQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 21:19:19 +0200
Date: Sun, 3 Apr 2022 21:19:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Stefan Agner <stefan@agner.ch>
Message-ID: <20220403191919.GK1811301@scaer>
References: <e5af121ce29e88fcca3183ebf5d0e8d4798241fa.1648716628.git.stefan@agner.ch>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <e5af121ce29e88fcca3183ebf5d0e8d4798241fa.1648716628.git.stefan@agner.ch>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH] package/openocd: Allow to build BCM2835 on
 aarch64
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

Stefan, All,

On 2022-03-31 10:53 +0200, Stefan Agner spake thusly:
> Allow to build the BCM2835 bitbang interface on aarch64.
> 
> Signed-off-by: Stefan Agner <stefan@agner.ch>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/openocd/Config.in | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/package/openocd/Config.in b/package/openocd/Config.in
> index b14f940b27..cef109b511 100644
> --- a/package/openocd/Config.in
> +++ b/package/openocd/Config.in
> @@ -190,13 +190,17 @@ config BR2_PACKAGE_OPENOCD_AT91RM
>  	help
>  	  Enable building support for AT91RM9200 based SBCs
>  
> +endif # BR2_arm
> +
> +if BR2_arm || BR2_aarch64
> +
>  config BR2_PACKAGE_OPENOCD_BCM2835
>  	bool "bitbanging on BCM2835"
>  	help
>  	  Enable building support for bitbanging on BCM2835
>  	  (as found in Raspberry Pi)
>  
> -endif # BR2_arm
> +endif # BR2_arm || BR2_aarch64
>  
>  config BR2_PACKAGE_OPENOCD_GW16012
>  	bool "Gateworks GW16012 JTAG Programmer"
> -- 
> 2.35.1
> 

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
