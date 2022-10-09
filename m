Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9929CC433FE
	for <buildroot@archiver.kernel.org>; Sun,  9 Oct 2022 09:29:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2DD0F60B6F;
	Sun,  9 Oct 2022 09:29:46 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2DD0F60B6F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fs82pH0fxgDT; Sun,  9 Oct 2022 09:29:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 13DE860BCE;
	Sun,  9 Oct 2022 09:29:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 13DE860BCE
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B87651BF36F
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 09:29:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9246B408D0
 for <buildroot@lists.busybox.net>; Sun,  9 Oct 2022 09:29:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9246B408D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nXqtU7fsKhxq for <buildroot@lists.busybox.net>;
 Sun,  9 Oct 2022 09:29:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 89AEF408C7
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 89AEF408C7
 for <buildroot@buildroot.org>; Sun,  9 Oct 2022 09:29:40 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id o21so19381414ejm.11
 for <buildroot@buildroot.org>; Sun, 09 Oct 2022 02:29:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ESj0lN5fFzxhFjbEkKJ/lQcBk1HEfPWWusarXh5/hxw=;
 b=rHORua6hh0MyhoeUogxSLP8shcZrwZd1Zy9qj+P70lUgWbIXXCe7qXER0X7wCYj2SJ
 Mfr/ugvN4U1R8hKk81Hhe5HFg5fZIdbJRp3JzRKXwnlU1gcTKl5xfNnC/9hFzAWh803Y
 hWam82n1pAurjjQ/6R5irUvELWkqeWmvqaguVkANcT2ORAasLKcL9AiPd+6sUhGh+nIH
 wr1hyz4fGl7kBM+8PGBYAV2WTXVnEflRzCmL9mF3wLnJOCRvEKQ//J0y93ti+b/fvWmM
 M84b04Biwn6UxM3Z9irIrXAhKbGyCYRRa+BaVevsu24wRHwldRa+OY4SrsVSUYRlgPs2
 jcwg==
X-Gm-Message-State: ACrzQf2gtHDVtLMdjHN2Yi0dmxoEtM7Diu2fn3GFyjz082r+39SNgKzx
 wxW6jbls1JLRj0zRrfXbvG3Laz6jPfC2lG0PZpznhMoHz/k=
X-Google-Smtp-Source: AMsMyM6PjZDcXtjYuwz9m6ZQNZqN7AKPMFc3sEkYBr6c5KgvJmnuKJ56z9Op/psjlfl0KIz2UhDnBznqR/H8XHBkL9w=
X-Received: by 2002:a17:906:5d0f:b0:78d:1bed:890f with SMTP id
 g15-20020a1709065d0f00b0078d1bed890fmr10658881ejt.594.1665307778528; Sun, 09
 Oct 2022 02:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <1665044877-79114-1-git-send-email-gwenj@trabucayre.com>
 <20221006215057.49eec773@windsurf>
 <20221006221340.45c07636@x230_1.trabucayre.com>
In-Reply-To: <20221006221340.45c07636@x230_1.trabucayre.com>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Sun, 9 Oct 2022 11:29:12 +0200
Message-ID: <CAJe0E3dcuE6Dwe85x9yMoCtdmJi-qUsX_BCNjVe6oAU4QYvbkA@mail.gmail.com>
To: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ESj0lN5fFzxhFjbEkKJ/lQcBk1HEfPWWusarXh5/hxw=;
 b=D5v4BquDJdI3mFLaUv3oHPLHgpEmq642IcUpNxZFD8Obk7e7jVhW2CvYw0zW4kSgqs
 u3Ck5zBPH0ZCMhhiwPxx/x4KtITcpzScJ52xHri2NxApecWsIDOot3DQBEzfD979qnf8
 AQT3gb7bU6wo8TKclj0qT8bNbNgOF6j9SmWdUVmZ0veqriH4eMgvFPeR+VLm3DALQFrS
 xEkMWEeK8asCwGgdkAkcB+d7tzWceTyZ/2MX9dfNqTYZVSwPHFzXdawL7C+9OKjQjlYl
 oUJ3Rpy8ISowGzKxQzOeqnCJ8XpHjvLIL8Nw3ZXdVNBeW0MKZ7bE6kQ/Qcyk9VdYZSAT
 j0mw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=D5v4BquD
Subject: Re: [Buildroot] [PATCH v4] package/gnuradio: bump version to
 3.10.4.0
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
Cc: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8929882603422036306=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8929882603422036306==
Content-Type: multipart/alternative; boundary="00000000000094bc9b05ea96aeca"

--00000000000094bc9b05ea96aeca
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello guys,

sorry for the delayed answer, no access to personal emails for a bit

> I am sorry, but this still doesn't make any sense, and will in fact
> cause build failures. A package cannot have a target package in its
> <pkg>_DEPENDENCIES variable without selecting it.
I agree with Thomas. Basically "gnuradio" is now becoming similar to
"scipy" which already exists.
And we do select "python-pybind" when enabling "scipy".

