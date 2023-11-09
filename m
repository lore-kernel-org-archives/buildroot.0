Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1A71C4332F
	for <buildroot@archiver.kernel.org>; Thu,  9 Nov 2023 22:52:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 63D47825DF;
	Thu,  9 Nov 2023 22:52:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 63D47825DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 25o6ybJ6T60m; Thu,  9 Nov 2023 22:51:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D6C2A825FE;
	Thu,  9 Nov 2023 22:51:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D6C2A825FE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1A3041BF36B
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 22:51:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E45784038B
 for <buildroot@lists.busybox.net>; Thu,  9 Nov 2023 22:51:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E45784038B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Cl37En2MtoNG for <buildroot@lists.busybox.net>;
 Thu,  9 Nov 2023 22:51:54 +0000 (UTC)
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BDD5C40360
 for <buildroot@buildroot.org>; Thu,  9 Nov 2023 22:51:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BDD5C40360
Received: by mail-ej1-x634.google.com with SMTP id
 a640c23a62f3a-9dd6dc9c00cso245270566b.3
 for <buildroot@buildroot.org>; Thu, 09 Nov 2023 14:51:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699570312; x=1700175112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YC8xDc+iFIV5+HNl/PG13PHA3gad0qLc7DUs5YIqgGA=;
 b=arqMMwlO8STwIcOOgIuX2jESGqjZLV1dGfxUaUQaNDc5wSXhFzY1ylaiZHBhO0WyHT
 MHISha9Dl/oBXC68PNIrMMKjkeziLcpJv3KDmj7Naq+spsxnb+zvaLih669yyMkZbOYK
 3WjlDLR/dhyU6NRm1TCNqC+H5lEquT1GmaTdS6oi+b4nLLsMRommu24bjX6rn+glZbWD
 gczhTeh2GWY7Ibeu5A4OcqSiYRPZcEsc8R+HqkeQmJnkzt65Qx+/JCiWuEM09EE+blBw
 +7wc5uqm+VlW5jEybbKszM5X3DS9i3rIUjpE4lTRosIpePPfa/Op3zk73fFLYrgjQk3+
 KbyQ==
X-Gm-Message-State: AOJu0YyhmvMGGtyLxxRkuUHNxkDDYpWPk1ntIvWb4uh6W1HTgUGDvBHX
 Poyjwx0sViSYLLQXi74r4M+PQ0rULHhzwoetVbh2Bw==
X-Google-Smtp-Source: AGHT+IHPgiJXmbCvu3N2g8u+0Kfjse0mWSjW4tqOwV8d66GsGq8lqTnNyk8ARTAEO0O81YkD4gV9Dis/ufaqWCrVww0=
X-Received: by 2002:a17:906:478a:b0:9c4:eefa:b6aa with SMTP id
 cw10-20020a170906478a00b009c4eefab6aamr5340998ejc.42.1699570311562; Thu, 09
 Nov 2023 14:51:51 -0800 (PST)
MIME-Version: 1.0
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
 <20231105202555.359391-19-adam.duskett@amarulasolutions.com>
 <20231109215241.GF996011@scaer>
In-Reply-To: <20231109215241.GF996011@scaer>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Thu, 9 Nov 2023 15:51:40 -0700
Message-ID: <CAHDQB6OWNq+atom_=KctivGE8tkzifBdxEy=7zzQ23X+wMn4fg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699570312; x=1700175112;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YC8xDc+iFIV5+HNl/PG13PHA3gad0qLc7DUs5YIqgGA=;
 b=VBWnqPFwfsw19SWrGDpGUrv2RUeyb/UhoG6ICio81Kc2Ys7NYBlpsF5bCUw2RPpo/6
 MhgLSlATyqS3AD5f4HulPAjj+59QRTcH6s/0tnwh4ofGHTtuBKwgxdf6MhuQj074dHSn
 dILc3/pjOdGPdRR6D3SjCR9RzwNUvnwu5/x5I=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VBWnqPFw
Subject: Re: [Buildroot] [PATCH v2 19/24] package/python-pygame: drop package
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7728169754194102626=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7728169754194102626==
Content-Type: multipart/alternative; boundary="000000000000b11d400609c00c0f"

--000000000000b11d400609c00c0f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Yann;

Did you test python-pygame with setuptools against python 3.12.0?

I receive the following error:

