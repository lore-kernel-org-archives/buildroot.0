Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCF55C433EF
	for <buildroot@archiver.kernel.org>; Wed, 26 Jan 2022 22:28:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 737DA6100C;
	Wed, 26 Jan 2022 22:28:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MofXZpQqI3PB; Wed, 26 Jan 2022 22:28:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADB556100D;
	Wed, 26 Jan 2022 22:28:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4C7CE1BF475
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:28:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B37A84D7D
 for <buildroot@lists.busybox.net>; Wed, 26 Jan 2022 22:28:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qCroVgV28CX3 for <buildroot@lists.busybox.net>;
 Wed, 26 Jan 2022 22:28:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3AFA884D7F
 for <buildroot@busybox.net>; Wed, 26 Jan 2022 22:28:07 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:61f5:fb85:a06d:c0])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id 4F76513F87C;
 Wed, 26 Jan 2022 23:28:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1643236084;
 bh=w09Pb1D4W4qy1M3A1IYayv9KApSRcORl1Rt2V07/bk4=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=URcKaLJi/0RT2jcEMcNsrxd3uiAQQ8skE+KiScLNwNDvWwgKFG4ZcsSnER5ETj8Oo
 9OnU4BKoEWnmRaPtNP+eZPNHbY/9IgLuFw6/QUnqwHaQsTzjbUOV+dT3Gaz9AbYVL/
 rLVx2hq10zu7vkzeQVtdWDm+B0hlHIW1obC5CF/UEp1AAP6pKIm0A6K3jfGndQPs1S
 XO+Sv18sEytKXDe8bMPjKLrORcEHzFSDmmVRGLqSja5azmoqwsmXCs2EFBmkyJhWxq
 SvdYuSmOIsbxKdAhav0t/7LiAkyZQwCvRvFsP6BJamna7RNYhQIM677V95VtxlSwoF
 MjxSOyMO/aGZQ==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Wed, 26 Jan 2022 23:28:00 +0100
Date: Wed, 26 Jan 2022 23:28:00 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Message-ID: <20220126222800.GL457876@scaer>
References: <20220126090457.32015-1-mf@go-sys.de>
 <20220126231432.37374caf@windsurf>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20220126231432.37374caf@windsurf>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/network-manager: add optional
 nmcli support
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
Cc: Michael Fischer <mf@go-sys.de>, buildroot@busybox.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, Michael, All,

On 2022-01-26 23:14 +0100, Thomas Petazzoni spake thusly:
> On Wed, 26 Jan 2022 10:04:57 +0100
> Michael Fischer <mf@go-sys.de> wrote:
[--SNIP--]
> > +config BR2_PACKAGE_NETWORK_MANAGER_CLI
> > +        bool "nmcli support"
> > +        select BR2_PACKAGE_READLINE
> > +        help
> > +          This option enables support for NetworkManager Command Line Interface
> 
> I think this line is too long, make sure to run "make check-package".
> 
> But a bigger problem is the legacy handling. Indeed, before your patch,
> a configuration with BR2_PACKAGE_NETWORK_MANAGER=y and
> BR2_PACKAGE_READLINE=y gets nmcli. After your patch, such a
> configuration no longer has nmcli compiled, because
> BR2_PACKAGE_NETWORK_MANAGER_CLI is not enabled.

I was also looking at that patch, and was wondering what we could do.
I do not like efaulting symbols to 'y', even conditionally, and I would
also expect people to regression-test their systems when they upgrade
anyway.

> Is this important to address, I don't know.
> 
> Is it possible to address is by doing:
> 
> config BR2_PACKAGE_NETWORK_MANAGER_CLI
> 	 bool "nmcli support"
> 	 default y if BR2_PACKAGE_READLINE
> 	 select BR2_PACKAGE_READLINE
> 
> I don't know if Kconfig is happy about such a construct. Yann? :-)

No it is not valid: you have both a backward and a forward dependency
that drive the availability of the symbol:

    package/readline/Config.in:1:error: recursive dependency detected!
    package/readline/Config.in:1:   symbol BR2_PACKAGE_READLINE is selected by BR2_PACKAGE_NETWORK_MANAGER_CLI
    package/network-manager/Config.in:36:   symbol BR2_PACKAGE_NETWORK_MANAGER_CLI depends on BR2_PACKAGE_READLINE
    For a resolution refer to Documentation/kbuild/kconfig-language.txt
    subsection "Kconfig recursive dependency limitations"

TBH, I would just leave it like that...

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
