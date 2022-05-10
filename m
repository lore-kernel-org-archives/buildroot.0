Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 887A9C433EF
	for <buildroot@archiver.kernel.org>; Tue, 10 May 2022 15:05:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14A1041732;
	Tue, 10 May 2022 15:05:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KIt2uEqh2GaZ; Tue, 10 May 2022 15:05:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A5154170F;
	Tue, 10 May 2022 15:05:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4A4B11BF2C9
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 15:05:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 37DC340AF7
 for <buildroot@lists.busybox.net>; Tue, 10 May 2022 15:05:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=googlemail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3QTihjdPmb2o for <buildroot@lists.busybox.net>;
 Tue, 10 May 2022 15:05:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x132.google.com (mail-il1-x132.google.com
 [IPv6:2607:f8b0:4864:20::132])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5D6D9403E0
 for <buildroot@buildroot.org>; Tue, 10 May 2022 15:05:36 +0000 (UTC)
Received: by mail-il1-x132.google.com with SMTP id n6so9630186ili.7
 for <buildroot@buildroot.org>; Tue, 10 May 2022 08:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=googlemail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gWTe/XxA5IElRDncUa4s6AfFAfxSuoae1HOnCB5iv/w=;
 b=NOytKclM2lz/+I607aDsKjdyvQArkl0xsyTh1ujc/ulKj2xfGNU76sQqLVpR9q+7sE
 Jh9nW14DJ0ZeAGtqqt8DeHfEY6JWsrKEzfOY4TPyvOEN2uXBzGZyJUpCVpxWFLBET4Jl
 bqtjtboSzXm2Td86rYQdHafv2N6k0VfFkFTR/8ROwgM7Mff8CYe+NSz+6+oyOn7UJXP5
 c+PlzQlNnTJViGleujhayZQ0HMuPbJdy9bjL+cklNpxuhcN6wo8wbQKpGukfWlCjjAOw
 BSj+eWIcHWRMukvYVfvpLWjTaKWb0D+pTc1Ylxer3hvljue/iy4rqpcrpvWN12LWN18B
 cXcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gWTe/XxA5IElRDncUa4s6AfFAfxSuoae1HOnCB5iv/w=;
 b=umZAT47+PFrviGgE8Jum0oPb/XFMzCYyIy3kkyB30pQ9WcRMoQvtTnN6IzsKEqhUHX
 3ypQi1IoxnohOwkcD1m3PYKAexuPU6g7aNFb7ZrFYN0RzpSIDVu+0qNcE2e7O9tmMaK1
 UvOyx5h7S9oulA1x4aP9w9E8vju4ZQzF1Pbu4TZT/XQ80chx+AleyfYPF3u1QwsCQQ0R
 g6dlnUv8wp9i94F1W6VZ/uIkd1XP7pDcwjn5oJdBq4HrLwQuejb6RbW+jhmfbzk5vStR
 r+bDJoYYMcfJMt369xtU4dyI6PGNLi7ci2zwKzUm29BBVrftIG9kuBrR96A4hUmcuP2V
 azBw==
X-Gm-Message-State: AOAM530EqF4bQ26TKwZILCGx1zPBrErhV/7YujYLHIPhtqX4U9TW99dZ
 p+936DKL4MVXnlh32t4qL9VsyPpAy18l3l876tYghyvpvao=
X-Google-Smtp-Source: ABdhPJxWnIdGfPvDGoWKBnQeC6a2sdvbBORFIQBXKQdt/TxiGxNkFMkP5NWNILyea74+Wy8b2YFzE5NZ5S1us0H0Dnc=
X-Received: by 2002:a05:6e02:18c8:b0:2cf:5266:ccf2 with SMTP id
 s8-20020a056e0218c800b002cf5266ccf2mr9406176ilu.207.1652195135455; Tue, 10
 May 2022 08:05:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220329145904.63900-1-andreynech@gmail.com>
 <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
In-Reply-To: <CAOiXNkB0QVU8E_XBmurhOzBUq+JL2qfG4cUzRk_7PKrNa2S8Xw@mail.gmail.com>
Date: Tue, 10 May 2022 17:05:24 +0200
Message-ID: <CAGm1_kunaZvTKh6wF8htjDjmjUu+n6RjH=0fyevtZ4523J1SkA@mail.gmail.com>
To: Andrey Nechypurenko <andreynech@gmail.com>
Subject: Re: [Buildroot] [PATCH] package/cmake: bump version to 3.22.3
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
From: Yegor Yefremov via buildroot <buildroot@buildroot.org>
Reply-To: Yegor Yefremov <yegorslists@googlemail.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andrey,

On Tue, May 10, 2022 at 5:02 PM Andrey Nechypurenko
<andreynech@gmail.com> wrote:
>
> Hi Folks,
>
> I am just curious if the following patch will be accepted for the
> upcoming release?

What about bumping it to 3.23.1?

Regards,
Yegor

> Thank you,
> Andrey.
>
> On Tue, 29 Mar 2022 at 16:59, Andrey Nechypurenko <andreynech@gmail.com> wrote:
> >
> > Version 3.20 is the first one where the following issue is fixed:
> > https://gitlab.kitware.com/cmake/cmake/-/issues/18299
> > Was affected by this bug and decide to bump the version to the
> > latest stable
> > ---
> >  package/cmake/cmake.hash | 4 ++--
> >  package/cmake/cmake.mk   | 4 ++--
> >  2 files changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/package/cmake/cmake.hash b/package/cmake/cmake.hash
> > index da514a6d6b..1749db8c27 100644
> > --- a/package/cmake/cmake.hash
> > +++ b/package/cmake/cmake.hash
> > @@ -1,5 +1,5 @@
> > -# From https://cmake.org/files/v3.18/cmake-3.18.6-SHA-256.txt
> > -sha256  124f571ab70332da97a173cb794dfa09a5b20ccbb80a08e56570a500f47b6600  cmake-3.18.6.tar.gz
> > +# From https://cmake.org/files/v3.22/cmake-3.22.3-SHA-256.txt
> > +sha256  9f8469166f94553b6978a16ee29227ec49a2eb5ceb608275dec40d8ae0d1b5a0  cmake-3.22.3.tar.gz
> >
> >  # Locally calculated
> >  sha256  131b9ff756b64a25b7461c3c1382e70b16c70a5b4833a1577897fa3ea6d88f8d  Copyright.txt
> > diff --git a/package/cmake/cmake.mk b/package/cmake/cmake.mk
> > index 4177b119ab..053658fad6 100644
> > --- a/package/cmake/cmake.mk
> > +++ b/package/cmake/cmake.mk
> > @@ -4,8 +4,8 @@
> >  #
> >  ################################################################################
> >
> > -CMAKE_VERSION_MAJOR = 3.18
> > -CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).6
> > +CMAKE_VERSION_MAJOR = 3.22
> > +CMAKE_VERSION = $(CMAKE_VERSION_MAJOR).3
> >  CMAKE_SITE = https://cmake.org/files/v$(CMAKE_VERSION_MAJOR)
> >  CMAKE_LICENSE = BSD-3-Clause
> >  CMAKE_LICENSE_FILES = Copyright.txt
> > --
> > 2.32.0
> >
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
