Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F17EBC433F5
	for <buildroot@archiver.kernel.org>; Sat,  1 Oct 2022 21:06:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 56BB78336F;
	Sat,  1 Oct 2022 21:06:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 56BB78336F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Gx_P1wyJv2Ti; Sat,  1 Oct 2022 21:06:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4355C83386;
	Sat,  1 Oct 2022 21:06:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4355C83386
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 165891BF4E6
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:06:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E590383386
 for <buildroot@lists.busybox.net>; Sat,  1 Oct 2022 21:06:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E590383386
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gGuFi2PxjxUQ for <buildroot@lists.busybox.net>;
 Sat,  1 Oct 2022 21:06:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CB8B8336F
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CB8B8336F
 for <buildroot@buildroot.org>; Sat,  1 Oct 2022 21:06:29 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id d42so11698313lfv.0
 for <buildroot@buildroot.org>; Sat, 01 Oct 2022 14:06:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4g4s3HH1UEzhjeYFnoZUjFA8PsyfogpLypVJq8Ta5FM=;
 b=Re37QTU4sGtEc9i0vT8Dfk0ytaQUiVNI1nc9ujDvWg9qaf/8IO9ns6kUfsmwXPlWwA
 HLkz+b7CTSQ4DBNglcylJZvfie13n+CnAwup5LMx9ANyccRHdZ4doSjVGlxz/FC8PX+d
 NrmXoJ4AAuTeJdB7DzwZFDp03QB5Yz7sXUagRHlvUWGEKtZgY5ZXQTq2iELrxAXpEfuN
 U1IWFHhJGdu1/Pu75jA3tWr7/Ho3U61g0dQJRp+e3t1RgqhiIP2/Irh859lxBxQRIk5d
 fjLTBD0i54IbMvO12RXadqNjQG8lS/T90c4JoSFq5qW1gHzo8ylMGR0z8OG+qV9CtGD+
 fnWw==
X-Gm-Message-State: ACrzQf1iKbVIuIzOZqFPTxcRMP3aacnzR9moJ3EEluOFWzIBLFb6Ju/u
 G03056DqAqjRa11FpKt/yPefI8UAhJAbJh8yM0fekPLB
X-Google-Smtp-Source: AMsMyM71YkyoTfKDS09n1C3X/I/2km52ClAh+VN9NVfV/8G9qVAM9UdUcn7GTKnWcO1ZWr5mcaMOkuts7VYae83X4Lg=
X-Received: by 2002:a19:f805:0:b0:498:df1f:858e with SMTP id
 a5-20020a19f805000000b00498df1f858emr5779691lff.610.1664658387160; Sat, 01
 Oct 2022 14:06:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220928213631.14450-1-fontaine.fabrice@gmail.com>
 <20221001165241.GM30794@scaer>
In-Reply-To: <20221001165241.GM30794@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 1 Oct 2022 23:06:15 +0200
Message-ID: <CAPi7W80PoLx4zqankep5Sv7vgB=t71xLg__BnqzpW-wm40WXdw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4g4s3HH1UEzhjeYFnoZUjFA8PsyfogpLypVJq8Ta5FM=;
 b=OvqghKia/n92xWLHEJLqCRDerYSv0Re1NMUrr9fqOCO21mSHscR3y57aFdIm9Kbckh
 pZwM0n6QT4Scr9b6K4w6t2yqgisp4+Al0d/NBh/C6PKZKxNCa1f+Ux/Pctf/C69EnVsA
 1fW01DArPZEsyTI/mF2sQ/CQt4ynPR5YSdDaa/Q7zxIZmIgJnBgATeHJxWYvI0ZvL+4T
 tp34+l8BGOqjUjvEN/dt8IyVsUPdIhbLxiCG7Hh82zv3x7kxtmicjtNCjYl842aO2Q2p
 Jw3SPfpPBo+1O7rzkvN0Sse3713ui/bxW3jwNyfyo2yCMsLjfooojDvOCGXIfux/dc5W
 gdGw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=OvqghKia
