Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9B02C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 21:42:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4903F40977;
	Sun, 14 Aug 2022 21:42:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4903F40977
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id hCFG-zG86IYs; Sun, 14 Aug 2022 21:42:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2687540933;
	Sun, 14 Aug 2022 21:42:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2687540933
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 8AB2D1BF282
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:42:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 662F9605A4
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 21:42:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 662F9605A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jv6XwgpkHza5 for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 21:42:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5C0C86059B
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5C0C86059B
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 21:42:20 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 961266012C;
 Sun, 14 Aug 2022 23:42:15 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 23:42:15 +0200
Date: Sun, 14 Aug 2022 23:42:15 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814214215.GP2854108@scaer>
References: <20220812210147.178027-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220812210147.178027-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660513338;
 bh=o4ftyr+W4y6jsVj+zv4g/dd3BP/rn5WFtUPoc2OYjxs=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=e8P4kjTC43DRivYrvc4aB8Htsu9XMmbR8UnBnep/Amim4XjDj01cse49E8YrfnvSr
 ZOHAsfCq6IeOe9vn8Gmvtq4IS8yS8fXlUjYuQSssp3wz9RXStgVdYwCdPImSNFqt06
 YcovSyxgNdbjYRyqthFRvctf/sK4HNF6cGmhJXphsvyOD/+UEZ/JHzjkIxWGnbR7sF
 UPQS/q2G6eT3Ij09hSwGjJC+yyRphzG9qX1ImFCvrH2c3zW7+HrMneOlVTjoUxHrQa
 aHdkGYAo6pse3cQpwHfIk+4nKcXeeXZRk3Kk+86JN88c624i43gFYEkaPlRhbcYzpH
 ns+bbwPyEhTFA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=e8P4kjTC
Subject: Re: [Buildroot] [PATCH 1/1] package/ocrad: fix static build
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
Cc: Gilles Talis <gilles.talis@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-12 23:01 +0200, Fabrice Fontaine spake thusly:
> Fix the following static build failure raised since bump to version 0.28
> in commit 1b677db703dc0b976a707942bbc94ecd3f7b4b4b:
> 
> /home/buildroot/autobuild/run/instance-2/output-1/host/opt/ext-toolchain/bin/../lib/gcc/arm-buildroot-linux-uclibcgnueabi/9.3.0/../../../../arm-buildroot-linux-uclibcgnueabi/bin/ld: /home/buildroot/autobuild/run/instance-2/output-1/host/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/lib/libpng.a(png.o): in function `png_reset_crc':
> png.c:(.text+0x738): undefined reference to `crc32'

I've added a blurb how LIBS work, and applied to master, thanks.

Regards,
Yann E. MORIN.

> Fixes:
>  - http://autobuild.buildroot.org/results/97543d8df5c40818e05622490e4aad60b48934a6
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/ocrad/ocrad.mk | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/ocrad/ocrad.mk b/package/ocrad/ocrad.mk
> index 78638b770a..5a68427bfb 100644
> --- a/package/ocrad/ocrad.mk
> +++ b/package/ocrad/ocrad.mk
> @@ -10,12 +10,14 @@ OCRAD_SITE = $(BR2_GNU_MIRROR)/ocrad
>  OCRAD_LICENSE = GPL-2.0+
>  OCRAD_LICENSE_FILES = COPYING
>  OCRAD_INSTALL_STAGING = YES
> -OCRAD_DEPENDENCIES = libpng
> +OCRAD_DEPENDENCIES = host-pkgconf libpng
> +OCRAD_LIBS = `$(PKG_CONFIG_HOST_BINARY) --libs libpng`
>  
>  # This is not a true autotools package.
>  define OCRAD_CONFIGURE_CMDS
>  	cd $(@D) && \
> -	$(TARGET_MAKE_ENV) ./configure --prefix=/usr --sysconfdir=/etc $(TARGET_CONFIGURE_OPTS)
> +	$(TARGET_MAKE_ENV) ./configure --prefix=/usr --sysconfdir=/etc \
> +		LIBS="$(OCRAD_LIBS)" $(TARGET_CONFIGURE_OPTS)
>  endef
>  
>  define OCRAD_BUILD_CMDS
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
