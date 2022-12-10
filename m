Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3839CC4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 08:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AF53E4086C;
	Sat, 10 Dec 2022 08:45:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AF53E4086C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DIuFS23TvwY1; Sat, 10 Dec 2022 08:45:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9639440882;
	Sat, 10 Dec 2022 08:45:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9639440882
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 148211BF44A
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 08:45:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F123281464
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 08:45:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F123281464
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rORfmETTJyaI for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 08:45:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 070098144A
Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 070098144A
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 08:45:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [92.184.110.151])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp6-g21.free.fr (Postfix) with ESMTPSA id 5DED178034E;
 Sat, 10 Dec 2022 09:45:02 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 10 Dec 2022 09:45:01 +0100
Date: Sat, 10 Dec 2022 09:45:01 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20221210084501.GQ2855@scaer>
References: <20221208202610.5018-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20221208202610.5018-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1670661906;
 bh=3O/+LMMkEgB74oPJH3+UcdSLv9oD/eHE5TaZBBOiN9o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=cWaFkVBP6foZS6i46jCcB3NQw5xGXVtHUn8vxt7vRz5eaNcHtNx+VpAeYyByS/mam
 /AtI63B21l/ioA2ff/+TF2cu57gmg/HSUSO5bMEpLlcpk9iI1LjkSXWnAC1A9fuk+O
 m/GWDo5lTxpFrRgbxx9OGzHU+GSoLbys3VQ4afutQvvTRxDUL7nhbVaZQWRg4B3WIp
 0XiX5md7LUHyKrq5JjHp7twDjDPl4Z1JNKtamcRoY31+V0nng/E5z82zOWIzBBXHZ3
 syTpz89VMUoCpKkuh68jzgOZo0exQRMNuIzrRuCMlJsLqmrO2VHcbtCWL3swmAGF2N
 uBTvRllRXnm5w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=cWaFkVBP
Subject: Re: [Buildroot] [PATCH 1/1] package/libuwsc: fix wolfssl build
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
Cc: Jianhui Zhao <zhaojh329@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-12-08 21:26 +0100, Fabrice Fontaine spake thusly:
> libuwsc needs BR2_PACKAGE_WOLFSSL_ALL (which enables openssl compat
> layer) to avoid the following wolfssl build failure raised since the
> addition of the package in commit
> 120c04775d7ebe5a2cfc14848f5d11f3a333970b:
> 
> /home/br-user/work/instance-1/output-1/build/libuwsc-3.3.5/src/ssl.c:62:5: error: unknown type name 'SSL_CTX'
>    62 |     SSL_CTX *ctx;
>       |     ^~~~~~~
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/6c2a6ed6fca1f92aab299f6ed9cd900b20e8d512
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

I added a blurb that explains why we don't siply select _ALL.

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/libuwsc/libuwsc.mk | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/package/libuwsc/libuwsc.mk b/package/libuwsc/libuwsc.mk
> index cad351529d..051ea411fa 100644
> --- a/package/libuwsc/libuwsc.mk
> +++ b/package/libuwsc/libuwsc.mk
> @@ -18,7 +18,7 @@ LIBUWSC_CONF_OPTS += \
>  	-DUWSC_USE_MBEDTLS=OFF \
>  	-DUWSC_USE_OPENSSL=ON \
>  	-DUWSC_USE_WOLFSSL=OFF
> -else ifeq ($(BR2_PACKAGE_WOLFSSL),y)
> +else ifeq ($(BR2_PACKAGE_WOLFSSL_ALL),y)
>  LIBUWSC_DEPENDENCIES += wolfssl
>  LIBUWSC_CONF_OPTS += \
>  	-DUWSC_SSL_SUPPORT=ON \
> -- 
> 2.35.1
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
