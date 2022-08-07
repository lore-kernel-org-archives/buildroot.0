Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0AB6C19F2A
	for <buildroot@archiver.kernel.org>; Sun,  7 Aug 2022 15:38:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 63BB340524;
	Sun,  7 Aug 2022 15:38:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 63BB340524
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OhFI1JDJ0Pol; Sun,  7 Aug 2022 15:38:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2410C4050C;
	Sun,  7 Aug 2022 15:38:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2410C4050C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F6971BF831
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 15:38:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 46B994050C
 for <buildroot@lists.busybox.net>; Sun,  7 Aug 2022 15:38:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46B994050C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vtDd8YYHluFZ for <buildroot@lists.busybox.net>;
 Sun,  7 Aug 2022 15:37:59 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EF3C2400B9
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id EF3C2400B9
 for <buildroot@buildroot.org>; Sun,  7 Aug 2022 15:37:58 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id i62so10363881yba.5
 for <buildroot@buildroot.org>; Sun, 07 Aug 2022 08:37:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=jA/wMWLfGb9weGawEdLbu65KQ3ccsQLWK2U/peTvZm0=;
 b=1tFCLYyOjBHFN+xDD+cdyC3ZhFkh+013wqz1bPASSVhlm8WHBpNXiB8vFobfOcAQ7R
 5DwrUFOyKyR4d1OQl1HNxqHP5TOoXecGBiZtahEeioojoZ6F8W96TkBr90RxwT5g7o4U
 dyCNVezI5h2g/B8Ang7CtTh3tBvCVJPD1CEt2Ppr5KFqEuaIXc+ad8jpUlYmEP+suTNB
 iUtFUNGEMdAwr3HA2FvPtgXeRrYiJIgGpzqY4P0EhdfUNPs7MBAVwyLYxYrOWlkHHdc1
 wTmH9kAZfy2t2A9ikI7Av5jGnBBBOoIR0gACSqoUrXe3dNo3HPBYRwIbLa08xru21ANz
 3IFg==
X-Gm-Message-State: ACgBeo334RiGg9tHYhwutnZI04MX3rAAHxKiVB2Cd0sejuVXDrT9A38t
 snZyXF8W5gPKFKj+YjQwvurEHFlfMBCGVCEA/5c=
X-Google-Smtp-Source: AA6agR4dMpevUz7baViE6nUlzQOTcM1axCQVietE0KCGbk+TCFxVVMmL1wCC9CQRmp1SHFk9Km8fPwjZWt/r10XSWHo=
X-Received: by 2002:a25:2d21:0:b0:676:d6a2:d4bf with SMTP id
 t33-20020a252d21000000b00676d6a2d4bfmr13332060ybt.217.1659886677755; Sun, 07
 Aug 2022 08:37:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220403221953.1158787-1-emile.cormier.jr@gmail.com>
 <20220403221953.1158787-3-emile.cormier.jr@gmail.com>
 <20220807165300.2137b391@windsurf>
In-Reply-To: <20220807165300.2137b391@windsurf>
From: Emile Cormier <emile.cormier.jr@gmail.com>
Date: Sun, 7 Aug 2022 12:37:46 -0300
Message-ID: <CAM70yxD-pbF7awEqoP-y5kKG_VZj1oTXZYb8s-zw6rE_nAM5dw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=jA/wMWLfGb9weGawEdLbu65KQ3ccsQLWK2U/peTvZm0=;
 b=Fb1qBgO5eM0ioYLY5ETBKi8Zc05wmeniudxUJihNZ0/UX0TeYnPhw2QMrbuqkLnnyt
 7HSMFLC7XbjSGNfm+ZHFgk8H8k3TDC6kwAQcHSPfNpBm3WvIpYZBmhdytYAHlCvMSF6g
 rOYOvbCCuCrpP1x21Jrc6aX3Wg4gsdf4pj92ptNc8TxC5W5OlJHBu93HkgbMRwo92QzO
 jjXzIV0UNRy07u/9UDTLjuuS2BALpARIlG8g3mLiiCfnzt9BSdwZnYu3/QxzONcipbLy
 k8uw43PLXvFh54NIIJqaby1t7LtMWN4W/vspRATFypzC6tq4eoTTdBwKEM/J6l3XUVNm
 LWLg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Fb1qBgO5
