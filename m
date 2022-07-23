Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3BDCC43334
	for <buildroot@archiver.kernel.org>; Sat, 23 Jul 2022 16:19:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7D75C84B9C;
	Sat, 23 Jul 2022 16:19:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7D75C84B9C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id VPmMAm2k07X6; Sat, 23 Jul 2022 16:19:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AF778493E;
	Sat, 23 Jul 2022 16:19:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AF778493E
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F36451BF271
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:19:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DBF6A8490B
 for <buildroot@lists.busybox.net>; Sat, 23 Jul 2022 16:19:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DBF6A8490B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bTFpSdL3QR3r for <buildroot@lists.busybox.net>;
 Sat, 23 Jul 2022 16:19:53 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 89D4C84974
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 89D4C84974
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 16:19:53 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [86.206.242.79])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 76A7D78050A;
 Sat, 23 Jul 2022 18:19:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 23 Jul 2022 18:19:48 +0200
Date: Sat, 23 Jul 2022 18:19:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Heiko Thiery <heiko.thiery@gmail.com>
Message-ID: <20220723161948.GE2641@scaer>
References: <20220723121538.14409-1-heiko.thiery@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220723121538.14409-1-heiko.thiery@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1658593190;
 bh=Cg8g2/E1N8is7FoZpek+GAQQBHvsV5bWgE7PSQTWh64=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=JxjA8+CLroOu7di/SE5F2YoNObT2BpFUXWVF7gJOZ2WU3P6NixBMsN5hc3RtkJ6K/
 dPiYNpzSCWafEsMhdtn6mql3L9lEwI3JtbqGsOf2eN0IfeLFxkGROiB1gMlgcU8Giy
 L7l/Dc9dmPBh+BunOVLE/Ipo2QtA86ibyHah3mNuo+0E7uuAnhEe9b6bNwyANr/1vo
 /zSs4UQC1kVpgS7RIbWtjjfGoo/E1cyjheAoXZ6Tw3OTJ6JCWXZC8CNzC5XE3Qq6SJ
 vKvhLjthTWUbR6MOmZbP/cQbogg5oUhQ/U6SGCGu//n5mWLvqUZXPX/AiGVJPwKEV5
 CkmZbUoskmicw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=JxjA8+CL
Subject: Re: [Buildroot] [PATCH] package/nettle: switch _SITE to ftp.gnu.org
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

Heiko, All,

On 2022-07-23 14:15 +0200, Heiko Thiery spake thusly:
> The former _SITE is not longer accessible with authentication.

As suggested by Arnout, I also changes the homepage, to point to the FSF
directory:
    https://directory.fsf.org/wiki/Nettle

> Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/nettle/nettle.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/nettle/nettle.mk b/package/nettle/nettle.mk
> index c3d5fcec64..05b8b0bea5 100644
> --- a/package/nettle/nettle.mk
> +++ b/package/nettle/nettle.mk
> @@ -5,7 +5,7 @@
>  ################################################################################
>  
>  NETTLE_VERSION = 3.8
> -NETTLE_SITE = http://www.lysator.liu.se/~nisse/archive
> +NETTLE_SITE = https://ftp.gnu.org/gnu/nettle
>  NETTLE_DEPENDENCIES = gmp
>  NETTLE_INSTALL_STAGING = YES
>  NETTLE_LICENSE = Dual GPL-2.0+/LGPL-3.0+
> -- 
> 2.20.1
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
