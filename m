Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6EAECAAA3
	for <buildroot@archiver.kernel.org>; Fri, 26 Aug 2022 20:49:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 25BF960AAA;
	Fri, 26 Aug 2022 20:49:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 25BF960AAA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jxSkLjQ9666V; Fri, 26 Aug 2022 20:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1713E607F6;
	Fri, 26 Aug 2022 20:49:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1713E607F6
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6245C1BF2A5
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:48:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3C757408C3
 for <buildroot@lists.busybox.net>; Fri, 26 Aug 2022 20:48:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C757408C3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DDVEXJjYeDMc for <buildroot@lists.busybox.net>;
 Fri, 26 Aug 2022 20:48:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 851E140247
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 851E140247
 for <buildroot@buildroot.org>; Fri, 26 Aug 2022 20:48:54 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:1c2f:c99e:ae80:bcc0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 6C19E19F58A;
 Fri, 26 Aug 2022 22:48:48 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 26 Aug 2022 22:48:48 +0200
Date: Fri, 26 Aug 2022 22:48:48 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: TIAN Yuanhao <tianyuanhao3@163.com>
Message-ID: <20220826204848.GD37358@scaer>
References: <20220826155934.12677-1-tianyuanhao3@163.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220826155934.12677-1-tianyuanhao3@163.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1661546931;
 bh=thFddsMdd9eE2YAkYq4Z7fXynnQSJ+bH4knJeKrft/0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=KfRmPdghKb+SU6eqk94B1D7yTbF5BhyxRHy108Dwp8bFK1dsKZxFhZCEpeh8B4OT6
 hGvlBhYCZj3Ks+GJqQtsJQVoe/B9FKeN5Df24M39f1GmleI1kc0vQq15rfcmdV5VpU
 q9ZPCL02zYSDTfOBIJBzNJ3dsmcsJCp3jS9wFDXOzrAW7DNPvvCk/fcl9MUgpl+QwK
 w3QMc7kTzYLcJi+Wcu1QmlL7UtgmQvY1HVv5MkB+vpoMXAqh8KkkmUodvuSI7QqEIo
 j0hwmeTBPTALqjbf0anYCumjgfhY5jXhBN6miorbTl0v/zcflKalEuIM1DefpsQN8R
 Vaj+b051JEsXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=KfRmPdgh
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: needs
 host-libxslt
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
Cc: James Hilliard <james.hilliard1@gmail.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Yuanhao, All,

On 2022-08-26 08:59 -0700, TIAN Yuanhao spake thusly:
> Besides, order depends alphabetically.
> 
> Fixes:
> output/build/network-manager-1.36.4/meson.build:89:0: ERROR: Program 'xsltproc' not found or not executable
> 
> See:
> http://cgit.openembedded.org/meta-openembedded/tree/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.36.2.bb?h=kirkstone#n13
> 
> Cc: James Hilliard <james.hilliard1@gmail.com>
> Signed-off-by: TIAN Yuanhao <tianyuanhao3@163.com>

Applied to next (as this is with the meson build system), thanks.

It is however a bit sad that we have to unconditionally need it, as it
should only be needed, as far as I can see, for goi or manpages.

Regards,
Yann E. MORIN.

> ---
>  package/network-manager/network-manager.mk | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/package/network-manager/network-manager.mk b/package/network-manager/network-manager.mk
> index d782370082..391baaafde 100644
> --- a/package/network-manager/network-manager.mk
> +++ b/package/network-manager/network-manager.mk
> @@ -9,8 +9,8 @@ NETWORK_MANAGER_VERSION = $(NETWORK_MANAGER_VERSION_MAJOR).4
>  NETWORK_MANAGER_SOURCE = NetworkManager-$(NETWORK_MANAGER_VERSION).tar.xz
>  NETWORK_MANAGER_SITE = https://download.gnome.org/sources/NetworkManager/$(NETWORK_MANAGER_VERSION_MAJOR)
>  NETWORK_MANAGER_INSTALL_STAGING = YES
> -NETWORK_MANAGER_DEPENDENCIES = host-pkgconf dbus udev gnutls libglib2 \
> -	host-intltool libndp util-linux
> +NETWORK_MANAGER_DEPENDENCIES = host-intltool host-libxslt host-pkgconf \
> +	dbus gnutls libglib2 libndp udev util-linux
>  NETWORK_MANAGER_LICENSE = GPL-2.0+ (app), LGPL-2.1+ (libnm)
>  NETWORK_MANAGER_LICENSE_FILES = COPYING COPYING.LGPL CONTRIBUTING.md
>  NETWORK_MANAGER_CPE_ID_VENDOR = gnome
> -- 
> 2.25.1
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
