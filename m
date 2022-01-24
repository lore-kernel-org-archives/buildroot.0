Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FF6FC433EF
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:22:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13BD560F1C;
	Mon, 24 Jan 2022 21:22:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e76trpLVqHh1; Mon, 24 Jan 2022 21:22:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A2160B06;
	Mon, 24 Jan 2022 21:22:00 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FF1E1BF35F
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:21:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1BC04409A4
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:21:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id D7volIqRMaL9 for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:21:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0904A4098B
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:21:57 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:f930:a371:1de8:7a1a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 1EB6419F54D;
 Mon, 24 Jan 2022 22:21:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643059315;
 bh=KcsAXzjk+brMkbWdkJ8st9DASdpTU3Wi8nIuGZlqVZc=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=iAIedn0rRtUITVM1oR48Efrjb5vcQjy4VQi2Skl29jMmAgCYgrO0n62iUewh0k5IX
 z3OKrP9+F5a2v9BzRR4Ksy99ahe//cG1JF//uRjiYvAtqRwJwjEZ5b1qSGYSEotrFL
 IQ8FV8I8cQZ4vZevNBglqYY2W6ewKZU8QoAaRul3wKVY94+1ZZrCY8PTcTN2RE30cv
 Tb0Ax4Ss3DBkupbmrNH2zyZSCTiE4szODpWhUIEFXSu1jVcRPH7oPKMKz6m4i9fV/h
 LHjZxo/EqHCVE3nn2ZuiXZKs0bwnZoGfZw2QqzjjFtrNlwPHEr1xM2VoaNzN1RcQUp
 X9Y5jnNR7J9Sw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Mon, 24 Jan 2022 22:21:49 +0100
Date: Mon, 24 Jan 2022 22:21:49 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220124212149.GJ2502@scaer>
References: <20220124173521.2236-1-jborne@kalray.eu> <87k0ep9gbx.fsf@tarshish>
 <20220124220238.1fa0568b@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220124220238.1fa0568b@windsurf>
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
Cc: Jonathan Borne <jborne@kalray.eu>, jmaselbas@kalray.eu,
 ysionneaux@kalray.eu, Baruch Siach via buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2022-01-24 22:02 +0100, Thomas Petazzoni spake thusly:
> On Mon, 24 Jan 2022 19:44:29 +0200
> Baruch Siach via buildroot <buildroot@buildroot.org> wrote:
> 
> > > Is there a reason behind this?  
> > 
> > As I understand that's because libiberty is static only. Buildroot does
> > not copy static libraries to $(TARGET_DIR) because they are only used at
> > build time, but not at run-time.
> 
> True, but it doesn't make sense to do that in
> BINUTILS_INSTALL_TARGET_CMDS. It should go in
> BINUTILS_INSTALL_STAGING_CMDS, where it is already present, as Romain
> pointed out.
> 
> So basically:
> 
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
> 
> needs to be dropped from BINUTILS_INSTALL_TARGET_CMDS, if indeed
> libiberty is only installed as a static library.
> 
> However, taking a step back:
> 
> # We just want libbfd, libiberty and libopcodes,
> # not the full-blown binutils in staging
> define BINUTILS_INSTALL_STAGING_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(STAGING_DIR) install
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
> endef
> 
> # If we don't want full binutils on target
> ifneq ($(BR2_PACKAGE_BINUTILS_TARGET),y)
> define BINUTILS_INSTALL_TARGET_CMDS
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/bfd DESTDIR=$(TARGET_DIR) install
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/opcodes DESTDIR=$(TARGET_DIR) install
>         $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/libiberty DESTDIR=$(STAGING_DIR) install
> endef
> endif
> 
> This is *extremely* suspicious. Indeed, we get the libraries
> unconditionally installed in staging, so any other library or program
> that we build after binutils can potentially link against thosze
> libraries.
> 
> But we only install them conditionally in $(TARGET_DIR) if
> BR2_PACKAGE_BINUTILS_TARGET=y.
> 
> This seems very bad to me. Both target and staging installations should
> be done under the same condition.

Not really. You missed the fact that binutils is an autotools package.

As such, when BR2_PACKAGE_BINUTILS_TARGET=n, then the full binutils are
instaleld in target, so the libs will be installed in target.

So whatever gets in staging is present in target, but target can be a
superset of what is in staging, so whatever links to a binutils lib from
staging will find it in target.

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
