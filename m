Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28CE7C433EF
	for <buildroot@archiver.kernel.org>; Sun,  9 Jan 2022 21:58:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BA4DF81815;
	Sun,  9 Jan 2022 21:58:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tHItw09em8Wm; Sun,  9 Jan 2022 21:58:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0674E81762;
	Sun,  9 Jan 2022 21:58:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4B14F1BF3C0
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:58:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 389F181762
 for <buildroot@lists.busybox.net>; Sun,  9 Jan 2022 21:58:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYOGGAEnvcqs for <buildroot@lists.busybox.net>;
 Sun,  9 Jan 2022 21:58:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [212.27.42.5])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0304281759
 for <buildroot@buildroot.org>; Sun,  9 Jan 2022 21:58:09 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:884e:4989:9dec:67ee])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id 1BE655FF23;
 Sun,  9 Jan 2022 22:58:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1641765487;
 bh=cCctVVm0q/6vKrE6NOjbSWVXQ0KkkW2NQ8ztvlYM5MY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=WAb7bszsGadPMjSMaLbfcaRhLK3Xe5TyD4ZS/yGdc7bKxNO/Etej6r3uAhL3QahSU
 LociYtbV4yDWCUDct+y92JamJ+2KHjj3q9NGNF/LkjpBBrxZVf5TYyQ4Cy772aqYhd
 6zHsFS+UQoKLoNbnaJBq9QaKnNi62Q9dlmorEOBMCgn/Y0rO7WoRfFXiNtX7CTgXun
 hUueIaHuhlc+Y6pCB+wXSiavHfNEtCSwNoKzLsd7OGQAR5cnfVo0XB5DDA7Grfi2h5
 1Wy+WbPt3tLqjmmiYpdYM4s8apldfED13S5prXXeTTcxznkIws1lUxhxm1POmGZjPY
 4p7Sdtr/USLyg==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 09 Jan 2022 22:58:03 +0100
Date: Sun, 9 Jan 2022 22:58:03 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Message-ID: <20220109215803.GJ1477939@scaer>
References: <20220109202003.3338357-1-fontaine.fabrice@gmail.com>
 <20220109204853.GH1477939@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220109204853.GH1477939@scaer>
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
Cc: buildroot@buildroot.org, Jared Bents <jared.bents@rockwellcollins.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Fabrice, All,

On 2022-01-09 21:48 +0100, Yann E. MORIN spake thusly:
> On 2022-01-09 21:20 +0100, Fabrice Fontaine spake thusly:
> > Fix the following build failure raised since commit
> > fbf25acfbfd5a73b3560918bea081768abbe5723:
> > 
> > WARNING: unmet direct dependencies detected for BR2_PACKAGE_NMAP
> >   Depends on [n]: BR2_INSTALL_LIBSTDCPP [=n] && BR2_USE_MMU [=y] && BR2_TOOLCHAIN_HAS_THREADS [=y]
> >   Selected by [y]:
> >   - BR2_PACKAGE_LIBVIRT_DAEMON [=y] && BR2_PACKAGE_LIBVIRT [=y] && !BR2_PACKAGE_NETCAT_OPENBSD [=n]
> > 
> > Fixes:
> >  - No autobuilder failures (yet)
> > 
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/libvirt/Config.in | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/package/libvirt/Config.in b/package/libvirt/Config.in
> > index a35295bc97..d7ca5f8db5 100644
> > --- a/package/libvirt/Config.in
> > +++ b/package/libvirt/Config.in
> > @@ -37,6 +37,7 @@ if BR2_PACKAGE_LIBVIRT
> >  config BR2_PACKAGE_LIBVIRT_DAEMON
> >  	bool "libvirtd"
> >  	default y
> > +	depends on BR2_INSTALL_LIBSTDCPP # nmap
> 
> In fact, the requirement on C++ is due to nmap-ncat, which is enabled
> only if netcat-openbsd is not available, so I relaxed the requirement
> accordingly.

This introduced a messy circular dependency, so I pushed another patch
that;
  - remove the C++ dependency
  - switches the nmap-ncat and netcat-openbsd conditional dependnecies

Regards,
Yann E. MORIN.

> Applied to master, thanks.
> 
> Regards,
> Yann E. MORIN.
> 
> >  	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
> >  	select BR2_PACKAGE_DNSMASQ
> >  	select BR2_PACKAGE_EBTABLES
> > @@ -50,6 +51,9 @@ config BR2_PACKAGE_LIBVIRT_DAEMON
> >  	  Build the libvirt daemon (libvirtd) otherwise build only the
> >  	  utility programs.
> >  
> > +comment "libvirtd needs a toolchain w/ C++"
> > +	depends on !BR2_INSTALL_LIBSTDCPP
> > +
> >  # Stateful drivers are useful only when building the daemon.
> >  if BR2_PACKAGE_LIBVIRT_DAEMON
> >  
> > -- 
> > 2.34.1
> > 
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
> 
> -- 
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics' conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___               |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v   conspiracy.  |
> '------------------------------^-------^------------------^--------------------'
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
