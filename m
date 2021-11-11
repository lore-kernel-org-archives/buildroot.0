Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F864C433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 08:14:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C9649610C8
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 08:13:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C9649610C8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6978340404;
	Thu, 11 Nov 2021 08:13:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5XuWSBmeU59M; Thu, 11 Nov 2021 08:13:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3194E40389;
	Thu, 11 Nov 2021 08:13:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2D07B1BF282
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 08:13:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1AB284043B
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 08:13:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tYNtNTfEm__o for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 08:13:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp3-g21.free.fr (smtp3-g21.free.fr [212.27.42.3])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 3535840389
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 08:13:51 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d0bf:367b:1b33:f0cc])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp3-g21.free.fr (Postfix) with ESMTPSA id D24CB13F89A;
 Thu, 11 Nov 2021 09:13:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1636618428;
 bh=VOgYMAJEc9QQR+YYStWpI8+7wTEqR3PaccvROiCK2ME=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=GvP9md41vYVgHrzDUjzoS9LpEIRfJ4xkqOGv+ngnBFOcPC/+aQd39RZLKfujPTg0B
 fMFhoyp9ds7+rTELxCI4WaZbi0YgPct1Q3nw82tUZ8sRVNlQG8nACJHfWUY37elfl1
 g25HLogk+ozGZ00cFsGLvbF1+AlAz0zNZ62QqoB3O7iadrgGBMB+HJ1oL0qBlEAVo/
 3hK3dkqJ0AFHcJLhz83unFnUd60rYpkxTyHwxFJM0evLCiTguXSS424Kwh0ACZ9e32
 I/9hBn7Av6s022VPzjXOYVCiQzEN6qL0UkNqprSWYl+eiZxWIFygnTJU30QhBfAHIl
 LdOCzhSfxh20A==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Thu, 11 Nov 2021 09:13:39 +0100
Date: Thu, 11 Nov 2021 09:13:39 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: Cyril Bur <cyrilbur@gmail.com>
Message-ID: <20211111081339.GS2084998@scaer>
References: <20211011220025.7998-1-petr.vorel@gmail.com>
 <20211011220025.7998-3-petr.vorel@gmail.com>
 <20211028145212.36dcb38a@camb691.localdomain>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20211028145212.36dcb38a@camb691.localdomain>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [RFC PATCH 2/3] make: Drop `type -p ...' fallback
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
Cc: Markus Mayer <mmayer@broadcom.com>, buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cyril, All,

On 2021-10-28 14:52 +0100, Cyril Bur spake thusly:
> On Tue, 12 Oct 2021 00:00:24 +0200
> Petr Vorel <petr.vorel@gmail.com> wrote:
> 
> > `command -v' is good enough as it's POSIX.
> > For easier debugging previous problems removed separately.
> > 
> 
> On doing some reading[1] I've discovered that this is a minefield.

Hmm.. A very long history lesson. Thanks! :-)

> Having said that, I'm pretty sure what currently happens isn't
> good either.
> 
> My only concern might be that theres old RHEL (its always RHEL ;))

**jiggles**

> systems out there which could break. Some of my coleagues use old RHEL
> VMs for their build machines. I'm going to try and see if I can get
> access but I wouldn't hold up the patch waiting.
> 
> I've given this patch applied with the previous one a test and is
> working fine on my system. I'm wondering if my tested by tag is
> appropriate for the previous patch since I haven't tested it in
> isolation.

A tested-by tag is always welcome: it means some people were interested
enough that they went off their daily lives and took time to test the
patch.

Thaks!

Regards,
Yann E. MORIN.