> If python-pybind is needed at build time on the host, then
> GNURADIO_DEPENDENCIES must contain host-python-pybind, and nothing
> needs to be done in Config.in.
I disagree with Thomas on this and agree with the proposal. But that's only
due to the weird nature of pybind.
The current setup/description of pybind is a Header only package, it is not
a host-package but the only difference *to me*, is where the headers are
installed to.
I scrolled the pybind emails history. The only justification for this, *to
me*, is Yann's:
"As I explained in my previous review, headers are supposed to be in
$(STAGING_DIR)/usr/include/pybind11/. That's at least where they are in
Debian-based distributions;"

So pybind got reworked to match those expectations regarding how to
properly manage a header only library.
For us, this did not help because the pybind setup script is tedious. But
we got it to work.
On the other hand, there are plenty of header only packages existing in BR
so we had examples to rely on.

For information, "gnuradio" and "scipy" are now the only two packages
relying on "pybind".
But two other candidates would be "kmsxx" and "zeek"; my understanding is,
these two currently have a build context that embeds a pybind itself.
Maybe in a not so far future, they would get incremented to rely on the
pybind we provide


Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le jeu. 6 oct. 2022 =C3=A0 22:13, Gwenhael Goavec-Merou <gwenj@trabucayre.c=
om> a
=C3=A9crit :

> Hello,
> On Thu, 6 Oct 2022 21:50:57 +0200
> Thomas Petazzoni <thomas.petazzoni@bootlin.com> wrote:
>
> > Hello,
> >
> > On Thu,  6 Oct 2022 10:27:57 +0200
> > Gwenhael Goavec-Merou <gwenj@trabucayre.com> wrote:
> >
> > > - Since gnuradio 3.10 swig was replaced by pybind. Now python
> libraries,
> > >   bindings and python wrappers are produces using pybind: this why
> > > python-pybind is a buildtime dependency. This one is a stagging only
> > > package (nothing installed into target directory -> no select
> > > BR2_PACKAGE_PYTHON_PYBIND added to Config.in but GNURADIO_DEPENDENCIE=
S
> is
> > > updated with python-pybind).
> >
> > I am sorry, but this still doesn't make any sense, and will in fact
> > cause build failures. A package cannot have a target package in its
> > <pkg>_DEPENDENCIES variable without selecting it.
> >
> > If python-pybind is needed at build time on the host, then
> > GNURADIO_DEPENDENCIES must contain host-python-pybind, and nothing
> > needs to be done in Config.in.
> >
> > If python-pybind is needed on the target, then two options:
> >
> >  (1) It's needed only at runtime =3D> it should be selected in Config.i=
n.
> >
> >  (2) It's needed at build-time =3D> it should be selected in Config.in
> >  *and* and added as a dependency in GNURADIO_DEPENDENCIES. However, I'd
> >  like to see a serious justification, because it is really uncommon to
> >  have target Python packages be build-time dependencies.
> >
> I'm totally agree: gnuradio needs host-python-pybind.
> In fact pybind package is not really clear to me:
> - there is no host-python-pybind
> - python-pybind is used to populate staging (PYTHON_PYBIND_INSTALL_STAGIN=
G
> =3D
>   YES) but nothing is installed into target (PYTHON_PYBIND_INSTALL_TARGET
> =3D NO)
>
> If I remember well (but unable to find thread) one of previous bump has
> required a long discussion with as result this status: maybe guillaume (i=
n
> CC)
> could help to clarify situation.
> > Best regards,
> >
> > Thomas
> > --
> > Thomas Petazzoni, co-owner and CEO, Bootlin
> > Embedded Linux and Kernel engineering and training
> > https://bootlin.com
> Regards,
>
> Gwenhael
>

--00000000000094bc9b05ea96aeca
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div><div><div><div><div>Hello guys,<br><br></div>sor=
ry for the delayed answer, no access to personal emails for a bit<br><br>&g=
t; I am sorry, but this still doesn&#39;t make any sense, and will in fact<=
br>
&gt; cause build failures. A package cannot have a target package in its<br=
>
&gt; &lt;pkg&gt;_DEPENDENCIES variable without selecting it.<br></div>I agr=
ee with Thomas. Basically &quot;gnuradio&quot; is now becoming similar to &=
quot;scipy&quot; which already exists.<br></div>And we do select &quot;pyth=
on-pybind&quot; when enabling &quot;scipy&quot;.<br><br>
&gt; If python-pybind is needed at build time on the host, then<br>
&gt; GNURADIO_DEPENDENCIES must contain host-python-pybind, and nothing<br>
&gt; needs to be done in Config.in.<br></div>I disagree with Thomas on this=
 and agree with the proposal. But that&#39;s only due to the weird nature o=
f pybind.<br></div>The current setup/description of pybind is a Header only=
 package, it is not a host-package but the only difference *to me*, is wher=
