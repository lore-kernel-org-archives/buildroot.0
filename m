Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 854ADC433EF
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 19:59:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FF1F60EB6;
	Sun,  3 Apr 2022 19:59:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NHI2_OXQMiWK; Sun,  3 Apr 2022 19:59:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 533F760E92;
	Sun,  3 Apr 2022 19:59:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7D3381BF20B
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:59:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 744AF60E92
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 19:59:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jQ7tCsvirjMJ for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 19:59:10 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [IPv6:2a01:e0c:1:1599::12])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 516B960E08
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 19:59:10 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:314c:79b0:cf44:9021])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 5EE0513F8A7;
 Sun,  3 Apr 2022 21:59:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649015947;
 bh=pMwUa4Yr2KcVcAu9mu8jsH0jr/PjqvPfe/Tha/rTS/o=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=khsu4Js+dBMa3cyc7qXMv2js67i/bu6VhwsvUaT/Ue0LQloMqBujpFIH2+Yp+2Oq8
 ZWnK9nd770alElu8f1ZUwLg3RF9D14GutS3UFmtdhDuXSumSNPI5G8wbfoBBKxI0HL
 lM1A6ioK2RVOY333OLsZVtxP46/javF9fyqVWo9eoyKFIKcN9StcuKmUkpQtxkyB18
 f7m/Ylgb7LZQrFQqv8+Gwl1XFJKsJuthfyr4BhY02tidGP70EnCUXekxWQppQqw+KE
 oee4jrGyHaD7/dtj3glSnkjgZDtcUa9AiGYBny1gh10ku/iABWpyK9wXAP8Z1GxpDn
 bKvQfGq7Y1XAw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 21:59:05 +0200
Date: Sun, 3 Apr 2022 21:59:05 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220403195905.GA2354230@scaer>
References: <20220403191103.1019544-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403191103.1019544-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/zlib-ng: fix build on powerpc
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

On 2022-04-03 21:11 +0200, Fabrice Fontaine spake thusly:
> Disable POWER8 optimisations to fix the following build failure with
> powerpc and libglib2 raised since bump to version 1.9.9-b1 in commit
> 1f7b12a0b4572d7e763c431a63c22cfb912b8b14 and
> https://github.com/zlib-ng/zlib-ng/commit/b81f4ee96dcbdf1db34b00727b6f1829a2ba1edb:
> 
> /home/autobuild/autobuild/instance-9/output-1/host/lib/gcc/powerpc-buildroot-linux-musl/11.2.0/../../../../powerpc-buildroot-linux-musl/bin/ld: /home/autobuild/autobuild/instance-9/output-1/host/powerpc-buildroot-linux-musl/sysroot/usr/lib/libz.a(adler32_power8.c.o): in function `adler32_power8':
> /home/autobuild/autobuild/instance-9/output-1/build/zlib-ng-2.0.6/arch/power/adler32_power8.c:106: undefined reference to `vec_sumsu'
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/f864a0e2307e25342b45c90a5b4fb57a0f5c1c93
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/zlib-ng/zlib-ng.mk | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
> index fb497b8c11..09edfe1faf 100644
> --- a/package/zlib-ng/zlib-ng.mk
> +++ b/package/zlib-ng/zlib-ng.mk
> @@ -15,6 +15,7 @@ ZLIB_NG_PROVIDES = zlib
>  ZLIB_NG_CONF_OPTS += \
>  	-DWITH_GZFILEOP=1 \
>  	-DWITH_OPTIM=1 \
> +	-DWITH_POWER8=OFF \

Why can't that be conditional on BR2_powerpc_power8 ?

Regards,
Yann E. MORIN.

>  	-DZLIB_COMPAT=1 \
>  	-DZLIB_ENABLE_TESTS=OFF
>  
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
