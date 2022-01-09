Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABFCAC433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 20:49:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3650C60BB6;
	Sun,  9 Jan 2022 20:49:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DDFtzfMq26Qo; Sun,  9 Jan 2022 20:49:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 786EB60BB5;
	Sun,  9 Jan 2022 20:49:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 636E31BF44C
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:49:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 51C3881D24
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 20:49:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id MYKi5xRSIonw for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 20:48:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6D4FB81D18
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 20:48:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 9F32B5FF9E;
 Sun,  9 Jan 2022 21:48:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641761336;
 bh=szd8DdQKUv7co4cuAmmunlrjZx99ROEhmb7Egu0OT34=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=T3id9lFkM+qZTdhmu4Q+EUkZED5wJACxpMCriT2mMQOf3qGE35HNNNbjAOgTeDee8
 m1+8yMp7IKcenJwJxzQuuB7qFZFDZ10Fdx69xHTncdDBKjxI01qG9HJkXvZ7sdAp8s
 zTrnOk9+krTXtvIO8CfFIxuMc5g9Kz5hk3I/XmYUrqiAEmj1paKpWCCM5S4og4ityA
 GBCd3WipqOSxpoIqis7EFuchaLvRPiy6ZmFF5AftgUu4ENjMCvPQ+2o5Tk4saLqi/3
 nw6L7joJCNLtWvdqxYlurZeGOX9Dvz2AFHaChWatjP4nsEo3GxUHT4FOSFlFwzom6y
 KAOjwP7nTzUZQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 21:48:53 +0100
Date: Sun, 9 Jan 2022 21:48:53 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220109204853.GH1477939@scaer>
References: <20220109202003.3338357-1-fontaine.fabrice@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109202003.3338357-1-fontaine.fabrice@gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/libvirt: libvirtd needs C++
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

You little joker, sending a fix right when I was applying your bump...
;-)

On 2022-01-09 21:20 +0100, Fabrice Fontaine spake thusly:
> Fix the following build failure raised since commit
> fbf25acfbfd5a73b3560918bea081768abbe5723:
> 
> WARNING: unmet direct dependencies detected for BR2_PACKAGE_NMAP
>   Depends on [n]: BR2_INSTALL_LIBSTDCPP [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]
>   Selected by [y]:
>   - BR2_PACKAGE_LIBVIRT_DAEMON [=y] && BR2_PACKAGE_LIBVIRT [=y] && !BR2_PACKAGE_NETCAT_OPENBSD [=n]
> 
> Fixes:
>  - No autobuilder failures (yet)
> 
> Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> ---
>  package/libvirt/Config.in | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> index a35295bc97..d7ca5f8db5 100644
> --- a/package/libvirt/Config.in
> +++ b/package/libvirt/Config.in
> @@ -37,6 +37,7 @@ if BR2_PACKAGE_LIBVIRT
>  config BR2_PACKAGE_LIBVIRT_DAEMON
>  	bool "libvirtd"
>  	default y
> +	depends on BR2_INSTALL_LIBSTDCPP # nmap

In fact, the requirement on C++ is due to nmap-ncat, which is enabled
only if netcat-openbsd is not available, so I relaxed the requirement
accordingly.

Applied to master, thanks.

Regards,
Yann E. MORIN.

>  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
>  	select BR2_PACKAGE_DNSMASQ
>  	select BR2_PACKAGE_EBTABLES
> @@ -50,6 +51,9 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
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
