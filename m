Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4A16C83F2C
	for <buildroot@archiver.kernel.org>; Sun,  3 Sep 2023 11:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5BBD2403B3;
	Sun,  3 Sep 2023 11:20:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5BBD2403B3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M8-fHEH919MM; Sun,  3 Sep 2023 11:20:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 70EA540480;
	Sun,  3 Sep 2023 11:20:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 70EA540480
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1C2401BF3EE
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 11:20:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 005BB4173D
 for <buildroot@lists.busybox.net>; Sun,  3 Sep 2023 11:20:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 005BB4173D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KOyPe2XJCyfu for <buildroot@lists.busybox.net>;
 Sun,  3 Sep 2023 11:20:40 +0000 (UTC)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CFD241735
 for <buildroot@buildroot.org>; Sun,  3 Sep 2023 11:20:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6CFD241735
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-52c4d3ff424so780098a12.0
 for <buildroot@buildroot.org>; Sun, 03 Sep 2023 04:20:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693740038; x=1694344838;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rTeISpG4XE3iNJmZjZHKMK169W4kSLetC8KY83V40wc=;
 b=hzT4vhDiGocQaGj4KbntfVvqGALzMmUduFOJp1TGVlJje7yFs5uv+TQ7Rgegl0YmF/
 AGfC0ClyTHIfaRS5vkirrBzdZ9vm3SyZUGe3Z5dJ6yrTm+e62eUARkuCebmhyZcfsKDh
 zLVNV/+kr+xL/fyUEqdNgM+j0e2TSpfo2mbg58wKMca2EFtJw7Jhhc8YEpA7PUBGqhmY
 yxT4BzTDt1E2E2rFxKwmbTb/3+JJwPF2aI8NdrxripYDP1chCxNDdUgvqpD5aLk/pow8
 3XvmPyDqnOK5O8puwZZaUj8qQQJZlM0cgX2l2vZai0NhE+M2phWd2vaiXAPA0gGOHpls
 mQ3g==
X-Gm-Message-State: AOJu0Yzph3xy1K2Jxpz3Ar8GzunmyKXxA3mMEpPXB0eDXKUM6Xb2qive
 ofLWe3X68btLcCvAT8U1ioAIlmhMCBP9eFaig3I=
X-Google-Smtp-Source: AGHT+IEP5gMZYrhv/WqL1kUIsBhvKzP68qMyQQrBTLXYzx3OmdaG51KNM3yihyG0pstLMsDf9ChRv4/tYDhROC0dPlE=
X-Received: by 2002:a05:6402:194d:b0:52c:a382:e0ca with SMTP id
 f13-20020a056402194d00b0052ca382e0camr2551717edz.41.1693740038096; Sun, 03
 Sep 2023 04:20:38 -0700 (PDT)
MIME-Version: 1.0
References: <CAPmASesrnM7zE7EL2r8Mdg9Sc1fJM-ESZUJk=JXLobHOuLisVw@mail.gmail.com>
 <f22ce06d-d9cf-c561-7455-19dce724c158@benettiengineering.com>
In-Reply-To: <f22ce06d-d9cf-c561-7455-19dce724c158@benettiengineering.com>
From: Andrea Simeoni <andreasimeoni73@gmail.com>
Date: Sun, 3 Sep 2023 13:20:26 +0200
Message-ID: <CAPmASevmp5gOTy5GqOiD8r1njSw6=hxdxepb5YwuG1OuA7ovkQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693740038; x=1694344838; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rTeISpG4XE3iNJmZjZHKMK169W4kSLetC8KY83V40wc=;
 b=OSKfGHrcCg4VDoE1yWBNVgDGkxQ5jiiJJbnOw/X2RekwZzU8ibDHXkMi1RpURL7+bB
 U0h8zQtwpdaYA+I8lPc8qCYNG7TxB6QvH4Zieanm28Y6LEGHDO+RdhwXqsyVI0vNzb+w
 QJiOKw+fZWjDDYsNMRewLMKrK/lZHi3oFwpRm++B+qCisT0vIOjtJRLAGtqd+Qu8EO49
 Bph8TDQqQB/+9CZxLelysuhW9OoU6/xrun6f+LW+yNyOMlZEZKPeJI1lY6iz5NXh5RVN
 aKwbigKSW/pKkcVCrKPMvkwSksjCCTeHPZ/HsRy1EZG7TAjaqxaXdur1etNg4hddnHhi
 D9jw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=OSKfGHrc
