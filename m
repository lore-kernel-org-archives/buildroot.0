Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 259B7EB64DC
	for <buildroot@archiver.kernel.org>; Sun, 25 Jun 2023 13:02:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1438160B7C;
	Sun, 25 Jun 2023 13:02:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1438160B7C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rau50qYKcJwT; Sun, 25 Jun 2023 13:02:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 458B860BD3;
	Sun, 25 Jun 2023 13:02:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 458B860BD3
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 8D49B1BF870
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:02:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74267403AA
 for <buildroot@lists.busybox.net>; Sun, 25 Jun 2023 13:02:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74267403AA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FBSntz-epv3D for <buildroot@lists.busybox.net>;
 Sun, 25 Jun 2023 13:02:33 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D93D400BA
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3D93D400BA
 for <buildroot@buildroot.org>; Sun, 25 Jun 2023 13:02:33 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:36ab:e848:bc86:4439])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 2CCC0B0059B;
 Sun, 25 Jun 2023 15:02:27 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 25 Jun 2023 15:02:27 +0200
Date: Sun, 25 Jun 2023 15:02:27 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Kilian Zinnecker <kilian.zinnecker@mail.de>
Message-ID: <20230625130227.GL24952@scaer>
References: <5686076.DvuYhMxLoT@kilian-aisec>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5686076.DvuYhMxLoT@kilian-aisec>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1687698150;
 bh=PgxET0814E3zaL8TzXjpl8DydlKyviibb8flRYkOovE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=oOjindYLCWnKOi+t+6lmbNLIkKIFU0VM2B4Vgpy44Q9TK4pgPfPbLoch6Sd9QpXN4
 hHSKivt2msvWMxoARkAvGYHfw0HLvYyWahNUWe56AmPAfaV3bYqEKc+ybFoN3x9hdU
 FXe+mMK7yiLZGLf2gsUcHcq30KlqdNbY8UQ/59v6KvK6aTvwh36FxCzvBS80GbeGt+
 S8T4IggZW1wZglUB7jRCnx63tqbQofqc3lIy9gELxMc6mMPeqgXUWUUF6qCHaIFTgD
 xIWh6AeStebL6vlh69rBomtX2qONhPg01jpyIGzZ5xKUN69g0U8BnowNcRA0AUVyhT
 T2ezGObDz/0zA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=oOjindYL
Subject: Re: [Buildroot] Problem: Setting Uboot custom version does not
 apply defconfig
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

Kilian, All,

On 2023-06-25 14:33 +0200, Kilian Zinnecker via buildroot spake thusly:
> I am having issues using the custom uboot version feature: When setting a 
> custom uboot version value and a particular uboot defconfig, buildroot seems to 
> NOT apply the uboot defconfig properly, i.e. there is no .config in the uboot 
> build folder. This is the error I get (further below my settings):
> 
> >>> uboot 2023.07-rc4 Patching
> for p in  ; do if test -d $p ; then PATH=/home/zinnecker/buildroot-test/
> buildroot/output/host/bin:$PATH support/scripts/apply-patches.sh  /home/
> zinnecker/buildroot-test/buildroot/output/build/uboot-2023.07-rc4 $p \*.patch 
> || exit 1 ; els
> e PATH=/home/zinnecker/buildroot-test/buildroot/output/host/bin:$PATH support/
> scripts/apply-patches.sh  /home/zinnecker/buildroot-test/buildroot/output/
> build/uboot-2023.07-rc4 `dirname $p` `basename $p` || exit 1; fi done
>   HOSTCC  scripts/basic/fixdep
>   HOSTCC  scripts/kconfig/conf.o
>   YACC    scripts/kconfig/zconf.tab.c
>   LEX     scripts/kconfig/zconf.lex.c
>   HOSTCC  scripts/kconfig/zconf.tab.o
>   HOSTLD  scripts/kconfig/conf
> scripts/kconfig/conf  --syncconfig Kconfig
> ***
> *** Configuration file ".config" not found!
> ***
> *** Please run some configurator (e.g. "make oldconfig" or
> *** "make menuconfig" or "make xconfig").
> ***
> make[5]: *** [scripts/kconfig/Makefile:75: syncconfig] Error 1
> make[4]: *** [Makefile:576: syncconfig] Error 2
> make[3]: *** No rule to make target 'include/config/auto.conf', needed by 
> 'include/config/uboot.release'.  Stop.
> make[2]: *** [Makefile:558: __build_one_by_one] Error 2
> make[1]: *** [boot/uboot/uboot.mk:553: /home/zinnecker/buildroot-test/
> buildroot/output/build/uboot-2023.07-rc4/.stamp_dotconfig] Error 2
> make: *** [Makefile:82: _all] Error 2
> 
> 
> What I did: I want to use a fairly new uboot ("2023.07-rc4") because it 
> features a defconfig for a particular board ("rock5b-rk3588_defconfig"). I 
> therefore use the following settings in my buildroot board defconfig / .config:
> 
> BR2_TARGET_UBOOT=y
> BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
> BR2_TARGET_UBOOT_CUSTOM_VERSION=y
> BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07-rc4"
> BR2_TARGET_UBOOT_USE_DEFCONFIG=y
> BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"

Looks like it is working as expected here, with this defconfig:

    BR2_aarch64=y
    BR2_cortex_a76_a55=y
    BR2_TOOLCHAIN_EXTERNAL=y
    BR2_TARGET_UBOOT=y
    BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
    BR2_TARGET_UBOOT_CUSTOM_VERSION=y
    BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07-rc4"
    BR2_TARGET_UBOOT_BOARD_DEFCONFIG="rock5b-rk3588"
    BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
    BR2_TARGET_UBOOT_NEEDS_OPENSSL=y

Note that the build fails much later, because it can't find
rockchip-tpl.bin; see tools/binman/missing-blob-help for some hint on
how to fix that.

Regards,
Yann E. MORIN.

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
