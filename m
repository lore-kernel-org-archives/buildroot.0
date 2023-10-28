Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6218DC0032E
	for <buildroot@archiver.kernel.org>; Sat, 28 Oct 2023 10:44:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F334E812A9;
	Sat, 28 Oct 2023 10:44:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F334E812A9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NLSiOuUP3x9s; Sat, 28 Oct 2023 10:44:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 14F9C811F7;
	Sat, 28 Oct 2023 10:44:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 14F9C811F7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B97F31BF83C
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 10:44:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 902DB40C0F
 for <buildroot@lists.busybox.net>; Sat, 28 Oct 2023 10:44:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 902DB40C0F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EpIDI515VqVp for <buildroot@lists.busybox.net>;
 Sat, 28 Oct 2023 10:44:51 +0000 (UTC)
Received: from mail-qt1-x82e.google.com (mail-qt1-x82e.google.com
 [IPv6:2607:f8b0:4864:20::82e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2CD8640191
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 10:44:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2CD8640191
Received: by mail-qt1-x82e.google.com with SMTP id
 d75a77b69052e-41cc56255e3so18631451cf.3
 for <buildroot@buildroot.org>; Sat, 28 Oct 2023 03:44:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698489890; x=1699094690;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/YXIb2lDQDwSKd3DjVGxa6zQnrpXEutiBybzdBxeh/E=;
 b=ZCqb+rm23HeJxjE8c+nmqtgNPv3bzXUh41GPaj2/HTWckFcfvVgGYqcrMvQOMnRp1p
 rW9qDkmRwaJ2nRb8GuDIRWb/slN7j3JH0BqtOiem57MgwE3hJIYtZPsQne17QO7sdJdt
 YU0PydNRXO6gnwIXF/W1OVet+UZB2rF+q259ZqrYlsps1zxT+i1X2wxprrrIPdaEO7lD
 loACcBYdHJrsIom3APnk1s5vxzOVS2xb1ARq06FvjTDMU/AGl3yPqy1SdNlnJnEiUoRd
 wFvTnFwBzRJ0KGLrsCyTdQS5XEjWFJo5knbk4MlzfeskGcX+XD+Nb63jPy/owOJ9b+72
 ypww==
X-Gm-Message-State: AOJu0Yykl7i4QMxW3CGLOlTB+cwdcWoEU0niuvRJmTq5qqYEYG/qqowB
 dbwYR7AjphPvEsKEpmsHtngkabFd0l62sRtFvFk=
X-Google-Smtp-Source: AGHT+IH/oS1sY77eaKjjWuO6OO2wEuF2FQNu7AN431EJIzrehIKCHDkaT41Th32njLQe+oQGQQYabHK1k/TpeJryXyM=
X-Received: by 2002:a05:622a:34a:b0:412:22cf:83fa with SMTP id
 r10-20020a05622a034a00b0041222cf83famr6003700qtw.28.1698489889775; Sat, 28
 Oct 2023 03:44:49 -0700 (PDT)
MIME-Version: 1.0
References: <20231028102435.1771460-1-yegorslists@googlemail.com>
 <CAGm1_kt2d-MUxuoJ+LF_pnNeiXXWyFGzZ1XYwnTAnp84ff+FZg@mail.gmail.com>
In-Reply-To: <CAGm1_kt2d-MUxuoJ+LF_pnNeiXXWyFGzZ1XYwnTAnp84ff+FZg@mail.gmail.com>
From: James Hilliard <james.hilliard1@gmail.com>
Date: Sat, 28 Oct 2023 04:44:38 -0600
Message-ID: <CADvTj4pyC-HhUAK3iJ=zRAUaw0WRQv09n-7Y45v2L-nkwgv-Vg@mail.gmail.com>
To: Yegor Yefremov <yegorslists@googlemail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698489890; x=1699094690; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/YXIb2lDQDwSKd3DjVGxa6zQnrpXEutiBybzdBxeh/E=;
 b=jWn5PTVc4DGHypguaIN3co31ho6TloqTFQvoYfg5gIhxIVlhXK67ZSE2rNs2bgOcA6
 hL9Ksk9XEcfHWwcq920p+Vl95tWlbInL9c59mp7BBl0YInyY8LgJxjYIJhNwSIjoqpPo
 xWkDOFnlyWJZmBeTQHYezUTHFa4desw2uAq/yYNenZUCJDwHX2r44/qfFF/iJhXzxh/U
 h3Trc8K2+DUQHGxCCnY+0EfRrAi0vcnoEO1pc7EgZoM4RzWzYmU7YhNUAnZwocrPtwk7
 svUz8lLQf80j3JBSZsaflbaEdl6yJosANhYz0989v5CY8SIggNct4908V0Qgsoa2kavb
 kcSw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=jWn5PTVc
Subject: Re: [Buildroot] [RFC PATCH] package/pkg-python.mk: PEP517: add
 support for setuptools backend
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
Cc: adam.duskett@amarulasolutions.com,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4429431124284682126=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4429431124284682126==
Content-Type: multipart/alternative; boundary="00000000000088e4460608c47ee2"

--00000000000088e4460608c47ee2
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Oct 28, 2023 at 4:31=E2=80=AFAM Yegor Yefremov <yegorslists@googlem=
ail.com>
wrote:

> Hi all,
>
> On Sat, Oct 28, 2023 at 12:25=E2=80=AFPM <yegorslists@googlemail.com> wro=
te:
> >
> > From: Yegor Yefremov <yegorslists@googlemail.com>
> >
> > Since version 41.0.0, setuptools has an experimental PEP517 support.
> >
> > Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
> > ---
> >  package/pkg-python.mk | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> > index 28ee4cb85f..00f71f6b19 100644
> > --- a/package/pkg-python.mk
> > +++ b/package/pkg-python.mk
> > @@ -300,7 +300,7 @@ ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)
> >  $(2)_DEPENDENCIES +=3D host-python-setuptools-rust
> >  endif
> >  else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)
> > -$(2)_DEPENDENCIES +=3D host-python-pypa-build host-python-installer
> > +$(2)_DEPENDENCIES +=3D host-python-pypa-build host-python-installer
> host-python-setuptools
> >  ifeq ($$($(2)_SETUP_TYPE),flit)
> >  $(2)_DEPENDENCIES +=3D host-python-flit-core
> >  endif
>
> This patch is more a workaround to convert such packages as
> python-tornado, python-configobj, etc. to PEP517 infrastructure. These
> packages just use a build-system section and otherwise rely on the
> setup.py file:
>

