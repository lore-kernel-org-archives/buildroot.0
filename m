Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA45BC433EF
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 05:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2EC7E400F8;
	Sun, 16 Jan 2022 05:09:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5s1eFlkVE-u3; Sun, 16 Jan 2022 05:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5A52A401AD;
	Sun, 16 Jan 2022 05:09:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0021A1BF588
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 05:09:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC1CA8266D
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 05:09:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aZxWG1N7YtCy for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 05:09:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com
 [IPv6:2607:f8b0:4864:20::32a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0CAD82512
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 05:09:09 +0000 (UTC)
Received: by mail-ot1-x32a.google.com with SMTP id
 l64-20020a9d1b46000000b005983a0a8aaaso2818757otl.3
 for <buildroot@buildroot.org>; Sat, 15 Jan 2022 21:09:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=alSRvJF1b7M6dOGwXl/Fo5kXrafm4KNG1QUjPQZFDpw=;
 b=eC/AUCUhv96T9wbVzNOxrjujg+3hPAm/jTpklgNIgjJPu762zIMw6yQCLZ2C9meP4D
 +Urh5Udiu8Rj/Cj8notoOh+IfLe7sfhfZhAlzn0eC8ePwdQXHYlXaJkuEsC4BSDwzn/p
 ElhhkcMKbo3trdeOImCQH/QYL5q5jfOBL6na7Yll4F1Cl7TtXTdy1FtLs/mcPEqtD5IE
 l1rVc2Q69hbDKV6DgKeq+7hShbAGmVy59Q9YVQqPn3vGZL1r+jBqBorga5ML3pFcDo1b
 HMrvVIBM99gJX7Hsf+C+qGcoUur7Msqr8mF+bkiuCdTQL9z2gdA+uErVuVVGitLkW4Ea
 HheQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=alSRvJF1b7M6dOGwXl/Fo5kXrafm4KNG1QUjPQZFDpw=;
 b=vtz5T4vgP2UDw6jPj56vYJJl1sco6rfTvbtOErJcpKbICgyVjoeyj3s1xc/3QNQc+r
 BpE3GzHfL91JwR9n40xnxb8Tfuk3Vi0sNENix6Iry69VEnvYvO73bgwChe5YVqybJvVC
 w2+Ce+L9DEYVNS7k/6iI1jJ19MqvJr9qKGapLnthvTbppXC5TUXsZ+vU21hvE+k/0FgK
 nUlmKdcttQYkLbhRe3b4LlE7CP43zPq9q1oqRh0fNbOzq0Lg0f5LsdkO5X1qncCpr955
 PiZYAO9TI4OJPJK14ep2ujU/KJlb9pkufsQ5coK/b/j4rpxO01R7KBw0HEPQaqYlJ0nD
 nOBg==
X-Gm-Message-State: AOAM532Yt/SHFL7QWO/hvBG/atew9Doxn/qPzjl38AgHhZy3hPmw46B/
 mbz0ZaUa9xfKUYFVtR2mR1ncP2WkpjBafoELA3M=
X-Google-Smtp-Source: ABdhPJz32e4eegdQ7atj646N3HWAqbyFydBhaFdmljAa8uatRcJ7VeQU0TeSM0l6HHYCpMcuauee08n0E0Ga36ELnVs=
X-Received: by 2002:a9d:63c3:: with SMTP id e3mr8614158otl.30.1642309748566;
 Sat, 15 Jan 2022 21:09:08 -0800 (PST)
MIME-Version: 1.0
References: <20220112203939.606775-1-james.hilliard1@gmail.com>
 <20220115233736.634f0d0b@gmx.net>
In-Reply-To: <20220115233736.634f0d0b@gmx.net>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 15 Jan 2022 22:08:57 -0700
Message-ID: <CADvTj4pFsYA+vaz4k6Fru9KnuRUeHmZ6QhQP_WJsxS+kHy1qdw@mail.gmail.com>
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

So I was able to reproduce this error, however best I can tell it's
probably not a regression
as the compilation still fails due to a different error without this patch:

ERROR at //build/config/linux/pkg_config.gni:103:17: Script returned
non-zero exit code.
    pkgresult = exec_script(pkg_config_script, args, "value")
                ^----------
Current dir: /home/buildroot/buildroot/output/build/qt5webengine-5.15.2/src/core/release/
Command: /home/buildroot/buildroot/output/host/bin/python2
/home/buildroot/buildroot/output/build/qt5webengine-5.15.2/src/3rdparty/chromium/build/config/linux/pkg-config.py
-p /home/buildroot/buildroot/output/build/qt5webengine-5.15.2/host-bin/host-pkg-config
libjpeg
Returned 1.
stderr:

Package libjpeg was not found in the pkg-config search path.
Perhaps you should add the directory containing `libjpeg.pc'
to the PKG_CONFIG_PATH environment variable
Package 'libjpeg', required by 'virtual:world', not found
Could not run pkg-config.

See //third_party/BUILD.gn:17:3: whence it was called.
  pkg_config("system_libjpeg") {
  ^-----------------------------
See //third_party/blink/renderer/platform/BUILD.gn:159:5: which caused
the file to be included.
    "//third_party:jpeg",
    ^-------------------
Project ERROR: GN run error!

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
>
> Regards,
> Peter
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