src/surface.c:2812:14: error: invalid type argument of unary =E2=80=98*=E2=
=80=99 (have
=E2=80=98int=E2=80=99)
 2812 |         ch =3D *PyUnicode_AS_UNICODE (obj);
      |              ^~~~~~~~~~~~~~~~~~~~~~~~~~~
src/surface.c: In function =E2=80=98PySurface_Blit=E2=80=99:


Thanks!

Adam Duskett

Senior Embedded Systems Developer

M. +1208-515-8102

adam.duskett@amarulasolutions.com

__________________________________


Amarula Solutions BV

Joop Geesinkweg 125, 1114 AB, Amsterdam, NL

T. +31 (0)85 111 9170
info@amarulasolutions.com

www.amarulasolutions.com



On Thu, Nov 9, 2023 at 2:52=E2=80=AFPM Yann E. MORIN <yann.morin.1998@free.=
fr>
wrote:

> Adam, All,
>
> On 2023-11-05 13:25 -0700, Adam Duskett spake thusly:
> > The python-pygame package has not recieved any update since
> > Sun May 1 22:15:17 2016 (commit:
> a9ec96e545102ae5ccd4280323d35360b0a5072d)
> > As python 3.12.0 no longer supports distutils, drop the package as the
> package
> > is clearly unmaintained.
> >
> > If someone wants to re-introduce this package at a later date they are
> more
> > than welcome to do so!
>
> Thet got a respite, as I applied James patch to switch to setuptools
> instead of distutils:
>
>     e759e927b344  package/python-pygame: switch from distutils to
> setuptools
>
> So, this patch that drops pyhon-pygame is no longer needed; I've marked
> it rekected in patchwork.
>
> Thanks!
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Adam Duskett <adam.duskett@amarulasolutions.com>
> > ---
> > v1 -> v2:
> >  - Remove python-pygame from the DEVELOPERS file
> >  - Don't remove python-pyxb from Config.in in this patch.
> >
> >  DEVELOPERS                               |   1 -
> >  package/Config.in                        |   1 -
> >  package/python-pygame/Config.in          |  50 ----------
> >  package/python-pygame/python-pygame.hash |   3 -
> >  package/python-pygame/python-pygame.mk   | 111 -----------------------
> >  5 files changed, 166 deletions(-)
> >  delete mode 100644 package/python-pygame/Config.in
> >  delete mode 100644 package/python-pygame/python-pygame.hash
> >  delete mode 100644 package/python-pygame/python-pygame.mk
> >
> > diff --git a/DEVELOPERS b/DEVELOPERS
> > index 3334cad77f..b890fb2586 100644
> > --- a/DEVELOPERS
> > +++ b/DEVELOPERS
> > @@ -1687,7 +1687,6 @@ F:      package/libcddb/
> >  F:   package/libmodbus/
> >  F:   package/ltris/
> >  F:   package/opentyrian/
> > -F:   package/python-pygame/
> >
> >  N:   Julien Corjon <corjon.j@ecagroup.com>
> >  F:   package/qt5/
> > diff --git a/package/Config.in b/package/Config.in
> > index 32347fe4e8..19e5035878 100644
> > --- a/package/Config.in
> > +++ b/package/Config.in
> > @@ -1228,7 +1228,6 @@ menu "External python modules"
> >       source "package/python-pydyf/Config.in"
> >       source "package/python-pyelftools/Config.in"
> >       source "package/python-pyftpdlib/Config.in"
> > -     source "package/python-pygame/Config.in"
> >       source "package/python-pygments/Config.in"
> >       source "package/python-pyhamcrest/Config.in"
> >       source "package/python-pyicu/Config.in"
> > diff --git a/package/python-pygame/Config.in
> b/package/python-pygame/Config.in
> > deleted file mode 100644
> > index 57eb020742..0000000000
> > --- a/package/python-pygame/Config.in
> > +++ /dev/null
> > @@ -1,50 +0,0 @@
> > -config BR2_PACKAGE_PYTHON_PYGAME
> > -     bool "python-pygame"
> > -     select BR2_PACKAGE_SDL
> > -     help
> > -       Pygame is a cross-platfrom library designed to make it easy
> > -       to write multimedia software, such as games, in
> > -       Python. Pygame requires the Python language and SDL
> > -       multimedia library.
> > -       It can also make use of several other popular libraries.
> > -
> > -       http://www.pygame.org/
> > -
> > -if BR2_PACKAGE_PYTHON_PYGAME
> > -config BR2_PACKAGE_PYTHON_PYGAME_IMAGE
> > -     bool "pygame.image"
> > -     select BR2_PACKAGE_SDL_IMAGE
> > -     select BR2_PACKAGE_SDL_IMAGE_PNG
> > -     select BR2_PACKAGE_SDL_IMAGE_JPEG
> > -     help
> > -       pygame module for loading, saving and transfering images.
> > -       Will autoselect sdl_image with png and jpeg support.
> > -
> > -config BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES
> > -     bool "pygame.examples"
> > -     help
> > -       Include examples.
> > -       Selecting this option adds about 1.5 MB to the target file
> > -       system.
> > -
> > -config BR2_PACKAGE_PYTHON_PYGAME_FONT
> > -     bool "pygame.font"
> > -     select BR2_PACKAGE_SDL_TTF
> > -     help
> > -       pygame module for loading and rendering fonts.
> > -       Will autoselect sdl_ttf.
> > -
> > -config BR2_PACKAGE_PYTHON_PYGAME_MIXER
> > -     bool "pygame.mixer"
> > -     select BR2_PACKAGE_SDL_MIXER
> > -     help
> > -       pygame module for loading and playing sounds.
> > -       Will autoselect sdl_mixer.
> > -
> > -config BR2_PACKAGE_PYTHON_PYGAME_SCRAP
> > -     bool "pygame.scrap"
> > -     depends on BR2_PACKAGE_SDL_X11
> > -     help
> > -       pygame module for clipboard support (X11 needed)
> > -
> > -endif
> > diff --git a/package/python-pygame/python-pygame.hash
> b/package/python-pygame/python-pygame.hash
> > deleted file mode 100644
> > index c0496515e2..0000000000
> > --- a/package/python-pygame/python-pygame.hash
> > +++ /dev/null
> > @@ -1,3 +0,0 @@
> > -# Locally computed
> > -sha256
> f95a7dd68ea294d415e36e068d2f533c5a01c67773452d14a535c5c7455681fe
> pygame-d61ea8eabd56.tar.gz
> > -sha256
> a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f0124db3cee7  LGPL
> > diff --git a/package/python-pygame/python-pygame.mk
> b/package/python-pygame/python-pygame.mk
> > deleted file mode 100644
> > index 600dd9e743..0000000000
> > --- a/package/python-pygame/python-pygame.mk
> > +++ /dev/null
> > @@ -1,111 +0,0 @@
> >
> -########################################################################=
########
> > -#
> > -# python-pygame
> > -#
> >
> -########################################################################=
########
> > -
> > -# stable 1.9.1 release requires V4L which has been wiped out of recent
> Linux
> > -# kernels, so use latest mercurial revision until next stable release
> is out.
> > -PYTHON_PYGAME_VERSION =3D d61ea8eabd56
> > -PYTHON_PYGAME_SOURCE =3D pygame-$(PYTHON_PYGAME_VERSION).tar.gz
> > -PYTHON_PYGAME_SITE =3D https://bitbucket.org/pygame/pygame
> > -PYTHON_PYGAME_SITE_METHOD =3D hg
> > -PYTHON_PYGAME_SETUP_TYPE =3D distutils
> > -PYTHON_PYGAME_LICENSE =3D LGPL-2.1+
> > -PYTHON_PYGAME_LICENSE_FILES =3D LGPL
> > -
> > -ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
> > -PYTHON_PYGAME_OPT_DEPENDS +=3D sdl_image
> > -endif
> > -
> > -ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
> > -PYTHON_PYGAME_OPT_DEPENDS +=3D sdl_ttf
> > -endif
> > -
> > -ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
> > -PYTHON_PYGAME_OPT_DEPENDS +=3D sdl_mixer
> > -endif
> > -
> > -PYTHON_PYGAME_DEPENDENCIES =3D sdl $(PYTHON_PYGAME_OPT_DEPENDS)
> > -
> > -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)
> > -define PYTHON_PYGAME_UNCONFIGURE_IMAGE
> > -     $(SED) 's/^imageext/#imageext/' $(@D)/Setup
> > -endef
> > -endif
> > -
> > -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)
> > -define PYTHON_PYGAME_UNCONFIGURE_FONT
> > -     $(SED) 's/^font/#font/' $(@D)/Setup
> > -endef
> > -endif
> > -
> > -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)
> > -define PYTHON_PYGAME_UNCONFIGURE_MIXER
> > -     $(SED) 's/^mixer/#mixer/g' $(@D)/Setup
> > -endef
> > -endif
> > -
> > -# Both require numpy or numeric python module
> > -define PYTHON_PYGAME_UNCONFIGURE_SNDARRAY
> > -     $(SED) 's/^_numericsndarray/#_numericsndarray/' $(@D)/Setup
> > -endef
> > -
> > -define PYTHON_PYGAME_UNCONFIGURE_SURFARRAY
> > -     $(SED) 's/^_numericsurfarray/#_numericsurfarray/' $(@D)/Setup
> > -endef
> > -
> > -# Requires smpeg
> > -define PYTHON_PYGAME_UNCONFIGURE_MOVIE
> > -     $(SED) 's/^movie/#movie/' $(@D)/Setup
> > -endef
> > -
> > -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_SCRAP),y)
> > -define PYTHON_PYGAME_UNCONFIGURE_SCRAP
> > -     $(SED) 's/^scrap/#scrap/' $(@D)/Setup
> > -endef
> > -endif
> > -
> > -define PYTHON_PYGAME_UNCONFIGURE_FREETYPE
> > -     $(SED) 's/^_freetype/#_freetype/' $(@D)/Setup
> > -endef
> > -
> > -PYTHON_PYGAME_SDL_FLAGS =3D `$(STAGING_DIR)/usr/bin/sdl-config --cflag=
s`
> > -PYTHON_PYGAME_SDL_FLAGS +=3D `$(STAGING_DIR)/usr/bin/sdl-config --libs=
`
> > -
> > -# Pygame needs a Setup file where options should be commented out if
> > -# dependencies are not available
> > -define PYTHON_PYGAME_CONFIGURE_CMDS
> > -     cp -f $(@D)/Setup.in $(@D)/Setup
> > -     $(SED) "s~^SDL =3D ~SDL =3D $(PYTHON_PYGAME_SDL_FLAGS) \n#~"
> $(@D)/Setup
> > -     $(SED) 's/^pypm/#pypm/' $(@D)/Setup
> > -     $(PYTHON_PYGAME_UNCONFIGURE_IMAGE)
> > -     $(PYTHON_PYGAME_UNCONFIGURE_FONT)
> > -     $(PYTHON_PYGAME_UNCONFIGURE_MIXER)
> > -     $(PYTHON_PYGAME_UNCONFIGURE_SNDARRAY)
> > -     $(PYTHON_PYGAME_UNCONFIGURE_SURFARRAY)
> > -     $(PYTHON_PYGAME_UNCONFIGURE_MOVIE)
> > -     $(PYTHON_PYGAME_UNCONFIGURE_SCRAP)
> > -     $(PYTHON_PYGAME_UNCONFIGURE_FREETYPE)
> > -endef
> > -
> > -define PYTHON_PYGAME_REMOVE_DOC
> > -     rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/docs
> > -endef
> > -
> > -PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS +=3D PYTHON_PYGAME_REMOVE_DOC
> > -
> > -define PYTHON_PYGAME_REMOVE_TESTS
> > -     rm -rf $(TARGET_DIR)/usr/lib/python*/site-packages/pygame/tests
> > -endef
> > -
> > -PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS +=3D PYTHON_PYGAME_REMOVE_TEST=
S
> > -
> > -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES),y)
> > -define PYTHON_PYGAME_REMOVE_EXAMPLES
> > -     rm -rf
> $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERSION_MAJOR)/site-packages/pygame=
/examples
> > -endef
> > -PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS +=3D PYTHON_PYGAME_REMOVE_EXAM=
PLES
> > -endif
> > -
> > -$(eval $(python-package))
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

