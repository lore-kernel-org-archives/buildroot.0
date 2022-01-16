Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75246C433F5
	for <buildroot@archiver.kernel.org>; Sun, 16 Jan 2022 19:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C5D1860AC9;
	Sun, 16 Jan 2022 19:23:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id uQeYz_8IkD-m; Sun, 16 Jan 2022 19:23:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D029E60745;
	Sun, 16 Jan 2022 19:23:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DE3201BF408
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 19:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BDA7340509
 for <buildroot@lists.busybox.net>; Sun, 16 Jan 2022 19:23:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EB0PVSPLEUy9 for <buildroot@lists.busybox.net>;
 Sun, 16 Jan 2022 19:23:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B446C404CF
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 19:23:30 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id c6so39710168ybk.3
 for <buildroot@buildroot.org>; Sun, 16 Jan 2022 11:23:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y5q+BcT77Z1FyC4vUvjFzWe+X9+HOX8SgFjwzbKYYXo=;
 b=qRLVtwecwFHhLqaXGODEXAsizPOUGBhRzf+p3k5GRZIHxU+kEuO+lma97cfN790etM
 VMscQWNIO5db7PJCr3CQwwmsMoXxhY/l/p+njGiyHLUNAxZV19+q5yLDi1l4K+Pegmtg
 tgR0vsSyXWS8gsgIX7SqFtzET3ae1+0c0tisEVs+UUEMJ8Gxo9mChL6ge2ER/yx7f2d6
 Se0ziDEgxodGZa3vd1EBILbF3pnOVdvIAAYsCXiskd24YpfkYHYZTrwm18B9fC2jbjC1
 Ss/1fMZ4s2Y7HyIp35X8eoBQfs5GSpyDL3+63QqgvPHfGeiBk8Sm4kAXCtW3t92ElkY7
 JvwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y5q+BcT77Z1FyC4vUvjFzWe+X9+HOX8SgFjwzbKYYXo=;
 b=4Na53jkO7vqbtciq6G2PXwq5sVtA2fOQUqz7tx8rjmu+cO39VRzAarsoNT7BQByYmy
 2vVl08kYKFh4RiLnXInZg5q2delR76neRRFMTXb+CsxzU3jbYRvKMFRUvd+E01gyOTGy
 r5kU1n1xB1q846cumvTRiPnahADUnaKSGL1kA7NbivFmK4Hn4pqkUqed96FLj1KiRL5J
 HbPRVruUhvEg3wuA7YVXptNXgZE/Hga/5FCHAfTSmqHiaHYuczOPb61yP+lQi9q/lJhD
 HAd92OJctN+hHuTFVCVQ3lSmskbUu6haTGr2TAq1mMbRmKYch0PGkP/z5im+mnDWuTgA
 ReAg==
X-Gm-Message-State: AOAM530jr4eF6Jgh8jBlompt0d+Rw2iXI/55H0NyV3+dOqrAfJ4ap6TS
 ZTXDTlJBRlenJs3iVbbGOcc9aw89NMrENTPyAws4GWZtQtQ=
X-Google-Smtp-Source: ABdhPJwjNVhlNTOoVomziTLu8cKowrOPeTSfLYVe/wfiDBeHqgPdWl+09+aViWszsQCQ/7F+L7OJ5bDwzUsjE45J9r0=
X-Received: by 2002:a05:6902:124e:: with SMTP id
 t14mr25599636ybu.65.1642361009642; 
 Sun, 16 Jan 2022 11:23:29 -0800 (PST)
MIME-Version: 1.0
References: <CAF8i9mOtQLce7b+H_PzHrsiUe_5qphpk-QsXq=WeLZodMv1heA@mail.gmail.com>
 <d85d6f3c-2315-8583-a48c-b0b58e443a4d@mind.be>
 <CAF8i9mPphK+bKcnTtd6soqP1_vfPaE=F=GB945sW+Xdwqm+h4A@mail.gmail.com>
 <420ac869-6aea-a492-7a74-3014b7bb4cf3@mind.be>
