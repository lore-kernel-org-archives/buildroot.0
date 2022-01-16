Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6037C433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 09:19:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2ABD460BF0;
	Sun, 16 Jan 2022 09:19:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id up1DBkdeGnJg; Sun, 16 Jan 2022 09:19:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4CFDC60BF8;
	Sun, 16 Jan 2022 09:19:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CBEB01BF47A
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 09:19:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B9CAE4067F
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 09:19:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=gmx.net
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eB_FEQ-EoA2A for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 09:19:11 +0000 (UTC)
X-Greylist: domain auto-whitelisted by SQLgrey-1.8.0
Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E4698405E7
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 09:19:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
 s=badeba3b8450; t=1642324744;
 bh=YkU9TXcKXodA0t9zv9Q53pha6uv8fZDcDgQCjdymBb0=;
 h=X-UI-Sender-Class:Date:From:To:Cc:Subject:In-Reply-To:References;
 b=ctINwbkdlo0wmTuWG11+x9IOoWPgt5aW8wF2nnPgDoSVRO9NBI9CmHLceQmGUlMTS
 2rJlCXULnG6mQyOnnNj08sim51LSiucvanjfcYOkTlORd0wJa/M68BTbbNGVqScc3c
 +wsj1utHwwb68bnKWdVD2Fxq7LSC/QPS7e3RG3kU=
X-UI-Sender-Class: 01bb95c1-4bf8-414a-932a-4f6e2808ef9c
Received: from localhost ([62.216.209.238]) by mail.gmx.net (mrgmx005
 [212.227.17.190]) with ESMTPSA (Nemesis) id 1Mt75H-1mJxMv2Zon-00tWLp; Sun, 16
 Jan 2022 10:19:04 +0100
Date: Sun, 16 Jan 2022 10:19:01 +0100
From: Peter Seiderer <ps.report@gmx.net>
To: James Hilliard <james.hilliard1@gmail.com>
Message-ID: <20220116101901.23db5faa@gmx.net>
In-Reply-To: <CADvTj4pFsYA+vaz4k6Fru9KnuRUeHmZ6QhQP_WJsxS+kHy1qdw@mail.gmail.com>
References: <20220112203939.606775-1-james.hilliard1@gmail.com>
 <20220115233736.634f0d0b@gmx.net>
 <CADvTj4pFsYA+vaz4k6Fru9KnuRUeHmZ6QhQP_WJsxS+kHy1qdw@mail.gmail.com>
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.31; x86_64-suse-linux-gnu)
MIME-Version: 1.0
X-Provags-ID: V03:K1:C04smcPIDQug/Jygi79TLRK2tQGBTq6RInRjpAgLuAlXpaqfj6p
 E9YijxSeGxk9mDIxGK7y5XOH0mOR2O7utAzv3YzQjdHtISkLh8vrGHsHF7SN1tBE1xnlY36
 vV6KxW9wiIu/zhco1ciZ1HNPzYw155vf4CXCznog380TsPyhEgPonrT6nsEAoQv9OsEIqTh
 kBQB3rAPZizJvBiXi6LkQ==