--000000000000b11d400609c00c0f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Yann;<div><br></div><div>Did you test python-pygame =
with setuptools against python 3.12.0?</div><div><br></div><div>I receive t=
he following error:</div><div><br></div><div>src/surface.c:2812:14: error: =
invalid type argument of unary =E2=80=98*=E2=80=99 (have =E2=80=98int=E2=80=
=99)<br>=C2=A02812 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 ch =3D *PyUnicode_AS_UNICO=
DE (obj);<br>=C2=A0 =C2=A0 =C2=A0 | =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~~~~~<br>src/surface.c: In function =E2=80=
=98PySurface_Blit=E2=80=99:<br></div><div><br></div><div><br></div><div>Tha=
nks!</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signa=
ture" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"l=
tr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0p=
t"><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,=
0,0);background-color:transparent;vertical-align:baseline;white-space:pre-w=
rap">Adam Duskett</span></p><p dir=3D"ltr" style=3D"line-height:1.799999999=
9999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;fon=
t-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-colo=
r:transparent;vertical-align:baseline;white-space:pre-wrap">Senior Embedded=
 Systems Developer</span></p><p dir=3D"ltr" style=3D"line-height:1.79999999=
99999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;fo=
nt-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-col=
or:transparent;vertical-align:baseline;white-space:pre-wrap">M. +1208-515-8=
102</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin=
-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot=
;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;=
vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:adam.dusket=
t@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com=
</a></span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margi=
n-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quo=
t;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent=
;vertical-align:baseline;white-space:pre-wrap">____________________________=
______</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;mar=
gin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&q=
uot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transpare=
nt;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=3D"=
font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-co=
lor:transparent;vertical-align:baseline;white-space:pre-wrap">Amarula Solut=
ions BV</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;ma=
rgin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&=
quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transpar=
ent;vertical-align:baseline;white-space:pre-wrap">Joop Geesinkweg 125, 1114=
 AB, Amsterdam, NL</span></p><p dir=3D"ltr" style=3D"line-height:1.79999999=