Subject: Re: [Buildroot] Issues with Qt6 and Raspberry Pi 3 B+
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
Content-Type: multipart/mixed; boundary="===============5543386085915529968=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5543386085915529968==
Content-Type: multipart/alternative; boundary="0000000000005011e3060472954c"

--0000000000005011e3060472954c
Content-Type: text/plain; charset="UTF-8"

>
> You should find aarch64-buildroot-linux-gnu-gdb
>

Yep, it's there. I was looking for a wrong filename. Sorry.


> It depends on how you've composed your Qt5/6 Kit. You have to pass qmake
> found under host/bin/qmake.
>

Something was odd before.
I select Qt5 again and make a clean build.

Now I can run my Qt/QML applications.
Thanks again!
Andrea


Il giorno sab 2 set 2023 alle ore 17:39 Giulio Benetti <
giulio.benetti@benettiengineering.com> ha scritto:

> Hi Andrea,
>
> On 02/09/23 13:54, Andrea Simeoni wrote:
> > Hi!
> > I need to setup Buildroot for Qt6 (or even Qt5, no big problem) with QML
> > for cross-compilation and remote debugging from a dev machine that runs
> > Ubuntu 23.04.
> >
> > There are few things I cannot fix by myself:
> >
> > 1) With Qt5 installed on target, QtCreator 11.0.2 requires the stat
> > command to deploy files to the target and I cannot find which package I
> > should enable in Buildroot (this is addressed on another message by the
> way)
>
> just answered to that
>
> > 2) I enabled BR2_PACKAGE_HOST_GDB and BR2_PACKAGE_GDB_SERVER. The host
> > GDB is built but not copied under the host directory:
> >
> >     ~/dev/buildroot/output/host$ find . -name gdb -type f
> >     ~/dev/buildroot/output/host$
> >
>
> You should find aarch64-buildroot-linux-gnu-gdb
>
> > Anyway, the executable is built for the host:
> >
> >     $ file build/host-gdb-11.2/build/gdb/gdb
> >     build/host-gdb-11.2/build/gdb/gdb: ELF 64-bit LSB pie executable,
> >     x86-64, version 1 (GNU/Linux), dynamically linked, interpreter
> >     /lib64/ld-linux-x86-64.so.2,
> >     BuildID[sha1]=98a2dc5cb85827a9be19abefc64919dacc41fbc7, for
> >     GNU/Linux 3.2.0, not stripped
>
> It must be built for the host since this is the client QtCreator will
> use to connect to the target gdbserver run by the QtCreator debugging
> step via ssh, of course after copying artifacts to the target.
>
> Anyway don't rely on build/ folder to check files, but use hosr/ and
> target/ folders.
>
> Since you've enabled BR2_PACKAGE_GDB_SERVER you should find
> aarch64-buildroot-linux-gnu--gdb under target/ folder.
>
> >
> > 3) Trying Qt6 instead, in QtCreator I added
> > host/usr/bin/aarch64-buildroot-linux-gnu-g++ and
> > host/usr/bin/aarch64-buildroot-linux-gnu-gcc as compilers and it
> > recognize them as ABI arm-linux-generic-elf-64bit (target triple
> > aarch64-buildroot-linux-gnu).
> >
> > Selecting host/bin/qmake it recognize it as Qt 6.4.3 but with no QML
> > utility installed.
> > How to enable them? I don't find anything under the Qt6 options in
> xconfig
>
> Yes, there is no Qt6 support for QML at this moment. You can give a try
> with Qt5.
>
> > 4) Furthermore it recognize the qmake to produce x86 executables:
> >
> > Name: Qt 6.4.3 (Buildroot)
> > ABI: x86-linux-generic-elf-64bit
> >
> > and it does not allow me to use the above compiler with this qmake.
>
> It depends on how you've composed your Qt5/6 Kit. You have to pass qmake
> found under host/bin/qmake.
>
> Best regards
> --
> Giulio Benetti
> CEO&CTO@Benetti Engineering sas
>

--0000000000005011e3060472954c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
You should find aarch64-buildroot-linux-gnu-gdb<br></blockquote><div><br></=
div><div>Yep, it&#39;s there. I was looking for a wrong filename. Sorry.<br=
></div><span class=3D"gmail-im"><div>=C2=A0</div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex">
It depends on how you&#39;ve composed your Qt5/6 Kit. You have to pass qmak=
e<br>
found under host/bin/qmake.<br></blockquote><div><br></div></span><div>Some=
thing was odd before.</div><div>I select Qt5 again and make a clean build.<=
/div><div><br></div><div>Now I can run my Qt/QML applications.</div><div>Th=
anks again!</div><font color=3D"#888888" style=3D"--darkreader-inline-color=
: #9d9488;"><div>Andrea</div><div><br></div></font></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Il giorno sab 2 set 2023=
 alle ore 17:39 Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benetti=
