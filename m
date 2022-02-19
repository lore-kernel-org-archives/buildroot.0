Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E05C2C433EF
	for <buildroot@archiver.kernel.org>; Sat, 19 Feb 2022 15:46:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7F3E182435;
	Sat, 19 Feb 2022 15:46:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S1DAg6LuF2A0; Sat, 19 Feb 2022 15:46:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A41FD82425;
	Sat, 19 Feb 2022 15:45:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D799A1BF30B
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 15:45:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D3852400E0
 for <buildroot@lists.busybox.net>; Sat, 19 Feb 2022 15:45:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0zQWRiLqOTwF for <buildroot@lists.busybox.net>;
 Sat, 19 Feb 2022 15:45:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x112e.google.com (mail-yw1-x112e.google.com
 [IPv6:2607:f8b0:4864:20::112e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 962B5400B8
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 15:45:56 +0000 (UTC)
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-2d6923bca1aso86614587b3.9
 for <buildroot@buildroot.org>; Sat, 19 Feb 2022 07:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=vsAdzKRZ0j1XhaSrc6dOx+Vv5DXRZxTPEOrsq+a1bz4=;
 b=Z6gSxF8xtEleY/ju0y+79S2LDeaH68Drhj81Omti7LhZmuKW5Dv0Umh/7GoCCipJKp
 ONveSnPRGDsQTPGAjXdES2rTSuUN3uxSubMrhIpDSVY0dj8hdxsEp91X//uNOZ+uOwIG
 tQ5ag6GNkPPdDzAMS/sNx69tHMOa0y0dlbXZoRGOl8LzwomYQPNFWbqqd5dOqkPAWL+f
 qjBqBS+0DGqLZ48bvPFp3Q6eNbqJ/sSPvBGQeegZ+CYhF6QdZNEW8g5WiCkkf6ZwFKEt
 Md7xuny1ipWHGTlKkoNrS4OBIuaEgQnBFgvlBO2ZBOL9Cd3IAfANx3excosA3vTaYxlN
 liXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=vsAdzKRZ0j1XhaSrc6dOx+Vv5DXRZxTPEOrsq+a1bz4=;
 b=d75wfQ8isuPNBE0UgKDj0ebYkphtLfNt/FnSvAmG0/rbEl4ovZ5VFgu+Hxgiz3OOAO
 i4zD1t+gdnfEmObCl72JW764v7OWYHsIGXyrOJrqjxxXzZX4m0H+nWDZv2ljkJskKTax
 u9M4XmckhfpfyvsyhNgBw9o/6O3roO7YiAk6WOBlkZQIXxCZukufDG6vjXblsP36cDbi
 aPwGbDlCbg9HEtI5B+4o4+ZempiAkg7S0LKLBbowpUO8vJsCqyCMADSnVulxmJFuY2n8
 FC3MjtZ1kOnDs0cvfbVkiNiP5YQkc2LaDndb89nRQuTv4WGcPbQAFfAEHUZ8SaWrj64r
 O0ug==
X-Gm-Message-State: AOAM530Fz8zBchqaa6tZWOZMYah0/0znzVfnAOYn3C9oKRo/i7+6DOxw
 GNQrN3R4wFuOweacNQv/4i9k9MTKFqygGocJXp0=
X-Google-Smtp-Source: ABdhPJxUSwLJG6Lr91HBzm9B8fuJgitIGTLryip5KZqNCTkqwU8SRd+3b8VGs+CWqBr2FZbwU0WwPFqcrVugesLW3jo=
X-Received: by 2002:a81:b288:0:b0:2d6:39d5:31a1 with SMTP id
 q130-20020a81b288000000b002d639d531a1mr12575120ywh.506.1645285555574; Sat, 19
 Feb 2022 07:45:55 -0800 (PST)
MIME-Version: 1.0
References: <CAGrGpJB10RkRQOwkJ6_cVz=qX2qkQPxp5rmf802qOiss+5+3xw@mail.gmail.com>
 <C47D66BF-F38D-4FD2-B36D-E6C3A1F21DF8@benettiengineering.com>
 <20220219090159.GA822323@scaer>
In-Reply-To: <20220219090159.GA822323@scaer>
From: Peter Thompson <peter.macleod.thompson@gmail.com>
Date: Sat, 19 Feb 2022 08:45:44 -0700
Message-ID: <CAGrGpJCHffK8qpCTvLLRXoGYwpcMfL_YsgbCS1VdLD9t7=SGCA@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] Buildroot Failure 2022-02-16 02:25:21
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============5610864012120062324=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5610864012120062324==
Content-Type: multipart/alternative; boundary="000000000000181c4405d860e5c9"

--000000000000181c4405d860e5c9
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

 > I think this might have been fixed with commit e253e41ce2e5
(package/sdl2_ttf:
add harfbuzz optional dependency)

Yes - I was just noticing that it was already fixed....   thanks Yann

Peter

On Sat, Feb 19, 2022 at 2:02 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Giulio, Peter, All,
>
> On 2022-02-18 22:41 +0100, Giulio Benetti spake thusly:
> > > Il giorno 18 feb 2022, alle ore 20:03, Peter Thompson <
> peter.macleod.thompson@gmail.com> ha scritto:
> > > My bump of sdl2_ttf-2.0.15 to sdl2_ttf-2.0.18  caused an autobuilder
> failure  2022-02-16 02:25:21.      The log indicates the problem is
> pthread.h missing when harfbuzz is specified.    See log below...
> > > Not sure why sdl2_ttf-2.0.15 worked before.....
> > It seems like that between 2.0.15 to 2.0.18(maybe)
> > sdl2_ttf only uses harfbuzz provided by sdl2_ttf itself.
> > This means it=E2=80=99s skipping the one provided from Buildroot that i=
s already
> patched for harfbuzz pthread.h issue.
> [--SNIP--]
> > If look closer the build failure you will see that it=E2=80=99s not Bui=
ldroot
> harfbuzz that fails but a harfbuzz embedded into sdl2_ttf.
> > So what I should to is to try to make sdl2_ttf drop its internal
> harfbuzz and use the Buildroot one.
>
> I think ths might have been fixed with commit e253e41ce2e5
> (package/sdl2_ttf:
> add harfbuzz optional dependency)
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------=
------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There i=
s
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------=
------'
>

--000000000000181c4405d860e5c9
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"> &gt; I think this might have been fixed with commit e253e=
41ce2e5 (package/sdl2_ttf:<br><div>
add harfbuzz optional dependency)</div><div><br></div><div>Yes - I was just=
 noticing that it was already fixed....=C2=A0=C2=A0 thanks Yann</div><div><=
br></div><div>Peter<br></div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Sat, Feb 19, 2022 at 2:02 AM Yann E. MORIN=
 &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>=
&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Giul=
io, Peter, All,<br>
<br>
On 2022-02-18 22:41 +0100, Giulio Benetti spake thusly:<br>
&gt; &gt; Il giorno 18 feb 2022, alle ore 20:03, Peter Thompson &lt;<a href=
=3D"mailto:peter.macleod.thompson@gmail.com" target=3D"_blank">peter.macleo=
d.thompson@gmail.com</a>&gt; ha scritto:<br>
&gt; &gt; My bump of sdl2_ttf-2.0.15 to sdl2_ttf-2.0.18=C2=A0 caused an aut=
obuilder failure=C2=A0 2022-02-16 02:25:21.=C2=A0 =C2=A0 =C2=A0 The log ind=
icates the problem is=C2=A0 pthread.h missing when harfbuzz is specified.=
=C2=A0 =C2=A0 See log below...<br>
&gt; &gt; Not sure why sdl2_ttf-2.0.15 worked before.....=C2=A0 <br>
&gt; It seems like that between 2.0.15 to 2.0.18(maybe)<br>
&gt; sdl2_ttf only uses harfbuzz provided by sdl2_ttf itself.<br>
&gt; This means it=E2=80=99s skipping the one provided from Buildroot that =
is already patched for harfbuzz pthread.h issue.<br>
[--SNIP--]<br>
&gt; If look closer the build failure you will see that it=E2=80=99s not Bu=
ildroot harfbuzz that fails but a harfbuzz embedded into sdl2_ttf. <br>
&gt; So what I should to is to try to make sdl2_ttf drop its internal harfb=
uzz and use the Buildroot one.<br>
<br>
I think ths might have been fixed with commit e253e41ce2e5 (package/sdl2_tt=
f:<br>
add harfbuzz optional dependency)<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=3D"_bl=
ank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =C2=A0 =
|=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>

--000000000000181c4405d860e5c9--

--===============5610864012120062324==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5610864012120062324==--