99999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;fo=
nt-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-col=
or:transparent;vertical-align:baseline;white-space:pre-wrap">T. +31 (0)85 1=
11 9170</span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&q=
uot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align=
:baseline;white-space:pre-wrap"><br></span><span style=3D"font-size:10pt;fo=
nt-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-col=
or:transparent;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mai=
lto:info@amarulasolutions.com" target=3D"_blank">info@amarulasolutions.com<=
/a></span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin=
-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.com/" ta=
rget=3D"_blank"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono=
&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-ali=
gn:baseline;white-space:pre-wrap">www.amarulasolutions.com</span></a></p><d=
iv><br></div></span></div></div></div><br></div></div><br><div class=3D"gma=
il_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Thu, Nov 9, 2023 at 2:52=
=E2=80=AFPM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">ya=
nn.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Adam, All,<br>
<br>
On 2023-11-05 13:25 -0700, Adam Duskett spake thusly:<br>
&gt; The python-pygame package has not recieved any update since<br>
&gt; Sun May 1 22:15:17 2016 (commit: a9ec96e545102ae5ccd4280323d35360b0a50=
72d)<br>
&gt; As python 3.12.0 no longer supports distutils, drop the package as the=
 package<br>
&gt; is clearly unmaintained.<br>
&gt; <br>
&gt; If someone wants to re-introduce this package at a later date they are=
 more<br>
