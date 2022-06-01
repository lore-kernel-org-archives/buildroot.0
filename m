Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E79CBC433EF
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 14:50:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 639366114E;
	Wed,  1 Jun 2022 14:50:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Rtf1dx92ZpFS; Wed,  1 Jun 2022 14:50:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7621D61042;
	Wed,  1 Jun 2022 14:50:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED1421BF20F
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 14:50:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC51682F20
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 14:50:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BiSaFCMm-g8k for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 14:50:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com
 [IPv6:2607:f8b0:4864:20::b32])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E00D88280E
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 14:50:33 +0000 (UTC)
Received: by mail-yb1-xb32.google.com with SMTP id t31so3359493ybi.2
 for <buildroot@buildroot.org>; Wed, 01 Jun 2022 07:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=kmZVBa64ELNtf7TGWw91PZrJZMvJ08c1re95MTBeWDM=;
 b=quFijlT878eer3c/Nw4k4tlgI/wwsah7zx9Odc9AZQJaruULlze9PYq6VVQhqw7dnx
 5n34Jy+/0rU7izbQCUPO4tSmt+GDfA22sFYUM6f5S0CP5P5yb2fAuuBZTqVc9FWLKS6R
 5odsnDmB2dzHUIWOSGVAEsYJAig0ZGW+JD9yV3ioAH20IUhRRS4B5xPZ2bVvD6hWbnC2
 umSjEGrQ5F4hUqhS8u8VTlbhB+NlEbxAlJ6TSlAWNH34lkK6bTjEuFazWiVuB+3nA0RQ
 1QwYUtGz7XGCymy6SmyPww11F0yCUmfTxAR4BbTGow7nX0kg9fOh29eo3yYPvbWxWlJ5
 4FpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=kmZVBa64ELNtf7TGWw91PZrJZMvJ08c1re95MTBeWDM=;
 b=6u6IoTbIk1RXScjwSDdOzYHBmSKUe04G+nM9r0URsa+YTfD05PydHe23Z58FG/8teK
 y9LNVxxdDNK7Lfj3aBzWbVCFpEFbwbctNmdBSjTk/tU1kyN/v3VFpaLnUB9ufrs5QAmi
 kDZlCgO7U0MzbMPMG0nZljm1uYxbtRUsOUqDZXBW02JoSeeGiFK8DVPL+waldPInNfbI
 fvS0nQfcTo0aoMss7UetNpkEQ0zMjtDmOb1kW8V1GFut2IoqBfg9ndsoN35CAmQv9UI2
 tYLkvMu3HN67HYVJaP63u0v0RT1iDxOaMx2nb957m4V7OmmR0GJKcIubcr8JojL26PW0
 nUVQ==
X-Gm-Message-State: AOAM532288SjekTLDklQxUoWKSQ8KraTocVQOapcubDkCFRdykr/hCXN
 iFi7jKADGkPI7Zfh6CKvaVr4Q85ZaHqxiPHD+yaAJmE0LGY=
X-Google-Smtp-Source: ABdhPJyYrNc4q+Lg6ikcVihaoBGHO8TxRlUaEXfYqhLsZN/EKEjTNaY6WJsaE4CD78jC2F0rusZxtUqcPg6Fm8hXX5A=
X-Received: by 2002:a25:3188:0:b0:653:885c:7c6e with SMTP id
 x130-20020a253188000000b00653885c7c6emr90645ybx.576.1654095032565; Wed, 01
 Jun 2022 07:50:32 -0700 (PDT)
MIME-Version: 1.0
From: "ewrwcwpw@gmail.com" <ewrwcwpw@gmail.com>
Date: Thu, 2 Jun 2022 00:50:20 +1000
Message-ID: <CAO6u9=UUrqNx3bWidqidNZXuNoCb2qWQCAaQ6wPzxeY2NjGCvA@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] RE i386 support
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
Content-Type: multipart/mixed; boundary="===============7949354092201144433=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7949354092201144433==
Content-Type: multipart/alternative; boundary="000000000000d7435d05e064024c"

--000000000000d7435d05e064024c
Content-Type: text/plain; charset="UTF-8"

Hi there,

I came across this
https://lists.buildroot.org/pipermail/buildroot/2016-April/159030.html when
looking at creating linux distro (Came across the snakeware distro
https://github.com/joshiemoore/snakeware and noticed there was no 32 bit
option and have some old 32 bit laptops around) I looked at
https://www.thirtythreeforty.net/posts/2020/01/mastering-embedded-linux-part-3-buildroot/
and
assumed that i386_defconfig would exist. similarly (as from .config file
from make menuconfig had i386 option)

So what impact does removing support for i386 have for compiling a distro?
I noticed you could select i386 in make menuconfig... Also debian still has
32bit versions (unlike Ubuntu etc) but that's the kernel plus
applications...

BR2_LEGACY=y and BR2_x86_i386=y were grouped in legacy but BR2_i386=y was
up higher in .config file

So what do people use - the current version of buildroot or the 2016.02
version?

I hope these aren't stupid questions.

--000000000000d7435d05e064024c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi there,</div><div><br></div>I came across this <a h=
ref=3D"https://lists.buildroot.org/pipermail/buildroot/2016-April/159030.ht=
ml">https://lists.buildroot.org/pipermail/buildroot/2016-April/159030.html<=
/a> when looking at creating linux distro (Came across the snakeware distro=
=C2=A0<a href=3D"https://github.com/joshiemoore/snakeware">https://github.c=
om/joshiemoore/snakeware</a>=C2=A0and noticed there was no 32 bit option an=
d have some old 32 bit laptops around) I looked at=C2=A0<a href=3D"https://=
www.thirtythreeforty.net/posts/2020/01/mastering-embedded-linux-part-3-buil=
droot/">https://www.thirtythreeforty.net/posts/2020/01/mastering-embedded-l=
inux-part-3-buildroot/</a>=C2=A0and assumed that i386_defconfig would exist=
. similarly (as from .config file from make menuconfig had i386 option)<div=
><br></div><div>So what impact does removing support for i386 have for comp=
iling a distro? I noticed you could select i386 in make menuconfig... Also =
debian still has 32bit versions (unlike Ubuntu etc) but that&#39;s the kern=
el plus applications...</div><div><br></div><div>BR2_LEGACY=3Dy and=C2=A0BR=
2_x86_i386=3Dy were grouped in legacy but=C2=A0BR2_i386=3Dy was up higher i=
n .config file<br></div><div><br></div><div>So what do people use - the cur=
rent version of buildroot or the 2016.02 version?</div><div><br></div><div>=
I hope these aren&#39;t stupid questions.</div><div><br></div></div>

--000000000000d7435d05e064024c--

--===============7949354092201144433==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7949354092201144433==--
