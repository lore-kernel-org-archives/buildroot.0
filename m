Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0856C04A95
	for <buildroot@archiver.kernel.org>; Wed, 28 Sep 2022 20:55:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8690C41834;
	Wed, 28 Sep 2022 20:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8690C41834
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cV1sbvC3q3nk; Wed, 28 Sep 2022 20:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3791E416C8;
	Wed, 28 Sep 2022 20:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3791E416C8
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6F6771BF2F8
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 20:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 47C07416EB
 for <buildroot@lists.busybox.net>; Wed, 28 Sep 2022 20:55:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 47C07416EB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UFTJmv_fW0hC for <buildroot@lists.busybox.net>;
 Wed, 28 Sep 2022 20:55:37 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D275416C8
Received: from smtp2-g21.free.fr (smtp2-g21.free.fr [IPv6:2a01:e0c:1:1599::11])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 2D275416C8
 for <buildroot@buildroot.org>; Wed, 28 Sep 2022 20:55:37 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:5602:3008:73e:c44])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp2-g21.free.fr (Postfix) with ESMTPSA id 163DE2003FC;
 Wed, 28 Sep 2022 22:55:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 28 Sep 2022 22:55:27 +0200
Date: Wed, 28 Sep 2022 22:55:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Message-ID: <20220928205527.GH1419013@scaer>
References: <20220928202429.461673-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220928202429.461673-1-giulio.benetti@benettiengineering.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1664398533;
 bh=Q+FjBuIt//q6uGs0kN5eZ4wOPtvUDG9VP5bhzY/V9uw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=TIedlDoSrvo8mA45wnsC+/sA+zlITVsDRLs3h/Q/D3lYuwyPfnVb0AC2RJvfPRwvw
 +PC7pVEP04m/lbKihjpNL0y+t8cF+c3fiUvfz0fnKWLu6ZuAvguHBkY35DqFFGMq3W
 57VrnkN0q4A2bSjAFn7DnqGzdZs5ZglGKBl77pv8fcrxGji2L7BNbbeXC8GypJbLOp
 RthpdUuTtu4t0xKTRNHpADAWkhHKXSSdbRe014/PJT0Jjgdwiy4rlXyTOdjpnK3YaF
 IumgfBqxuMZD0VD6Shx5Bga43Wq2ut9KyJ31Zr55eUYzWou6Y5xZcdgVfZ37ZdNAwA
 7L4YzJc+iXeHg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=TIedlDoS
Subject: Re: [Buildroot] [PATCH] package/qt5: fix build failure due to
 libressl use
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Giulio, All,

On 2022-09-28 22:24 +0200, Giulio Benetti spake thusly:
> Qt5 only supports openssl, check [0] and [1]. So in qt5base.mk let's check
> if BR2_PACKAGE_LIBOPENSSL is enabled instead of BR2_PACKAGE_OPENSSL(that
> could be openssl or libressl) and for qt5enginio and qt5webkit let's select
> specifically BR2_PACKAGE_LIBOPENSSL instead of only BR2_PACKAGE_OPENSSL.
> This way we make sure that only openssl is selected and not libressl or
> other future openssl-like implementations.
> 
> Fixes:
> http://autobuild.buildroot.net/results/a956b48b782dbaa055d7146360465e2493a809d9/
> 
> [0]: https://doc.qt.io/qt-5/ssl.html#enabling-and-disabling-ssl-support
> [1]: https://bugreports.qt.io/browse/QTBUG-68374
> 
> Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
> ---
>  package/qt5/qt5base/qt5base.mk   | 4 ++--
>  package/qt5/qt5enginio/Config.in | 1 +
>  package/qt5/qt5webkit/Config.in  | 1 +
>  3 files changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> index a81892422c..efa0e16e9a 100644
> --- a/package/qt5/qt5base/qt5base.mk
> +++ b/package/qt5/qt5base/qt5base.mk
> @@ -229,8 +229,8 @@ else
>  QT5BASE_CONFIGURE_OPTS += -no-eglfs
>  endif
>  
> -QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_OPENSSL),-openssl,-no-openssl)
> -QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_OPENSSL),openssl)
> +QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_LIBOPENSSL),-openssl,-no-openssl)
> +QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_LIBOPENSSL),openssl)
>  
>  QT5BASE_CONFIGURE_OPTS += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),-fontconfig,-no-fontconfig)
>  QT5BASE_DEPENDENCIES   += $(if $(BR2_PACKAGE_QT5BASE_FONTCONFIG),fontconfig)
> diff --git a/package/qt5/qt5enginio/Config.in b/package/qt5/qt5enginio/Config.in
> index b738f0db7c..d421972392 100644
> --- a/package/qt5/qt5enginio/Config.in
> +++ b/package/qt5/qt5enginio/Config.in
> @@ -1,6 +1,7 @@
>  config BR2_PACKAGE_QT5ENGINIO
>  	bool "qt5enginio"
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL # Only openssl is supported by qt5

BR2_PACKAGE_LIBOPENSSL is part of a choice, so you can't select it.

However, you can achieve the same with:
    select BR2_PACKAGE_OPENSSL
    select BR2_PACKAGE_OPENSSL_FORCE_LIBOPENSSL

By the way, we have a single package, gitlab-runner, that selects
BR2_PACKAGE_LIBOPENSSL, so this should be fixed.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_QT5BASE_GUI
>  	select BR2_PACKAGE_QT5BASE_NETWORK
>  	help
> diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
> index 26c3897d1d..035e8b19b8 100644
> --- a/package/qt5/qt5webkit/Config.in
> +++ b/package/qt5/qt5webkit/Config.in
> @@ -16,6 +16,7 @@ config BR2_PACKAGE_QT5WEBKIT
>  	select BR2_PACKAGE_LEVELDB
>  	select BR2_PACKAGE_LIBPNG
>  	select BR2_PACKAGE_OPENSSL
> +	select BR2_PACKAGE_LIBOPENSSL # Only openssl is supported by qt5
>  	select BR2_PACKAGE_QT5BASE_ICU
>  	select BR2_PACKAGE_QT5BASE_GUI
>  	select BR2_PACKAGE_QT5BASE_WIDGETS
> -- 
> 2.34.1
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