X-UI-Out-Filterresults: notjunk:1;V03:K0:fIMHLVhgQIg=:FnNZaSEIZyBb5ZCjMCgaNs
 Ft3D1in7SWpM8IE2fhLh3akUgLfTQSpU9smDUC3jgUGRHjJq3+5LBiT9+yqSiOYpYZodlRHAu
 8nHTJVzIBvpG/I0wqcJGylXG+otvSWCfz+vkMwQHW8Zczj8J1KZi/ZTFtWVpZiIPA4uIP0zzz
 1rN9+eeQ8WaU9aj9qlB4j0t+HDsDntp2b8Iig+VUuv/jlfsbGPl0Bd8rAY6uzTsNd1CaO983f
 2SY1okvNqhXhr+iNY5dfIgoQujtI/P+knXKKLAP7l7ZLJ2/G2ldZNZXdu++Q0f7CZ97BAgu5q
 WizHiGAuqSB4MgOXsltJ3aYnFEs7qr4nceKjBDVX/RdJMDuX4FvrOfJJ/WL7WQka5ugpyywBp
 amqoQhNB7sDFMY1RZ/eAQHh7ua8Q+Oyv4WdVV+KFh9q7WF8UxRHURtsk3s5Fas4evViyFcij9
 lppEAmzgQdhhlYLwRZdhMKzBe0zdKKUgzd0uLuzIojbhT1gaA2kH82OnTTGp+OlRqYDDvLiCd
 vNonekD7AZKoKhSAsKR5fYam5/QfaWr/LmOk3ISRnXQkMHK3B2XsO6UhMBtkCuyIN8AG6GvU4
 yfMFaFPRE/EdaX8xTbRl0tFwgrT6tSJiPvHiG8cG+aMuuM+mmHUPayTuHO74t3gmnlfxHwahj
 1RauiYbGEfIQgfTH7wHd9MdS2sdr3JCdJ9vy+JW5Jgb1bY+4OuEEo97ZIUPoNWkc/KLMi8CSF
 rMlIwLIqgh6QKXWp4rpB++iFzc692VW9yXx+CXB7sEQEXTlGdNY/MEryn+/nPHeAbeESDHpPn
 c+0Un8c3r5kkLaOl9udvi/qCXwMwRtZGbgTPA7v+J6iOcz+zk6HqsCmk7agjMIKDgRGRdFP7R
 qw2trAYf36KzgcytO41vsnhkbES1QZsFeEl1c/KeF0rzae+mFDercX0OUe6cEC5By9g+hQSxw
 Qa0RaqFm5ide5brrA1CnuO9fBNb4gPcoFVv+BNKd+KQx++tk+jKFeQqnGXITH7urbul8U9/3c
 0Bxqr5IEosTwagOTDZupPtY1Ph8mUJLM/hRy2pdkpnKtDCbmmcRk1gzX2tLeH+sL6aGWPbTiu
 SUVOaNSsnSMLps=
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

Hello James,

On Sat, 15 Jan 2022 22:08:57 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:

> On Sat, Jan 15, 2022 at 3:37 PM Peter Seiderer <ps.report@gmx.net> wrote:
> >
> > Hello James, *,
> >
> > On Wed, 12 Jan 2022 13:39:39 -0700, James Hilliard <james.hilliard1@gmail.com> wrote:
> >
> > > Currently the qmake gcc sysrootify path logic causes issues with
> > > per-package directories, disable automatic gcc sysroot for qt5base
> > > install and override all qt.conf paths manually to point to their
> > > correct locations.
> > >
> > > Redirect HostData to STAGING_DIR as mkspecs need to be available there
> > > instead of the HOST_DIR for cross compilation to work.
> > >
> > > Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
> > > ---
> > >  package/qt5/qt5base/qt.conf.in | 18 +++++++++++++++---
> > >  package/qt5/qt5base/qt5base.mk |  2 ++
> > >  2 files changed, 17 insertions(+), 3 deletions(-)
> > >
> > > diff --git a/package/qt5/qt5base/qt.conf.in b/package/qt5/qt5base/qt.conf.in
> > > index 2215cbd4e1..db9ab0c364 100644
> > > --- a/package/qt5/qt5base/qt.conf.in
> > > +++ b/package/qt5/qt5base/qt.conf.in
> > > @@ -2,6 +2,18 @@
> > >  Prefix=/usr
> > >  HostPrefix=@@HOST_DIR@@
> > >  Sysroot=@@STAGING_DIR@@
> > > -Headers=/usr/include/qt5
> > > -Plugins=/usr/lib/qt/plugins
> > > -Examples=/usr/lib/qt/examples
> > > +SysrootifyPrefix=false
> > > +Binaries=@@STAGING_DIR@@/usr/bin
> > > +Libraries=@@STAGING_DIR@@/usr/lib
> > > +Headers=@@STAGING_DIR@@/usr/include/qt5
> > > +Plugins=@@STAGING_DIR@@/usr/lib/qt/plugins
> > > +Examples=@@STAGING_DIR@@/usr/lib/qt/examples
> > > +Data=@@STAGING_DIR@@
> > > +Translations=@@STAGING_DIR@@/translations
> > > +ArchData=@@STAGING_DIR@@/usr
> > > +LibraryExecutables=@@STAGING_DIR@@/usr/libexec
> > > +Imports=@@STAGING_DIR@@/usr/imports
> > > +Qml2Imports=@@STAGING_DIR@@/usr/qml
> > > +HostBinaries=@@HOST_DIR@@/bin
> > > +HostLibraries=@@HOST_DIR@@/lib
> > > +HostData=@@STAGING_DIR@@
> > > diff --git a/package/qt5/qt5base/qt5base.mk b/package/qt5/qt5base/qt5base.mk
> > > index bcdf036f00..6c05e710d8 100644
> > > --- a/package/qt5/qt5base/qt5base.mk
> > > +++ b/package/qt5/qt5base/qt5base.mk
> > > @@ -311,8 +311,10 @@ define QT5BASE_CONFIGURE_CMDS
> > >               -v \
> > >               -prefix /usr \
> > >               -hostprefix $(HOST_DIR) \
> > > +             -hostdatadir $(STAGING_DIR) \
> > >               -headerdir /usr/include/qt5 \
> > >               -sysroot $(STAGING_DIR) \
> > > +             -no-gcc-sysroot \
> > >               -plugindir /usr/lib/qt/plugins \
> > >               -examplesdir /usr/lib/qt/examples \
> > >               -no-rpath \
> >
> > This one leads to the following compile failure for qt5webengine-5.15.2:
> >
> >   .../host/lib/gcc/arm-buildroot-linux-gnueabihf/10.3.0/../../../../arm-buildroot-linux-gnueabihf/bin/ld: cannot find crti.o: No such file or directory
> > collect2: error: ld returned 1 exit status
>
> So I was able to reproduce this error, however best I can tell it's
> probably not a regression

