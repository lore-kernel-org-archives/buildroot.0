Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7189C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:03:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5847940196;
	Sat,  8 Jan 2022 19:03:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id b8muOn_hnTw5; Sat,  8 Jan 2022 19:03:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5D1654018E;
	Sat,  8 Jan 2022 19:03:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7A6041BF593
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:03:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6817F607C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:03:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1PwsXJJZkVGy for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:03:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 0F0A060669
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:03:28 +0000 (UTC)
Received: by mail-io1-xd35.google.com with SMTP id q5so11714197ioj.7
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 11:03:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=CrsGv3KJvA1YL0c7Xu30mRheAIBO/bhazdDgT5trDHw=;
 b=ZxX53vYJk7gl0JbPwNyjaXh2yKxdtOMvfUIEEoNJd5lBzb706SKxODaFG1zIhna0IM
 /nY5qDjS7uVv0KbJO3vwi3Se2cZS324IHfwXRHks0qIGGcxrisIw7L4ubk06efKe5CS4
 OgqC61dUBvvq/iQfm8tHU6O+3eM5sAlei93L3hT7G87i5NSGyoEGELsW43Af4iQ9VBZU
 hOUMQCM/w7pnk6UA/rlOD2NMdFddx57qe1j4/711rlXAREri0A1DnKuW72QuaJz4bVD5
 Fcr/JiqoTBgZFNMWk2Gg82uTlYmo4XbBHoPWkFxgqiOMBM0yFfqh7OoP/I3X9nJaBBFq
 D58g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=CrsGv3KJvA1YL0c7Xu30mRheAIBO/bhazdDgT5trDHw=;
 b=6hAmNSAusfbV0kmJXUqVsuPZYYLDqDZgBaSvAwDuk1za+hQ3xYecOh1JLeGyIx3x8n
 v+qb4XqHj6MAStv6fUD223oVKu3K8gAAl5wTTRvr3D4AwFyhJnhLwPlrHJL4uJNd/FoP
 f8GdyLg+E3gwVVm2oivm3WsKXr3W8EnIJBruWC7/pynMnlyV8VpG2sKHjCMCy4owLN7X
 +MlkttyCGETeqavbn32P8hhoUN2HnUjsDPWuzoRF4fPa2h4CnmAH80y6ew+cYShKY9eW
 n0+hW9GRh+hBc07uKM4d2in5gpdPXkxmgFwVLfiUyvGa4IEeQ9veY0D84qYRjgeyJ0Kh
 KXDQ==
X-Gm-Message-State: AOAM531OLED3PZWppa2RP1uAlDX226QAa5fq8h4bRGnqVSoQMDHzzytP
 yaxJtd2UPdRPhiCbmaSIcZbnpnuFaVBlx5fwi1ckHZPh
X-Google-Smtp-Source: ABdhPJyKI5unKhd20x0KPZ1R2MF41prbTZsoqhniNUBWVaXoGhb2+oh5S8U2wNw/nnN9OrpuHvDgYS1GmiS8MYJhyks=
X-Received: by 2002:a5d:85d5:: with SMTP id e21mr32119449ios.51.1641668608067; 
 Sat, 08 Jan 2022 11:03:28 -0800 (PST)
MIME-Version: 1.0
References: <20210623145231.19243-1-cyrilbur@gmail.com>
 <382b2896-92a6-4a75-0093-bea2b6f91bf9@smile.fr>
In-Reply-To: <382b2896-92a6-4a75-0093-bea2b6f91bf9@smile.fr>
From: Cyril Bur <cyrilbur@gmail.com>
Date: Sat, 8 Jan 2022 19:03:17 +0000
Message-ID: <CAN-ccAQ9p1GKWmLThvGxi2+r698j9LB47RK0R6piC5zR2OgRvQ@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH] package/python-greenlet: enable as host
 package
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
Content-Type: multipart/mixed; boundary="===============8655509392006036622=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8655509392006036622==
Content-Type: multipart/alternative; boundary="000000000000390da105d516c2b2"