Subject: Re: [Buildroot] [PATCH 1/1] package/wolfssl: security bump to
 version 5.5.1
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
Cc: Sergio Prado <sergio.prado@e-labworks.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5841140722092993377=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5841140722092993377==
Content-Type: multipart/alternative; boundary="000000000000d6d04205e9ff7b12"

--000000000000d6d04205e9ff7b12
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le sam. 1 oct. 2022 =C3=A0 18:52, Yann E. MORIN <yann.morin.1998@free.fr> a
=C3=A9crit :

> Fabrice, All,
>
> On 2022-09-28 23:36 +0200, Fabrice Fontaine spake thusly:
> > Denial of service attack and buffer overflow against TLS 1.3
> > servers using session ticket resumption. When built with
> > --enable-session-ticket and making use of TLS 1.3 server code in
> > wolfSSL, there is the possibility of a malicious client to craft a
> > malformed second ClientHello packet that causes the server to crash.
> > This issue is limited to when using both --enable-session-ticket and TL=
S
> > 1.3 on the server side. Users with TLS 1.3 servers, and having
> > --enable-session-ticket, should update to the latest version of wolfSSL=
.
>
> I see that we are not explicitly using either --enable or
> --disable-session-ticket, so what is the default, and were we impacted?
>

session-ticket is disabled by default.
Moreover, session-ticket is enabled if nginx, wpas, haproxy or lighty is
enabled (but all of them are disabled).

So, we were not impacted except if the user has explicitly enabled this
option in its own tree.

>
> Also, we should have an explicit setting for that, rather than leave it
> to chance.
>

Why not, but wolfssl has a ton of options, should we also explicitly set
them to false even if they are disabled by default?


>
> > https://github.com/wolfSSL/wolfssl/releases/tag/v5.5.1-stable
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> Applied to master, thanks.
>
> Regards,
> Yann E. MORIN.
>
> > ---
> >  package/wolfssl/wolfssl.hash | 2 +-
> >  package/wolfssl/wolfssl.mk   | 2 +-
> >  2 files changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.has=
h
> > index f1401e4cda..3849ffb9fc 100644
> > --- a/package/wolfssl/wolfssl.hash
> > +++ b/package/wolfssl/wolfssl.hash
> > @@ -1,5 +1,5 @@
> >  # Locally computed:
> > -sha256
> c34b74b5f689fac7becb05583b044e84d3b10d39f38709f0095dd5d423ded67f
> wolfssl-5.5.0.tar.gz
> > +sha256
> 97339e6956c90e7c881ba5c748dd04f7c30e5dbe0c06da765418c51375a6dee3
> wolfssl-5.5.1.tar.gz
> >
> >  # Hash for license files:
> >  sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> > diff --git a/package/wolfssl/wolfssl.mk b/package/wolfssl/wolfssl.mk
> > index ca360312c9..95d4f47952 100644
> > --- a/package/wolfssl/wolfssl.mk
> > +++ b/package/wolfssl/wolfssl.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -WOLFSSL_VERSION =3D 5.5.0
> > +WOLFSSL_VERSION =3D 5.5.1
> >  WOLFSSL_SITE =3D $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSION)-sta=
ble)
> >  WOLFSSL_INSTALL_STAGING =3D YES
> >
> > --
> > 2.35.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
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

Best Regards,

Fabrice

