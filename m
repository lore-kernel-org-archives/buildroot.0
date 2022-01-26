Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A403BC2BA4C
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 17:15:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2007F60F8C;
	Wed, 26 Jan 2022 17:15:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UQ4ogSb5yHzd; Wed, 26 Jan 2022 17:15:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4DBC460BD4;
	Wed, 26 Jan 2022 17:15:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7CD6F1BF417
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 17:15:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6B43060BD4
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 17:15:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XSOthYrdWZeh for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 17:14:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1713260B50
 for <buildroot@buildroot.org>; Wed, 26 Jan 2022 17:14:59 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:61f5:fb85:a06d:c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id B0AB613F89C;
 Wed, 26 Jan 2022 18:14:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643217296;
 bh=+7xGf6EbWQDMDLb8RpV7RAATxse6MMryK1jHcCz8an8=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=levRz4/ZQfmj+8teVTBVNdrlEjpuRZPe7EsbmIbIiVKb+TA0Hlf5N6oScJuZw+cPO
 n+frBnUNyBNkMfDgV76pp3tCZSUDBTUMwSd0y1W5Ek26oZjuDdAPQvEk/TGhMhZemX
 HIt3PTI3aHsqfgku0OWSvwUc423AYBbouDogWGQxlXyyne0KEX32tm/IdIcyRZxq/g
 hX74NLs4E79DXYyJL4cD2hxnyTQjK+Cga25TsPlBwEIMdW+HKSNh7svTY3dYAjKj60
 qZ1M7tarJOrNooiiBiluOf5y/iUk++/sF3ip6CH7Ifh2iWyACyV2TtHpgGOg6/D3x2
 +WpBU8Lca8ZBw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 26 Jan 2022 18:14:50 +0100
Date: Wed, 26 Jan 2022 18:14:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Jonathan Borne <jborne@kalray.eu>
Message-ID: <20220126171450.GI457876@scaer>
References: <20220124173521.2236-1-jborne@kalray.eu> <87k0ep9gbx.fsf@tarshish>
 <20220124220238.1fa0568b@windsurf> <20220124212149.GJ2502@scaer>
 <20220124225356.03c1c658@windsurf>
 <608336144.1670038.1643211044586.JavaMail.zimbra@kalray.eu>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <608336144.1670038.1643211044586.JavaMail.zimbra@kalray.eu>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC PATCH 0/1] Fix binutils/libiberty target
 install directory
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
Cc: ysionneaux@kalray.eu, Baruch Siach via buildroot <buildroot@buildroot.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, jmaselbas@kalray.eu
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Jonathan, All,

On 2022-01-26 16:30 +0100, Jonathan Borne via buildroot spake thusly:
> ----- On Jan 24, 2022, at 10:53 PM, Thomas Petazzoni thomas.petazzoni@bootlin.com wrote:
> > On Mon, 24 Jan 2022 22:21:49 +0100
> > "Yann E. MORIN" <yann.morin.1998@free.fr> wrote:
> >> As such, when BR2_PACKAGE_BINUTILS_TARGET=n, then the full binutils are
> >> instaleld in target, so the libs will be installed in target.
> I think you made a typo here... 
> The full binutils install to target is made when BR2_PACKAGE_BINUTILS_TARGET=y.

Hehe... ;-)

> >> So whatever gets in staging is present in target, but target can be a
> >> superset of what is in staging, so whatever links to a binutils lib from
> >> staging will find it in target.
> 
> Agreed! So if I understand correctly, as was suggested by Romain and Thomas,
> we could indeed get rid of
> 
> $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
> 
> in BINUTILS_INSTALL_TARGET_CMDS.

Yes, but to avoid any confusion, please also add a comment above the
staging installation commands that states that libiberty is static only,
as Baruch pointed out earlier.

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