--000000000000390da105d516c2b2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Romain,

Thanks for your interest.

My employer has some custom packages which do depend on host python
greenlet.

I'm keen to avoid any forks (however small) of buildroot internally, it
just makes life easier.

Cyril


On Sat, 8 Jan 2022, 18:43 Romain Naour, <romain.naour@smile.fr> wrote:

> Hello,
>
> Le 23/06/2021 =C3=A0 16:52, Cyril Bur a =C3=A9crit :
>
> Why?
>
> There is not package using host-python-greenlet in the tree.
>
> Best regards,
> Romain
>
> > Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> > ---
> >  package/python-greenlet/python-greenlet.mk | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/package/python-greenlet/python-greenlet.mk
> b/package/python-greenlet/python-greenlet.mk
> > index 01d578a183..e90d1c0f56 100644
> > --- a/package/python-greenlet/python-greenlet.mk
> > +++ b/package/python-greenlet/python-greenlet.mk
> > @@ -12,3 +12,4 @@ PYTHON_GREENLET_LICENSE =3D MIT, PSF-2.0
> >  PYTHON_GREENLET_LICENSE_FILES =3D LICENSE LICENSE.PSF
> >
> >  $(eval $(python-package))
> > +$(eval $(host-python-package))
> >
>
>

--000000000000390da105d516c2b2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Romain,<div dir=3D"auto"><br></div><div dir=3D"au=
to">Thanks for your interest.</div><div dir=3D"auto"><br></div><div dir=3D"=
auto">My employer has some custom packages which do depend on host python g=
reenlet.</div><div dir=3D"auto"><br></div><div dir=3D"auto">I&#39;m keen to=
 avoid any forks (however small) of buildroot internally, it just makes lif=
e easier.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cyril</div><br=
><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sa=
t, 8 Jan 2022, 18:43 Romain Naour, &lt;<a href=3D"mailto:romain.naour@smile=
.fr">romain.naour@smile.fr</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-lef=
t:1ex">Hello,<br>
<br>
Le 23/06/2021 =C3=A0 16:52, Cyril Bur a =C3=A9crit=C2=A0:<br>
<br>
Why?<br>
<br>
There is not package using host-python-greenlet in the tree.<br>
<br>
Best regards,<br>
Romain<br>
<br>
&gt; Signed-off-by: Cyril Bur &lt;<a href=3D"mailto:cyrilbur@gmail.com" tar=
get=3D"_blank" rel=3D"noreferrer">cyrilbur@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/python-greenlet/<a href=3D"http://python-greenlet.mk" re=
l=3D"noreferrer noreferrer" target=3D"_blank">python-greenlet.mk</a> | 1 +<=
br>
&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt; <br>
&gt; diff --git a/package/python-greenlet/<a href=3D"http://python-greenlet=
.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">python-greenlet.mk</a>=
 b/package/python-greenlet/<a href=3D"http://python-greenlet.mk" rel=3D"nor=
eferrer noreferrer" target=3D"_blank">python-greenlet.mk</a><br>
&gt; index 01d578a183..e90d1c0f56 100644<br>
&gt; --- a/package/python-greenlet/<a href=3D"http://python-greenlet.mk" re=
l=3D"noreferrer noreferrer" target=3D"_blank">python-greenlet.mk</a><br>
&gt; +++ b/package/python-greenlet/<a href=3D"http://python-greenlet.mk" re=
l=3D"noreferrer noreferrer" target=3D"_blank">python-greenlet.mk</a><br>
&gt; @@ -12,3 +12,4 @@ PYTHON_GREENLET_LICENSE =3D MIT, PSF-2.0<br>
&gt;=C2=A0 PYTHON_GREENLET_LICENSE_FILES =3D LICENSE LICENSE.PSF<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 $(eval $(python-package))<br>
&gt; +$(eval $(host-python-package))<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--000000000000390da105d516c2b2--

--===============8655509392006036622==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8655509392006036622==--
