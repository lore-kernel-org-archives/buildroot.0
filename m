Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6732EC00140
	for <buildroot@archiver.kernel.org>; Mon, 15 Aug 2022 09:42:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09B0C408D0;
	Mon, 15 Aug 2022 09:42:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 09B0C408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iZasCtN1EUoQ; Mon, 15 Aug 2022 09:42:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1A40740146;
	Mon, 15 Aug 2022 09:42:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1A40740146
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id F383B1BF3CB
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C90C1409D0
 for <buildroot@lists.busybox.net>; Mon, 15 Aug 2022 09:42:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C90C1409D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WCJfXAyROec7 for <buildroot@lists.busybox.net>;
 Mon, 15 Aug 2022 09:42:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89E25409BC
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89E25409BC
 for <buildroot@buildroot.org>; Mon, 15 Aug 2022 09:42:28 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:c91d:14e3:a117:34c4])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 78C485FFB7;
 Mon, 15 Aug 2022 11:42:23 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 15 Aug 2022 11:42:23 +0200
Date: Mon, 15 Aug 2022 11:42:23 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220815094223.GS2854108@scaer>
References: <20220814182734.2878423-1-fontaine.fabrice@gmail.com>
 <20220814182734.2878423-2-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814182734.2878423-2-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660556546;
 bh=KugkWUzRO4GUdRC7y6SUZHYKcD9+exw6MTxmKi9BvIA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=RTDbO6jCeCQe8j/e0+DdHnB+42LWxcmg5T/1GO5aXGhH51v2LDBSm0Z0v7g2yOFlV
 0iu5h+TqQob1IoSkPXW68UbVwwKxUSbXso1ZVbTkcspuMpNKUKPHlos3WLrUX7nLQG
 WhLesFqsgZuJFMZSbqSKTDTTDgtVbOfoLVEDsjHWQ/caQQHudad1Nyv5XqdfeLKK+g
 TpF93+bCtaN0TzVXs7S4OWSVs0iaLsDL+a+PR+pBFxkDPoH0rq5F4LbJOvsuVY9zHf
 FdPWt4Fqdw1YqhkUV3zD1o+mQSSNNprUzhmo8UvCXDqw0EpzPTlyaSK6lUsTEGalp6
 FA0T+uRGuwSBg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=RTDbO6jC
Subject: Re: [Buildroot] [PATCH v3,
 2/2] package/libvirt: fix libvirtd dependency
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
Cc: Jared Bents <jared.bents@rockwellcollins.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-08-14 20:27 +0200, Fabrice Fontaine spake thusly:
> Commit 4dff1be05e90 (package/libvirt: libvirtd needs C++ for nmap-ncat)
> introduce a recursive dependency (really: a circular dependency):
> 
>     package/busybox/Config.in:33:error: recursive dependency detected!
>     package/busybox/Config.in:33:   symbol BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is selected by BR2_PACKAGE_EBTABLES_UTILS_SAVE
>     package/ebtables/Config.in:11:  symbol BR2_PACKAGE_EBTABLES_UTILS_SAVE depends on BR2_PACKAGE_EBTABLES
>     package/ebtables/Config.in:1:   symbol BR2_PACKAGE_EBTABLES is selected by BR2_PACKAGE_LIBVIRT_DAEMON
>     package/libvirt/Config.in:44:   symbol BR2_PACKAGE_LIBVIRT_DAEMON depends on BR2_PACKAGE_NETCAT_OPENBSD
>     package/netcat-openbsd/Config.in:1:     symbol BR2_PACKAGE_NETCAT_OPENBSD depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> 
> We can't drop the C++ dependency and switch the netcat-openbsd and
> nmap-ncat dependencies conditions without adding a glibc dependency.
> 
> So always mandate C++ even if is only needed by nmap and not

*if it is...

> netcat-openbsd
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>

Acked-by: Yann E. MORIN <yann.morin.1998@free.fr>

Regards,
Yann E. MORIN.

> ---
> Changes v2 -> v3 (after review of Thomas Petazzoni):
>  - Always mandate C++ instead of glibc
>  
> Changes v1 -> v2 (after review of Yann E. Morin):
>  - Fix patch (rebase on top of current master)
> 
>  package/libvirt/Config.in | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> index afd2372d0e..c404d1b0e2 100644
> --- a/package/libvirt/Config.in
> +++ b/package/libvirt/Config.in
> @@ -38,7 +38,7 @@ if BR2_PACKAGE_LIBVIRT
>  config BR2_PACKAGE_LIBVIRT_DAEMON
>  	bool "libvirtd"
>  	default y
> -	depends on BR2_INSTALL_LIBSTDCPP || BR2_PACKAGE_NETCAT_OPENBSD # nmap
> +	depends on BR2_INSTALL_LIBSTDCPP # nmap
>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	select BR2_PACKAGE_DNSMASQ
>  	select BR2_PACKAGE_EBTABLES
> @@ -52,6 +52,9 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
>  	  Build the libvirt daemon (libvirtd) otherwise build only the
>  	  utility programs.
>  
> +comment "libvirtd needs a toolchain w/ C++"
> +	depends on !BR2_INSTALL_LIBSTDCPP
> +
>  # Stateful drivers are useful only when building the daemon.
>  if BR2_PACKAGE_LIBVIRT_DAEMON
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