&gt; than welcome to do so!<br>
<br>
Thet got a respite, as I applied James patch to switch to setuptools<br>
instead of distutils:<br>
<br>
=C2=A0 =C2=A0 e759e927b344=C2=A0 package/python-pygame: switch from distuti=
ls to setuptools<br>
<br>
So, this patch that drops pyhon-pygame is no longer needed; I&#39;ve marked=
<br>
it rekected in patchwork.<br>
<br>
Thanks!<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Signed-off-by: Adam Duskett &lt;<a href=3D"mailto:adam.duskett@amarula=
solutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a>&gt;<=
br>
&gt; ---<br>
&gt; v1 -&gt; v2:<br>
&gt;=C2=A0 - Remove python-pygame from the DEVELOPERS file<br>
&gt;=C2=A0 - Don&#39;t remove python-pyxb from Config.in in this patch.<br>
&gt; <br>
&gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A01 =
-<br>
&gt;=C2=A0 package/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A01 -<br>
&gt;=C2=A0 package/python-pygame/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 |=C2=A0 50 ----------<br>
&gt;=C2=A0 package/python-pygame/python-pygame.hash |=C2=A0 =C2=A03 -<br>
&gt;=C2=A0 package/python-pygame/<a href=3D"http://python-pygame.mk" rel=3D=
"noreferrer" target=3D"_blank">python-pygame.mk</a>=C2=A0 =C2=A0| 111 -----=
------------------<br>
&gt;=C2=A0 5 files changed, 166 deletions(-)<br>
&gt;=C2=A0 delete mode 100644 package/python-pygame/Config.in<br>
&gt;=C2=A0 delete mode 100644 package/python-pygame/python-pygame.hash<br>
&gt;=C2=A0 delete mode 100644 package/python-pygame/<a href=3D"http://pytho=
n-pygame.mk" rel=3D"noreferrer" target=3D"_blank">python-pygame.mk</a><br>
&gt; <br>
&gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; index 3334cad77f..b890fb2586 100644<br>
&gt; --- a/DEVELOPERS<br>
&gt; +++ b/DEVELOPERS<br>
&gt; @@ -1687,7 +1687,6 @@ F:=C2=A0 =C2=A0 =C2=A0 package/libcddb/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/libmodbus/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/ltris/<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/opentyrian/<br>
&gt; -F:=C2=A0 =C2=A0package/python-pygame/<br>
&gt;=C2=A0 <br>
&gt;=C2=A0 N:=C2=A0 =C2=A0Julien Corjon &lt;<a href=3D"mailto:corjon.j@ecag=
roup.com" target=3D"_blank">corjon.j@ecagroup.com</a>&gt;<br>
&gt;=C2=A0 F:=C2=A0 =C2=A0package/qt5/<br>
&gt; diff --git a/package/Config.in b/package/Config.in<br>
&gt; index 32347fe4e8..19e5035878 100644<br>
&gt; --- a/package/Config.in<br>
&gt; +++ b/package/Config.in<br>
&gt; @@ -1228,7 +1228,6 @@ menu &quot;External python modules&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-pydyf/Config.in&=
quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-pyelftools/Confi=
g.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-pyftpdlib/Config=
.in&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0source &quot;package/python-pygame/Config.in&quot=
;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-pygments/Config.=
in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-pyhamcrest/Confi=
g.in&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0source &quot;package/python-pyicu/Config.in&=
quot;<br>
&gt; diff --git a/package/python-pygame/Config.in b/package/python-pygame/C=
onfig.in<br>
&gt; deleted file mode 100644<br>
&gt; index 57eb020742..0000000000<br>
&gt; --- a/package/python-pygame/Config.in<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,50 +0,0 @@<br>
&gt; -config BR2_PACKAGE_PYTHON_PYGAME<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bool &quot;python-pygame&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_SDL<br>
&gt; -=C2=A0 =C2=A0 =C2=A0help<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Pygame is a cross-platfrom library designe=
d to make it easy<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0to write multimedia software, such as game=
s, in<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Python. Pygame requires the Python languag=
e and SDL<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0multimedia library.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0It can also make use of several other popu=
lar libraries.<br>
&gt; -<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"http://www.pygame.org/" rel=3D"=
noreferrer" target=3D"_blank">http://www.pygame.org/</a><br>
&gt; -<br>
&gt; -if BR2_PACKAGE_PYTHON_PYGAME<br>
&gt; -config BR2_PACKAGE_PYTHON_PYGAME_IMAGE<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bool &quot;pygame.image&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_SDL_IMAGE<br>
&gt; -=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_SDL_IMAGE_PNG<br>
&gt; -=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_SDL_IMAGE_JPEG<br>
&gt; -=C2=A0 =C2=A0 =C2=A0help<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pygame module for loading, saving and tran=
sfering images.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Will autoselect sdl_image with png and jpe=
g support.<br>
&gt; -<br>
&gt; -config BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bool &quot;pygame.examples&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0help<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Include examples.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Selecting this option adds about 1.5 MB to=
 the target file<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0system.<br>
