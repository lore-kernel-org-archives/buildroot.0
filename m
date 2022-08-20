Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96F85C25B08
	for <buildroot@archiver.kernel.org>; Sat, 20 Aug 2022 21:01:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E067F60A99;
	Sat, 20 Aug 2022 21:01:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E067F60A99
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sqEyZd0UYpUj; Sat, 20 Aug 2022 21:01:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E87F9607BC;
	Sat, 20 Aug 2022 21:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E87F9607BC
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 049D71BF3D1
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 21:01:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0DEE8249E
 for <buildroot@lists.busybox.net>; Sat, 20 Aug 2022 21:01:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E0DEE8249E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 4TJz8DpZl-o4 for <buildroot@lists.busybox.net>;
 Sat, 20 Aug 2022 21:01:50 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9448D82470
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9448D82470
 for <buildroot@busybox.net>; Sat, 20 Aug 2022 21:01:50 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:18c4:2559:c4a2:6528])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1B03760132;
 Sat, 20 Aug 2022 23:01:44 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sat, 20 Aug 2022 23:01:43 +0200
Date: Sat, 20 Aug 2022 23:01:43 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: "Guillaume W. Bres" <guillaume.bressaix@gmail.com>
Message-ID: <20220820210143.GR2167049@scaer>
References: <20220816103710.1278-1-guillaume.bressaix@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220816103710.1278-1-guillaume.bressaix@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661029307;
 bh=qjCqjy/3bHat465NU4+jbrh+8ac2Ee0dxX6+pMqkbIU=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RYeI1O4CnImQ4Mb9M4+QrPjJPSgRDgIxiHqCWuHFaicoE9qyD/eE8xkQsfbf0xjkB
 rXNp/1m9iEcbtWo4n4dZwgtGRkSRKL5iyx5EmcQWlFEcxEwvKQobDuX53IDmU1feJu
 Jg4lE1cInxbbk/FBAeO0K4aJL5/MjOlQsHM2P9wUc4yZY0pzia0EFu7kzGYI+LTj6U
 Ie1Hs0d+MnS+FGR83T5iszP+H6p64DrSGt9WW5sKjUg8DQ8IJEf+2oJm9IfGVKXQJh
 dIx/V+GRHapKWAYn1i5fjTvkP9DGPJhyAodtPDlgfrbwelrfikWncHXGX9JGJB3F+L
 qLChGQgvzpuvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RYeI1O4C
Subject: Re: [Buildroot] [PATCH v1 1/1] package/pkg-meson.mk: handle
 possibly non existing compilers
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
Cc: buildroot@busybox.net, Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Guillaume, All,

On 2022-08-16 12:37 +0200, Guillaume W. Bres spake thusly:
> To avoid populating the cross-file with non existing compilers,
> we tie them to /bin/false
> 
> Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>

Applied to next, thanks.

Regards,
Yann E. MORIN.

> ---
>  package/pkg-meson.mk | 18 ++++++++++++++++--
>  1 file changed, 16 insertions(+), 2 deletions(-)
> 
> diff --git a/package/pkg-meson.mk b/package/pkg-meson.mk
> index 0632ab21cf..d675f7f733 100644
> --- a/package/pkg-meson.mk
> +++ b/package/pkg-meson.mk
> @@ -68,15 +68,29 @@ else
>  PKG_MESON_TARGET_CPU_FAMILY = $(ARCH)
>  endif
>  
> +# To avoid populating the cross-file with non existing compilers,
> +# we tie them to /bin/false
> +ifeq ($(BR2_INSTALL_LIBSTDCPP),y)
> +PKG_MESON_TARGET_CXX = $(TARGET_CXX)
> +else
> +PKG_MESON_TARGET_CXX = /bin/false
> +endif
> +
> +ifeq ($(BR2_TOOLCHAIN_HAS_FORTRAN),y)
> +PKG_MESON_TARGET_FC = $(TARGET_FC)
> +else
> +PKG_MESON_TARGET_FC = /bin/false
> +endif
> +
>  # Generates sed patterns for patching the cross-compilation.conf template,
>  # since Flags might contain commas the arguments are passed indirectly by
>  # variable name (stripped to deal with whitespaces).
>  # Arguments are variable containing cflags, cxxflags, ldflags, fcflags
>  define PKG_MESON_CROSSCONFIG_SED
>          -e "s%@TARGET_CC@%$(TARGET_CC)%g" \
> -        -e "s%@TARGET_CXX@%$(TARGET_CXX)%g" \
> +        -e "s%@TARGET_CXX@%$(PKG_MESON_TARGET_CXX)%g" \
>          -e "s%@TARGET_AR@%$(TARGET_AR)%g" \
> -        -e "s%@TARGET_FC@%$(TARGET_FC)%g" \
> +        -e "s%@TARGET_FC@%$(PKG_MESON_TARGET_FC)%g" \
>          -e "s%@TARGET_STRIP@%$(TARGET_STRIP)%g" \
>          -e "s%@TARGET_ARCH@%$(PKG_MESON_TARGET_CPU_FAMILY)%g" \
>          -e "s%@TARGET_CPU@%$(GCC_TARGET_CPU)%g" \
> -- 
> 2.20.1
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
