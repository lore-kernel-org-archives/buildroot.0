Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 261BEC433EF
	for <buildroot@archiver.kernel.org>; Wed, 30 Mar 2022 20:18:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C205940309;
	Wed, 30 Mar 2022 20:18:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uig9jmtUf5IL; Wed, 30 Mar 2022 20:18:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFE4E402EE;
	Wed, 30 Mar 2022 20:18:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id ABA241BF42D
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 20:18:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 965C640022
 for <buildroot@lists.busybox.net>; Wed, 30 Mar 2022 20:18:03 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NK1tFBXTn_DZ for <buildroot@lists.busybox.net>;
 Wed, 30 Mar 2022 20:18:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6171A4049E
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 20:18:02 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-2e612af95e3so232053447b3.9
 for <buildroot@buildroot.org>; Wed, 30 Mar 2022 13:18:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=r87CtmcTDzXSn++Xl3oBxfW4SADG5zJdXFQ0GNPTAYs=;
 b=QQjj5wZK7GhAG4oCvXnAm0g/GqIywLYwqogEg0GJ1LEf01BUn3sICzrXTFpZpmafxe
 wcBWoOIKDJaHvQWP5OFLpLLRbkQpuB64jM4CNqcSvY8I0Zcfhbx3z11NdsMd8w0dAnpr
 X24uvQEiqO+RhtfNkecdMqgt52SQFUbqunAaWu+ccnq23YVR3r2D5yYM03fZOqbu6aZX
 e+B4RSA1chUiNx+smAoMxSqABH/g/1wu5N5F3n3ytV5ob31g1IrIuy7kYupfOrYzqJqL
 QAQphyLyKq5ozB8L5sxC3OmLHO/zLu9wbq3NkcFsO8SbvrUF03O0mKY8ngTuRQK2lE2Y
 q50g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=r87CtmcTDzXSn++Xl3oBxfW4SADG5zJdXFQ0GNPTAYs=;
 b=yeOQ3fDjmioKSRnDnE6E04Eq9Fd6bbwIF3VbsbQSMiqk/u3uMfEu7xIf2hqrzNMt2t
 NBNeJlI0jyRXC1WAoP0zvo33ik8ToM1OQqCzEusUG3dL89Tg+8NqMGTGPrfM43rB4HCf
 hUk1GZBScK1tqKqCrGX3OX7DD3/4oGS3wCdHhpY+CT7fiUtjm2DhOtfOQ7/iAKq0n7Yr
 03ndjewJKnl8JnTG9AwUeUBxTWY14/88V2BoSrOTY5pxqau9cB2IZPDGYLLyNHzEU84L
 E8ivFnUSsN4MD/4Z2C+dhntql+Mrl30+yKcRZfSBeM+1ZmM8/duoItvleMPdaq3NUAnL
 F+Tw==
X-Gm-Message-State: AOAM5318+eZZo8BZvc5eSq7VYXEs01Rcf9MIvsNr66fEEWDxeq7igIQZ
 Rjz8m3cxQGiInWi6hVfNlelygq7pcP4lgyUB7YEGwYIngYU=
X-Google-Smtp-Source: ABdhPJzoPZ8rh44RyAm6YaOb91F+nCCeognFlS4RjVDZlAM++L6WgGDwPh8/DMZib/nu3wAlzI9dRUhpLpyA5PniPaI=
X-Received: by 2002:a81:554:0:b0:2e6:84dd:da77 with SMTP id
 81-20020a810554000000b002e684ddda77mr1551629ywf.357.1648671481340; Wed, 30
 Mar 2022 13:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <CAM70yxDW2GTLva+_JQ7wH1z+MQiXYxn__wNSu4KQ-w-MJnJ2gw@mail.gmail.com>
 <CADvTj4qWax3zJXamtBgGEyPE31Pp-fH6Ge=ZYvk1c7XzcisntQ@mail.gmail.com>
 <CAM70yxB3EJmtX6PtBMB0UJtrzX6_8yhnRWBkGhbgK1Hxcm7fAA@mail.gmail.com>
 <CADvTj4rNA_vsqU5-2Hu6XT4LjpRhmuO09FsZOEk8w16VMri6xw@mail.gmail.com>
 <CAM70yxD=tU7FK1uf2iEpFVK_jDQyHv6j8xAdW9nEDz0r8njz6w@mail.gmail.com>
 <CADvTj4qo_ac-wizQH_xvMbn5Y7urEHnNyopLGTmF4RJ3HP=+Hw@mail.gmail.com>
 <CAM70yxB61g2r5+aHZYPbit+3TjaWG4khnb71vHC-2pfF+WoyfQ@mail.gmail.com>
 <CAM70yxCMj-_4q_Rix-PK2=sG+RcfVE0GQr8FK4UqrRT6c7AsSw@mail.gmail.com>
 <CADvTj4qO-YJDa4uqW8SzQpEHYyOPc948cxFrRonXCJMSO1m=7g@mail.gmail.com>