--000000000000d6d04205e9ff7b12
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi,<br></div><br><div class=3D"gmail_quot=
e"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 1 oct. 2022 =C3=A0=C2=
=A018:52, Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann=
.morin.1998@free.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Fabrice, All,<br>
<br>
On 2022-09-28 23:36 +0200, Fabrice Fontaine spake thusly:<br>
&gt; Denial of service attack and buffer overflow against TLS 1.3<br>
&gt; servers using session ticket resumption. When built with<br>
&gt; --enable-session-ticket and making use of TLS 1.3 server code in<br>
&gt; wolfSSL, there is the possibility of a malicious client to craft a<br>
&gt; malformed second ClientHello packet that causes the server to crash.<b=
r>
&gt; This issue is limited to when using both --enable-session-ticket and T=
LS<br>
&gt; 1.3 on the server side. Users with TLS 1.3 servers, and having<br>
&gt; --enable-session-ticket, should update to the latest version of wolfSS=
L.<br>
<br>
I see that we are not explicitly using either --enable or<br>
--disable-session-ticket, so what is the default, and were we impacted?<br>=
</blockquote><div><br></div><div>session-ticket is disabled by default.</di=
v><div>Moreover, session-ticket is enabled if nginx, wpas, haproxy or light=
y is enabled (but all of them are disabled).<br></div><div>=C2=A0</div><div=
>So, we were not impacted except if the user has explicitly enabled this op=
tion in its own tree.<br></div><blockquote class=3D"gmail_quote" style=3D"m=
argin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left=
:1ex">
<br>
Also, we should have an explicit setting for that, rather than leave it<br>
to chance.<br></blockquote><div><br></div><div>Why not, but wolfssl has a t=
on of options, should we also explicitly set them to false even if they are=
 disabled by default?<br></div><div>=C2=A0</div><blockquote class=3D"gmail_=
quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,=
204);padding-left:1ex">
<br>
&gt; <a href=3D"https://github.com/wolfSSL/wolfssl/releases/tag/v5.5.1-stab=
le" rel=3D"noreferrer" target=3D"_blank">https://github.com/wolfSSL/wolfssl=
/releases/tag/v5.5.1-stable</a><br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
<br>
Applied to master, thanks.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 package/wolfssl/wolfssl.hash | 2 +-<br>
&gt;=C2=A0 package/wolfssl/<a href=3D"http://wolfssl.mk" rel=3D"noreferrer"=
 target=3D"_blank">wolfssl.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 2 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/wolfssl/wolfssl.hash b/package/wolfssl/wolfssl.ha=
sh<br>
&gt; index f1401e4cda..3849ffb9fc 100644<br>
&gt; --- a/package/wolfssl/wolfssl.hash<br>
&gt; +++ b/package/wolfssl/wolfssl.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 # Locally computed:<br>
&gt; -sha256=C2=A0 c34b74b5f689fac7becb05583b044e84d3b10d39f38709f0095dd5d4=
23ded67f=C2=A0 wolfssl-5.5.0.tar.gz<br>
&gt; +sha256=C2=A0 97339e6956c90e7c881ba5c748dd04f7c30e5dbe0c06da765418c513=
75a6dee3=C2=A0 wolfssl-5.5.1.tar.gz<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 # Hash for license files:<br>
&gt;=C2=A0 sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404=
010521b880643=C2=A0 COPYING<br>
&gt; diff --git a/package/wolfssl/<a href=3D"http://wolfssl.mk" rel=3D"nore=
ferrer" target=3D"_blank">wolfssl.mk</a> b/package/wolfssl/<a href=3D"http:=
//wolfssl.mk" rel=3D"noreferrer" target=3D"_blank">wolfssl.mk</a><br>
&gt; index ca360312c9..95d4f47952 100644<br>
&gt; --- a/package/wolfssl/<a href=3D"http://wolfssl.mk" rel=3D"noreferrer"=
 target=3D"_blank">wolfssl.mk</a><br>
&gt; +++ b/package/wolfssl/<a href=3D"http://wolfssl.mk" rel=3D"noreferrer"=
 target=3D"_blank">wolfssl.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -WOLFSSL_VERSION =3D 5.5.0<br>
&gt; +WOLFSSL_VERSION =3D 5.5.1<br>
&gt;=C2=A0 WOLFSSL_SITE =3D $(call github,wolfSSL,wolfssl,v$(WOLFSSL_VERSIO=
N)-stable)<br>
&gt;=C2=A0 WOLFSSL_INSTALL_STAGING =3D YES<br>
&gt;=C2=A0 <br>
&gt; -- <br>
&gt; 2.35.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
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
--------&#39;<br></blockquote><div><br></div><div>Best Regards,</div><div><=
br></div><div>Fabrice <br></div></div></div>

--000000000000d6d04205e9ff7b12--

--===============5841140722092993377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5841140722092993377==--
