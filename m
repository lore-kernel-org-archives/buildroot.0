Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96AA8C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 20 Dec 2023 15:02:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0330161048;
	Wed, 20 Dec 2023 15:02:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0330161048
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ejpcP9LKqrJC; Wed, 20 Dec 2023 15:02:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E44366104E;
	Wed, 20 Dec 2023 15:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E44366104E
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 0E3E81BF3C6
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 15:02:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D1EF043650
 for <buildroot@lists.busybox.net>; Wed, 20 Dec 2023 15:02:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1EF043650
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WiN-pZbwJq6Z for <buildroot@lists.busybox.net>;
 Wed, 20 Dec 2023 15:02:42 +0000 (UTC)
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 372FB404FE
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 15:02:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 372FB404FE
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-5cda24a77e0so1743190a12.2
 for <buildroot@buildroot.org>; Wed, 20 Dec 2023 07:02:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1703084561; x=1703689361;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4g02dyB3UqJObwSaZnXiyHfcwS+iuE+UeHV2/zhA3vA=;
 b=mHEGoepO4edJWilJ2q4zEQl7diGLtpbZbWit842gLfwEle654CvkonFUjGDg5uVrer
 LKP19UP3jVdkkFUPCsftth/GZO8okQYSbCzGlTRW55rz6HzDee2ly7+4+YgvS4+udoWW
 T53mqr6TQgX6rtIt/2uTczjyWYR8DeB+ZCP4c65jSS/S4BFYG5DuSKMSaSGeDSl20xA5
 k4zyj+j8jplUmqqsInHf3b8gq6vnXIgvZj4Uz0+L0lUj82DCqj5HN8/RLmkKqG28XsZT
 /uYZEHPBxFgM5abDg+GcpsahyKKeyT+h02ebCCnESIbIIXzijWNBkTo9hvsbTrrSHpak
 ZY+g==
X-Gm-Message-State: AOJu0YykOFwMeSKz5G/BiC3Kdjcxg3HjMJiXs6l5J3INwMlEJ3NL1roH
 RQrwobpq02z+r9VaOT0JQu5yVrl9SJorBNASpg0=
X-Google-Smtp-Source: AGHT+IH3l+J7NjIIVsBy1wxBmqUDaQu8HC1Ju9JB1OSRg0fMlBE7LpcEji0TUKxx7ym6O0euxbyiaYqJKAxY6nnez+I=
X-Received: by 2002:a17:90a:4306:b0:28a:2758:2cbb with SMTP id
 q6-20020a17090a430600b0028a27582cbbmr8730408pjg.85.1703084561429; Wed, 20 Dec
 2023 07:02:41 -0800 (PST)
MIME-Version: 1.0
References: <20231220134816.6306-1-jlangholzj@gmail.com>
 <20231220145641.39b93844@windsurf>
In-Reply-To: <20231220145641.39b93844@windsurf>
From: John Langholz <jlangholzj@gmail.com>
Date: Wed, 20 Dec 2023 10:02:29 -0500
Message-ID: <CAPL9kM2G4kc2aGcnA-8RkX-9Ya3vm++gQ3S0OJ9AA5x+TPYdrA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1703084561; x=1703689361; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4g02dyB3UqJObwSaZnXiyHfcwS+iuE+UeHV2/zhA3vA=;
 b=djTX3DlDPuOIkjGvIYOni4BCxyW8ZLB2VRJRLwbf9YhpPP+5ukEUvmaWJCuMiee3B0
 uixKw3cl5viAdETTcQOxkqta0RuI+31+jB5NcJ3JIEzt0ZfVbEN7JGK347lRmWC5UVBr
 tIi8juvn3YMrBzjS4eA0Kxp4/Z2z8965aO25WWcv1IlsFknPvDWBQqu+ci3AnuA6JH80
 9axsftxl+RGsu4DUMUQColEeo53B9B3kEN2HLPM8PFGH2UxW+Ux7RTNt7n2fvDMzR0te
 g8PToyZfjlf056MK2PZ/mDRS3kMlIJdt39bZjEe5mFFra7q42L583/Zqw0kVWk1lZ+5Y
 fFLQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=djTX3DlD
