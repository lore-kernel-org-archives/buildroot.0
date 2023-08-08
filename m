Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15E9DC001B0
	for <buildroot@archiver.kernel.org>; Tue,  8 Aug 2023 05:24:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7F3734091E;
	Tue,  8 Aug 2023 05:24:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7F3734091E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Hcg5L5vQwHMa; Tue,  8 Aug 2023 05:24:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DBBD40923;
	Tue,  8 Aug 2023 05:24:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1DBBD40923
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6CA8F1BF32C
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 05:24:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3C597403A2
 for <buildroot@lists.busybox.net>; Tue,  8 Aug 2023 05:24:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3C597403A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5tWgpKxWgCQD for <buildroot@lists.busybox.net>;
 Tue,  8 Aug 2023 05:24:19 +0000 (UTC)
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by smtp2.osuosl.org (Postfix) with ESMTPS id D1838402F4
 for <buildroot@buildroot.org>; Tue,  8 Aug 2023 05:24:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1838402F4
Received: by mail-lj1-f169.google.com with SMTP id
 38308e7fff4ca-2b974031aeaso81344841fa.0
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 22:24:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691472256; x=1692077056;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MTJrO9hlh/I9TCaAcYvgRBT+eiOsauAeJBXJwzzSFxw=;
 b=leeA4JtytCqx7gpX9qBotBTfAjgABLAsi4tiEteF/7qROyk/nR0v0N30CrQFkXFftu
 T4v6mQXMEAEoNJ4Oq0Fq4UfX7Nfi98tnNMr5Er1wE/Q+SWb90fZrDjfXEGOhjo7uq9ln
 a1cLW2TSLTuSec/6Bmk4s0Ls5O3Ag/9ZkpDvYL2zMBgaI/TAhWIvk6T8O1H8EhPWVsNI
 fjpjZQe9UyboEZYweowTawADam9f54+jPq1pDs7Lp1JZ8rT6mxZJSlpTIKybzBkOmHq2
 Yd3XS9OxrX2J5yALiQ4VykwuH9/fBybj0dj5t9fxKjH/AUA/YOnNI9NNeuAGCCUbtv+n
 ZzKg==
X-Gm-Message-State: AOJu0Ywgz+xXSJTUCARgq0GAqR9Bus5MTxLJpGis4fhdN3XUBEivW7mK
 1tJ8wlnu9jvntcZND6L/IYXS1E3DaQDjZND2
X-Google-Smtp-Source: AGHT+IHp2UCOQh0L02I1LBsFrcCi9ERZ2QAFQwrQ6TxL0S1Xm+Ck21Ye0/8K8pDVTw1NDbkUiDYTgg==
X-Received: by 2002:a2e:a312:0:b0:2b6:decf:5cbd with SMTP id
 l18-20020a2ea312000000b002b6decf5cbdmr8144149lje.36.1691472256493; 
 Mon, 07 Aug 2023 22:24:16 -0700 (PDT)
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com.
 [209.85.167.47]) by smtp.gmail.com with ESMTPSA id
 z24-20020a2e8e98000000b002b9ead74535sm2132392ljk.15.2023.08.07.22.24.15
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Aug 2023 22:24:16 -0700 (PDT)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-4f4b2bc1565so8467037e87.2
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 22:24:15 -0700 (PDT)
X-Received: by 2002:ac2:504e:0:b0:4f8:6d54:72f9 with SMTP id
 a14-20020ac2504e000000b004f86d5472f9mr7471377lfm.61.1691472255722; Mon, 07
 Aug 2023 22:24:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230807145839.2375839-1-thomas.devoogdt@barco.com>
 <20230807213131.GA421096@scaer>
In-Reply-To: <20230807213131.GA421096@scaer>
From: Thomas Devoogdt <thomas@devoogdt.com>
Date: Tue, 8 Aug 2023 07:24:03 +0200
X-Gmail-Original-Message-ID: <CACXRmJg7oT6yyWCtNJ7ok_57AtGXzS3sD41KYFTn9YzUeUWgWQ@mail.gmail.com>
Message-ID: <CACXRmJg7oT6yyWCtNJ7ok_57AtGXzS3sD41KYFTn9YzUeUWgWQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: Re: [Buildroot] [PATCH v1 1/3 next] package/qt6/qt6serialport: use
 the CMAKE_NINJA flag
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
Cc: Thomas Devoogdt <thomas@devoogdt.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 Thomas Devoogdt <thomas.devoogdt@barco.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2738318534126508895=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2738318534126508895==
Content-Type: multipart/alternative; boundary="000000000000f32c47060262929a"