> uname -a
> Linux 5.14.12-arch1-1 #1 SMP PREEMPT Wed, 13 Oct 2021 16:58:16
> +0000 x86_64 GNU/Linux
> 
> make --version
> GNU Make 4.3
> Built for x86_64-pc-linux-gnu
> 
> /bin/sh --version
> GNU bash, version 5.1.8(1)-release (x86_64-pc-linux-gnu)
> 
> [1]
> https://unix.stackexchange.com/questions/85249/why-not-use-which-what-to-use-then
> 
> Tested-by: Cyril Bur <cyrilbur@gmail.com>
> Reviewed-by: Cyril Bur <cyrilbur@gmail.com>
> > Signed-off-by: Petr Vorel <petr.vorel@gmail.com>
> 
> 
> 
> > ---
> >  Makefile            | 22 +++++++++++-----------
> >  package/Makefile.in |  6 +++---
> >  2 files changed, 14 insertions(+), 14 deletions(-)
> > 
> > diff --git a/Makefile b/Makefile
> > index 2317655272..81b7173974 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -284,12 +284,12 @@ HOSTAS := as
> >  endif
> >  ifndef HOSTCC
> >  HOSTCC := gcc
> > -HOSTCC := $(shell $(SHELL) -c "command -v '$(HOSTCC)' || type -p
> > '$(HOSTCC)' || echo gcc") +HOSTCC := $(shell $(SHELL) -c "command -v
> > '$(HOSTCC)' || echo gcc") endif
> >  HOSTCC_NOCCACHE := $(HOSTCC)
> >  ifndef HOSTCXX
> >  HOSTCXX := g++
> > -HOSTCXX := $(shell $(SHELL) -c "command -v '$(HOSTCXX)' || type -p
> > '$(HOSTCXX)' || echo g++") +HOSTCXX := $(shell $(SHELL) -c "command
> > -v '$(HOSTCXX)' || echo g++") endif
> >  HOSTCXX_NOCCACHE := $(HOSTCXX)
> >  ifndef HOSTCPP
> > @@ -310,15 +310,15 @@ endif
> >  ifndef HOSTRANLIB
> >  HOSTRANLIB := ranlib
> >  endif
> > -HOSTAR := $(shell '$(SHELL)' -c "command -v '$(HOSTAR)' || type -p
> > '$(HOSTAR)' || echo ar") -HOSTAS := $(shell '$(SHELL)' -c "command -v
> > '$(HOSTAS)' || type -p '$(HOSTAS)' || echo as") -HOSTCPP := $(shell
> > '$(SHELL)' -c "command -v '$(HOSTCPP)' || type -p '$(HOSTCPP)' ||
> > echo cpp") -HOSTLD := $(shell '$(SHELL)' -c "command -v '$(HOSTLD)'
> > || type -p '$(HOSTLD)' || echo ld") -HOSTLN := $(shell '$(SHELL)' -c
> > "command -v '$(HOSTLN)' || type -p '$(HOSTLN)' || echo ln") -HOSTNM
> > := $(shell '$(SHELL)' -c "command -v '$(HOSTNM)' || type -p
> > '$(HOSTNM)' || echo nm") -HOSTOBJCOPY := $(shell '$(SHELL)' -c
> > "command -v '$(HOSTOBJCOPY)' || type -p '$(HOSTOBJCOPY)' || echo
> > objcopy") -HOSTRANLIB := $(shell '$(SHELL)' -c "command -v
> > '$(HOSTRANLIB)' || type -p '$(HOSTRANLIB)' || echo ranlib") -SED :=
> > $(shell $(SHELL) -c "command -v sed || type -p sed") -i -e +HOSTAR :=
> > $(shell '$(SHELL)' -c "command -v '$(HOSTAR)' || echo ar") +HOSTAS :=
> > $(shell '$(SHELL)' -c "command -v '$(HOSTAS)' || echo as") +HOSTCPP
> > := $(shell '$(SHELL)' -c "command -v '$(HOSTCPP)' || echo cpp")
> > +HOSTLD := $(shell '$(SHELL)' -c "command -v '$(HOSTLD)' || echo ld")
> > +HOSTLN := $(shell '$(SHELL)' -c "command -v '$(HOSTLN)' || echo ln")
> > +HOSTNM := $(shell '$(SHELL)' -c "command -v '$(HOSTNM)' || echo nm")
> > +HOSTOBJCOPY := $(shell '$(SHELL)' -c "command -v '$(HOSTOBJCOPY)' ||
> > echo objcopy") +HOSTRANLIB := $(shell '$(SHELL)' -c "command -v
> > '$(HOSTRANLIB)' || echo ranlib") +SED := $(shell $(SHELL) -c "command
> > -v sed") -i -e export HOSTAR HOSTAS HOSTCC HOSTCXX HOSTLD export
> > HOSTCC_NOCCACHE HOSTCXX_NOCCACHE diff --git a/package/Makefile.in
> > b/package/Makefile.in index 2ba4d8b381..4e993ecd5f 100644 ---
> > a/package/Makefile.in +++ b/package/Makefile.in @@ -4,7 +4,7 @@ endif
> >  ifndef HOSTMAKE
> >  HOSTMAKE = $(MAKE)
> >  endif
> > -HOSTMAKE := $(shell $(SHELL) -c "command -v '$(HOSTMAKE)' || type -p
> > '$(HOSTMAKE)' || echo make") +HOSTMAKE := $(shell $(SHELL) -c
> > "command -v '$(HOSTMAKE)' || echo make") 
> >  # If BR2_JLEVEL is 0, scale the maximum concurrency with the number
> > of # CPUs. An additional job is used in order to keep processors busy
> > @@ -222,8 +222,8 @@ else
> >  TARGET_STRIP = /bin/true
> >  STRIPCMD = $(TARGET_STRIP)
> >  endif
> > -INSTALL := $(shell $(SHELL) -c "command -v install || type -p
> > install") -UNZIP := $(shell $(SHELL) -c "command -v unzip || type -p
> > unzip") -q +INSTALL := $(shell $(SHELL) -c "command -v install")
> > +UNZIP := $(shell $(SHELL) -c "command -v unzip") -q
> >  
> >  APPLY_PATCHES = PATH=$(HOST_DIR)/bin:$$PATH
> > support/scripts/apply-patches.sh $(if $(QUIET),-s) 
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
