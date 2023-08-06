Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAE8DC001B0
	for <buildroot@archiver.kernel.org>; Sun,  6 Aug 2023 20:55:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7A9DA60A8D;
	Sun,  6 Aug 2023 20:55:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7A9DA60A8D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DOl28FQxsMYQ; Sun,  6 Aug 2023 20:55:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 84BAF60BD3;
	Sun,  6 Aug 2023 20:55:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 84BAF60BD3
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 995551BF2F3
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:55:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B0CD640857
 for <buildroot@lists.busybox.net>; Sun,  6 Aug 2023 20:54:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B0CD640857
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7yEsChasfMgl for <buildroot@lists.busybox.net>;
 Sun,  6 Aug 2023 20:54:57 +0000 (UTC)
Received: from smtp5-g21.free.fr (smtp5-g21.free.fr [IPv6:2a01:e0c:1:1599::14])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0560B4012C
 for <buildroot@buildroot.org>; Sun,  6 Aug 2023 20:54:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0560B4012C
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b44:b00:973b:6057:7632:5151])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp5-g21.free.fr (Postfix) with ESMTPSA id CC4415FF9A;
 Sun,  6 Aug 2023 22:54:47 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Sun, 06 Aug 2023 22:54:47 +0200
Date: Sun, 6 Aug 2023 22:54:47 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Thomas Devoogdt <thomas@devoogdt.com>
Message-ID: <20230806205447.GW421096@scaer>
References: <20230802111447.41714-1-thomas@devoogdt.com>
 <20230802111447.41714-4-thomas@devoogdt.com>
 <20230806141955.GV421096@scaer>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230806141955.GV421096@scaer>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1691355294;
 bh=/Za75dGGKkskBCT6+H3NWT1tboGlXcemEXkjqZQw9L0=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=uvNqbfpUZnW0DttAVTIt0oXbsvUlHDQ7VMhjZgICvhDYz+62Ff7VWsY5SEVgZTlak
 rP5bedN89Ct0msWqsrb9hQfjFxdZS13jdB/G2tJPwqIUvbSeHkclTk2r0bic2nw9L3
 i1zcwq4vFe8INg3TIwWmsnTlunYmnmoGQRvZhnVm68HhxfU00laRNF5OenPiflH+22
 zo7oDO/4F2HRrBYNcrYkHU89Ck931wwHQHdiZQxc+s4GmX3s3b6xVZgx62hFbE8JxJ
 5w5kMrHFOLSW1NQTyckMFn/ylrwUtvz8yE6y+SSgJVovBGcDfVC/eK0SxM72/SAi47
 H2nPtHOB+dKSQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=uvNqbfpU
Subject: Re: [Buildroot] [PATCH v6 4/4] pkg-cmake: make ninja the default
 for all packages
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
Cc: Eric Le Bihan <eric.le.bihan.dev@free.fr>,
 Adrian Perez de Castro <aperez@igalia.com>,
 Samuel Martin <s.martin49@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Thomas, All,

On 2023-08-06 16:19 +0200, Yann E. MORIN spake thusly:
> On 2023-08-02 13:14 +0200, Thomas Devoogdt spake thusly:
> > From: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > Use ninja as the default generator.
> I have not applied that patch yet, because Thomas P. and I believed this
> is a bit bold, even for next.

And I will not apply it, because it does actually break some packages
because of ninja.

For example, compiler-rt complains with:

    ninja: error: dependency cycle: include/sanitizer/allocator_interface.h -> include/sanitizer/allocator_interface.h

So, maybe the package is broken and needs fixing, but it (supposedly)
builds OKi-ish with makefiles.

So, we need to assess how many of the cmake packages build fine with
ninja. If they are the vast majority, then we annonate those that don't
and change the default to use ninja. If however, the vast majority does
not work with ninja, then we keep the curremnt status quo, and annotate
those packages that do, like webktigtk or wpewebkit.

Also, please have a look at qt6: it is already using ninja, but like
webkitgtk and wpewebkit, is was special-coded. Could you please send
a follow-up patch that upgrades qt6 to use QT6_CMAKE_BACKEND?

Regards,
Yann E. MORIN.

> I've started a build with a bunch of cmake-based packages, and I'll see
> if they break alot of not later in the evening. If there's breakage,
> I'll report and you'll have to investigate! ;-p
> 
> > A fun fact is that we of course have to disable ninja when building ninja.
> 
> Yes, of course! :-)
> 
> Regards,
> Yann E. MORIN.
> 
> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > ---
> > v5: add this optional commit
> > v6: rebase
> > ---
> >  package/ninja/ninja.mk | 1 +
> >  package/pkg-cmake.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 1 deletion(-)
> > 
> > diff --git a/package/ninja/ninja.mk b/package/ninja/ninja.mk
> > index b7bc1a4f1c..85dd2e05aa 100644
> > --- a/package/ninja/ninja.mk
> > +++ b/package/ninja/ninja.mk
> > @@ -9,6 +9,7 @@ NINJA_VERSION = $(NINJA_VERSION_MAJOR).g95dee.kitware.jobserver-1
> >  NINJA_SITE = $(call github,Kitware,ninja,v$(NINJA_VERSION))
> >  NINJA_LICENSE = Apache-2.0
> >  NINJA_LICENSE_FILES = COPYING
> > +NINJA_CMAKE_NINJA = NO
> >  
> >  define HOST_NINJA_INSTALL_CMDS
> >  	$(INSTALL) -m 0755 -D $(@D)/ninja $(HOST_DIR)/bin/ninja
> > diff --git a/package/pkg-cmake.mk b/package/pkg-cmake.mk
> > index 36ab88d3a1..dab87c81f4 100644
> > --- a/package/pkg-cmake.mk
> > +++ b/package/pkg-cmake.mk
> > @@ -52,7 +52,7 @@ endif
> >  define inner-cmake-package
> >  
> >  $(3)_SUPPORTS_IN_SOURCE_BUILD ?= YES
> > -
> > +$(3)_CMAKE_NINJA ?= YES
> >  
> >  ifeq ($$($(3)_SUPPORTS_IN_SOURCE_BUILD),YES)
> >  $(2)_BUILDDIR			= $$($(2)_SRCDIR)
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
