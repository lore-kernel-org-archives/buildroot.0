Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E276C433F5
	for <buildroot@archiver.kernel.org>; Tue,  5 Apr 2022 21:20:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4189C60BA6;
	Tue,  5 Apr 2022 21:20:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vHtgrC4F5krR; Tue,  5 Apr 2022 21:20:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 269CC60D5D;
	Tue,  5 Apr 2022 21:20:27 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E5C1A1BF3A3
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:20:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D393E60E70
 for <buildroot@lists.busybox.net>; Tue,  5 Apr 2022 21:20:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZU33JzK9OJyS for <buildroot@lists.busybox.net>;
 Tue,  5 Apr 2022 21:20:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87C9660AB5
 for <buildroot@buildroot.org>; Tue,  5 Apr 2022 21:20:23 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:b44e:a19f:2a4d:fe1])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id F1BF119F4F3;
 Tue,  5 Apr 2022 23:20:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649193622;
 bh=LWYJ0O5rwUY4BLRTcHXTUU0Z74SUBOBoKCb3rIaKsYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=rxKhyRIs8e6hUHzZ4zvY0Eh2+ysVPRlKrJEVLRIIk5gk+WMjiv8hEu66MauYwG8mW
 /1xadugfUQlVVieDQDdUfjQ/q2jNNjpL4TDb6CvVXOxMpS6xt6OIketdkSpnHDCyi+
 DKnpn/83MdeKzim95G3lDnNYcsLT6HP9oKl3gZWU8FY59kBc4Reap7T8M1rvNoK1TJ
 KPrWq7MOC4U/15C6KuesovvPVRIrnFj4zVC7ohfaWTCUHUy6Nmzm16iM38yBcITbmr
 q7Hif0STYSR59vM3XkrYAFAIGRxveVtj0WQHwSnQB6FCbprByOPDB52d2iwJ5lRcIV
 zcgtVoz6d0Rgw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Tue, 05 Apr 2022 23:20:19 +0200
Date: Tue, 5 Apr 2022 23:20:19 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Peter Seiderer <ps.report@gmx.net>
Message-ID: <20220405212019.GK2354230@scaer>
References: <20220405204254.11147-1-ps.report@gmx.net>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220405204254.11147-1-ps.report@gmx.net>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v1] package/spidev_test: fix version
 determination (SPI_TX_OCTAL support needs linux headers >= 5.8)
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

Peter, All,

On 2022-04-05 22:42 +0200, Peter Seiderer spake thusly:
> Fixes:
> 
>   - http://autobuild.buildroot.net/results/a5c008aaff40f4851ffa36439c7340b6243a4842
> 
>   .../build/spidev_test-5.8/spidev_test.c:132:13: error: 'SPI_TX_OCTAL' undeclared (first use in this function); did you mean 'SPI_TX_DUAL'?
>     132 |  if (mode & SPI_TX_OCTAL)
>         |             ^~~~~~~~~~~~
>         |             SPI_TX_DUAL
> 
> Signed-off-by: Peter Seiderer <ps.report@gmx.net>

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/spidev_test/Config.in      | 2 +-
>  package/spidev_test/spidev_test.mk | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/spidev_test/Config.in b/package/spidev_test/Config.in
> index 81386adf7a..abfa885b73 100644
> --- a/package/spidev_test/Config.in
> +++ b/package/spidev_test/Config.in
> @@ -9,7 +9,7 @@ config BR2_PACKAGE_SPIDEV_TEST
>  	  proper operation of 'spidev_test'.
>  
>  	  The version used is based on your toolchain headers version,
> -	  if it's older than 3.15 then 3.0 is used, up to headers 4.20
> +	  if it's older than 3.15 then 3.0 is used, up to headers 5.7
>  	  version 4.10 is used and otherwise version 5.8.
>  	  This means you won't have quad-pumped SPI support if your
>  	  toolchain is too old.
> diff --git a/package/spidev_test/spidev_test.mk b/package/spidev_test/spidev_test.mk
> index 6c5a9495a4..bd138b0142 100644
> --- a/package/spidev_test/spidev_test.mk
> +++ b/package/spidev_test/spidev_test.mk
> @@ -10,7 +10,7 @@
>  # If you need quad-pumped spi support you need to upgrade your toolchain.
>  # Note that the location of spidev_test.c changes from v4.5 onwards.
>  
> -ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_0),y)
> +ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_8),y)
>  SPIDEV_TEST_VERSION = 5.8
>  SPIDEV_TEST_PATH = tools/spi
>  else ifeq ($(BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_15),y)
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
