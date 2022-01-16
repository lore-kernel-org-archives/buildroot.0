Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C029C433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 01:34:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id D0348403AA;
	Sun, 16 Jan 2022 01:34:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id B2818kTreCyz; Sun, 16 Jan 2022 01:34:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEB1E4017B;
	Sun, 16 Jan 2022 01:34:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0F1ED1BF3DA
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 01:34:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F2133403EC
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 01:34:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id X0EB_ReeR0Nu for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 01:34:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22c.google.com (mail-oi1-x22c.google.com
 [IPv6:2607:f8b0:4864:20::22c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C13784032E
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 01:34:48 +0000 (UTC)
Received: by mail-oi1-x22c.google.com with SMTP id x193so18227958oix.0
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 17:34:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2xi784Zrk6h5BF7MSk5aywz6mcufBIRcq8Ar1udFnYE=;
 b=hecv/GugLx8TmhNy/B2Kfbg/A/NT+S16C0/YEVlW7HrrpTJtZxA7jNYLgPue2uf0EN
 7ltKJ/4LzovaInhW+Yu/GTLgaVP6CTXSAxF+o1WUnxTZRdTbDNfY/1yE95ov2czEBkr+
 0LtqOl/cgWsW6BsKfNv5VdSujB59XpSSNpb3yJU7nIxOtx6TOL4srZYsVcAiA3aIZeLr
 Gx65xxA3Mki3EPcYOt61Y0SxPgzqVsCRyCZexy28eOXRBf+Krad+CrdSRw0rHmFnHNia
 Qdx9JfW04zNjtTxGgJV4zerG5EqTOxtYjDSU6I4OFN0JOc/GH79U7ffRwv9CUUEMF5JL
 9EVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2xi784Zrk6h5BF7MSk5aywz6mcufBIRcq8Ar1udFnYE=;
 b=JXpZZZYZoKrl2I40ISyOMVhsAByOlOtfdIcsSmSU7XPxjI7RPkvPafADP0J7d4ZCJX
 O3eg4cmE2qtSG0ny8GkCFEOSkY1R1k2yg/u3irHehejkyXLEyzay16KhOeqsjfF4YTWf
 MqfcSvnOsqArjJXyMHxqxHrUXqOCazPJwEYHPkCHobGRsOyVW9NPWWIxM1RmCzoWVfAX
 l2X0sICthAb32kaBA98hLJJMzpvP5EofMCM9IjemKi/KobNIL8uHIZw+18IF8Poc08JE
 S9A7Az4p/sQqc/BPWkLZQZbnf3QUT+cs8q8XqPdQrmGQ8S5HTo9ZqyyZAVe7iY6ViVoL
 Nauw==
X-Gm-Message-State: AOAM5335pxJKItf7PYrs7JyX+wU8WK/S40VCLdtlHZjiOVw8bvScYXnd
 un0n5toA1mgDIydA+prWz1YDSDcRaAEYMMU7TMP7uCGwuGc=
X-Google-Smtp-Source: ABdhPJyrM3vDlpNf5yA8mbc6ubZL8HggI05ql4u2yvmK3kYoewDvZeaeEzYD5qRPLTmwuNEU3uWMQeYV4lIea9r/8zQ=
X-Received: by 2002:a05:6808:f8d:: with SMTP id
 o13mr16976693oiw.67.1642296887619; 
 Sat, 15 Jan 2022 17:34:47 -0800 (PST)
MIME-Version: 1.0
References: <20220112203939.606775-1-james.hilliard1@gmail.com>
 <20220115233736.634f0d0b@gmx.net>
In-Reply-To: <20220115233736.634f0d0b@gmx.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 15 Jan 2022 18:34:36 -0700
Message-ID: <CADvTj4oZfgo1UuSBW1Ar-8jr9TfD0UG54=o9yDLQ3o9Qe03+AA@mail.gmail.com>
To: Peter Seiderer <ps.report@gmx.net>
Subject: Re: [Buildroot] [PATCH 1/1] package/qt5/qt5base: disable broken
 qmake sysrootify
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
Cc: Julien Corjon <corjon.j@ecagroup.com>, buildroot <buildroot@buildroot.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

On Sat, Jan 15, 2022 at 3:37 PM Peter Seiderer <ps.report@gmx.net> wrote:
>
> Hello James, *,
>
> On Wed, 12 Jan 2022 13:39:39 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:
>
> > Currently the qmake gcc sysrootify path logic causes issues with
> > per-package directories, disable automatic gcc sysroot for qt5base
> > install and override all qt.conf paths manually to point to their
> > correct locations.
> >
> > Redirect HostData to STAGING_DIR as mkspecs need to be available there
> > instead of the HOST_DIR for cross compilation to work.
> >
> > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > ---
> >  package/qt5/qt5base/qt.conf.in | 18 +++++++++++++++---
> >  package/qt5/qt5base/qt5base.mk |  2 ++
> >  2 files changed, 17 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
> > index 2215cbd4e1..db9ab0c364 100644
> > --- a/package/qt5/qt5base/qt.conf.in
> > +++ b/package/qt5/qt5base/qt.conf.in
> > @@ -2,6 +2,18 @@
> >  Prefix=/usr
> >  HostPrefix=@@HOST_DIR@@
> >  Sysroot=@@STAGING_DIR@@
> > -Headers=/usr/include/qt5
> > -Plugins=/usr/lib/qt/plugins
> > -Examples=/usr/lib/qt/examples
> > +SysrootifyPrefix=false
> > +Binaries=@@STAGING_DIR@@/usr/bin
> > +Libraries=@@STAGING_DIR@@/usr/lib
> > +Headers=@@STAGING_DIR@@/usr/include/qt5
> > +Plugins=@@STAGING_DIR@@/usr/lib/qt/plugins
> > +Examples=@@STAGING_DIR@@/usr/lib/qt/examples
> > +Data=@@STAGING_DIR@@
> > +Translations=@@STAGING_DIR@@/translations
> > +ArchData=@@STAGING_DIR@@/usr
> > +LibraryExecutables=@@STAGING_DIR@@/usr/libexec
> > +Imports=@@STAGING_DIR@@/usr/imports
> > +Qml2Imports=@@STAGING_DIR@@/usr/qml
> > +HostBinaries=@@HOST_DIR@@/bin
> > +HostLibraries=@@HOST_DIR@@/lib
> > +HostData=@@STAGING_DIR@@
> > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> > index bcdf036f00..6c05e710d8 100644
> > --- a/package/qt5/qt5base/qt5base.mk
> > +++ b/package/qt5/qt5base/qt5base.mk
> > @@ -311,8 +311,10 @@ define QT5BASE_CONFIGURE_CMDS
> >               -v \
> >               -prefix /usr \
> >               -hostprefix $(HOST_DIR) \
> > +             -hostdatadir $(STAGING_DIR) \
> >               -headerdir /usr/include/qt5 \
> >               -sysroot $(STAGING_DIR) \
> > +             -no-gcc-sysroot \
> >               -plugindir /usr/lib/qt/plugins \
> >               -examplesdir /usr/lib/qt/examples \
> >               -no-rpath \
>
> This one leads to the following compile failure for qt5webengine-5.15.2:
>
>   .../host/lib/gcc/arm-buildroot-linux-gnueabihf/10.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: cannot find crti.o: No such file or directory
> collect2: error: ld returned 1 exit status

Hmm, I'll test that again.

>
>
> But the file crti.o exists:
>
>         $ find . -name crti.o
>         ./build/glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/build/csu/crti.o
>         ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/crti.o
>
>
> Did not (yet) test with your latest (v2) patch iteration...
>
> Compile with qt5webengine bump to 5.15.8-lts fails already before the linking stage
> (see secoidt.h/pk11pub.h No such file or directory failure reported by already by
> Thomas)...

Does qt5webengine build ok without per-package directories with just
the KDE bump
for all the other qt5 packages?:
https://patchwork.ozlabs.org/project/buildroot/patch/20220113000935.2353800-1-james.hilliard1@gmail.com/

I separated that out to make it easier to isolate the linker issues
with the qt5webengine
5.15.8-lts build.

>
> Regards,
> Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