In-Reply-To: <420ac869-6aea-a492-7a74-3014b7bb4cf3@mind.be>
From: William Tambe <tambewilliam@gmail.com>
Date: Sun, 16 Jan 2022 13:23:20 -0600
Message-ID: <CAF8i9mMGixY2q5e+fXH=-0H6vss97Q4T1uKwnUg-zTzZ5d7Hkg@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] BR2_PACKAGE_DHCP_CLIENT fails to build:
 readline/history.h: No such file or directory
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

On Mon, Jan 10, 2022 at 1:33 AM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 10/01/2022 00:46, William Tambe wrote:
> > On Sun, Jan 9, 2022 at 2:08 PM Arnout Vandecappelle <arnout@mind.be> wrote:
> >>
> >>
> >>
> >> On 09/01/2022 19:18, William Tambe wrote:
> >>> I am attempting to build:
> >>>
> >>> +BR2_PACKAGE_DHCP=y
> >>> +BR2_PACKAGE_DHCP_CLIENT=y
> >>>
> >>> However it fails as follow complaining about not finding readline/history.h:
> >>>
> >>> making all in /home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/bin/nsupdate
> >>> /home/tambewilliam/Documents/buildroot-build/host/bin/pu32-elf-gcc
> >>
> >>    pu32 doesn't exist in Buildroot, so this may very well be due to external changes.
>
>   So, do you have external changes that may be the cause of this? IOW, can you
> reproduce the problem on upstream Buildroot?
>
> >>
> >>> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35
> >>> -I../.. -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/lwres/include
> >>> -I../../lib/lwres/unix/include -I../../lib/lwres/include
> >>> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/dns/include
> >>> -I../../lib/dns/include
> >>> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/bind9/include
> >>> -I../../lib/bind9/include
> >>> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/isc/include
> >>> -I../../lib/isc -I../../lib/isc/include -I../../lib/isc/unix/include
> >>> -I../../lib/isc/pthreads/include -I../../lib/isc/noatomic/include
> >>> -I/home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/lib/isccfg/include
> >>> -I../../lib/isccfg/include    -D_REENTRANT -DVERSION=\"9.11.35\"
> >>> -D_GNU_SOURCE -D_LARGEFILE_SOURCE -D_LARGEFILE64_SOURCE
> >>> -D_FILE_OFFSET_BITS=64  -Os -g0  -static   -W -Wall
> >>> -Wmissing-prototypes -Wcast-qual -Wwrite-strings -Wformat
> >>> -Wpointer-arith -fno-strict-aliasing -fno-delete-null-pointer-checks
> >>> \
> >>>           -DSESSION_KEYFILE=\"/var/run/named/session.key\" \
> >>>           -c ./nsupdate.c
> >>> ./nsupdate.c:104:10: fatal error: readline/history.h: No such file or directory
> >>>     104 | #include <readline/history.h>
> >>>         |          ^~~~~~~~~~~~~~~~~~~~
> >>
> >>    This sounds like you changed your configuration without doing 'make clean'. Is
> >> that possible?
> >
> > I am building from clean or from scratch.
> >
> >>
> >>    Is BR2_PACKAGE_READLINE enabled in your configuration? Has it been built?
> >
> > Yes, BR2_PACKAGE_READLINE is enabled in my configuration.
>
>   And does it get built? Does output/build/readline/.stamp_staging_installed exist?

Yes it gets built and installed and .stamp_staging_installed exists.

Below are related buildroot files listing:

$ ls -ld buildroot-build/build/readline-8.1/.*
drwxr-xr-x  6 tambewilliam tambewilliam 4096 Jan 16 12:58
buildroot-build/build/readline-8.1/.
drwxr-xr-x 30 tambewilliam tambewilliam 4096 Jan 16 12:59
buildroot-build/build/readline-8.1/..
-rw-r--r--  1 tambewilliam tambewilliam   84 Jan 16 12:58
buildroot-build/build/readline-8.1/.applied_patches_list
-rw-r--r--  1 tambewilliam tambewilliam    0 Jan 16 12:58
buildroot-build/build/readline-8.1/.files-list-host.txt
-rw-r--r--  1 tambewilliam tambewilliam  799 Jan 16 12:58
buildroot-build/build/readline-8.1/.files-list-staging.txt
-rw-r--r--  1 tambewilliam tambewilliam  822 Jan 16 12:58
buildroot-build/build/readline-8.1/.files-list.txt
-rw-r--r--  1 tambewilliam tambewilliam    0 Jan 16 12:58
buildroot-build/build/readline-8.1/.stamp_built
-rw-r--r--  1 tambewilliam tambewilliam    0 Jan 16 12:58
buildroot-build/build/readline-8.1/.stamp_configured
-rw-r--r--  1 tambewilliam tambewilliam    0 Jan 16 12:58
buildroot-build/build/readline-8.1/.stamp_downloaded
-rw-r--r--  1 tambewilliam tambewilliam    0 Jan 16 12:58
buildroot-build/build/readline-8.1/.stamp_extracted
-rw-r--r--  1 tambewilliam tambewilliam    0 Jan 16 12:58
buildroot-build/build/readline-8.1/.stamp_installed
-rw-r--r--  1 tambewilliam tambewilliam    0 Jan 16 12:58
buildroot-build/build/readline-8.1/.stamp_patched
-rw-r--r--  1 tambewilliam tambewilliam    0 Jan 16 12:58
buildroot-build/build/readline-8.1/.stamp_staging_installed
-rw-r--r--  1 tambewilliam tambewilliam    0 Jan 16 12:58
buildroot-build/build/readline-8.1/.stamp_target_installed

>
>   The bind.mk file has this:
> ifeq ($(BR2_PACKAGE_READLINE),y)
> BIND_DEPENDENCIES += readline
> else
> BIND_CONF_OPTS += --with-readline=no
> endif
>
> which should make sure that readline is built and installed before bind. This in
> turn should make sure that output/host/*/sysroot/usr/include/readline/history.h
> exists.

When I search for history.h I find it in following locations:

$ find buildroot-build/ | fgrep history.h
buildroot-build/target/usr/include/readline/history.h
buildroot-build/host/pu32-buildroot-linux-gnu/sysroot/usr/include/readline/history.h
buildroot-build/build/bash-5.1/lib/readline/history.h
buildroot-build/build/readline-8.1/doc/history.html
buildroot-build/build/readline-8.1/history.h

How to make buildroot use include path
host/pu32-buildroot-linux-gnu/sysroot/usr/include/readline/ such that
it will find history.h ?

>
>   Regards,
>   Arnout
>
> >
> >>
> >>    Regards,
> >>    Arnout
> >>
> >>> compilation terminated.
> >>> make[5]: *** [Makefile:473: nsupdate.o] Error 1
> >>> make[4]: *** [Makefile:79: subdirs] Error 1
> >>> make[3]: *** [Makefile:88: subdirs] Error 1
> >>> make[2]: *** [package/pkg-generic.mk:270:
> >>> /home/tambewilliam/Documents/buildroot-build/build/bind-9.11.35/.stamp_built]
> >>> Error 2
> >>> make[1]: *** [Makefile:23: _all] Error 2
> >>> make[1]: Leaving directory '/home/tambewilliam/Documents/buildroot-build'
> >>> make: *** [pu32/makefile:67: pu32-build/buildroot] Error 2
> >>> _______________________________________________
> >>> buildroot mailing list
> >>> buildroot@buildroot.org
> >>> https://lists.buildroot.org/mailman/listinfo/buildroot
> >>>
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
