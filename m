Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFB84C71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 11:54:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 152C541DDA;
	Sat,  2 Sep 2023 11:54:54 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 152C541DDA
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SzMo9qdJqg8R; Sat,  2 Sep 2023 11:54:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D485E41DDD;
	Sat,  2 Sep 2023 11:54:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D485E41DDD
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0E75A1BF409
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 11:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D4C2D41DDD
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 11:54:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4C2D41DDD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y1z9MIfSuUFW for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 11:54:48 +0000 (UTC)
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D47E41DDA
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 11:54:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D47E41DDA
Received: by mail-ej1-x631.google.com with SMTP id
 a640c23a62f3a-9a5dff9d2d9so354184566b.3
 for <buildroot@buildroot.org>; Sat, 02 Sep 2023 04:54:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693655686; x=1694260486;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=GI5on0x/Yu90VE95KcgIPLStEgKlkrGA21sLRDRbdg8=;
 b=To+bYRatDJA5CeAdQCGXlmhpi8/trSVvYjVMHdwOR8JllypYtxsI6p8aKY0m1D1F2i
 /ZMOiMkMdf7Klto46tGKWwgaLiiajZGCqOkU3u8plJEbZ4Qlosbxa3SZi8qOcvVVkome
 0uxRg9mJBB2yeDihYqSsnqPW0ZZAxQ9ErkCluILT8I2AAOITcZPe8dqj2EcOzg4itOlJ
 yerSrLZKg0v12p1MN9vdcmaWiVoc/NvWeTpURZlrDCaTzfEy0+hwXfUniaTakOmNhwpU
 6SWShbXzrnuZAWnkUsn2ngJN/3ircZak9NhODTzQhwXe+dbakHKUzTQ7w4Zd70kZbXSF
 qKuA==
X-Gm-Message-State: AOJu0Yyuct/oEwd6TKcBbyJ2Umh3U3ShNkv/XHNbca++B8/3e52LGydE
 OF6BrGx90f/bBegh1AiW08LUq3whNEVo4nT4lX0a66Me3xgKag==
X-Google-Smtp-Source: AGHT+IGXsy0Vyve2zfHYG5vqS25EY5u9X39RAA83mtczIpwFXQdH2MG6qzI0pSiBTTQ9PJeskCIkfGTQ6L3+el4RFxM=
X-Received: by 2002:a17:906:3116:b0:9a1:b5fc:8c56 with SMTP id
 22-20020a170906311600b009a1b5fc8c56mr3248450ejx.55.1693655686467; Sat, 02 Sep
 2023 04:54:46 -0700 (PDT)
MIME-Version: 1.0
From: Andrea Simeoni <andreasimeoni73@gmail.com>
Date: Sat, 2 Sep 2023 13:54:35 +0200
Message-ID: <CAPmASesrnM7zE7EL2r8Mdg9Sc1fJM-ESZUJk=JXLobHOuLisVw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693655686; x=1694260486; darn=buildroot.org;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=GI5on0x/Yu90VE95KcgIPLStEgKlkrGA21sLRDRbdg8=;
 b=pJzSXeEurdhjhF5WDNpNLxTNnOlETMLfucWkaWmTZSzt/SUmsv4Ydl0jgxbse55ENS
 JMVmD++hhaZcbDLNxk48enBl1YYDlllY351D6TBkvCL/4js893cF1PORqKRXPX9q7aVX
 BZTYsMFjJOpure1K9/Ax+MvU5q5bew9kvxUpHhnGCgEwuGaCrO0XnLNC5gR25bXicLDl
 gkDO/CRdzr87U6VU96o4nlsw5zvVks555y8yeZk/Gd6x2/XLSsGcvstO8HLlNbnDlojG
 fOXaJRg1D+6rCFhaOc3nhFIEZM0fS087B+0Tt3tb2zMLnx6MU1IB4USZGjIGn9fXXuXr
 62lw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=pJzSXeEu
Subject: [Buildroot] Issues with Qt6 and Raspberry Pi 3 B+
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
Content-Type: multipart/mixed; boundary="===============6270331836833383397=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6270331836833383397==
Content-Type: multipart/alternative; boundary="00000000000090558e06045ef140"

--00000000000090558e06045ef140
Content-Type: text/plain; charset="UTF-8"

Hi!
I need to setup Buildroot for Qt6 (or even Qt5, no big problem) with QML
for cross-compilation and remote debugging from a dev machine that runs
Ubuntu 23.04.