Subject: Re: [Buildroot] [PATCH] package/python3: add tk as core module
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0897584172858978280=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0897584172858978280==
Content-Type: multipart/alternative; boundary="0000000000004e7a8e060cf246de"

--0000000000004e7a8e060cf246de
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just to clarify to make sure I'm understanding the question: The concern is
that the host tk package (BR2_package_tk) isn't included as a dependency
(in my changes to host-python), is that correct?

Again, just for clarity; from my limited understanding, tk is included with
python but it's still just the interpreter for the tk/TCL packages. Because
of that, I was worried there was the potential to miss the other required
host packages and I was curious if there were some additional required
changes to ensure they were included. It appears that the "selected by"
statements for host-TCL and host-tk are handling this appropriately.

My one uncertainty is that they (host-tk and host-TCL) do both additionally
require the host-XORG package (BR2_package_XORG7) to be selected (via their
selected-by statement). I assumed that tk wouldn't ever be used without
some kind of window system and that's why the host-XORG package was
included in the selected-by statement for host-TCL and host-tk. That was my
only real unknown. That being said, In my limited testing it appears to
function as intended without the need for including host-tk as a dependency=
.

As an aside, I had some of this info included in the generated patch
cover-letter but I had not appropriately configured the cc-cover and
to-cover option for git email. As a result, when I ran the send-email
command it was left off! I'll fix that for the future to help give some
context.

On Wed, Dec 20, 2023 at 8:56=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello,
>
> Thanks for your contribution. See below a comment.
>
> On Wed, 20 Dec 2023 08:48:14 -0500
> "J. Langholz" <jlangholzj@gmail.com> wrote:
>
> > ---
> >  package/python3/Config.in  | 6 ++++++
> >  package/python3/python3.mk | 9 +++++++--
> >  2 files changed, 13 insertions(+), 2 deletions(-)
> >
> > diff --git a/package/python3/Config.in b/package/python3/Config.in
> > index 38f0580aa4..65afd4e6e2 100644
> > --- a/package/python3/Config.in
> > +++ b/package/python3/Config.in
> > @@ -108,6 +108,12 @@ config BR2_PACKAGE_PYTHON3_SQLITE
> >       help
> >         SQLite database support
> >
> > +config BR2_PACKAGE_PYTHON3_TK
> > +     bool "tk module"
> > +     select BR2_PACKAGE_TK
> > +     help
> > +       tk (a.k.a. tkinter) module support
> > +
> >  config BR2_PACKAGE_PYTHON3_PYEXPAT
> >       bool "xml module"
> >       select BR2_PACKAGE_EXPAT
> > diff --git a/package/python3/python3.mk b/package/python3/python3.mk
> > index b9c5054a21..ca797f8cda 100644
> > --- a/package/python3/python3.mk
> > +++ b/package/python3/python3.mk
> > @@ -20,7 +20,6 @@ HOST_PYTHON3_CONF_OPTS +=3D \
> >       --without-ensurepip \
> >       --without-cxx-main \
> >       --disable-sqlite3 \
> > -     --disable-tk \
>
> This is affecting the host package, but you're not adding host-tk to
> the dependencies. Do we need a host python with TK support to be able
> to build a target Python with TK support? (I don't think we do).
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>


--=20
Thanks,

-John Langholz

--0000000000004e7a8e060cf246de
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div>Just to clarify to make sure I&#39;m=
 understanding the question: The concern is that the host tk package (BR2_p=
ackage_tk) isn&#39;t included as a dependency (in my changes to host-python=
), is that correct?</div></div><div dir=3D"ltr"><br></div><div dir=3D"ltr">=
Again, just for clarity; from my limited understanding, tk is included with=
 python but it&#39;s still just the interpreter for the tk/TCL packages. Be=
