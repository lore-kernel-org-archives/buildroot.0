Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87529C25B06
	for <buildroot@archiver.kernel.org>; Sun, 14 Aug 2022 08:26:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C98A24036F;
	Sun, 14 Aug 2022 08:26:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C98A24036F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uJjI-iKfkcFX; Sun, 14 Aug 2022 08:26:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CE6C2400FB;
	Sun, 14 Aug 2022 08:26:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org CE6C2400FB
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9D4771BF356
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 08:26:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F15260B72
 for <buildroot@lists.busybox.net>; Sun, 14 Aug 2022 08:26:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7F15260B72
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BTK3rwyTltsT for <buildroot@lists.busybox.net>;
 Sun, 14 Aug 2022 08:26:08 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1939E605B7
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1939E605B7
 for <buildroot@buildroot.org>; Sun, 14 Aug 2022 08:26:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:4cac:4fa9:6c11:832f])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CF2156013C;
 Sun, 14 Aug 2022 10:26:00 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 14 Aug 2022 10:26:00 +0200
Date: Sun, 14 Aug 2022 10:26:00 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220814082600.GC2854108@scaer>
References: <20220814075132.2432549-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220814075132.2432549-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1660465564;
 bh=d+7OI5bLybO8Lpd9qhTUKETtB+rVWw5GCn4xsb9QcEQ=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UM6/Vla2p7XALJHj8IEzga/vcxO4PQYhflxQlD2RGY1Kv1H2eZJYDc51dPrigjUaQ
 UFX7k4r+F4n0siDlyVLgQwUhVLyb/zcgS7j7o5YHTAue4lC9blCM5KMJzI6y3GGOAn
 /4N28aIIn28xSDbE7ayM6oBmieyBWXvMtaZ6h2dmwCiKdEc0K0oEQ4VlowZa6FwOoW
 O412d6SQjh2OtQFtDLZSjnA2L6IhYUm60C3PlXD1v+1rvP0EjiGBYvndxmd8QYQ24f
 DV9+u1VRGimfogWgUzdMKK47nJ5JS+3hvJ2W5ySsO5OD3UcStfZqYVZPH21th5NU80
 Ld0S8l1o1/z2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=UM6/Vla2
Subject: Re: [Buildroot] [PATCH 1/1] package/libvirt: fix libvirtd dependency
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

On 2022-08-14 09:51 +0200, Fabrice Fontaine spake thusly:
> Add a dependency to BR2_TOOLCHAIN_USES_GLIBC to fix the following
> libvirtd build failure raised since commit
> f81242ae4fb64ab85af5d38e70246222276552ae:
> 
> Makefile:575: *** libbsd is in the dependency chain of netcat-openbsd that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.
> 
> BR2_TOOLCHAIN_USES_GLIBC is only needed by netcat-openbsd, but a
> dependency on BR2_TOOLCHAIN_USES_GLIBC || !BR2_PACKAGE_NETCAT_OPENBSD
> can't be added as it will create a circular dependency
> 
> An other option would be to revert
> f81242ae4fb64ab85af5d38e70246222276552ae and to always mandate C++ even
> if it is only needed by nmap-ncat
> 
> Fixes:
>  - http://autobuild.buildroot.org/results/aada1d92df6cab0d01e27431b7b7483e3d165e79
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvirt/Config.in | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> index 29098f3f55..ab8624c05f 100644
> --- a/package/libvirt/Config.in
> +++ b/package/libvirt/Config.in
> @@ -39,6 +39,7 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
>  	bool "libvirtd"
>  	default y
>  	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9 # iptables

What branch is this based on? We do not have that condition in the
crrent tree, neither in 2022.02.x nor 2022.05.x, nor master, nor next.

Regards,
Yann E. MORIN.

> +	depends on BR2_TOOLCHAIN_USES_GLIBC # netcat-openbsd
>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	select BR2_PACKAGE_DNSMASQ
>  	select BR2_PACKAGE_EBTABLES
> @@ -51,8 +52,9 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
>  	  Build the libvirt daemon (libvirtd) otherwise build only the
>  	  utility programs.
>  
> -comment "libvirtd needs a toolchain w/ headers >= 4.9"
> -	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9
> +comment "libvirtd needs a glibc toolchain w/ headers >= 4.9"
> +	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_9 || \
> +		!BR2_TOOLCHAIN_USES_GLIBC
>  
>  # Stateful drivers are useful only when building the daemon.
>  if BR2_PACKAGE_LIBVIRT_DAEMON
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