In-Reply-To: <CADvTj4qO-YJDa4uqW8SzQpEHYyOPc948cxFrRonXCJMSO1m=7g@mail.gmail.com>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Wed, 30 Mar 2022 17:17:50 -0300
Message-ID: <CAM70yxD0LGfsKrDwHH8v8-nN9Xu3KQEvmo=jYXKKXMjQGq-isg@mail.gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
Subject: Re: [Buildroot] [PATCH 1/1] package/pkg-python.mk: fix PEP517
 purelib deployment path
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
Cc: buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============7033443058383467320=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7033443058383467320==
Content-Type: multipart/alternative; boundary="000000000000ff27e105db753dde"

--000000000000ff27e105db753dde
Content-Type: text/plain; charset="UTF-8"

Oops, missed the interpreter option for
HOST_PKG_PYTHON_PEP517_INSTALL_OPTS. I made the change as you suggested and
it still works. Revised patch follows:

-----

package/pkg-python.mk: fix PEP517 purelib deployment path

This allows the Python interpreter to find packages built via the new Flit
infrastructure and fixes bug #14721.
Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>

diff --git a/package/pkg-python.mk b/package/pkg-python.mk
index 52ce402281..81c33ba557 100644
--- a/package/pkg-python.mk
+++ b/package/pkg-python.mk
@@ -127,7 +127,7 @@ PKG_PYTHON_PEP517_ENV = \
 PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
  --interpreter=/usr/bin/python \
  --script-kind=posix \
- --purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
+
--purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
\
  --headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
  --scripts=$(TARGET_DIR)/usr/bin \
  --data=$(TARGET_DIR)/usr
@@ -135,7 +135,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
 PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
  --interpreter=/usr/bin/python \
  --script-kind=posix \
- --purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
\
+
--purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
\
  --headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
  --scripts=$(STAGING_DIR)/usr/bin \
  --data=$(STAGING_DIR)/usr
@@ -147,11 +147,11 @@ HOST_PKG_PYTHON_PEP517_ENV = \
  $(HOST_CONFIGURE_OPTS)

 HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
- --interpreter=/usr/bin/python \
+ --interpreter=/bin/python \
  --script-kind=posix \
  --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
- --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
- --scripts=$(HOST_DIR)/usr/bin \
+ --headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)  \
+ --scripts=$(HOST_DIR)/bin \
  --data=$(HOST_DIR)/usr

 ################################################################################

On Wed, Mar 30, 2022 at 4:25 PM James Hilliard <james.hilliard1@gmail.com>
wrote:

> On Wed, Mar 30, 2022 at 12:52 PM Emile Cormier
> <emile.cormier.jr@gmail.com> wrote:
> >
> > package/pkg-python.mk: fix PEP517 purelib deployment path
> >
> > This allows the Python interpreter to find packages built via the new
> Flit
> > infrastructure and fixes bug #14721.
> > Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
> >
> > diff --git a/package/pkg-python.mk b/package/pkg-python.mk
> > index 52ce402281..ab4f7af6a6 100644
> > --- a/package/pkg-python.mk
> > +++ b/package/pkg-python.mk
> > @@ -127,7 +127,7 @@ PKG_PYTHON_PEP517_ENV = \
> >  PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
> >   --interpreter=/usr/bin/python \
> >   --script-kind=posix \
> > -
> --purelib=$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> > +
> --purelib=$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> \
> >   --headers=$(TARGET_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> >   --scripts=$(TARGET_DIR)/usr/bin \
> >   --data=$(TARGET_DIR)/usr
> > @@ -135,7 +135,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS = \
> >  PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS = \
> >   --interpreter=/usr/bin/python \
> >   --script-kind=posix \
> > -
> --purelib=$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> > +
> --purelib=$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> \
> >   --headers=$(STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> >   --scripts=$(STAGING_DIR)/usr/bin \
> >   --data=$(STAGING_DIR)/usr
> > @@ -150,8 +150,8 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
> >   --interpreter=/usr/bin/python \
> >   --script-kind=posix \
> >   --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages
> \
> > - --headers=$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)  \
> > - --scripts=$(HOST_DIR)/usr/bin \
> > + --headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)  \
> > + --scripts=$(HOST_DIR)/bin \
> >   --data=$(HOST_DIR)/usr
>
> I think it should be something like this for the host:
> HOST_PKG_PYTHON_PEP517_INSTALL_OPTS = \
> --interpreter=/bin/python \
> --script-kind=posix \
> --purelib=$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \
> --headers=$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \
> --scripts=$(HOST_DIR)/bin \
> --data=$(HOST_DIR)
>
>
> >
> >
> ################################################################################
> >
> > On Wed, Mar 30, 2022 at 3:51 PM Emile Cormier <
> emile.cormier.jr@gmail.com> wrote:
> >>
> >> On Wed, Mar 30, 2022 at 3:01 PM James Hilliard <
> james.hilliard1@gmail.com> wrote:
> >>>
> >>> I think keep /usr for STAGING/TARGET OPTS but remove for HOST OPTS.
> >>
> >>
> >> Alright, I've changed it as you suggested and it still works for me.
> I'll post an updated patch.
>

--000000000000ff27e105db753dde
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Oops, missed the interpreter option for HOST_PKG_PYTH=
ON_PEP517_INSTALL_OPTS. I made the change as you suggested and it still wor=
ks. Revised patch follows:</div><div><br></div><div>-----<br></div><div><br=
></div><div>package/<a href=3D"http://pkg-python.mk">pkg-python.mk</a>: fix=
 PEP517 purelib deployment path<br><br>This allows the Python interpreter t=
o find packages built via the new Flit<br>infrastructure and fixes bug #147=
21.<br>Signed-off-by: Emile Cormier &lt;<a href=3D"mailto:emile.cormier.jr@=
gmail.com">emile.cormier.jr@gmail.com</a>&gt;<br><br>diff --git a/package/<=
a href=3D"http://pkg-python.mk">pkg-python.mk</a> b/package/<a href=3D"http=
://pkg-python.mk">pkg-python.mk</a><br>index 52ce402281..81c33ba557 100644<=
br>--- a/package/<a href=3D"http://pkg-python.mk">pkg-python.mk</a><br>+++ =
b/package/<a href=3D"http://pkg-python.mk">pkg-python.mk</a><br>@@ -127,7 +=
127,7 @@ PKG_PYTHON_PEP517_ENV =3D \<br>=C2=A0PKG_PYTHON_PEP517_INSTALL_TAR=
GET_OPTS =3D \<br>=C2=A0	--interpreter=3D/usr/bin/python \<br>=C2=A0	--scri=
pt-kind=3Dposix \<br>-	--purelib=3D$(TARGET_DIR)/lib/python$(PYTHON3_VERSIO=
N_MAJOR)/site-packages \<br>+	--purelib=3D$(TARGET_DIR)/usr/lib/python$(PYT=
HON3_VERSION_MAJOR)/site-packages \<br>=C2=A0	--headers=3D$(TARGET_DIR)/usr=
/include/python$(PYTHON3_VERSION_MAJOR) =C2=A0\<br>=C2=A0	--scripts=3D$(TAR=
GET_DIR)/usr/bin \<br>=C2=A0	--data=3D$(TARGET_DIR)/usr<br>@@ -135,7 +135,7=
 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS =3D \<br>=C2=A0PKG_PYTHON_PEP517_=
