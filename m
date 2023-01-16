Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47AFEC54EBE
	for <buildroot@archiver.kernel.org>; Mon, 16 Jan 2023 20:20:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3024813BA;
	Mon, 16 Jan 2023 20:20:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E3024813BA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PT-tkX0oF_iQ; Mon, 16 Jan 2023 20:20:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E405813BF;
	Mon, 16 Jan 2023 20:20:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2E405813BF
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2DAC41BF3C6
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:19:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13F924004E
 for <buildroot@lists.busybox.net>; Mon, 16 Jan 2023 20:19:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 13F924004E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GWhstJ2QfR6n for <buildroot@lists.busybox.net>;
 Mon, 16 Jan 2023 20:19:58 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C6B544000E
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C6B544000E
 for <buildroot@buildroot.org>; Mon, 16 Jan 2023 20:19:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown [171.22.1.1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id A1F405FFC4;
 Mon, 16 Jan 2023 21:19:52 +0100 (CET)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 16 Jan 2023 21:19:52 +0100
Date: Mon, 16 Jan 2023 21:19:52 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Message-ID: <20230116201952.GB2770@scaer>
References: <20230116180434.3090717-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230116180434.3090717-1-dario.binacchi@amarulasolutions.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1673900395;
 bh=Qny9nGZXICorOrNsEhvogU1+Mma21hgM9hcRKTgsbEg=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=FpahzxakpmXn0COx/vrwdfPSFimwHnNFLRPxk/0gusxXMMwurxf6JwalwCcMg7+uj
 1r3tssgbN9VDm1HdIgYuE240ygYB3OO/wQVDae++HAoRjVsGrqSl/GrvpHsrBvlugs
 /iJw2gwi65xZApqa47Oy3s66SwIOKnna3EUghuzoB7ZMMkFIVG04mV1I7AIq0TdBp5
 GVmn2TV8pTwCJvO1LyCQA8TMQPyt8MP8P1555phXdvg9bVitDFPqdY070yq3BfBgf3
 h5SlszwWmawz6Jp+4is6jkDYTerH6GuVNifDnY8dmUjfVY6P3WW5LZd+pYBP2gRydG
 /zVF8HHzb8j5w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Fpahzxak
Subject: Re: [Buildroot] [RESEND PATCH 1/1] package/sscep: requires des
 support in openssl
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

Dario, All,

On 2023-01-16 19:04 +0100, Dario Binacchi spake thusly:
> Enable des in openssl to fix the following build failure raised
> since the addition of the package in commit
> 72fa60dc102679f51b228336ec38f5af78ff7646:
> 
> src/sscep.c: In function 'get_cipher_alg':
> src/sscep.c:119:32: warning: implicit declaration of function 'EVP_des_ede3_cbc'; did you mean 'NID_des_ede3_cbc'? [-Wimplicit-function-declaration]
>   119 |                         return EVP_des_ede3_cbc();
>       |                                ^~~~~~~~~~~~~~~~
>       |                                NID_des_ede3_cbc
> 
> Fixes:
>  - http://autobuild.buildroot.net/results/34bd76e8e5e7df0db31918d610a0dadf531f369d
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/sscep/Config.in | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/sscep/Config.in b/package/sscep/Config.in
> index 2e5e29f7c8f8..549c65274b45 100644
> --- a/package/sscep/Config.in
> +++ b/package/sscep/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_SSCEP
>  	bool "sscep"
>  	select BR2_PACKAGE_LIBOPENSSL_ENABLE_BLOWFISH if BR2_PACKAGE_LIBOPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL_ENABLE_DES if BR2_PACKAGE_LIBOPENSSL
>  	select BR2_PACKAGE_OPENSSL
>  	help
>  	  SSCEP is a client-only implementation of the SCEP
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
