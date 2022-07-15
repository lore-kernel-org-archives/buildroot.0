Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A82BFC433EF
	for <buildroot@archiver.kernel.org>; Fri, 15 Jul 2022 16:25:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC3DA8505A;
	Fri, 15 Jul 2022 16:25:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC3DA8505A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oi_JotQiWQvS; Fri, 15 Jul 2022 16:25:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F1C8D8504F;
	Fri, 15 Jul 2022 16:25:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F1C8D8504F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4E38D1BF3B8
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 16:25:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 27D3E40376
 for <buildroot@lists.busybox.net>; Fri, 15 Jul 2022 16:25:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 27D3E40376
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JHhhTYndtLRC for <buildroot@lists.busybox.net>;
 Fri, 15 Jul 2022 16:25:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1ADAB4026A
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1ADAB4026A
 for <buildroot@buildroot.org>; Fri, 15 Jul 2022 16:25:18 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 i8-20020a17090a4b8800b001ef8a65bfbdso6592551pjh.1
 for <buildroot@buildroot.org>; Fri, 15 Jul 2022 09:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=9fqMBYHa33OVI18WS3DIJl5sd6rsQCHxXREQQjN+iGQ=;
 b=ewZtTpws4a7yoAVqpfdI6HkZ/j9rdERtUB3EqpLLn5AoUWJY08slPmgkKVLrDNlkCZ
 +7mBtH224avoQ9LQEOC3Ut4NTMe0xAPzREMAlaSccsA6UZTMYEG83NkyQUoI9rieTvHA
 O2TsCBi56K+Rxrs9iVoQxo0lNcE4dN2RRYvZk9snqgv68Wvzr9KoOsYEmrWA4Oc4CJ8D
 ZA4EXjCPqPS8Zm1o/QZE7+UZRluiKj33JoS69YeAkttLsHfryqomO711sTRFlYIGJEWK
 LnFA/JBMSNUHs1xZCW2yrwKuNomKhKKGATr72W65UvbdprSl4X7Ve+8qswDDivsxU3Q0
 +OtQ==
X-Gm-Message-State: AJIora/kXbTjuRVNa3/vOod6b+ycRNuU2bhPn46YI9nnMgJudjkS0gM3
 n1eeE/FBMpY93fgBmQKmroxoi5solCUWIlFREgQbGI2I
X-Google-Smtp-Source: AGRyM1u5MNAhQ34M2HqOptSmMTbYfmyZ16qew2rUokdiA2rAIY8tlEOe6Ay9eDUNBkx9t9kzFOvWV/mi8YKvSe+BNrA=
X-Received: by 2002:a17:90a:ca89:b0:1ef:7de9:ac45 with SMTP id
 y9-20020a17090aca8900b001ef7de9ac45mr16333720pjt.59.1657902315791; Fri, 15
 Jul 2022 09:25:15 -0700 (PDT)
MIME-Version: 1.0
References: <CAJxTgFw=_ztH8CWEC8-Fwy1Q+eUtVV26iqw99+v6YNKBwjE85g@mail.gmail.com>
 <20220715154532.02a18e7f@windsurf>
 <CAJxTgFyTmLxM57mUC5c6w8WH8ZDiiuG+zHm4SkcPadCvwTbCgw@mail.gmail.com>
In-Reply-To: <CAJxTgFyTmLxM57mUC5c6w8WH8ZDiiuG+zHm4SkcPadCvwTbCgw@mail.gmail.com>
From: Ritvik <ritviktanksalkar@gmail.com>
Date: Fri, 15 Jul 2022 21:55:04 +0530
Message-ID: <CAJxTgFw0R0nSBjgXO9T6ZpacUQ2xfAMqWXLsK-V9pPrJNi5REg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=9fqMBYHa33OVI18WS3DIJl5sd6rsQCHxXREQQjN+iGQ=;
 b=JxvtnsAt+QKcNCopPKSZCqxffe2/5ws1Tu5Z9d8/OBc4v1YV9LW1QsStXcRcPJCm7t
 tU2EtyjeJXp3aKonb/TcQP/RQ6Iya/huSQn3w7mU4kqC7F4ejQLJ92MSdA+MegdIR2PW
 bzDC9rOKWLK179D2g8YVbmIkaRwEd6hCwyMAKLKgqUEm2OWI8YGhQsi3FgukD86K8IZT
 Zb6nmm4eoQCIy0myFfNjvkhKMR3n2RiR8sTgc/NhtcdSKVlMWNDWsYZsWj6ewqQU1c9N
 hiuooFZ8l6f+WtV8Zo8SwIK9v2U4/n5DUXYTEKtacx+Hl6XEcAIeO/3qEDnG1ayRPQa0
 jNBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=JxvtnsAt