INSTALL_STAGING_OPTS =3D \<br>=C2=A0	--interpreter=3D/usr/bin/python \<br>=
=C2=A0	--script-kind=3Dposix \<br>-	--purelib=3D$(STAGING_DIR)/lib/python$(=
PYTHON3_VERSION_MAJOR)/site-packages \<br>+	--purelib=3D$(STAGING_DIR)/usr/=
lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \<br>=C2=A0	--headers=3D$(=
STAGING_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR) =C2=A0\<br>=C2=A0	-=
-scripts=3D$(STAGING_DIR)/usr/bin \<br>=C2=A0	--data=3D$(STAGING_DIR)/usr<b=
r>@@ -147,11 +147,11 @@ HOST_PKG_PYTHON_PEP517_ENV =3D \<br>=C2=A0	$(HOST_C=
ONFIGURE_OPTS)<br>=C2=A0<br>=C2=A0HOST_PKG_PYTHON_PEP517_INSTALL_OPTS =3D \=
<br>-	--interpreter=3D/usr/bin/python \<br>+	--interpreter=3D/bin/python \<=
br>=C2=A0	--script-kind=3Dposix \<br>=C2=A0	--purelib=3D$(HOST_DIR)/lib/pyt=
hon$(PYTHON3_VERSION_MAJOR)/site-packages \<br>-	--headers=3D$(HOST_DIR)/us=
r/include/python$(PYTHON3_VERSION_MAJOR) =C2=A0\<br>-	--scripts=3D$(HOST_DI=
R)/usr/bin \<br>+	--headers=3D$(HOST_DIR)/include/python$(PYTHON3_VERSION_M=
AJOR) =C2=A0\<br>+	--scripts=3D$(HOST_DIR)/bin \<br>=C2=A0	--data=3D$(HOST_=
DIR)/usr<br>=C2=A0<br>=C2=A0###############################################=
#################################</div></div><br><div class=3D"gmail_quote"=
><div dir=3D"ltr" class=3D"gmail_attr">On Wed, Mar 30, 2022 at 4:25 PM Jame=
s Hilliard &lt;<a href=3D"mailto:james.hilliard1@gmail.com">james.hilliard1=
@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">On Wed, Mar 30, 2022 at 12:52 PM Emile Cormier<br>
&lt;<a href=3D"mailto:emile.cormier.jr@gmail.com" target=3D"_blank">emile.c=
ormier.jr@gmail.com</a>&gt; wrote:<br>
&gt;<br>
&gt; package/<a href=3D"http://pkg-python.mk" rel=3D"noreferrer" target=3D"=
_blank">pkg-python.mk</a>: fix PEP517 purelib deployment path<br>
&gt;<br>
&gt; This allows the Python interpreter to find packages built via the new =
Flit<br>
&gt; infrastructure and fixes bug #14721.<br>
&gt; Signed-off-by: Emile Cormier &lt;<a href=3D"mailto:emile.cormier.jr@gm=
ail.com" target=3D"_blank">emile.cormier.jr@gmail.com</a>&gt;<br>
&gt;<br>
&gt; diff --git a/package/<a href=3D"http://pkg-python.mk" rel=3D"noreferre=
r" target=3D"_blank">pkg-python.mk</a> b/package/<a href=3D"http://pkg-pyth=
on.mk" rel=3D"noreferrer" target=3D"_blank">pkg-python.mk</a><br>
&gt; index 52ce402281..ab4f7af6a6 100644<br>
&gt; --- a/package/<a href=3D"http://pkg-python.mk" rel=3D"noreferrer" targ=
et=3D"_blank">pkg-python.mk</a><br>
&gt; +++ b/package/<a href=3D"http://pkg-python.mk" rel=3D"noreferrer" targ=
et=3D"_blank">pkg-python.mk</a><br>
&gt; @@ -127,7 +127,7 @@ PKG_PYTHON_PEP517_ENV =3D \<br>
&gt;=C2=A0 PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0--interpreter=3D/usr/bin/python \<br>
&gt;=C2=A0 =C2=A0--script-kind=3Dposix \<br>
&gt; - --purelib=3D$(TARGET_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-pa=
ckages \<br>
&gt; + --purelib=3D$(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/sit=
e-packages \<br>
&gt;=C2=A0 =C2=A0--headers=3D$(TARGET_DIR)/usr/include/python$(PYTHON3_VERS=
ION_MAJOR)=C2=A0 \<br>
&gt;=C2=A0 =C2=A0--scripts=3D$(TARGET_DIR)/usr/bin \<br>
&gt;=C2=A0 =C2=A0--data=3D$(TARGET_DIR)/usr<br>
&gt; @@ -135,7 +135,7 @@ PKG_PYTHON_PEP517_INSTALL_TARGET_OPTS =3D \<br>
&gt;=C2=A0 PKG_PYTHON_PEP517_INSTALL_STAGING_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0--interpreter=3D/usr/bin/python \<br>
&gt;=C2=A0 =C2=A0--script-kind=3Dposix \<br>
&gt; - --purelib=3D$(STAGING_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-p=
ackages \<br>
&gt; + --purelib=3D$(STAGING_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/si=
te-packages \<br>
&gt;=C2=A0 =C2=A0--headers=3D$(STAGING_DIR)/usr/include/python$(PYTHON3_VER=
SION_MAJOR)=C2=A0 \<br>
&gt;=C2=A0 =C2=A0--scripts=3D$(STAGING_DIR)/usr/bin \<br>
&gt;=C2=A0 =C2=A0--data=3D$(STAGING_DIR)/usr<br>
&gt; @@ -150,8 +150,8 @@ HOST_PKG_PYTHON_PEP517_INSTALL_OPTS =3D \<br>
&gt;=C2=A0 =C2=A0--interpreter=3D/usr/bin/python \<br>
&gt;=C2=A0 =C2=A0--script-kind=3Dposix \<br>
&gt;=C2=A0 =C2=A0--purelib=3D$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)=
/site-packages \<br>
&gt; - --headers=3D$(HOST_DIR)/usr/include/python$(PYTHON3_VERSION_MAJOR)=
=C2=A0 \<br>
&gt; - --scripts=3D$(HOST_DIR)/usr/bin \<br>
&gt; + --headers=3D$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR)=C2=A0=
 \<br>
&gt; + --scripts=3D$(HOST_DIR)/bin \<br>
&gt;=C2=A0 =C2=A0--data=3D$(HOST_DIR)/usr<br>
<br>
I think it should be something like this for the host:<br>
HOST_PKG_PYTHON_PEP517_INSTALL_OPTS =3D \<br>
--interpreter=3D/bin/python \<br>
--script-kind=3Dposix \<br>
--purelib=3D$(HOST_DIR)/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages \<=
br>
--headers=3D$(HOST_DIR)/include/python$(PYTHON3_VERSION_MAJOR) \<br>
--scripts=3D$(HOST_DIR)/bin \<br>
--data=3D$(HOST_DIR)<br>
<br>
<br>
&gt;<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;<br>
&gt; On Wed, Mar 30, 2022 at 3:51 PM Emile Cormier &lt;<a href=3D"mailto:em=
ile.cormier.jr@gmail.com" target=3D"_blank">emile.cormier.jr@gmail.com</a>&=
gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; On Wed, Mar 30, 2022 at 3:01 PM James Hilliard &lt;<a href=3D"mail=
to:james.hilliard1@gmail.com" target=3D"_blank">james.hilliard1@gmail.com</=
a>&gt; wrote:<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; I think keep /usr for STAGING/TARGET OPTS but remove for HOST =
OPTS.<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt; Alright, I&#39;ve changed it as you suggested and it still works f=
or me. I&#39;ll post an updated patch.<br>
</blockquote></div>

--000000000000ff27e105db753dde--

--===============7033443058383467320==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7033443058383467320==--
