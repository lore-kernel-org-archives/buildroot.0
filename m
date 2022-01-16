Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB2C4C433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 10:46:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 706B860AAD;
	Sun, 16 Jan 2022 10:46:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vTU0p0uFyhwM; Sun, 16 Jan 2022 10:46:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5103C60AE4;
	Sun, 16 Jan 2022 10:46:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9B2EE1BF426
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:45:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8201D826FF
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 10:45:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id UVsS8D_Ovnww for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 10:45:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x335.google.com (mail-ot1-x335.google.com
 [IPv6:2607:f8b0:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3C8F3826FB
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 10:45:57 +0000 (UTC)
Received: by mail-ot1-x335.google.com with SMTP id
 g1-20020a9d6481000000b00592d01f2b6eso11970413otl.5
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 02:45:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ol7jPCT5055L1IaVjEAtkGFmHMxE9fwM50xXJc0gUMk=;
 b=e2TqGzPEGtAIuW/oG2M0kAjFkO8B1AKbUiZJFK8f2Bvalqr9WjSU7zCmHQuOXmp+P1
 mNQz+YCMkZ65Ry2QBkeqcWimEnEYrSGRiYh8CS7/UrIUYvCGOMzAZLAAYO236Pp9AToV
 kPJ2hyBRTOOg+5mWTA4CmLIDY6qasmGMNCoGAz1/8X0YLvV9NxULw2Ma2GVikUvTE/F5
 QUkT5dKnDBwJZj1876NyyQo2ZnVsXXDNEgBsEn4Iod32LTsVWCn/F05/kWjevk4KRZ4m
 hScV8WOzwUrl0aqFZG9/ie53bBL8r7Di6NxFkgU6XA6kIZ4qPsI3kWybSeajDYpqDopZ
 j2tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ol7jPCT5055L1IaVjEAtkGFmHMxE9fwM50xXJc0gUMk=;
 b=SPt955jVxj9m6UfYfK42d3YoFeKWNKAEwfQmFfXC84Rbtg4idZ9Ew+2A+ADGhQIc4w
 ZVSFHHfAHMDCk1zHOoQa72aJL9kLbXmvhWTzzUyqYXbBd/JK9osvq1xX26JG4R91PE7k
 tQZnzh6rxdMpv5f1Nw8bgRXn2ISkm6QTdTVjDrnPfwBk/YkkQMeXAO29mlELhw6AAwhm
 oA3W/YytksnT/VB+QpfQDb96ut6ynGwGqHVq53P+SxYqC9+kNdQuRZC0LJ1X7+xbquJu
 7g99NAWOMiLDAGWpq/sOjTbBHw2ADtZtavc5wZ/GA0TuaZuWg6mshl2wBN1HbC9Oax1S
 DX/Q==
X-Gm-Message-State: AOAM532Slhthj16CXmdY8rq6Y0/+PhLTcSfG/WLY9SMLG7IvnaQlG4TA
 HS7kSgh9sDKZJaVHjyp2LWHstheNS8txHQX/B9YJqytrgE0=
X-Google-Smtp-Source: ABdhPJwg8I81CCCArh4pJhHeiLV/FwN2wvnFXCjyYSt4Y+vIy0XIGMvm2iyOMYtVWeXb4MWC1XOr85V+alMMvoBpy6c=
X-Received: by 2002:a9d:63c3:: with SMTP id e3mr9178654otl.30.1642329956111;
 Sun, 16 Jan 2022 02:45:56 -0800 (PST)
MIME-Version: 1.0
References: <20220112203939.606775-1-james.hilliard1@gmail.com>
 <20220115233736.634f0d0b@gmx.net>
 <CADvTj4pFsYA+vaz4k6Fru9KnuRUeHmZ6QhQP_WJsxS+kHy1qdw@mail.gmail.com>
 <20220116101901.23db5faa@gmx.net>
 <CADvTj4rT_wwssYQ3FGRQza5oVdbGyTvf6AM3Yx-_VKg_GWnrnQ@mail.gmail.com>
In-Reply-To: <CADvTj4rT_wwssYQ3FGRQza5oVdbGyTvf6AM3Yx-_VKg_GWnrnQ@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sun, 16 Jan 2022 03:45:45 -0700
Message-ID: <CADvTj4p2v4gr77vE_zDJ436Wm-kuvzBmwvr5pg96cS-6kw2hXw@mail.gmail.com>
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

On Sun, Jan 16, 2022 at 3:28 AM James Hilliard
<james.hilliard1@gmail.com> wrote:
>
> On Sun, Jan 16, 2022 at 2:19 AM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > Hello James,
> >
> > On Sat, 15 Jan 2022 22:08:57 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > > On Sat, Jan 15, 2022 at 3:37 PM Peter Seiderer <ps.report@gmx.net> wrote:
> > > >
> > > > Hello James, *,
> > > >
> > > > On Wed, 12 Jan 2022 13:39:39 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:
> > > >
> > > > > Currently the qmake gcc sysrootify path logic causes issues with
> > > > > per-package directories, disable automatic gcc sysroot for qt5base
> > > > > install and override all qt.conf paths manually to point to their
> > > > > correct locations.
> > > > >
> > > > > Redirect HostData to STAGING_DIR as mkspecs need to be available there
> > > > > instead of the HOST_DIR for cross compilation to work.
> > > > >
> > > > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > > > ---
> > > > >  package/qt5/qt5base/qt.conf.in | 18 +++++++++++++++---
> > > > >  package/qt5/qt5base/qt5base.mk |  2 ++
> > > > >  2 files changed, 17 insertions(+), 3 deletions(-)
> > > > >
> > > > > diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
> > > > > index 2215cbd4e1..db9ab0c364 100644
> > > > > --- a/package/qt5/qt5base/qt.conf.in
> > > > > +++ b/package/qt5/qt5base/qt.conf.in
> > > > > @@ -2,6 +2,18 @@
> > > > >  Prefix=/usr
> > > > >  HostPrefix=@@HOST_DIR@@
> > > > >  Sysroot=@@STAGING_DIR@@
> > > > > -Headers=/usr/include/qt5
> > > > > -Plugins=/usr/lib/qt/plugins
> > > > > -Examples=/usr/lib/qt/examples
> > > > > +SysrootifyPrefix=false
> > > > > +Binaries=@@STAGING_DIR@@/usr/bin
> > > > > +Libraries=@@STAGING_DIR@@/usr/lib
> > > > > +Headers=@@STAGING_DIR@@/usr/include/qt5
> > > > > +Plugins=@@STAGING_DIR@@/usr/lib/qt/plugins
> > > > > +Examples=@@STAGING_DIR@@/usr/lib/qt/examples
> > > > > +Data=@@STAGING_DIR@@
> > > > > +Translations=@@STAGING_DIR@@/translations
> > > > > +ArchData=@@STAGING_DIR@@/usr
> > > > > +LibraryExecutables=@@STAGING_DIR@@/usr/libexec
> > > > > +Imports=@@STAGING_DIR@@/usr/imports
> > > > > +Qml2Imports=@@STAGING_DIR@@/usr/qml
> > > > > +HostBinaries=@@HOST_DIR@@/bin
> > > > > +HostLibraries=@@HOST_DIR@@/lib
> > > > > +HostData=@@STAGING_DIR@@
> > > > > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> > > > > index bcdf036f00..6c05e710d8 100644
> > > > > --- a/package/qt5/qt5base/qt5base.mk
> > > > > +++ b/package/qt5/qt5base/qt5base.mk
> > > > > @@ -311,8 +311,10 @@ define QT5BASE_CONFIGURE_CMDS
> > > > >               -v \
> > > > >               -prefix /usr \
> > > > >               -hostprefix $(HOST_DIR) \
> > > > > +             -hostdatadir $(STAGING_DIR) \
> > > > >               -headerdir /usr/include/qt5 \
> > > > >               -sysroot $(STAGING_DIR) \
> > > > > +             -no-gcc-sysroot \
> > > > >               -plugindir /usr/lib/qt/plugins \
> > > > >               -examplesdir /usr/lib/qt/examples \
> > > > >               -no-rpath \
> > > >
> > > > This one leads to the following compile failure for qt5webengine-5.15.2:
> > > >
> > > >   .../host/lib/gcc/arm-buildroot-linux-gnueabihf/10.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: cannot find crti.o: No such file or directory
> > > > collect2: error: ld returned 1 exit status
> > >
> > > So I was able to reproduce this error, however best I can tell it's
> > > probably not a regression
> >
> > This is a known failure, see the patches adding host-freetype/host-libjepeg/host-harfbuzz ([1])
> > or your own qt5webengine bump adding host-freetype dependency ([2])...
>
> So there's a major pkg-config bug here, I partially fixed it here but
> it seems gn
> is mangling some of the paths after getting them from pkg-config:
> https://patchwork.ozlabs.org/project/buildroot/patch/20220116101739.2623120-1-james.hilliard1@gmail.com/
>
> This gets the target pkg-config paths set up right at least
> output/build/qt5webengine-5.15.2/src/core/release/args.gn:
> pkg_config = "/home/buildroot/buildroot/output/host/bin/pkg-config"
> host_pkg_config =
> "/home/buildroot/buildroot/output/build/qt5webengine-5.15.2/host-bin/host-pkg-config"
>
> However gn I think is prepending the target_sysroot to the include
> paths or something:
> target_sysroot =
>     "/home/buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot"
>
> which causes this error:
> /home/buildroot/buildroot/output/host/bin/aarch64-linux-g++ -MMD -MF
> obj/crypto/crypto/nss_util.o.d -DCRYPTO_IMPLEMENTATION -DUSE_UDEV
> -DUSE_AURA=1 -DUSE_NSS_CERTS=1 -DUSE_OZONE=1 -DOFFICIAL_BUILD
> -DTOOLKIT_QT -D_FILE_OFFSET_BITS=64 -D_LARGEFILE_SOURCE
> -D_LARGEFILE64_SOURCE -DNO_UNWIND_TABLES -D__STDC_CONSTANT_MACROS
> -D__STDC_FORMAT_MACROS
> -DCR_SYSROOT_HASH=2cade9ee1ca9186b28ac768c19e1ab7c45ee0600 -DNDEBUG
> -DNVALGRIND -DDYNAMIC_ANNOTATIONS_ENABLED=0 -Igen
> -I../../3rdparty/chromium
> -I../../3rdparty/chromium/third_party/boringssl/src/include
> -fno-strict-aliasing --param=ssp-buffer-size=4 -fstack-protector
> -fno-unwind-tables -fno-asynchronous-unwind-tables -fPIC -pipe
> -pthread -Wall -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2
> -Wno-unused-local-typedefs -Wno-maybe-uninitialized
> -Wno-deprecated-declarations -fno-delete-null-pointer-checks
> -Wno-comments -Wno-packed-not-aligned -Wno-dangling-else
> -Wno-missing-field-initializers -Wno-unused-parameter -O2 -fno-ident
> -fdata-sections -ffunction-sections -fno-omit-frame-pointer -g0
> -fvisibility=hidden
> -I/home/buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/home/buildroot/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/include/nss
> -I/home/buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/home/buildroot/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/include/nspr
> -std=gnu++14 -Wno-narrowing -Wno-class-memaccess -Wno-attributes
> -Wno-class-memaccess -Wno-subobject-linkage -Wno-invalid-offsetof
> -Wno-return-type -Wno-deprecated-copy -fno-exceptions -fno-rtti
> --sysroot=../../../../../host/aarch64-buildroot-linux-gnu/sysroot
> -fvisibility-inlines-hidden -c
> ../../3rdparty/chromium/crypto/nss_util.cc -o
> obj/crypto/crypto/nss_util.o
> ../../3rdparty/chromium/crypto/nss_util.cc:8:10: fatal error:
> pk11pub.h: No such file or directory
>     8 | #include <pk11pub.h>
>       |          ^~~~~~~~~~~
>
> The include path being set by gn doesn't exist, although it's at least
> trying to use the
> target variant now:
> /home/buildroot/buildroot/output/host/aarch64-buildroot-linux-gnu/sysroot/home/buildroot/buildroot/output/host/bin/../aarch64-buildroot-linux-gnu/sysroot/usr/include/nss

Hmm, so I think I found a way to get that to not happen by setting
PKG_CONFIG_SYSROOT_DIR="/":
https://patchwork.ozlabs.org/project/buildroot/patch/20220116104321.2696659-1-james.hilliard1@gmail.com/

>
> >
> > Additional the SIGSTKSZ fix is needed...
>
> Yeah, on newer glibc's it's needed.
>
> >
> > Regards,
> > Peter
> >
> > [1] http://lists.busybox.net/pipermail/buildroot/2022-January/634005.html
> > [2] http://lists.busybox.net/pipermail/buildroot/2022-January/633439.html
> >
> >
> > > as the compilation still fails due to a different error without this patch:
> > >
> > > ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned
> > > non-zero exit code.
> > >     pkgresult = exec_script(pkg_config_script, args, "value")
> > >                 ^----------
> > > Current dir: /home/buildroot/buildroot/output/build/qt5webengine-5.15.2/src/core/release/
> > > Command: /home/buildroot/buildroot/output/host/bin/python2
> > > /home/buildroot/buildroot/output/build/qt5webengine-5.15.2/src/3rdparty/chromium/build/config/linux/pkg-config.py
> > > -p /home/buildroot/buildroot/output/build/qt5webengine-5.15.2/host-bin/host-pkg-config
> > > libjpeg
> > > Returned 1.
> > > stderr:
> > >
> > > Package libjpeg was not found in the pkg-config search path.
> > > Perhaps you should add the directory containing `libjpeg.pc'
> > > to the PKG_CONFIG_PATH environment variable
> > > Package 'libjpeg', required by 'virtual:world', not found
> > > Could not run pkg-config.
> > >
> > > See //third_party/BUILD.gn:17:3: whence it was called.
> > >   pkg_config("system_libjpeg") {
> > >   ^-----------------------------
> > > See //third_party/blink/renderer/platform/BUILD.gn:159:5: which caused
> > > the file to be included.
> > >     "//third_party:jpeg",
> > >     ^-------------------
> > > Project ERROR: GN run error!
> > >
> > > >
> > > >
> > > > But the file crti.o exists:
> > > >
> > > >         $ find . -name crti.o
> > > >         ./build/glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/build/csu/crti.o
> > > >         ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/crti.o
> > > >
> > > >
> > > > Did not (yet) test with your latest (v2) patch iteration...
> > > >
> > > > Compile with qt5webengine bump to 5.15.8-lts fails already before the linking stage
> > > > (see secoidt.h/pk11pub.h No such file or directory failure reported by already by
> > > > Thomas)...
> > > >
> > > > Regards,
> > > > Peter
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