e the headers are installed to.<br></div>I scrolled the pybind emails histo=
ry. The only justification for this, *to me*, is Yann&#39;s: <br><div><div>=
<div><div>&quot;As I explained in my previous review, headers are supposed =
to be in<br>
$(STAGING_DIR)/usr/include/pybind11/. That&#39;s at least where they are in=
<br>
Debian-based distributions;&quot;</div><div><div><div><br></div><div>So pyb=
ind got reworked to match those expectations regarding how to properly mana=
ge a header only library.<br></div><div>For us, this did not help because t=
he pybind setup script is tedious. But we got it to work.<br></div><div>On =
the other hand, there are plenty of header only packages existing in BR so =
we had examples to rely on.<br><br></div><div>For information, &quot;gnurad=
io&quot; and &quot;scipy&quot; are now the only two packages relying on &qu=
ot;pybind&quot;.<br></div><div>But two other candidates would be &quot;kmsx=
x&quot; and &quot;zeek&quot;; my understanding is, these two currently have=
 a build context that embeds a pybind itself.<br></div><div>Maybe in a not =
so far future, they would get incremented to rely on the pybind we provide<=
br><br></div><div><br clear=3D"all"></div><div><div><div><div><div dir=3D"l=
tr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div>=
<font face=3D"arial,helvetica,sans-serif">Guillaume W. Bres<br></font></div=
><font face=3D"arial,helvetica,sans-serif">Software engineer</font><br></di=
v><font face=3D"arial,helvetica,sans-serif"></font></div><font face=3D"aria=
l,helvetica,sans-serif">&lt;<a href=3D"mailto:guillaume.bressaix@gmail.com"=
 target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br></font></div></d=
iv></div></div></div></div><br></div></div></div></div></div></div></div></=
div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_at=
tr">Le=C2=A0jeu. 6 oct. 2022 =C3=A0=C2=A022:13, Gwenhael Goavec-Merou &lt;<=
a href=3D"mailto:gwenj@trabucayre.com">gwenj@trabucayre.com</a>&gt; a =C3=
=A9crit=C2=A0:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">H=
ello,<br>
On Thu, 6 Oct 2022 21:50:57 +0200<br>
Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=
=3D"_blank">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br>
<br>
&gt; Hello,<br>
&gt; <br>
&gt; On Thu,=C2=A0 6 Oct 2022 10:27:57 +0200<br>
&gt; Gwenhael Goavec-Merou &lt;<a href=3D"mailto:gwenj@trabucayre.com" targ=
et=3D"_blank">gwenj@trabucayre.com</a>&gt; wrote:<br>
&gt; <br>
&gt; &gt; - Since gnuradio 3.10 swig was replaced by pybind. Now python lib=
raries,<br>
&gt; &gt;=C2=A0 =C2=A0bindings and python wrappers are produces using pybin=
d: this why<br>
&gt; &gt; python-pybind is a buildtime dependency. This one is a stagging o=
nly<br>
&gt; &gt; package (nothing installed into target directory -&gt; no select<=
br>
&gt; &gt; BR2_PACKAGE_PYTHON_PYBIND added to Config.in but GNURADIO_DEPENDE=
NCIES is<br>
&gt; &gt; updated with python-pybind).=C2=A0 <br>
&gt; <br>
&gt; I am sorry, but this still doesn&#39;t make any sense, and will in fac=
t<br>
&gt; cause build failures. A package cannot have a target package in its<br=
>
&gt; &lt;pkg&gt;_DEPENDENCIES variable without selecting it.<br>
&gt; <br>
&gt; If python-pybind is needed at build time on the host, then<br>
&gt; GNURADIO_DEPENDENCIES must contain host-python-pybind, and nothing<br>
&gt; needs to be done in Config.in.<br>
&gt; <br>
&gt; If python-pybind is needed on the target, then two options:<br>
&gt; <br>
&gt;=C2=A0 (1) It&#39;s needed only at runtime =3D&gt; it should be selecte=
d in Config.in.<br>
&gt; <br>
&gt;=C2=A0 (2) It&#39;s needed at build-time =3D&gt; it should be selected =
in Config.in<br>
&gt;=C2=A0 *and* and added as a dependency in GNURADIO_DEPENDENCIES. Howeve=
r, I&#39;d<br>
&gt;=C2=A0 like to see a serious justification, because it is really uncomm=
on to<br>
&gt;=C2=A0 have target Python packages be build-time dependencies.<br>
&gt; <br>
I&#39;m totally agree: gnuradio needs host-python-pybind.<br>
In fact pybind package is not really clear to me:<br>
- there is no host-python-pybind<br>
- python-pybind is used to populate staging (PYTHON_PYBIND_INSTALL_STAGING =
=3D<br>
=C2=A0 YES) but nothing is installed into target (PYTHON_PYBIND_INSTALL_TAR=
GET =3D NO)<br>
<br>
If I remember well (but unable to find thread) one of previous bump has<br>
required a long discussion with as result this status: maybe guillaume (in =
CC)<br>
could help to clarify situation.<br>
&gt; Best regards,<br>
&gt; <br>
&gt; Thomas<br>
&gt; -- <br>
&gt; Thomas Petazzoni, co-owner and CEO, Bootlin<br>
&gt; Embedded Linux and Kernel engineering and training<br>
&gt; <a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">h=
ttps://bootlin.com</a><br>
Regards,<br>
<br>
Gwenhael<br>
</blockquote></div>

--00000000000094bc9b05ea96aeca--

--===============8929882603422036306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8929882603422036306==--
