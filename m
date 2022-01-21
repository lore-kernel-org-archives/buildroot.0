Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CFC7C433F5
	for <buildroot@archiver.kernel.org>; Fri, 21 Jan 2022 06:59:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E1C4D833CD;
	Fri, 21 Jan 2022 06:59:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1QCVjXsLidNB; Fri, 21 Jan 2022 06:59:02 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 139C282EA4;
	Fri, 21 Jan 2022 06:59:01 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9B38F1BF321
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 06:58:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 97E6260ACC
 for <buildroot@lists.busybox.net>; Fri, 21 Jan 2022 06:58:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=free.fr
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yT8fJj-Q9160 for <buildroot@lists.busybox.net>;
 Fri, 21 Jan 2022 06:58:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [212.27.42.1])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 51D5160784
 for <buildroot@buildroot.org>; Fri, 21 Jan 2022 06:58:58 +0000 (UTC)
Received: from ymorin.is-a-geek.org (unknown
 [IPv6:2a01:cb19:8b51:cb00:9c35:7598:9514:be6a])
 (Authenticated sender: yann.morin.1998@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 345BCB0051B;
 Fri, 21 Jan 2022 07:58:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1642748335;
 bh=Ewe0Aoc6ANC794OwDfmKdooR6lMCa/XY5kDjAWZq6tE=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=MTN2e2OeVLP/9kuPO+Pm+ghu9oY6yqdPtxd/ZcTyIUyMWp9TyWkLeIDY4PU8KFsHe
 m6HNtsHjviEfbiKxNXFsUoWSYl1wl6qdYZo6xqw1YPsK1iyPC0i1dvQzDg76Deuy/2
 byFHrDEI3a8t0o3lT0g5O9xV2msocPdvrI5QTCmptQpkVV6whAb3CAa5h15vVLMYlg
 9h68C0fB5VNwAiYOqvV9BoG3DvxghY35Q5S4cEX5v73vhSQSfkscZTHLzxeMgbnLrO
 zX9rzNPzqNbisHDGFH4U5+UriJZ2oFKeCca/CNPx8VBgTOoZq+SZaVlWTZ8HrCINFJ
 qy1Yn8S18NCDw==
Received: by ymorin.is-a-geek.org (sSMTP sendmail emulation);
 Fri, 21 Jan 2022 07:58:50 +0100
Date: Fri, 21 Jan 2022 07:58:50 +0100
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220121065850.GF3252931@scaer>
References: <20220119084545.3642950-1-james.hilliard1@gmail.com>
 <20220119204518.GC3095239@scaer>
 <CADvTj4q2AWnzpQbbQHFRUWnKki_uRCcDTOiT7pwRZ4-Ao0o3fw@mail.gmail.com>
 <20220120222936.6e7b5aba@gmx.net>
 <CADvTj4rXQO8Kbe0sMA5YJdj6A2R98OELOB5sPD_xriZ_npkaFQ@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CADvTj4rXQO8Kbe0sMA5YJdj6A2R98OELOB5sPD_xriZ_npkaFQ@mail.gmail.com>
User-Agent: Mutt/1.5.22 (2013-10-16)
Subject: Re: [Buildroot] [PATCH 1/1] package/re2: switch to generic-package
 make build
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
Cc: Peter Seiderer <ps.report@gmx.net>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

James, All,

On 2022-01-20 16:57 -0700, James Hilliard spake thusly:
> On Thu, Jan 20, 2022 at 2:29 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > Or keep the cmake build and do the following to install re2.pc (taken from #349, [1]):
> >
> > --- a/package/re2/re2.mk
> > +++ b/package/re2/re2.mk
> > @@ -9,9 +9,20 @@ RE2_SITE = $(call github,google,re2,$(RE2_VERSION))
> >  RE2_LICENSE = BSD-3-Clause
> >  RE2_LICENSE_FILES = LICENSE
> >  RE2_INSTALL_STAGING = YES
> > +# keep original Makefile (for re2.pc install)
> > +RE2_SUPPORTS_IN_SOURCE_BUILD = NO
> >
> >  RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF
> >  HOST_RE2_CONF_OPTS += -DRE2_BUILD_TESTING=OFF -DBUILD_SHARED_LIBS=ON
> >
> > +# install re2.pc
> > +define RE2_INSTALL_PKG_CONFIG
> > +       $(MAKE1) -C $(@D) DESTDIR=$(STAGING_DIR) \
> > +               libdir=/usr/lib includedir=/usr/include \
> > +               common-install
> > +endef
> > +
> > +RE2_POST_INSTALL_STAGING_HOOKS += RE2_INSTALL_PKG_CONFIG
> > +
> >  $(eval $(cmake-package))
> >  $(eval $(host-cmake-package))
> >
> > Regards,
> > Peter
> >
> > [1] https://github.com/macports/macports-ports/pull/9836#issuecomment-807868854
> 
> There's a problem with this approach, the makefile with common-install
> gets overwritten
> by the one generated by cmake if cmake is used.

It currently gets overwritten, because the build is done in-tree, but
What Peter suggests is doing the build out-of-tree, with:
    RE2_SUPPORTS_IN_SOURCE_BUILD = NO

However, I can't say that I am very fond of this option either. Misinx
the two buildsystems looks icky... What bothers me a bit, is that
common-install also installs the headers, not just the re2.pc, so this
could, even if unlikely, conflict with what the cmake-side would do.

But when looking at the various bugs about this issue:

    https://github.com/google/re2/issues/349
     -> https://github.com/google/re2/issues/304#issuecomment-808219200
         -> https://github.com/macports/macports-ports/pull/9836

    re2: change to cmake build to support gprc, which currently needs a
    cmake version of re2 to build. Try to make it work like the previous
    autotools build worked.

So, that last issue, against homebrew, is interesting: it seems that
using the Makefile-based buildsystem is not enough, because it does not
isntall the cmake equivalent of re2.pc, which breaks grpc.

So, whether we keep the cmake build, or switch to the Makefile build, we
would eventually still miss some pieces...

Damn, back to square-one...

So, I think that Peter's proposal is not so un-appealing, in then end.
But then in such situation, I think it would be simpler for us to just
apply something like:

    define RE2_INSTALL_PC
        $(INTALL) -d -m 0644 $(@D)/re2.pc \
            $(STAGING_DIR)/usr/lib/pkgconfig/re2.pc
        $(SED) 's,@includedir@,/usr/include,; s,@libdir@,/usr/lib,' \
            $(STAGING_DIR)/usr/lib/pkgconfig/re2.pc
    endef
    RE2_POST_STAGING_INSTALL_HOOKS += RE2_INSTALL_PC

And be done with it: minimal change to the re2 package, no dual-buildsystem
situation and thus no install conflict on the headers, usual and simple
post-install hook.

Thoughts?

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
