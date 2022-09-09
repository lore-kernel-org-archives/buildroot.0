Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0841ECAAD3
	for <buildroot@archiver.kernel.org>; Fri,  9 Sep 2022 19:31:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D113841D86;
	Fri,  9 Sep 2022 19:31:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D113841D86
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BDums9KW2qKn; Fri,  9 Sep 2022 19:31:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AA5141D7E;
	Fri,  9 Sep 2022 19:31:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8AA5141D7E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 241901BF384
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 19:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F3A0860E27
 for <buildroot@lists.busybox.net>; Fri,  9 Sep 2022 19:31:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F3A0860E27
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ew-vCxB4PWI8 for <buildroot@lists.busybox.net>;
 Fri,  9 Sep 2022 19:31:31 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11B2F60E17
Received: from smtp4-g21.free.fr (smtp4-g21.free.fr [212.27.42.4])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 11B2F60E17
 for <buildroot@buildroot.org>; Fri,  9 Sep 2022 19:31:31 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:d2dc:af53:61e0:beab])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp4-g21.free.fr (Postfix) with ESMTPSA id 047C519F5AD;
 Fri,  9 Sep 2022 21:31:20 +0200 (CEST)
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 09 Sep 2022 21:31:20 +0200
Date: Fri, 9 Sep 2022 21:31:20 +0200
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220909193120.GA264214@scaer>
References: <20220905202002.4183680-1-james.hilliard1@gmail.com>
 <20220906072158.GM1490660@scaer>
 <CADvTj4rCFTZOm0MA+Ph7u8DmjPqgJw39oXqWoxPLWmERRCJrPg@mail.gmail.com>
 <09be7323-3af8-2fa2-2d45-16d3d92e1c13@mind.be>
 <CADvTj4pk0+0fQbFarBZ5vfoAjBHz1UJhJzEAyLJounQns7Exbw@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4pk0+0fQbFarBZ5vfoAjBHz1UJhJzEAyLJounQns7Exbw@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=free.fr; s=smtp-20201208; t=1662751885;
 bh=ngf1POszmkNnt2cXXk3sLwsP0CbDIv/pTvqAQXRYTjY=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=Ni0O31LmfrdDULRwoCnv5Wy5pRfNfWOdV8DQuNkVMTXocRXBr/u49cUi3LCzLiPWD
 KLwYu/YYARp4sfpSJ7fZtrQVrWrMYOYSnZ2HXlkysrQeYZ2Wk6wF3e4YlPAwQGUvS+
 D5XkJ+tlnNc4y7/1tjXc2bruQjGFsooz0owOulVK81alDPWoaAghPd/lEBX3fIosjg
 uwpVYh/LwFePFdlkjXiO08TDrKxszu1k0/oaPdB09HIICPD4fWJyWn5/EuyMMVI7x2
 eIgW/QwlYrbcymJbQeGDBq2Y2hs/Dr+4d3tD1NUVrIjCL8I3hU4JBFdgZzziL4odcI
 T92YJ2krs73HA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr
 header.a=rsa-sha256 header.s=smtp-20201208 header.b=Ni0O31Lm
Subject: Re: [Buildroot] [PATCH 1/1] Makefile: unexport TARGET env variable
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
Cc: buildroot@buildroot.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-09-07 16:51 -0600, James Hilliard spake thusly:
> On Wed, Sep 7, 2022 at 6:42 AM Arnout Vandecappelle <arnout@mind.be> wrote:
[--SNIP--]
> > >> Can you provide an actual error message and an explanation on how that
> > >> actually fails?
> > >
> > > I had set this in my env(for some non-buildroot compiler testing), and noticed
> > > it broke buildroot builds unless cleared:
> > > export TARGET=bpf
> > >
> > >>>> host-icu 70-1 Building
[--SNIP--]
> > > Note: rebuild with "/usr/bin/make VERBOSE=1 " to show all compiler parameters.
> > > make[3]: *** No rule to make target 'bpf', needed by 'all-local'.  Stop.

OK, this (elided), should be part of the commit log.

[--SNIP--]
> >   It's conditionally assigned:
> >
> > ifneq ($(ENABLE_STATIC),)
> > TARGET = $(STUBDATA_LIBDIR)$(LIBSICU)$(TARGET_STUBNAME)$(ICULIBSUFFIX).$(A)
> > endif
> >
> >   There are a couple of Makefile.in where it's defined like that....
> >
> >   This does look like a very icu-specific thing though, so I think it should be
> > fixed in icu.mk itself, by setting TARGET= in the _ENV.
> 
> Set to empty like this?
> ICU_CONF_ENV += TARGET=""
> ICU_MAKE_ENV += TARGET=""

Ues, this should do the trick.

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
