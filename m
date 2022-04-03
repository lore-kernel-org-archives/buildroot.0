Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 029C7C433F5
	for <buildroot@archiver.kernel.org>; Sun,  3 Apr 2022 21:48:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6FF1B830B8;
	Sun,  3 Apr 2022 21:48:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DzV7GPKGvthp; Sun,  3 Apr 2022 21:48:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7C7D083096;
	Sun,  3 Apr 2022 21:48:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A5E591BF2CA
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 21:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9415B60E22
 for <buildroot@lists.busybox.net>; Sun,  3 Apr 2022 21:48:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BU_MsZwkHwjM for <buildroot@lists.busybox.net>;
 Sun,  3 Apr 2022 21:48:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 707D260D56
 for <buildroot@buildroot.org>; Sun,  3 Apr 2022 21:48:05 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:314c:79b0:cf44:9021])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 91CED13F838;
 Sun,  3 Apr 2022 23:48:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1649022482;
 bh=jhN4LYICarxf6exE0KSsEuUaD6234VRetpH9Zb1WJCo=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TV2VSLIPpRhOizUOhVI6FRIUqhI9aVCbE8V6dbNhWHd16WNiYxZUhqED+fn+ucu8y
 e5MBlFUDtcPV8rhrUZY45WqP/1zRhk9H3gEH2e1ewXbhAGq7rA7X/imIfnrh8NxnGI
 Xa+NDOjsaBrjHw7zbb7dPw6BWgUPLgdIJCv5Qe21k65BBPq7R91AQ3f/IHS1CtfD63
 Fd1u1jDBAjmOk/7yAyJfftwiCHADglQ/fSaaOnCoIlxwDAf41Lx0ai6YUgtutcEgnP
 7wa1ihlOQloz03TqouQ4uYD63Nb9uIlJdoNVArjzrphldahSkXOh7tq3T3VepFb1C1
 tft/jzRjQTatg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 03 Apr 2022 23:48:00 +0200
Date: Sun, 3 Apr 2022 23:48:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220403214800.GF2354230@scaer>
References: <20220403202202.1583075-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220403202202.1583075-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH v2,
 1/1] package/zlib-ng: fix build on powerpc
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

On 2022-04-03 22:22 +0200, Fabrice Fontaine spake thusly:
> Handle WITH_POWER8 to fix the following build failure with powerpc and
> libglib2 raised since bump to version 1.9.9-b1 in commit
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

Applied to master, thanks.

Regards,
Yann E. MORIN.

> ---
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Don't unconditionally disable power8
> 
>  package/zlib-ng/zlib-ng.mk | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/package/zlib-ng/zlib-ng.mk b/package/zlib-ng/zlib-ng.mk
> index fb497b8c11..938acd4181 100644
> --- a/package/zlib-ng/zlib-ng.mk
> +++ b/package/zlib-ng/zlib-ng.mk
> @@ -23,4 +23,10 @@ ifeq ($(BR2_arm),y)
>  ZLIB_NG_CONF_OPTS += -DWITH_ACLE=1 -DWITH_NEON=1
>  endif
>  
> +ifeq ($(BR2_powerpc_power8),y)
> +ZLIB_NG_CONF_OPTS += -DWITH_POWER8=ON
> +else
> +ZLIB_NG_CONF_OPTS += -DWITH_POWER8=OFF
> +endif
> +
>  $(eval $(cmake-package))
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