There are few things I cannot fix by myself:

1) With Qt5 installed on target, QtCreator 11.0.2 requires the stat command
to deploy files to the target and I cannot find which package I should
enable in Buildroot (this is addressed on another message by the way)

2) I enabled BR2_PACKAGE_HOST_GDB and BR2_PACKAGE_GDB_SERVER. The host GDB
is built but not copied under the host directory:

> ~/dev/buildroot/output/host$ find . -name gdb -type f
> ~/dev/buildroot/output/host$
>

Anyway, the executable is built for the host:

$ file build/host-gdb-11.2/build/gdb/gdb
> build/host-gdb-11.2/build/gdb/gdb: ELF 64-bit LSB pie executable, x86-64,
> version 1 (GNU/Linux), dynamically linked, interpreter
> /lib64/ld-linux-x86-64.so.2,
> BuildID[sha1]=98a2dc5cb85827a9be19abefc64919dacc41fbc7, for GNU/Linux
> 3.2.0, not stripped
>

3) Trying Qt6 instead, in QtCreator I added
host/usr/bin/aarch64-buildroot-linux-gnu-g++ and
host/usr/bin/aarch64-buildroot-linux-gnu-gcc as compilers and it recognize
them as ABI arm-linux-generic-elf-64bit (target triple
aarch64-buildroot-linux-gnu).

Selecting host/bin/qmake it recognize it as Qt 6.4.3 but with no QML
utility installed.
How to enable them? I don't find anything under the Qt6 options in xconfig

4) Furthermore it recognize the qmake to produce x86 executables:

Name: Qt 6.4.3 (Buildroot)
ABI: x86-linux-generic-elf-64bit

and it does not allow me to use the above compiler with this qmake.
Thanks for any hint!
Andrea

--00000000000090558e06045ef140
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi!</div><div>I need to setup Buildroot for Qt6 (or e=
ven Qt5, no big problem) with QML for cross-compilation and remote debuggin=
g from a dev machine that runs Ubuntu 23.04.</div><div><br></div><div>There=
 are few things I cannot fix by myself:</div><div><br></div><div>1) With Qt=
5 installed on target, QtCreator 11.0.2 requires the stat command to deploy=
 files to the target and I cannot find which package I should enable in Bui=
ldroot (this is addressed on another message by the way)</div><div><br></di=
v><div>2) I enabled BR2_PACKAGE_HOST_GDB and BR2_PACKAGE_GDB_SERVER. The ho=
st GDB is built but not copied under the host directory:</div><div><blockqu=
ote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px=
 solid rgb(204,204,204);padding-left:1ex"><div>~/dev/buildroot/output/host$=
 find . -name gdb -type f<br>~/dev/buildroot/output/host$ <br></div></block=
quote><div><br></div><div>Anyway, the executable is built for the host:</di=
v><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div>$ f=
ile build/host-gdb-11.2/build/gdb/gdb<br>build/host-gdb-11.2/build/gdb/gdb:=
 ELF 64-bit LSB pie executable, x86-64, version 1 (GNU/Linux), dynamically =
linked, interpreter /lib64/ld-linux-x86-64.so.2, BuildID[sha1]=3D98a2dc5cb8=
5827a9be19abefc64919dacc41fbc7, for GNU/Linux 3.2.0, not stripped</div></bl=
ockquote><div><br></div><div>3) Trying Qt6 instead, in QtCreator I added ho=
st/usr/bin/aarch64-buildroot-linux-gnu-g++ and host/usr/bin/aarch64-buildro=
ot-linux-gnu-gcc as compilers and it recognize them as ABI arm-linux-generi=
c-elf-64bit (target triple aarch64-buildroot-linux-gnu).</div><div><br></di=
v><div></div><div>Selecting host/bin/qmake it recognize it as Qt 6.4.3 but =
with no QML utility installed.=C2=A0</div><div>How to enable them? I don&#3=
9;t find anything under the Qt6 options in xconfig</div><div><br></div><div=
>4) Furthermore it recognize the qmake to produce x86 executables:</div><di=
v></div><div><br>Name: Qt 6.4.3 (Buildroot)<br>ABI: x86-linux-generic-elf-6=
4bit<br></div><div><br></div><div>and it does not allow me to use the above=
 compiler with this qmake. <br></div><div>Thanks for any hint!</div><div>An=
drea<br></div><div><br></div></div></div>

--00000000000090558e06045ef140--

--===============6270331836833383397==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6270331836833383397==--