cause of that, I was worried there was the potential to miss the other requ=
ired host packages and I was curious if there were some additional required=
 changes to ensure they were included.

 It appears that the &quot;selected by&quot; statements for host-TCL and ho=
st-tk are handling this appropriately.=C2=A0</div><div dir=3D"ltr"><br></di=
v><div dir=3D"ltr">My one uncertainty is that they (host-tk and host-TCL) d=
o both additionally require the host-XORG package (BR2_package_XORG7) to be=
 selected (via their selected-by statement). I assumed that tk wouldn&#39;t=
 ever be used without some kind of window system and that&#39;s why the hos=
t-XORG package was included in the selected-by statement for host-TCL and h=
ost-tk. That was my only real unknown. That being said, In my limited testi=
ng it appears to function as intended without the need for including host-t=
k as a dependency.<br></div><div dir=3D"ltr"><br></div><div>As an aside, I =
had some of this info included in the generated patch cover-letter but I ha=
d not appropriately configured the cc-cover and to-cover option for git ema=
il. As a result, when I ran the send-email command it was left off! I&#39;l=
l fix that for the future to help give some context.<br></div><br><div clas=
s=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Dec 20, 202=
3 at 8:56=E2=80=AFAM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzon=
i@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
Thanks for your contribution. See below a comment.<br>
<br>
On Wed, 20 Dec 2023 08:48:14 -0500<br>
&quot;J. Langholz&quot; &lt;<a href=3D"mailto:jlangholzj@gmail.com" target=
=3D"_blank">jlangholzj@gmail.com</a>&gt; wrote:<br>
<br>
&gt; ---<br>
&gt;=C2=A0 package/python3/Config.in=C2=A0 | 6 ++++++<br>
&gt;=C2=A0 package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer"=
 target=3D"_blank">python3.mk</a> | 9 +++++++--<br>
&gt;=C2=A0 2 files changed, 13 insertions(+), 2 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/python3/Config.in b/package/python3/Config.in<br>
&gt; index 38f0580aa4..65afd4e6e2 100644<br>
&gt; --- a/package/python3/Config.in<br>
&gt; +++ b/package/python3/Config.in<br>
&gt; @@ -108,6 +108,12 @@ config BR2_PACKAGE_PYTHON3_SQLITE<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0SQLite database support<br>
&gt;=C2=A0 <br>
&gt; +config BR2_PACKAGE_PYTHON3_TK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;tk module&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_TK<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0tk (a.k.a. tkinter) module support<br>
&gt; +<br>
&gt;=C2=A0 config BR2_PACKAGE_PYTHON3_PYEXPAT<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;xml module&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_EXPAT<br>
&gt; diff --git a/package/python3/<a href=3D"http://python3.mk" rel=3D"nore=
ferrer" target=3D"_blank">python3.mk</a> b/package/python3/<a href=3D"http:=
//python3.mk" rel=3D"noreferrer" target=3D"_blank">python3.mk</a><br>
&gt; index b9c5054a21..ca797f8cda 100644<br>
&gt; --- a/package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer"=
 target=3D"_blank">python3.mk</a><br>
&gt; +++ b/package/python3/<a href=3D"http://python3.mk" rel=3D"noreferrer"=
 target=3D"_blank">python3.mk</a><br>
&gt; @@ -20,7 +20,6 @@ HOST_PYTHON3_CONF_OPTS +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--without-ensurepip \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--without-cxx-main \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--disable-sqlite3 \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0--disable-tk \<br>
<br>
This is affecting the host package, but you&#39;re not adding host-tk to<br=
>
the dependencies. Do we need a host python with TK support to be able<br>
to build a target Python with TK support? (I don&#39;t think we do).<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><br><span class=3D"gmail_signature_pre=
fix">-- </span><br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"l=
tr">Thanks,<div><br></div><div>-John Langholz</div></div></div></div>

--0000000000004e7a8e060cf246de--

--===============0897584172858978280==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0897584172858978280==--