&gt; -<br>
&gt; -config BR2_PACKAGE_PYTHON_PYGAME_FONT<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bool &quot;pygame.font&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_SDL_TTF<br>
&gt; -=C2=A0 =C2=A0 =C2=A0help<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pygame module for loading and rendering fo=
nts.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Will autoselect sdl_ttf.<br>
&gt; -<br>
&gt; -config BR2_PACKAGE_PYTHON_PYGAME_MIXER<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bool &quot;pygame.mixer&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0select BR2_PACKAGE_SDL_MIXER<br>
&gt; -=C2=A0 =C2=A0 =C2=A0help<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pygame module for loading and playing soun=
ds.<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0Will autoselect sdl_mixer.<br>
&gt; -<br>
&gt; -config BR2_PACKAGE_PYTHON_PYGAME_SCRAP<br>
&gt; -=C2=A0 =C2=A0 =C2=A0bool &quot;pygame.scrap&quot;<br>
&gt; -=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_SDL_X11<br>
&gt; -=C2=A0 =C2=A0 =C2=A0help<br>
&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0pygame module for clipboard support (X11 n=
eeded)<br>
&gt; -<br>
&gt; -endif<br>
&gt; diff --git a/package/python-pygame/python-pygame.hash b/package/python=
-pygame/python-pygame.hash<br>
&gt; deleted file mode 100644<br>
&gt; index c0496515e2..0000000000<br>
&gt; --- a/package/python-pygame/python-pygame.hash<br>
&gt; +++ /dev/null<br>
&gt; @@ -1,3 +0,0 @@<br>
&gt; -# Locally computed<br>
&gt; -sha256=C2=A0 f95a7dd68ea294d415e36e068d2f533c5a01c67773452d14a535c5c7=
455681fe=C2=A0 pygame-d61ea8eabd56.tar.gz<br>
&gt; -sha256=C2=A0 a190dc9c8043755d90f8b0a75fa66b9e42d4af4c980bf5ddc633f012=
4db3cee7=C2=A0 LGPL<br>
&gt; diff --git a/package/python-pygame/<a href=3D"http://python-pygame.mk"=
 rel=3D"noreferrer" target=3D"_blank">python-pygame.mk</a> b/package/python=