Subject: [Buildroot] Fwd:  Buildroot failure due to undeclared variable
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
Content-Type: multipart/mixed; boundary="===============5900144966520126116=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5900144966520126116==
Content-Type: multipart/alternative; boundary="0000000000009ae83005e3da76db"

--0000000000009ae83005e3da76db
Content-Type: text/plain; charset="UTF-8"

---------- Forwarded message ---------
From: Ritvik <ritviktanksalkar@gmail.com>
Date: Fri, 15 Jul 2022, 19:51
Subject: Re: [Buildroot] Buildroot failure due to undeclared variable
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>


Hello Thomas,

The problem I see is supposedly arising while building
`output/build/xenomai-3.0.10`. If that doesn't seem to help, please let me
know, I will try to create a config which can reach the build process of
xenomai-3.0.10.

Warm Regards,
Ritvik Tanksalkar



On Fri, Jul 15, 2022 at 7:15 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> On Fri, 15 Jul 2022 18:44:32 +0530
> Ritvik <ritviktanksalkar@gmail.com> wrote:
>
> > I have been trying to build the latest version of buildroot (2022.02.3)
> on
> > ubuntu 22.04 (ec2 server), a thing to note would be that I wish to
> install
> > literally every extra package that buildroot offers as part of it's
> target
> > packages, so I checked every box of all packages and libraries of every
> > category in the target packages. I also selected the linux kernel as some
> > packages needed that as a dependency. My installation is stuck at an
> error
> > apparently related to linux kernel's cobalt xenomai x32 syscalls stating
> > that `__COBALT_X32_BASE` is undeclared. I am attaching a screenshot for
> > reference. Any help in this regard would be highly appreciated.
>
> Thanks for your report. Since enabling all packages doesn't really make
> a lot of sense, and would make reproducing your issue very long, could
> you try to provide a small Buildroot configuration that exhibits the
> issue?
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000009ae83005e3da76db
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" cla=
ss=3D"gmail_attr">---------- Forwarded message ---------<br>From: <strong c=
lass=3D"gmail_sendername" dir=3D"auto">Ritvik</strong> <span dir=3D"auto">&=
lt;<a href=3D"mailto:ritviktanksalkar@gmail.com">ritviktanksalkar@gmail.com=
</a>&gt;</span><br>Date: Fri, 15 Jul 2022, 19:51<br>Subject: Re: [Buildroot=
] Buildroot failure due to undeclared variable<br>To: Thomas Petazzoni &lt;=
<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.co=
m</a>&gt;<br></div><br><br><div dir=3D"ltr">Hello Thomas,<div><br></div><di=
v>The problem I see is supposedly arising while building `output/build/xeno=
mai-3.0.10`. If that doesn&#39;t seem to help, please let me know, I will t=
ry to create a config which can reach the build process of xenomai-3.0.10.<=
/div><div><br clear=3D"all"><div><div dir=3D"ltr" data-smartmail=3D"gmail_s=
ignature"><div dir=3D"ltr"><div><div dir=3D"ltr">Warm Regards,<div>Ritvik T=
anksalkar</div><div><br></div></div></div></div></div></div><br></div></div=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fr=
i, Jul 15, 2022 at 7:15 PM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.pe=
tazzoni@bootlin.com" target=3D"_blank" rel=3D"noreferrer">thomas.petazzoni@=
bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">Hello,<br>
<br>
On Fri, 15 Jul 2022 18:44:32 +0530<br>
Ritvik &lt;<a href=3D"mailto:ritviktanksalkar@gmail.com" target=3D"_blank" =
rel=3D"noreferrer">ritviktanksalkar@gmail.com</a>&gt; wrote:<br>
<br>
&gt; I have been trying to build the latest version of buildroot (2022.02.3=
) on<br>
&gt; ubuntu 22.04 (ec2 server), a thing to note would be that I wish to ins=
tall<br>
&gt; literally every extra package that buildroot offers as part of it&#39;=
s target<br>
&gt; packages, so I checked every box of all packages and libraries of ever=
y<br>
&gt; category in the target packages. I also selected the linux kernel as s=
ome<br>
&gt; packages needed that as a dependency. My installation is stuck at an e=
rror<br>
&gt; apparently related to linux kernel&#39;s cobalt xenomai x32 syscalls s=
tating<br>
&gt; that `__COBALT_X32_BASE` is undeclared. I am attaching a screenshot fo=
r<br>
&gt; reference. Any help in this regard would be highly appreciated.<br>
<br>
Thanks for your report. Since enabling all packages doesn&#39;t really make=
<br>
a lot of sense, and would make reproducing your issue very long, could<br>
you try to provide a small Buildroot configuration that exhibits the<br>
issue?<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div>
</div>

--0000000000009ae83005e3da76db--

--===============5900144966520126116==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5900144966520126116==--