Subject: Re: [Buildroot] [PATCH 3/6] package/python-zlmdb: add new package
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1862712383802037917=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1862712383802037917==
Content-Type: multipart/alternative; boundary="000000000000cb892805e5a87bef"

--000000000000cb892805e5a87bef
Content-Type: text/plain; charset="UTF-8"

Hi Thomas,

I'm in the process of migrating away from Crossbar, due to dynamic
authentication/authorization no longer working and the author not
interested in backporting bug fixes to older versions. I can no longer
devote any time to support Crossbar on Buildroot. Please do what you will
with these patch requests.

Sorry, I'm not familiar with zlmdb; the only reason I introduced it was to
satisfy a dependency by Crossbar.

Cheers,
Emile Cormier

On Sun, Aug 7, 2022 at 11:53 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Emile,
>
> I have also applied this patch, though with some changes. See below.
>
> On Sun,  3 Apr 2022 19:19:50 -0300
> Emile Cormier <emile.cormier.jr@gmail.com> wrote:
>
> > From: ecorm <ecorm@users.noreply.github.com>
>
> I fixed this bogus From: value.
>
> >
> > Required by python-crossbar.
>
> Added an empty new line here.
>
> > Signed-off-by: Emile Cormier <emile.cormier.jr@gmail.com>
> > ---
> >  DEVELOPERS                             |  5 +++++
> >  package/Config.in                      |  1 +
> >  package/python-zlmdb/Config.in         | 16 ++++++++++++++++
> >  package/python-zlmdb/python-zlmdb.hash |  5 +++++
> >  package/python-zlmdb/python-zlmdb.mk   | 14 ++++++++++++++
> >  5 files changed, 41 insertions(+)
> >  create mode 100644 package/python-zlmdb/Config.in
> >  create mode 100644 package/python-zlmdb/python-zlmdb.hash
> >  create mode 100644 package/python-zlmdb/python-zlmdb.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index a66b9d7eee..7f04663077 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -746,6 +746,11 @@ N:       Eloi Bail <eloi.bail@savoirfairelinux.com>
> >  F:   package/bayer2rgb-neon/
> >  F:   package/gstreamer1/gst1-plugins-bayer2rgb-neon/
> >
> > +N:   Emile Cormier <emile.cormier.jr@gmail.com>
> > +F:   package/python-autobahn/
> > +F:   package/python-crossbar/
> > +F:   package/python-zlmdb/
>
> Reduce this to just adding package/python-zlmdb/. Entries for existing
> packages should be added in a separate commit.
>
> > diff --git a/package/python-zlmdb/Config.in
> b/package/python-zlmdb/Config.in
> > new file mode 100644
> > index 0000000000..9eaab3a7a7
> > --- /dev/null
> > +++ b/package/python-zlmdb/Config.in
> > @@ -0,0 +1,16 @@
> > +config BR2_PACKAGE_PYTHON_ZLMDB
> > +     bool "python-zlmdb"
> > +     select BR2_PACKAGE_PYTHON_CBOR2 # runtime
> > +     select BR2_PACKAGE_PYTHON_CFFI # runtime
> > +     select BR2_PACKAGE_PYTHON_CLICK # runtime
> > +     select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
> > +     select BR2_PACKAGE_PYTHON_LMDB # runtime
> > +     select BR2_PACKAGE_PYTHON_NUMPY # runtime
>
> This one has some depends on that we need to replicate.
>
> > +     select BR2_PACKAGE_PYTHON_PYNACL # runtime
> > +     select BR2_PACKAGE_PYTHON_PYYAML # runtime
> > +     select BR2_PACKAGE_PYTHON_TXAIO # runtime
> > +     help
> > +       Object-relational zero-copy in-memory database layer for
> > +       LMDB.
> > +
> > +       https://github.com/crossbario/zlmdb
>
> So the final Config.in file looks like this:
>
> config BR2_PACKAGE_PYTHON_ZLMDB
>         bool "python-zlmdb"
>         depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS # python-numpy
>         depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL #
> python-numpy
>         select BR2_PACKAGE_PYTHON_CBOR2 # runtime
>         select BR2_PACKAGE_PYTHON_CFFI # runtime
>         select BR2_PACKAGE_PYTHON_CLICK # runtime
>         select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime
>         select BR2_PACKAGE_PYTHON_LMDB # runtime
>         select BR2_PACKAGE_PYTHON_NUMPY # runtime
>         select BR2_PACKAGE_PYTHON_PYNACL # runtime
>         select BR2_PACKAGE_PYTHON_PYYAML # runtime
>         select BR2_PACKAGE_PYTHON_TXAIO # runtime
>         help
>           Object-relational zero-copy in-memory database layer for
>           LMDB.
>
>           https://github.com/crossbario/zlmdb
>
> comment "python-zlmdb needs glibc or musl"
>         depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPORTS
>         depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOLCHAIN_USES_MUSL)
>
> Another thing that this package really needs is a test case, in
> support/testing/tests/package/. I was trying to look for some
> documentation, but apart from a pretty obscure reference document that
> doesn't have much explanations, I couldn't find anything.
>
> Do you have some simple example on how to use zlmdb? This would allow
> us to add a test case for this package that has a lot of runtime
> dependencies.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000cb892805e5a87bef
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><div><br></div><div>I&#39;m in the pr=
ocess of migrating away from Crossbar, due to dynamic authentication/author=
ization no longer working and the author not interested in backporting bug =
fixes to older versions. I can no longer devote any time to support Crossba=
r on Buildroot. Please do what you will with these patch requests.</div><di=
v><br></div><div>Sorry, I&#39;m not familiar with zlmdb; the only reason I =
introduced it was to satisfy a dependency by Crossbar.</div><div><br></div>=
<div>Cheers,</div><div>Emile Cormier<br></div></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 7, 2022 at 11:53 =
AM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">tho=
mas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">Hello Emile,<br>
<br>
I have also applied this patch, though with some changes. See below.<br>
<br>
On Sun,=C2=A0 3 Apr 2022 19:19:50 -0300<br>
Emile Cormier &lt;<a href=3D"mailto:emile.cormier.jr@gmail.com" target=3D"_=
blank">emile.cormier.jr@gmail.com</a>&gt; wrote:<br>
<br>
&gt; From: ecorm &lt;<a href=3D"mailto:ecorm@users.noreply.github.com" targ=
et=3D"_blank">ecorm@users.noreply.github.com</a>&gt;<br>
<br>
I fixed this bogus From: value.<br>
<br>
&gt; <br>
&gt; Required by python-crossbar.<br>
<br>
Added an empty new line here.<br>
<br>
&gt; Signed-off-by: Emile Cormier &lt;<a href=3D"mailto:emile.cormier.jr@gm=
ail.com" target=3D"_blank">emile.cormier.jr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 5 +++++<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 package/python-zlmdb/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
| 16 ++++++++++++++++<br>
&gt;=C2=A0 package/python-zlmdb/python-zlmdb.hash |=C2=A0 5 +++++<br>
&gt;=C2=A0 package/python-zlmdb/<a href=3D"http://python-zlmdb.mk" rel=3D"n=
oreferrer" target=3D"_blank">python-zlmdb.mk</a>=C2=A0 =C2=A0| 14 +++++++++=
+++++<br>
&gt;=C2=A0 5 files changed, 41 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/python-zlmdb/Config.in<br>
&gt;=C2=A0 create mode 100644 package/python-zlmdb/python-zlmdb.hash<br>
&gt;=C2=A0 create mode 100644 package/python-zlmdb/<a href=3D"http://python=
-zlmdb.mk" rel=3D"noreferrer" target=3D"_blank">python-zlmdb.mk</a><br>
&gt; <br>
&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; index a66b9d7eee..7f04663077 100644<br>
&gt; --- a/DEVELOPERS<br>
&gt; +++ b/DEVELOPERS<br>
&gt; @@ -746,6 +746,11 @@ N:=C2=A0 =C2=A0 =C2=A0 =C2=A0Eloi Bail &lt;<a hre=
f=3D"mailto:eloi.bail@savoirfairelinux.com" target=3D"_blank">eloi.bail@sav=
oirfairelinux.com</a>&gt;<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/bayer2rgb-neon/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/gstreamer1/gst1-plugins-bayer2rgb-neon/<b=
r>
&gt;=C2=A0 <br>
&gt; +N:=C2=A0 =C2=A0Emile Cormier &lt;<a href=3D"mailto:emile.cormier.jr@g=
mail.com" target=3D"_blank">emile.cormier.jr@gmail.com</a>&gt;<br>
&gt; +F:=C2=A0 =C2=A0package/python-autobahn/<br>
&gt; +F:=C2=A0 =C2=A0package/python-crossbar/<br>
&gt; +F:=C2=A0 =C2=A0package/python-zlmdb/<br>
<br>
Reduce this to just adding package/python-zlmdb/. Entries for existing<br>
packages should be added in a separate commit.<br>
<br>
&gt; diff --git a/package/python-zlmdb/Config.in b/package/python-zlmdb/Con=
fig.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..9eaab3a7a7<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/python-zlmdb/Config.in<br>
&gt; @@ -0,0 +1,16 @@<br>
&gt; +config BR2_PACKAGE_PYTHON_ZLMDB<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;python-zlmdb&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_CBOR2 # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_CFFI # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_CLICK # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime<b=
r>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_LMDB # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_NUMPY # runtime<br>
<br>
This one has some depends on that we need to replicate.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_PYNACL # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_PYYAML # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_PYTHON_TXAIO # runtime<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0Object-relational zero-copy in-memory data=
base layer for<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0LMDB.<br>
&gt; +<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/crossbario/z=
lmdb" rel=3D"noreferrer" target=3D"_blank">https://github.com/crossbario/zl=
mdb</a><br>
<br>
So the final Config.in file looks like this:<br>
<br>
config BR2_PACKAGE_PYTHON_ZLMDB<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 bool &quot;python-zlmdb&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPOR=
TS # python-numpy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_TOOLCHAIN_USES_GLIBC || BR2_TOOL=
CHAIN_USES_MUSL # python-numpy<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_CBOR2 # runtime<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_CFFI # runtime<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_CLICK # runtime<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_FLATBUFFERS # runtime=
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_LMDB # runtime<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_NUMPY # runtime<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_PYNACL # runtime<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_PYYAML # runtime<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_PYTHON_TXAIO # runtime<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 help<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Object-relational zero-copy in-memory da=
tabase layer for<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 LMDB.<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 <a href=3D"https://github.com/crossbario=
/zlmdb" rel=3D"noreferrer" target=3D"_blank">https://github.com/crossbario/=
zlmdb</a><br>
<br>
comment &quot;python-zlmdb needs glibc or musl&quot;<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on BR2_PACKAGE_PYTHON_NUMPY_ARCH_SUPPOR=
TS<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 depends on !(BR2_TOOLCHAIN_USES_GLIBC || BR2_TO=
OLCHAIN_USES_MUSL)<br>
<br>
Another thing that this package really needs is a test case, in<br>
support/testing/tests/package/. I was trying to look for some<br>
documentation, but apart from a pretty obscure reference document that<br>
doesn&#39;t have much explanations, I couldn&#39;t find anything.<br>
<br>
Do you have some simple example on how to use zlmdb? This would allow<br>
us to add a test case for this package that has a lot of runtime<br>
dependencies.<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--000000000000cb892805e5a87bef--

--===============1862712383802037917==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1862712383802037917==--