-pygame/<a href=3D"http://python-pygame.mk" rel=3D"noreferrer" target=3D"_b=
lank">python-pygame.mk</a><br>
&gt; deleted file mode 100644<br>
&gt; index 600dd9e743..0000000000<br>
&gt; --- a/package/python-pygame/<a href=3D"http://python-pygame.mk" rel=3D=
"noreferrer" target=3D"_blank">python-pygame.mk</a><br>
&gt; +++ /dev/null<br>
&gt; @@ -1,111 +0,0 @@<br>
&gt; -#####################################################################=
###########<br>
&gt; -#<br>
&gt; -# python-pygame<br>
&gt; -#<br>
&gt; -#####################################################################=
###########<br>
&gt; -<br>
&gt; -# stable 1.9.1 release requires V4L which has been wiped out of recen=
t Linux<br>
&gt; -# kernels, so use latest mercurial revision until next stable release=
 is out.<br>
&gt; -PYTHON_PYGAME_VERSION =3D d61ea8eabd56<br>
&gt; -PYTHON_PYGAME_SOURCE =3D pygame-$(PYTHON_PYGAME_VERSION).tar.gz<br>
&gt; -PYTHON_PYGAME_SITE =3D <a href=3D"https://bitbucket.org/pygame/pygame=
" rel=3D"noreferrer" target=3D"_blank">https://bitbucket.org/pygame/pygame<=
/a><br>
&gt; -PYTHON_PYGAME_SITE_METHOD =3D hg<br>
&gt; -PYTHON_PYGAME_SETUP_TYPE =3D distutils<br>
&gt; -PYTHON_PYGAME_LICENSE =3D LGPL-2.1+<br>
&gt; -PYTHON_PYGAME_LICENSE_FILES =3D LGPL<br>
&gt; -<br>
&gt; -ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)<br>
&gt; -PYTHON_PYGAME_OPT_DEPENDS +=3D sdl_image<br>
&gt; -endif<br>
&gt; -<br>
&gt; -ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)<br>
&gt; -PYTHON_PYGAME_OPT_DEPENDS +=3D sdl_ttf<br>
&gt; -endif<br>
&gt; -<br>
&gt; -ifeq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)<br>
&gt; -PYTHON_PYGAME_OPT_DEPENDS +=3D sdl_mixer<br>
&gt; -endif<br>
&gt; -<br>
&gt; -PYTHON_PYGAME_DEPENDENCIES =3D sdl $(PYTHON_PYGAME_OPT_DEPENDS)<br>
&gt; -<br>
&gt; -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_IMAGE),y)<br>
&gt; -define PYTHON_PYGAME_UNCONFIGURE_IMAGE<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(SED) &#39;s/^imageext/#imageext/&#39; $(@D)/Set=
up<br>
&gt; -endef<br>
&gt; -endif<br>
&gt; -<br>
&gt; -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_FONT),y)<br>
&gt; -define PYTHON_PYGAME_UNCONFIGURE_FONT<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(SED) &#39;s/^font/#font/&#39; $(@D)/Setup<br>
&gt; -endef<br>
&gt; -endif<br>
&gt; -<br>
&gt; -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_MIXER),y)<br>
&gt; -define PYTHON_PYGAME_UNCONFIGURE_MIXER<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(SED) &#39;s/^mixer/#mixer/g&#39; $(@D)/Setup<br=
>
&gt; -endef<br>
&gt; -endif<br>
&gt; -<br>
&gt; -# Both require numpy or numeric python module<br>
&gt; -define PYTHON_PYGAME_UNCONFIGURE_SNDARRAY<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(SED) &#39;s/^_numericsndarray/#_numericsndarray=
/&#39; $(@D)/Setup<br>
&gt; -endef<br>
&gt; -<br>
&gt; -define PYTHON_PYGAME_UNCONFIGURE_SURFARRAY<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(SED) &#39;s/^_numericsurfarray/#_numericsurfarr=
ay/&#39; $(@D)/Setup<br>
&gt; -endef<br>
&gt; -<br>
&gt; -# Requires smpeg<br>
&gt; -define PYTHON_PYGAME_UNCONFIGURE_MOVIE<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(SED) &#39;s/^movie/#movie/&#39; $(@D)/Setup<br>
&gt; -endef<br>
&gt; -<br>
&gt; -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_SCRAP),y)<br>
&gt; -define PYTHON_PYGAME_UNCONFIGURE_SCRAP<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(SED) &#39;s/^scrap/#scrap/&#39; $(@D)/Setup<br>
&gt; -endef<br>
&gt; -endif<br>
&gt; -<br>
&gt; -define PYTHON_PYGAME_UNCONFIGURE_FREETYPE<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(SED) &#39;s/^_freetype/#_freetype/&#39; $(@D)/S=
etup<br>
&gt; -endef<br>
&gt; -<br>
&gt; -PYTHON_PYGAME_SDL_FLAGS =3D `$(STAGING_DIR)/usr/bin/sdl-config --cfla=
gs`<br>
&gt; -PYTHON_PYGAME_SDL_FLAGS +=3D `$(STAGING_DIR)/usr/bin/sdl-config --lib=
s`<br>
&gt; -<br>
&gt; -# Pygame needs a Setup file where options should be commented out if<=
br>
&gt; -# dependencies are not available<br>
&gt; -define PYTHON_PYGAME_CONFIGURE_CMDS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0cp -f $(@D)/Setup.in $(@D)/Setup<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(SED) &quot;s~^SDL =3D ~SDL =3D $(PYTHON_PYGAME_=
SDL_FLAGS) \n#~&quot; $(@D)/Setup<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(SED) &#39;s/^pypm/#pypm/&#39; $(@D)/Setup<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(PYTHON_PYGAME_UNCONFIGURE_IMAGE)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(PYTHON_PYGAME_UNCONFIGURE_FONT)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(PYTHON_PYGAME_UNCONFIGURE_MIXER)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(PYTHON_PYGAME_UNCONFIGURE_SNDARRAY)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(PYTHON_PYGAME_UNCONFIGURE_SURFARRAY)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(PYTHON_PYGAME_UNCONFIGURE_MOVIE)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(PYTHON_PYGAME_UNCONFIGURE_SCRAP)<br>
&gt; -=C2=A0 =C2=A0 =C2=A0$(PYTHON_PYGAME_UNCONFIGURE_FREETYPE)<br>
&gt; -endef<br>
&gt; -<br>
&gt; -define PYTHON_PYGAME_REMOVE_DOC<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -rf $(TARGET_DIR)/usr/lib/python*/site-package=
s/pygame/docs<br>
&gt; -endef<br>
&gt; -<br>
&gt; -PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS +=3D PYTHON_PYGAME_REMOVE_DOC=
<br>
&gt; -<br>
&gt; -define PYTHON_PYGAME_REMOVE_TESTS<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -rf $(TARGET_DIR)/usr/lib/python*/site-package=
s/pygame/tests<br>
&gt; -endef<br>
&gt; -<br>
&gt; -PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS +=3D PYTHON_PYGAME_REMOVE_TES=
TS<br>
&gt; -<br>
&gt; -ifneq ($(BR2_PACKAGE_PYTHON_PYGAME_EXAMPLES),y)<br>
&gt; -define PYTHON_PYGAME_REMOVE_EXAMPLES<br>
&gt; -=C2=A0 =C2=A0 =C2=A0rm -rf $(TARGET_DIR)/usr/lib/python$(PYTHON3_VERS=
ION_MAJOR)/site-packages/pygame/examples<br>
&gt; -endef<br>
&gt; -PYTHON_PYGAME_POST_INSTALL_TARGET_HOOKS +=3D PYTHON_PYGAME_REMOVE_EXA=
MPLES<br>
&gt; -endif<br>
&gt; -<br>
&gt; -$(eval $(python-package))<br>
&gt; -- <br>
&gt; 2.41.0<br>
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
</blockquote></div>

--000000000000b11d400609c00c0f--

--===============7728169754194102626==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7728169754194102626==--