--000000000000f32c47060262929a
Content-Type: text/plain; charset="UTF-8"

Yann, All,


Ah wow, missed it, will change it too and re-run test-pkg with that one
include. The other three simply passed for the default test-pkg
architectures.


Kr,

Thomas

Op ma 7 aug. 2023 23:31 schreef Yann E. MORIN <yann.morin.1998@free.fr>:

> Thomas, All,
>
> Thanks for this series. Thomas P. applied it before I had a chance to
> reply, so:
>
> Is there an issue with qt6svg, or did you just miss it?
>
> Regards,
> Yann E. MORIN.
>
> On 2023-08-07 16:58 +0200, Thomas Devoogdt spake thusly:
> > Use the newly introduce backend option
> (4cf79d9b71ff5cf2aede3f21e09ade7c7ac59606)
> > to specify what cmake backend to use, instead of special-coding it's use.
> >
> > Signed-off-by: Thomas Devoogdt <thomas.devoogdt@barco.com>
> > ---
> >  package/qt6/qt6serialport/qt6serialport.mk | 16 ++--------------
> >  1 file changed, 2 insertions(+), 14 deletions(-)
> >
> > diff --git a/package/qt6/qt6serialport/qt6serialport.mk
> b/package/qt6/qt6serialport/qt6serialport.mk
> > index 497719d4ec..bdb16dd892 100644
> > --- a/package/qt6/qt6serialport/qt6serialport.mk
> > +++ b/package/qt6/qt6serialport/qt6serialport.mk
> > @@ -10,6 +10,8 @@ QT6SERIALPORT_SOURCE =
> qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT
> >  QT6SERIALPORT_INSTALL_STAGING = YES
> >  QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
> >
> > +QT6SERIALPORT_CMAKE_BACKEND = ninja
> > +
> >  QT6SERIALPORT_LICENSE = \
> >       GPL-2.0+ or LGPL-3.0, \
> >       GPL-3.0 with exception (tools), \
> > @@ -25,7 +27,6 @@ QT6SERIALPORT_LICENSE_FILES = \
> >       LICENSES/Qt-GPL-exception-1.0.txt
> >
> >  QT6SERIALPORT_CONF_OPTS = \
> > -     -GNinja \
> >       -DQT_HOST_PATH=$(HOST_DIR) \
> >       -DBUILD_WITH_PCH=OFF \
> >       -DQT_BUILD_EXAMPLES=OFF \
> > @@ -33,19 +34,6 @@ QT6SERIALPORT_CONF_OPTS = \
> >
> >  QT6SERIALPORT_DEPENDENCIES = \
> >       host-pkgconf \
> > -     host-ninja \
> >       qt6base
> >
> > -define QT6SERIALPORT_BUILD_CMDS
> > -     $(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERIALPORT_BUILDDIR)
> > -endef
> > -
> > -define QT6SERIALPORT_INSTALL_STAGING_CMDS
> > -     $(TARGET_MAKE_ENV) DESTDIR=$(STAGING_DIR) $(BR2_CMAKE) --install
> $(QT6SERIALPORT_BUILDDIR)
> > -endef
> > -
> > -define QT6SERIALPORT_INSTALL_TARGET_CMDS
> > -     $(TARGET_MAKE_ENV) DESTDIR=$(TARGET_DIR) $(BR2_CMAKE) --install
> $(QT6SERIALPORT_BUILDDIR)
> > -endef
> > -
> >  $(eval $(cmake-package))
> > --
> > 2.41.0
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
>
>

