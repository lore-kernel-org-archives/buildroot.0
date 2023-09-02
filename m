Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4461C71153
	for <buildroot@archiver.kernel.org>; Sat,  2 Sep 2023 15:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7022440500;
	Sat,  2 Sep 2023 15:39:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7022440500
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id yEqXWEsWOflU; Sat,  2 Sep 2023 15:39:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B136F404A0;
	Sat,  2 Sep 2023 15:39:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B136F404A0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 29D701BF401
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:39:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0350D40471
 for <buildroot@lists.busybox.net>; Sat,  2 Sep 2023 15:39:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0350D40471
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OvlRdjAdfuLU for <buildroot@lists.busybox.net>;
 Sat,  2 Sep 2023 15:39:07 +0000 (UTC)
Received: from smtpcmd12131.aruba.it (smtpcmd12131.aruba.it [62.149.156.131])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 87CA8404A0
 for <buildroot@buildroot.org>; Sat,  2 Sep 2023 15:39:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 87CA8404A0
Received: from [192.168.50.162] ([146.241.105.17])
 by Aruba Outgoing Smtp  with ESMTPSA
 id cSiGqx2axT5N3cSiHquvb3; Sat, 02 Sep 2023 17:39:05 +0200
Message-ID: <f22ce06d-d9cf-c561-7455-19dce724c158@benettiengineering.com>
Date: Sat, 2 Sep 2023 17:39:05 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Content-Language: en-US
To: Andrea Simeoni <andreasimeoni73@gmail.com>, buildroot@buildroot.org
References: <CAPmASesrnM7zE7EL2r8Mdg9Sc1fJM-ESZUJk=JXLobHOuLisVw@mail.gmail.com>
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
In-Reply-To: <CAPmASesrnM7zE7EL2r8Mdg9Sc1fJM-ESZUJk=JXLobHOuLisVw@mail.gmail.com>
X-CMAE-Envelope: MS4xfLrMotMwNmRJoEHlNiThr6bVS8FMeHnrjufbgfBBP9zD5aAen1ynAumfWqMA6TWrYCLZqEllDlvYGpWWucSbatLfvSFVHmEqiAyFmML+amxFugN8NEj8
 ardYZN8GSSvjC60y+BycbGqrI8+sPaxPej/sASffpF+jfWuM2sMBl2eQCj8wk/ZIYfYy6Zl19IVbVaMHJj+9rSPP+UGXt//VvXZqSun/i8czJ8XDpgxK1CSD
 f3Sil7TvsplRnZq90jL0TkB3THnw0GTu5Rx/qUPL2iQ=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1693669145; bh=41UQ5jDs6yJvKbyHsVpvMFxFouy2w+Z0f+lT7nBiu3M=;
 h=Date:MIME-Version:Subject:To:From:Content-Type;
 b=nGFZzpcnkPLw5q8pyk6uzmwXRo4pu5lotDhP1HLT4tpXTWvqzune5aLTFRi4u3TlR
 CTq0k8hJUAr4Ua5s9aZwT2MMQf8Zqq2Oz9X7rn0d5AyWKHhZHSnLqlFg0MjBZiGSYL
 djNJexQdkrPC22YajoPKKXStxt+VRKh5ryqCCzT6+P2t7VBzcaROKvtdECLJFZvt8f
 FZE4empX1fKIArrDe+Jaw4t7qkJbj+1WOPAoacCeanOSoPdgzxvcTF/lxZjXI+YbZ/
 QHQO5aPskwVsT/GV6hGz3CyA3brC0zCYBRGCfMNQoJWj/UwJj9xTeIvNCuwpRdU0F+
 xqh9TL5xqrzbg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nGFZzpcn
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Hi Andrea,

On 02/09/23 13:54, Andrea Simeoni wrote:
> Hi!
> I need to setup Buildroot for Qt6 (or even Qt5, no big problem) with QML 
> for cross-compilation and remote debugging from a dev machine that runs 
> Ubuntu 23.04.
> 
> There are few things I cannot fix by myself:
> 
> 1) With Qt5 installed on target, QtCreator 11.0.2 requires the stat 
> command to deploy files to the target and I cannot find which package I 
> should enable in Buildroot (this is addressed on another message by the way)

just answered to that

> 2) I enabled BR2_PACKAGE_HOST_GDB and BR2_PACKAGE_GDB_SERVER. The host 
> GDB is built but not copied under the host directory:
> 
>     ~/dev/buildroot/output/host$ find . -name gdb -type f
>     ~/dev/buildroot/output/host$
> 

You should find aarch64-buildroot-linux-gnu-gdb

> Anyway, the executable is built for the host:
> 
>     $ file build/host-gdb-11.2/build/gdb/gdb
>     build/host-gdb-11.2/build/gdb/gdb: ELF 64-bit LSB pie executable,
>     x86-64, version 1 (GNU/Linux), dynamically linked, interpreter
>     /lib64/ld-linux-x86-64.so.2,
>     BuildID[sha1]=98a2dc5cb85827a9be19abefc64919dacc41fbc7, for
>     GNU/Linux 3.2.0, not stripped

It must be built for the host since this is the client QtCreator will
use to connect to the target gdbserver run by the QtCreator debugging
step via ssh, of course after copying artifacts to the target.

Anyway don't rely on build/ folder to check files, but use hosr/ and
target/ folders.

Since you've enabled BR2_PACKAGE_GDB_SERVER you should find 
aarch64-buildroot-linux-gnu--gdb under target/ folder.

> 
> 3) Trying Qt6 instead, in QtCreator I added 
> host/usr/bin/aarch64-buildroot-linux-gnu-g++ and 
> host/usr/bin/aarch64-buildroot-linux-gnu-gcc as compilers and it 
> recognize them as ABI arm-linux-generic-elf-64bit (target triple 
> aarch64-buildroot-linux-gnu).
> 
> Selecting host/bin/qmake it recognize it as Qt 6.4.3 but with no QML 
> utility installed.
> How to enable them? I don't find anything under the Qt6 options in xconfig

Yes, there is no Qt6 support for QML at this moment. You can give a try
with Qt5.

> 4) Furthermore it recognize the qmake to produce x86 executables:
> 
> Name: Qt 6.4.3 (Buildroot)
> ABI: x86-linux-generic-elf-64bit
> 
> and it does not allow me to use the above compiler with this qmake.

It depends on how you've composed your Qt5/6 Kit. You have to pass qmake
found under host/bin/qmake.

Best regards
-- 
Giulio Benetti
CEO&CTO@Benetti Engineering sas
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
