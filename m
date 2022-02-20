Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F27C433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 12:45:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5550E8175B;
	Sun, 20 Feb 2022 12:45:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bpo338g0FUEX; Sun, 20 Feb 2022 12:45:52 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CF728146E;
	Sun, 20 Feb 2022 12:45:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8E27A1BF371
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 12:45:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7C2B38146E
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 12:45:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xoSxuNDts23A for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 12:45:48 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2DD4A8146B
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 12:45:48 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id p9so22358513wra.12
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 04:45:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=64JI3ulUsNcCsl4pfP+sRthVnIeQ6qJabRIw5WJt2vg=;
 b=FMdLQgyn8IKb6YfMmn/GHRdUoZOR9S+YvvOHPztPQlsUtovihZFiSCjP9QQOhd0EBk
 6Usfz8ws9QWDBTFkQNaodGh+0RWUedbmo9ayoxtExqiI35/wieAfRxXqIBVADPobLP5F
 LYPJmg0YDbGsPDkqdXRTpdJxfjfYQk4Dt7nAGmS/X/7icJBgwss5lwm6tqMRagWAxFPX
 HkC/kvUAi/hHrAomg87aOv27dGK2OxLVgsF1+9Dg5dZf3kNB53hoGDN66CT+SzTDqFx+
 rzzCQq8EmiAFYNN5gdNRa/CSLK89BmxKcmwxLsXWe2C2O34hopShqrlLVx/Uh7DUaWQN
 avPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=64JI3ulUsNcCsl4pfP+sRthVnIeQ6qJabRIw5WJt2vg=;
 b=eERFUmCm26FzliPmN64/XdPolBLbdxpseUGkE6jWsFqIHI8ID+jJyNEFGr3Mlo03ea
 +CDWGEvatxdfUFUEIT+3akTKLuUSb0V6V2iGmdzLoqhoqAhN0MuDDLIv0l/KOWar6VPE
 KEVEaADbfBDy6+GkYXq7LWo3iFJG9pHByvOCyVPidMB1vhq7C6m320f1/QS+JNRzOIen
 NNABp1n3jgQWq6mf0SUfh+iiAQvByPIwLJp6id+HlwNzUrg752UYPAM3wB76ZhzoQkgo
 oEzBJl3udgVMDeffgeOKOQYNmuKCmIVLQ9bZmUqXEw8dioSKcgwilFkGrDO5YR4U2N09
 8nJQ==
X-Gm-Message-State: AOAM532sDtGBYnFD58rdG35/wJf047fguLgdyEh80XIZVHUssk6SwFh8
 XdJSPXS0RyPGfgNfv9oq3hdbJLVyCRDYEJSHm/KnLlFSuAM=
X-Google-Smtp-Source: ABdhPJy/rHiI8kzHKet6uziLwvhzbylWpG40YZgFg1TddFlVyxik6arkth5RDRB69VcAYoOwEbbugY21LQ8TlLdUNbc=
X-Received: by 2002:a5d:634d:0:b0:1e6:f150:522e with SMTP id
 b13-20020a5d634d000000b001e6f150522emr12601635wrw.439.1645361146061; Sun, 20
 Feb 2022 04:45:46 -0800 (PST)
MIME-Version: 1.0
References: <CAHnHX5jBPNhPMUZz+TPiUk2_+FpWYV0EoHwCdHoKHNsLsqbM4g@mail.gmail.com>
 <893D1C4B-6F6D-4F58-A77C-C71AFED67270@benettiengineering.com>
In-Reply-To: <893D1C4B-6F6D-4F58-A77C-C71AFED67270@benettiengineering.com>
From: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
Date: Sun, 20 Feb 2022 20:45:34 +0800
Message-ID: <CAHnHX5jOqW2fg--vVGjygya_QMo76DqDsYyEYiqpOmWHW3EHQg@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] Issue with login
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
Content-Type: multipart/mixed; boundary="===============3556507917138120497=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3556507917138120497==
Content-Type: multipart/alternative; boundary="000000000000a3680d05d8727ef9"

--000000000000a3680d05d8727ef9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Giulio,

Yes I have used root as a user. unfortunately i didn't set the path to the
users tables. Could this be a problem? If so, where to set them? I
understand that the users list are kept in paswd file correct?

Thanks

On Sun, Feb 20, 2022 at 7:43 PM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> Hi Mohd,
>
> have you used root as user? Or did you provide a user table?
>
> Giulio
>
> Inviato da iPhone
>
> > Il giorno 20 feb 2022, alle ore 11:57, Mohd Faiz Rohani <
> mohd.faiz.rohani@gmail.com> ha scritto:
> >
> > =EF=BB=BF
> > Hi guys,
> >
> > I managed to compile with success the Uboot(U-Boot 2019.04), Linux
> kernel(4.4.155)and root file system(systemd 249) using the
> Buildroot-2021.11.1. It was able to boot successfully until the login
> prompt. However, it seems like there is an error with the login prompt it
> does not want to enter, just looping around the login prompt after I have
> entered the login name (not showing the password prompt). Did anyone know
> about this?
> >
> > Thanks.
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--000000000000a3680d05d8727ef9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi=C2=A0Giulio,<div><br></div><div>Yes I have used root as=
 a user. unfortunately i didn&#39;t=C2=A0set the path to the users tables. =
Could this be a problem? If so, where to set them? I understand that the us=
ers list are kept in paswd=C2=A0file correct?</div><div><br></div><div>Than=
ks</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmai=
l_attr">On Sun, Feb 20, 2022 at 7:43 PM Giulio Benetti &lt;<a href=3D"mailt=
o:giulio.benetti@benettiengineering.com">giulio.benetti@benettiengineering.=
com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Hi Mohd,<br>
<br>
have you used root as user? Or did you provide a user table?<br>
<br>
Giulio<br>
<br>
Inviato da iPhone<br>
<br>
&gt; Il giorno 20 feb 2022, alle ore 11:57, Mohd Faiz Rohani &lt;<a href=3D=
"mailto:mohd.faiz.rohani@gmail.com" target=3D"_blank">mohd.faiz.rohani@gmai=
l.com</a>&gt; ha scritto:<br>
&gt; <br>
&gt; =EF=BB=BF<br>
&gt; Hi guys,<br>
&gt; <br>
&gt; I managed to compile with success the Uboot(U-Boot 2019.04), Linux ker=
nel(4.4.155)and root file system(systemd 249) using the Buildroot-2021.11.1=
. It was able to boot successfully until the login prompt. However, it seem=
s like there is an error with the login prompt it does not want to enter, j=
ust looping around the login prompt after I have entered the login name (no=
t showing the password prompt). Did anyone know about this?<br>
&gt; <br>
&gt; Thanks.<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
<br>
</blockquote></div>

--000000000000a3680d05d8727ef9--

--===============3556507917138120497==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3556507917138120497==--