--000000000000f32c47060262929a
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Yann, All,=C2=A0</div><div dir=3D"auto"><br></div><d=
iv dir=3D"auto"><br></div><div dir=3D"auto">Ah wow, missed it, will change =
it too and re-run test-pkg with that one include. The other three simply pa=
ssed for the default test-pkg architectures.=C2=A0</div><div dir=3D"auto"><=
br></div><div dir=3D"auto"><br></div><div dir=3D"auto">Kr,=C2=A0</div><div =
dir=3D"auto"><br></div><div dir=3D"auto">Thomas=C2=A0<br><br><div class=3D"=
gmail_quote" dir=3D"auto"><div dir=3D"ltr" class=3D"gmail_attr">Op ma 7 aug=
. 2023 23:31 schreef Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@fr=
ee.fr">yann.morin.1998@free.fr</a>&gt;:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:=
1ex">Thomas, All,<br>
<br>
Thanks for this series. Thomas P. applied it before I had a chance to<br>
reply, so:<br>
<br>
Is there an issue with qt6svg, or did you just miss it?<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
On 2023-08-07 16:58 +0200, Thomas Devoogdt spake thusly:<br>
&gt; Use the newly introduce backend option (4cf79d9b71ff5cf2aede3f21e09ade=
7c7ac59606)<br>
&gt; to specify what cmake backend to use, instead of special-coding it&#39=
;s use.<br>
&gt; <br>
&gt; Signed-off-by: Thomas Devoogdt &lt;<a href=3D"mailto:thomas.devoogdt@b=
arco.com" target=3D"_blank" rel=3D"noreferrer">thomas.devoogdt@barco.com</a=
>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/qt6/qt6serialport/<a href=3D"http://qt6serialport.mk" re=
l=3D"noreferrer noreferrer" target=3D"_blank">qt6serialport.mk</a> | 16 ++-=
-------------<br>
&gt;=C2=A0 1 file changed, 2 insertions(+), 14 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/qt6/qt6serialport/<a href=3D"http://qt6serialport=
.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">qt6serialport.mk</a> b=
/package/qt6/qt6serialport/<a href=3D"http://qt6serialport.mk" rel=3D"noref=
errer noreferrer" target=3D"_blank">qt6serialport.mk</a><br>
&gt; index 497719d4ec..bdb16dd892 100644<br>
&gt; --- a/package/qt6/qt6serialport/<a href=3D"http://qt6serialport.mk" re=
l=3D"noreferrer noreferrer" target=3D"_blank">qt6serialport.mk</a><br>
&gt; +++ b/package/qt6/qt6serialport/<a href=3D"http://qt6serialport.mk" re=
l=3D"noreferrer noreferrer" target=3D"_blank">qt6serialport.mk</a><br>
&gt; @@ -10,6 +10,8 @@ QT6SERIALPORT_SOURCE =3D qtserialport-$(QT6_SOURCE_T=
ARBALL_PREFIX)-$(QT6SERIALPORT<br>
&gt;=C2=A0 QT6SERIALPORT_INSTALL_STAGING =3D YES<br>
&gt;=C2=A0 QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
&gt;=C2=A0 <br>
&gt; +QT6SERIALPORT_CMAKE_BACKEND =3D ninja<br>
&gt; +<br>
&gt;=C2=A0 QT6SERIALPORT_LICENSE =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-2.0+ or LGPL-3.0, \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0GPL-3.0 with exception (tools), \<br>
&gt; @@ -25,7 +27,6 @@ QT6SERIALPORT_LICENSE_FILES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0LICENSES/Qt-GPL-exception-1.0.txt<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 QT6SERIALPORT_CONF_OPTS =3D \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0-GNinja \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
&gt; @@ -33,19 +34,6 @@ QT6SERIALPORT_CONF_OPTS =3D \<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 QT6SERIALPORT_DEPENDENCIES =3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-pkgconf \<br>
&gt; -=C2=A0 =C2=A0 =C2=A0host-ninja \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0qt6base<br>
&gt;=C2=A0 <br>
&gt; -define QT6SERIALPORT_BUILD_CMDS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(BR2_CMAKE) --build $(QT6SERI=
ALPORT_BUILDDIR)<br>
&gt; -endef<br>
&gt; -<br>
&gt; -define QT6SERIALPORT_INSTALL_STAGING_CMDS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) DESTDIR=3D$(STAGING_DIR) $(BR2=
_CMAKE) --install $(QT6SERIALPORT_BUILDDIR)<br>
&gt; -endef<br>
&gt; -<br>
&gt; -define QT6SERIALPORT_INSTALL_TARGET_CMDS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) DESTDIR=3D$(TARGET_DIR) $(BR2_=
CMAKE) --install $(QT6SERIALPORT_BUILDDIR)<br>
&gt; -endef<br>
&gt; -<br>
&gt;=C2=A0 $(eval $(cmake-package))<br>
&gt; -- <br>
&gt; 2.41.0<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"no=
referrer">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
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
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=
=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
<br>
</blockquote></div></div></div>

--000000000000f32c47060262929a--

--===============2738318534126508895==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2738318534126508895==--
