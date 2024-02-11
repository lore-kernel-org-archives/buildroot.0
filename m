Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D6C5C4829A
	for <buildroot@archiver.kernel.org>; Sun, 11 Feb 2024 17:15:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6292840518;
	Sun, 11 Feb 2024 17:15:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Z7iMcvoDg3mG; Sun, 11 Feb 2024 17:15:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 638EB4028D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 638EB4028D;
	Sun, 11 Feb 2024 17:15:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 853E41BF4D5
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 802D08215E
 for <buildroot@lists.busybox.net>; Sun, 11 Feb 2024 17:15:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 22e4_atK-RwM for <buildroot@lists.busybox.net>;
 Sun, 11 Feb 2024 17:15:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::234; helo=mail-lj1-x234.google.com;
 envelope-from=abiliojr@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A421B8215D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A421B8215D
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A421B8215D
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 17:15:26 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id
 38308e7fff4ca-2d0bc402c8eso26177971fa.1
 for <buildroot@buildroot.org>; Sun, 11 Feb 2024 09:15:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707671724; x=1708276524;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=25OTSL8YeBwKCNGqhFQ+lb93T/RDZfdnNWZHJc2ylyg=;
 b=Ox+HUmwKVODXEAX8r/+xwJM//d+ermulHlrZCbXwa5bCWU7oaB8AFvQi4ntym5P6GU
 qCxtCLlLpUoHPecQqEHv0otEy9Jx8SkydBQ6NB0ZbGmXVgZ+6qrAiuKu66RDY97wolfg
 AOmWOY6GlR9BXXRD8hu3zOtv5z7Gp5YjFFpeRvd2xuUftGOGB47JF2cY0QlKnD8agHhO
 kzvwd/JR1nmQ0d/GgAMLvJauAsmI6kyju9cq6V3gGiaNCsOYVjuGmyr0EsdA8Rh2wOWN
 cWys/rnCWbROYDz5YW0XrIygRK6TrcKUTBeZ24ttxvZwbhFNeJ4/s/xnH4l00zJ83F+l
 3wGg==
X-Gm-Message-State: AOJu0Yyc3dM9Yj/DZD1oK/0vngyddItuu8mpcF7c5fDkpAkGFjbfSbqC
 Lc4uulAtCE4bltvquG2y0vflZaPunAYm8sM+SpcsJtpFLcoSL9n1MZruON5X23KxA4w/4xfRpR8
 G4Ugva0A5KhlAZnAw7fijdFNELakaz0u/lUE=
X-Google-Smtp-Source: AGHT+IELbOmM4cLbYeIOvM1t5F/J4d/w5XDQMCTHSxxR8lo2ST1Wp17fZzK54cypIIuq2beBoske9hm41JE5DFvvwIg=
X-Received: by 2002:a2e:875a:0:b0:2d0:c327:79a6 with SMTP id
 q26-20020a2e875a000000b002d0c32779a6mr2086259ljj.21.1707671724122; Sun, 11
 Feb 2024 09:15:24 -0800 (PST)
MIME-Version: 1.0
References: <20240204062645.3616072-1-abiliojr@gmail.com>
 <ZcDhkvk_uO8wbQoz@landeda>
In-Reply-To: <ZcDhkvk_uO8wbQoz@landeda>
From: Abilio Marques <abiliojr@gmail.com>
Date: Sun, 11 Feb 2024 09:15:12 -0800
Message-ID: <CAEWqYrVOgiBYqYad3RDX5BfRvqF2LJxSTvdqgwQ9aVA7SWfKEQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707671724; x=1708276524; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=25OTSL8YeBwKCNGqhFQ+lb93T/RDZfdnNWZHJc2ylyg=;
 b=YHWIkHzGYHytn+t3K1//oe3DKfwxQoAC2D84WW6TMFCaje4wbYBTFtSWsc/56zY299
 +kMs1Lwvu4rZxbvJuahdHxtML9RB7wRjc5cRIJCnqfqvTE5uXHEqT7OGv7bIQ1bkxPlg
 x1ggsBDvZqmgqnwTOkYOC/EOvbp7G4OB1fAbRhL1Z/hLuqfVW/RI+PkuwVng3TH0v4xt
 jJlAluRU97ASxcjhN2Tg6QA8mirDzqVkLmw3ROVezX6DqaVdUEpQEtvtvGSx9x0EjGJZ
 S6Wj+oyTgyO81GyV1yKqxlWO7OLsTAjO9CwmbSOmXK6Q9AKFnc7uR14y8CL4SQ2S94Ko
 RVBg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YHWIkHzG