engineering.com">giulio.benetti@benettiengineering.com</a>&gt; ha scritto:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Andrea,<br>
<br>
On 02/09/23 13:54, Andrea Simeoni wrote:<br>
&gt; Hi!<br>
&gt; I need to setup Buildroot for Qt6 (or even Qt5, no big problem) with Q=
ML <br>
&gt; for cross-compilation and remote debugging from a dev machine that run=
s <br>
&gt; Ubuntu 23.04.<br>
&gt; <br>
&gt; There are few things I cannot fix by myself:<br>
&gt; <br>
&gt; 1) With Qt5 installed on target, QtCreator 11.0.2 requires the stat <b=
r>
&gt; command to deploy files to the target and I cannot find which package =
I <br>
&gt; should enable in Buildroot (this is addressed on another message by th=
e way)<br>
<br>
just answered to that<br>
<br>
&gt; 2) I enabled BR2_PACKAGE_HOST_GDB and BR2_PACKAGE_GDB_SERVER. The host=
 <br>
&gt; GDB is built but not copied under the host directory:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0~/dev/buildroot/output/host$ find . -name gdb -type=
 f<br>
&gt;=C2=A0 =C2=A0 =C2=A0~/dev/buildroot/output/host$<br>
&gt; <br>
<br>
You should find aarch64-buildroot-linux-gnu-gdb<br>
<br>
&gt; Anyway, the executable is built for the host:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0$ file build/host-gdb-11.2/build/gdb/gdb<br>
&gt;=C2=A0 =C2=A0 =C2=A0build/host-gdb-11.2/build/gdb/gdb: ELF 64-bit LSB p=
ie executable,<br>
&gt;=C2=A0 =C2=A0 =C2=A0x86-64, version 1 (GNU/Linux), dynamically linked, =
interpreter<br>
&gt;=C2=A0 =C2=A0 =C2=A0/lib64/ld-linux-x86-64.so.2,<br>
&gt;=C2=A0 =C2=A0 =C2=A0BuildID[sha1]=3D98a2dc5cb85827a9be19abefc64919dacc4=
1fbc7, for<br>
&gt;=C2=A0 =C2=A0 =C2=A0GNU/Linux 3.2.0, not stripped<br>
<br>
It must be built for the host since this is the client QtCreator will<br>
use to connect to the target gdbserver run by the QtCreator debugging<br>
step via ssh, of course after copying artifacts to the target.<br>
<br>
Anyway don&#39;t rely on build/ folder to check files, but use hosr/ and<br=
>
target/ folders.<br>
<br>
Since you&#39;ve enabled BR2_PACKAGE_GDB_SERVER you should find <br>
aarch64-buildroot-linux-gnu--gdb under target/ folder.<br>
<br>
&gt; <br>
&gt; 3) Trying Qt6 instead, in QtCreator I added <br>
&gt; host/usr/bin/aarch64-buildroot-linux-gnu-g++ and <br>
&gt; host/usr/bin/aarch64-buildroot-linux-gnu-gcc as compilers and it <br>
&gt; recognize them as ABI arm-linux-generic-elf-64bit (target triple <br>
&gt; aarch64-buildroot-linux-gnu).<br>
&gt; <br>
&gt; Selecting host/bin/qmake it recognize it as Qt 6.4.3 but with no QML <=
br>
&gt; utility installed.<br>
&gt; How to enable them? I don&#39;t find anything under the Qt6 options in=
 xconfig<br>
<br>
Yes, there is no Qt6 support for QML at this moment. You can give a try<br>
with Qt5.<br>
<br>
&gt; 4) Furthermore it recognize the qmake to produce x86 executables:<br>
&gt; <br>
&gt; Name: Qt 6.4.3 (Buildroot)<br>
&gt; ABI: x86-linux-generic-elf-64bit<br>
&gt; <br>
&gt; and it does not allow me to use the above compiler with this qmake.<br=
>
<br>
It depends on how you&#39;ve composed your Qt5/6 Kit. You have to pass qmak=
e<br>
found under host/bin/qmake.<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
CEO&amp;CTO@Benetti Engineering sas<br>
</blockquote></div>

--0000000000005011e3060472954c--

--===============5543386085915529968==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5543386085915529968==--