This is a known failure, see the patches adding host-freetype/host-libjepeg/host-harfbuzz ([1])
or your own qt5webengine bump adding host-freetype dependency ([2])...

Additional the SIGSTKSZ fix is needed...

Regards,
Peter

[1] http://lists.busybox.net/pipermail/buildroot/2022-January/634005.html
[2] http://lists.busybox.net/pipermail/buildroot/2022-January/633439.html


> as the compilation still fails due to a different error without this patch:
>
> ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned
> non-zero exit code.
>     pkgresult = exec_script(pkg_config_script, args, "value")
>                 ^----------
> Current dir: /home/buildroot/buildroot/output/build/qt5webengine-5.15.2/src/core/release/
> Command: /home/buildroot/buildroot/output/host/bin/python2
> /home/buildroot/buildroot/output/build/qt5webengine-5.15.2/src/3rdparty/chromium/build/config/linux/pkg-config.py
> -p /home/buildroot/buildroot/output/build/qt5webengine-5.15.2/host-bin/host-pkg-config
> libjpeg
> Returned 1.
> stderr:
>
> Package libjpeg was not found in the pkg-config search path.
> Perhaps you should add the directory containing `libjpeg.pc'
> to the PKG_CONFIG_PATH environment variable
> Package 'libjpeg', required by 'virtual:world', not found
> Could not run pkg-config.
>
> See //third_party/BUILD.gn:17:3: whence it was called.
>   pkg_config("system_libjpeg") {
>   ^-----------------------------
> See //third_party/blink/renderer/platform/BUILD.gn:159:5: which caused
> the file to be included.
>     "//third_party:jpeg",
>     ^-------------------
> Project ERROR: GN run error!
>
> >
> >
> > But the file crti.o exists:
> >
> >         $ find . -name crti.o
> >         ./build/glibc-2.34-9-g9acab0bba6a5a57323b1f94bf95b21618a9e5aa4/build/csu/crti.o
> >         ./host/arm-buildroot-linux-gnueabihf/sysroot/usr/lib/crti.o
> >
> >
> > Did not (yet) test with your latest (v2) patch iteration...
> >
> > Compile with qt5webengine bump to 5.15.8-lts fails already before the linking stage
> > (see secoidt.h/pk11pub.h No such file or directory failure reported by already by
> > Thomas)...
> >
> > Regards,
> > Peter
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