Subject: Re: [Buildroot] [PATCH] package/micropython: add support for
 manifest.py in the configuration
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
Cc: Chris Packham <judge.packham@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3593160832485725384=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3593160832485725384==
Content-Type: multipart/alternative; boundary="00000000000082654906111e4e26"

--00000000000082654906111e4e26
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Yann,

One of the uses of manifest.py is to specify which modules of
micropython-lib should be frozen within the binary.  For those modules you
don't need to include the path. e.g.,

package('os')

That's the application I'm going for. I know it seems limited but it's
really useful, and probably welcomed by other people using Micropython in
the next release of Buildroot.

I have ideas on how to solve the path and dependency order problem while
still using the "official" manifest.py concept. The biggest challenge is
that currently there are no other 3rd party Micropython modules available
for Buildroot, so that makes it all very theoretical. All solutions require
a bigger amount of work than the one needed for this patch. Also, I would
like to discuss them before actually presenting a patch that allows 3rd
party modules to be frozen.

I always try to go for an incremental approach, where I get the bigger bang
for the buck. I believe that allowing people to freeze the official
Micropython modules is already a big step forward. But at the same time,
I'm new to the Buildroot project, so please advice on the approach.


Kind regards,
Abilio


On Mon, Feb 5, 2024 at 5:24=E2=80=AFAM Yann E. MORIN <yann.morin.1998@free.=
fr>
wrote:

> Abilio, All,
>
> On 2024-02-03 22:26 -0800, Abilio Marques spake thusly:
> > Micropython can embed packages an modules as frozen bytecode. What code
> > gets built this way can be defined by means of a "manifest.py" file.
> >
> > This commit exposes the variable FROZEN_MANIFEST to Buildroot users
> > through a new variable called BR2_PACKAGE_MICROPYTHON_MANIFEST.
> >
> > Please check Micropython's documentation for more information:
> > https://docs.micropython.org/en/latest/reference/manifest.html
>
> Minor nit: this blurb should have been in the help text of the new
> option, and I could have done that when applying, but I have a much
> more involved question, see below.
>
> > Signed-off-by: Abilio Marques <abiliojr@gmail.com>
> > ---
> >  package/micropython/Config.in      | 8 ++++++++
> >  package/micropython/micropython.mk | 5 +++++
> >  2 files changed, 13 insertions(+)
> >
> > diff --git a/package/micropython/Config.in
> b/package/micropython/Config.in
> > index 26a00baab0..52717d815a 100644
> > --- a/package/micropython/Config.in
> > +++ b/package/micropython/Config.in
> > @@ -17,6 +17,14 @@ config BR2_PACKAGE_MICROPYTHON_LIB
> >       help
> >         Core Python libraries ported to MicroPython.
> >
> > +config BR2_PACKAGE_MICROPYTHON_MANIFEST
> > +     string "Path to a manifest.py file"
> > +     help
> > +       MicroPython allows Python code to be =E2=80=9Cfrozen=E2=80=9D a=
s bytecode
> > +       into its binary, as an alternative to loading code from
> > +       the filesystem. See MicroPython's documentation for more
> > +       information.
> > +
> >  endif # BR2_PACKAGE_MICROPYTHON
> >
> >  comment "micropython needs a toolchain w/ threads, dynamic library"
> > diff --git a/package/micropython/micropython.mk b/package/micropython/
> micropython.mk
> > index 125a0edcfb..5a2c136547 100644
> > --- a/package/micropython/micropython.mk
> > +++ b/package/micropython/micropython.mk
> > @@ -43,6 +43,11 @@ else
> >  MICROPYTHON_MAKE_OPTS +=3D MICROPY_PY_FFI=3D0
> >  endif
> >
> > +ifneq ($(BR2_PACKAGE_MICROPYTHON_MANIFEST),"")
> > +MICROPYTHON_MAKE_OPTS +=3D \
> > +     FROZEN_MANIFEST=3D$(BR2_PACKAGE_MICROPYTHON_MANIFEST)
> > +endif
>
> So, as I understand this, micropython will grab the files (from modules,
> files, etc...) listed from the manifest and bundle them in the
> micropython executable. It seems the paths in the manifest can be either
> absolute, or relative; in the latter case, it not documented what they
> would be relative to; additionally there are placeholders (see below)
> that can be used but are absolute paths.
>
> So this has a few implications:
>
>   - the files must be available before micropython is built, so some
>     dependency order is needed to ensure that: if files are provided in
>     a package, then we need a dependency and it is going to be a little
>     bit difficult to do and we need a way to address that;
>
>   - the paths can't be hard-coded to absolute paths in the manifest file
>     itself, because we don't know beforehand where the buildroot build
>     directory will be, so we need a way to shoehorn $(TOPDIR) or some
>     such variable in the manifest;
>
>   - absolute paths must be fixed to accommodate the per-package option,
>     because those paths change for eaach package.
>
> From the micropython doc, that you pointed above, there are a few
> placeholders that will be replaced in the manifest, but I don't think
> we can reuse those:
>
>     Any paths used in manifest files can include the following variables.
>     These all resolve to absolute paths.
>       * $(MPY_DIR) =E2=80=93 path to the micropython repo.
>       * $(MPY_LIB_DIR) =E2=80=93 path to the micropython-lib submodule. P=
refer to
> use require().
>       * $(PORT_DIR) =E2=80=93 path to the current port (e.g. ports/stm32)
>       * $(BOARD_DIR) =E2=80=93 path to the current board (e.g.
> ports/stm32/boards/PYBV11)
>
> So we need a bit more information how this feature is to be used, and an
> example (or a few) would probably help a lot in this respect. We also
> have a runtime test for micropython, in:
>     support/testing/tests/package/test_micropython.py
>
> It would be nice to extend that runtime test as well.
>
> Regards,
> Yann E. MORIN.
>
> >  define MICROPYTHON_BUILD_CMDS
> >       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cross
> >       $(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/unix \
> > --
> > 2.43.0
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

--00000000000082654906111e4e26
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div style=3D"font-family:trebuchet ms,sans-serif" class=
=3D"gmail_default"></div><div style=3D"font-family:trebuchet ms,sans-serif"=
 class=3D"gmail_default"></div><span class=3D"gmail_default" style=3D"font-=
family:trebuchet ms,sans-serif"></span><span class=3D"gmail_default" style=
=3D"font-family:trebuchet ms,sans-serif"></span>Hello Yann,<br><br>One
 of the uses of manifest.py is to specify which modules of=20
micropython-lib should be frozen within the binary.=C2=A0 For those modules=
=20
you don&#39;t need to include the path. e.g.,<br><br>package(&#39;os&#39;)<=
br><br>That&#39;s
 the application I&#39;m going for. I know it seems limited but it&#39;s re=
ally=20
useful, and probably welcomed by other people using Micropython in the=20
next release of Buildroot.<br><br>I have ideas on how to solve the path and=
 dependency order problem while still using the<span class=3D"gmail_default=
" style=3D"font-family:trebuchet ms,sans-serif"> &quot;official&quot;</span=
> manifest.py concept. The biggest <span class=3D"gmail_default" style=3D"f=
ont-family:trebuchet ms,sans-serif">challenge</span> is that currently ther=
e are no other 3rd party <span class=3D"gmail_default" style=3D"font-family=
:trebuchet ms,sans-serif">M</span>icropython modules available for <span cl=
ass=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif">B</span=
>uildroot, so that makes it all very theoretical.<span class=3D"gmail_defau=
lt" style=3D"font-family:trebuchet ms,sans-serif"> All solutions require a =
bigger amount of work than the one needed for this patch. Also, I would lik=
e to discuss them before actually presenting a </span><span class=3D"gmail_=
default" style=3D"font-family:trebuchet ms,sans-serif">patch that allows 3r=
d party modules to be frozen.</span><br><br><div>I always try to go for an =
incremental approach, where<span class=3D"gmail_default" style=3D"font-fami=
ly:trebuchet ms,sans-serif"> I get</span> the bigger bang for the buck. <sp=
an class=3D"gmail_default" style=3D"font-family:trebuchet ms,sans-serif">I =
believe that allowing people to freeze the official Micropython modules is =
already a big step forward. </span>But at the same time, I&#39;m new to the=
 Buildroot project, so please advice on the approach.</div><div><br></div><=
div><br></div><div><div style=3D"font-family:trebuchet ms,sans-serif" class=
=3D"gmail_default">Kind regards,</div><div style=3D"font-family:trebuchet m=
s,sans-serif" class=3D"gmail_default">Abilio<br></div></div><div><br></div>=
<div><br></div><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_a=
ttr">On Mon, Feb 5, 2024 at 5:24=E2=80=AFAM Yann E. MORIN &lt;<a href=3D"ma=
ilto:yann.morin.1998@free.fr">yann.morin.1998@free.fr</a>&gt; wrote:<br></d=
iv><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bord=
er-left:1px solid rgb(204,204,204);padding-left:1ex">Abilio, All,<br>
<br>
On 2024-02-03 22:26 -0800, Abilio Marques spake thusly:<br>
&gt; Micropython can embed packages an modules as frozen bytecode. What cod=
e<br>
&gt; gets built this way can be defined by means of a &quot;manifest.py&quo=
t; file.<br>
&gt; <br>
&gt; This commit exposes the variable FROZEN_MANIFEST to Buildroot users<br=
>
&gt; through a new variable called BR2_PACKAGE_MICROPYTHON_MANIFEST.<br>
&gt; <br>
&gt; Please check Micropython&#39;s documentation for more information:<br>
&gt; <a href=3D"https://docs.micropython.org/en/latest/reference/manifest.h=
tml" rel=3D"noreferrer" target=3D"_blank">https://docs.micropython.org/en/l=
atest/reference/manifest.html</a><br>
<br>
Minor nit: this blurb should have been in the help text of the new<br>
option, and I could have done that when applying, but I have a much<br>
more involved question, see below.<br>
<br>
&gt; Signed-off-by: Abilio Marques &lt;<a href=3D"mailto:abiliojr@gmail.com=
" target=3D"_blank">abiliojr@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/micropython/Config.in=C2=A0 =C2=A0 =C2=A0 | 8 ++++++++<b=
r>
&gt;=C2=A0 package/micropython/<a href=3D"http://micropython.mk" rel=3D"nor=
eferrer" target=3D"_blank">micropython.mk</a> | 5 +++++<br>
&gt;=C2=A0 2 files changed, 13 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/micropython/Config.in b/package/micropython/Confi=
g.in<br>
&gt; index 26a00baab0..52717d815a 100644<br>
&gt; --- a/package/micropython/Config.in<br>
&gt; +++ b/package/micropython/Config.in<br>
&gt; @@ -17,6 +17,14 @@ config BR2_PACKAGE_MICROPYTHON_LIB<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Core Python libraries ported to Micro=
Python.<br>
&gt;=C2=A0 <br>
&gt; +config BR2_PACKAGE_MICROPYTHON_MANIFEST<br>
&gt; +=C2=A0 =C2=A0 =C2=A0string &quot;Path to a manifest.py file&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0MicroPython allows Python code to be =E2=
=80=9Cfrozen=E2=80=9D as bytecode<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0into its binary, as an alternative to load=
ing code from<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0the filesystem. See MicroPython&#39;s docu=
mentation for more<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0information.<br>
&gt; +<br>
&gt;=C2=A0 endif # BR2_PACKAGE_MICROPYTHON<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 comment &quot;micropython needs a toolchain w/ threads, dynamic =
library&quot;<br>
&gt; diff --git a/package/micropython/<a href=3D"http://micropython.mk" rel=
=3D"noreferrer" target=3D"_blank">micropython.mk</a> b/package/micropython/=
<a href=3D"http://micropython.mk" rel=3D"noreferrer" target=3D"_blank">micr=
opython.mk</a><br>
&gt; index 125a0edcfb..5a2c136547 100644<br>
&gt; --- a/package/micropython/<a href=3D"http://micropython.mk" rel=3D"nor=
eferrer" target=3D"_blank">micropython.mk</a><br>
&gt; +++ b/package/micropython/<a href=3D"http://micropython.mk" rel=3D"nor=
eferrer" target=3D"_blank">micropython.mk</a><br>
&gt; @@ -43,6 +43,11 @@ else<br>
&gt;=C2=A0 MICROPYTHON_MAKE_OPTS +=3D MICROPY_PY_FFI=3D0<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +ifneq ($(BR2_PACKAGE_MICROPYTHON_MANIFEST),&quot;&quot;)<br>
&gt; +MICROPYTHON_MAKE_OPTS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0FROZEN_MANIFEST=3D$(BR2_PACKAGE_MICROPYTHON_MANIF=
EST)<br>
&gt; +endif<br>
<br>
So, as I understand this, micropython will grab the files (from modules,<br=
>
files, etc...) listed from the manifest and bundle them in the<br>
micropython executable. It seems the paths in the manifest can be either<br=
>
absolute, or relative; in the latter case, it not documented what they<br>
would be relative to; additionally there are placeholders (see below)<br>
that can be used but are absolute paths.<br>
<br>
So this has a few implications:<br>
<br>
=C2=A0 - the files must be available before micropython is built, so some<b=
r>
=C2=A0 =C2=A0 dependency order is needed to ensure that: if files are provi=
ded in<br>
=C2=A0 =C2=A0 a package, then we need a dependency and it is going to be a =
little<br>
=C2=A0 =C2=A0 bit difficult to do and we need a way to address that;<br>
<br>
=C2=A0 - the paths can&#39;t be hard-coded to absolute paths in the manifes=
t file<br>
=C2=A0 =C2=A0 itself, because we don&#39;t know beforehand where the buildr=
oot build<br>
=C2=A0 =C2=A0 directory will be, so we need a way to shoehorn $(TOPDIR) or =
some<br>
=C2=A0 =C2=A0 such variable in the manifest;<br>
<br>
=C2=A0 - absolute paths must be fixed to accommodate the per-package option=
,<br>
=C2=A0 =C2=A0 because those paths change for eaach package.<br>
<br>
From the micropython doc, that you pointed above, there are a few<br>
placeholders that will be replaced in the manifest, but I don&#39;t think<b=
r>
we can reuse those:<br>
<br>
=C2=A0 =C2=A0 Any paths used in manifest files can include the following va=
riables.<br>
=C2=A0 =C2=A0 These all resolve to absolute paths.<br>
=C2=A0 =C2=A0 =C2=A0 * $(MPY_DIR) =E2=80=93 path to the micropython repo.<b=
r>
=C2=A0 =C2=A0 =C2=A0 * $(MPY_LIB_DIR) =E2=80=93 path to the micropython-lib=
 submodule. Prefer to use require().<br>
=C2=A0 =C2=A0 =C2=A0 * $(PORT_DIR) =E2=80=93 path to the current port (e.g.=
 ports/stm32)<br>
=C2=A0 =C2=A0 =C2=A0 * $(BOARD_DIR) =E2=80=93 path to the current board (e.=
g.=C2=A0 ports/stm32/boards/PYBV11)<br>
<br>
So we need a bit more information how this feature is to be used, and an<br=
>
example (or a few) would probably help a lot in this respect. We also<br>
have a runtime test for micropython, in:<br>
=C2=A0 =C2=A0 support/testing/tests/package/test_micropython.py<br>
<br>
It would be nice to extend that runtime test as well.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt;=C2=A0 define MICROPYTHON_BUILD_CMDS<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/mpy-cros=
s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)/ports/un=
ix \<br>
&gt; -- <br>
&gt; 2.43.0<br>
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
--------&#39;<br>
</blockquote></div></div>

--00000000000082654906111e4e26--

--===============3593160832485725384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3593160832485725384==--