Are these failing to build without PEP517 infrastructure for setuptools?


>
> [build-system]
> requires =3D ["setuptools"]
> build-backend =3D "setuptools.build_meta"
>
> What is the plan to support this backend? Just use setuptools-rust or
> convert "_SETUP_TYPE=3Dsetuptools" to PEP517 after the introduction of
> Python 12.x?
>

I already have a patch converting our setuptools infrastructure to PEP517:
https://lore.kernel.org/buildroot/20230930152517.1077576-3-james.hilliard1@=
gmail.com/


>
> Regards,
> Yegor
>

--00000000000088e4460608c47ee2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">On Sat, Oct 28, 2023 at 4:31=E2=80=AFAM Y=
egor Yefremov &lt;<a href=3D"mailto:yegorslists@googlemail.com">yegorslists=
@googlemail.com</a>&gt; wrote:</div><div class=3D"gmail_quote"><blockquote =
class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px sol=
id rgb(204,204,204);padding-left:1ex">Hi all,<br>
<br>
On Sat, Oct 28, 2023 at 12:25=E2=80=AFPM &lt;<a href=3D"mailto:yegorslists@=
googlemail.com" target=3D"_blank">yegorslists@googlemail.com</a>&gt; wrote:=
<br>
&gt;<br>
&gt; From: Yegor Yefremov &lt;<a href=3D"mailto:yegorslists@googlemail.com"=
 target=3D"_blank">yegorslists@googlemail.com</a>&gt;<br>
&gt;<br>
&gt; Since version 41.0.0, setuptools has an experimental PEP517 support.<b=
r>
&gt;<br>
&gt; Signed-off-by: Yegor Yefremov &lt;<a href=3D"mailto:yegorslists@google=
mail.com" target=3D"_blank">yegorslists@googlemail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/<a href=3D"http://pkg-python.mk" rel=3D"noreferrer" targ=
et=3D"_blank">pkg-python.mk</a> | 2 +-<br>
&gt;=C2=A0 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt;<br>
&gt; diff --git a/package/<a href=3D"http://pkg-python.mk" rel=3D"noreferre=
r" target=3D"_blank">pkg-python.mk</a> b/package/<a href=3D"http://pkg-pyth=
on.mk" rel=3D"noreferrer" target=3D"_blank">pkg-python.mk</a><br>
&gt; index 28ee4cb85f..00f71f6b19 100644<br>
&gt; --- a/package/<a href=3D"http://pkg-python.mk" rel=3D"noreferrer" targ=
et=3D"_blank">pkg-python.mk</a><br>
&gt; +++ b/package/<a href=3D"http://pkg-python.mk" rel=3D"noreferrer" targ=
et=3D"_blank">pkg-python.mk</a><br>
&gt; @@ -300,7 +300,7 @@ ifeq ($$($(2)_SETUP_TYPE),setuptools-rust)<br>
&gt;=C2=A0 $(2)_DEPENDENCIES +=3D host-python-setuptools-rust<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 else ifneq ($$(filter flit maturin pep517,$$($(2)_SETUP_TYPE)),)=
<br>
&gt; -$(2)_DEPENDENCIES +=3D host-python-pypa-build host-python-installer<b=
r>
&gt; +$(2)_DEPENDENCIES +=3D host-python-pypa-build host-python-installer h=
ost-python-setuptools<br>
&gt;=C2=A0 ifeq ($$($(2)_SETUP_TYPE),flit)<br>
&gt;=C2=A0 $(2)_DEPENDENCIES +=3D host-python-flit-core<br>
&gt;=C2=A0 endif<br>
<br>
This patch is more a workaround to convert such packages as<br>
python-tornado, python-configobj, etc. to PEP517 infrastructure. These<br>
packages just use a build-system section and otherwise rely on the<br>
setup.py file:<br></blockquote><div><br></div><div>Are these failing to bui=
ld without PEP517 infrastructure for setuptools?<br></div><div>=C2=A0</div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
[build-system]<br>
requires =3D [&quot;setuptools&quot;]<br>
build-backend =3D &quot;setuptools.build_meta&quot;<br>
<br>
What is the plan to support this backend? Just use setuptools-rust or<br>
convert &quot;_SETUP_TYPE=3Dsetuptools&quot; to PEP517 after the introducti=
on of<br>
Python 12.x?<br></blockquote><div><br></div><div>I already have a patch con=
verting our setuptools infrastructure to PEP517:</div><div><a href=3D"https=
://lore.kernel.org/buildroot/20230930152517.1077576-3-james.hilliard1@gmail=
.com/">https://lore.kernel.org/buildroot/20230930152517.1077576-3-james.hil=
liard1@gmail.com/</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quot=
e" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204)=
;padding-left:1ex">
<br>
Regards,<br>
Yegor<br>
</blockquote></div></div>

--00000000000088e4460608c47ee2--

--===============4429431124284682126==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4429431124284682126==--
