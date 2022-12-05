Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C842C4321E
	for <buildroot@archiver.kernel.org>; Mon,  5 Dec 2022 10:14:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C58E040120;
	Mon,  5 Dec 2022 10:14:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C58E040120
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6iRG2PhLN42J; Mon,  5 Dec 2022 10:14:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4872F4050C;
	Mon,  5 Dec 2022 10:14:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4872F4050C
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4F4F61BF577
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 10:14:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2ABE88149C
 for <buildroot@lists.busybox.net>; Mon,  5 Dec 2022 10:14:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2ABE88149C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OPzb2EGN6mu6 for <buildroot@lists.busybox.net>;
 Mon,  5 Dec 2022 10:14:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 76CE08149A
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com
 [IPv6:2607:f8b0:4864:20::230])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 76CE08149A
 for <buildroot@buildroot.org>; Mon,  5 Dec 2022 10:14:06 +0000 (UTC)
Received: by mail-oi1-x230.google.com with SMTP id r11so6755892oie.13
 for <buildroot@buildroot.org>; Mon, 05 Dec 2022 02:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sl3vcDaIK9STIJppkwFw7cF3E1tbO0700eqnKHWwGfg=;
 b=YEvSI9Ox7H5wmtekNaFBx8LTzzDwsHsDHFvKhCiBpozPslKWhCzSlKwRoOL0O42eON
 HWkvJef7JPnX1TDzchPXG9+HBJ/4tSRnA0TgPifq06BPRkWHbetDIYeuljGYMWazxFnT
 ExWIYrBpD57R8Q482Fn0YB0ORboP0lN2X6273f3gUdIDG0CwFkamvUZzguGFPkVLytjO
 wO2HvH4cxUkeoL/I8SLS3reEArBbx32lI2sVdn+dd8gxNw6IZlo8b8Dm/xb8B5BHGdhp
 eIHhO9U9eD5UyvqIO+c/w6m9CiEbPrgJ4ys2tgARisybPNHzrDhALXiUEYooyIYArS3e
 r7LA==
X-Gm-Message-State: ANoB5pmsB6A18xU6c4ULW7HFwhRQkcO24WqksO9q/UZP+wIiKfHiCc9p
 JnmIKJ3QQiZnn+EQQowDJ6CQYrz2fTKe84c0Am+VDw==
X-Google-Smtp-Source: AA0mqf7F8fGdb1VL0qs35uWYaTw1uqETyfiG+5UqJB4ImWg8py6Wg2Flm6/30f/rjPNtjQozsFsldzWPkoK4/6D172k=
X-Received: by 2002:aca:c108:0:b0:354:946b:f72f with SMTP id
 r8-20020acac108000000b00354946bf72fmr33176459oif.48.1670235245364; Mon, 05
 Dec 2022 02:14:05 -0800 (PST)
MIME-Version: 1.0
References: <20221013121041.1398841-1-jesseevg@gmail.com>
 <20221204203528.GF2855@scaer>
 <CAMdwsN81VOr9Q8i4Z8VaGu2K0_QjW7Vm7KzYPTiB2S-2ehc2eQ@mail.gmail.com>
In-Reply-To: <CAMdwsN81VOr9Q8i4Z8VaGu2K0_QjW7Vm7KzYPTiB2S-2ehc2eQ@mail.gmail.com>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 5 Dec 2022 11:13:29 +0100
Message-ID: <CA+_SqVbMJMHg0XtwJ9jCNr+X4u8QoZ4=eGpOMfzHcHaE2hwXsA@mail.gmail.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=sl3vcDaIK9STIJppkwFw7cF3E1tbO0700eqnKHWwGfg=;
 b=eKqFSy+A8YwjWEX5yuW3ybg0MZyyjiA9G8ZI95MXHo8XKlrd1t4C//coCpStTPEuFc
 vls4Mh1/D7BpWW6OuJ65sm11qn05aCNgUcSlJLTdiTolvlgrv9hVZdU/4Ay8OJLobC0F
 5axZOVDGYZGdjF3/n08XUOGkS5+0PPtqiWaDU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=eKqFSy+A
Subject: Re: [Buildroot] [PATCH v2 1/1] package/qt6: Change license hashes
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7042633654431025837=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7042633654431025837==
Content-Type: multipart/alternative; boundary="0000000000007dea8c05ef11f272"

--0000000000007dea8c05ef11f272
Content-Type: text/plain; charset="UTF-8"

On Mon, Dec 5, 2022 at 11:01 AM Jesse Van Gavere <jesseevg@gmail.com> wrote:

> Op zo 4 dec. 2022 om 21:35 schreef Yann E. MORIN <yann.morin.1998@free.fr
> >:
> >
> > Jesse, All,
> >
> > On 2022-10-13 14:10 +0200, Jesse Van Gavere spake thusly:
> > > There was a major rework of how licenses are used in the Qt codebase
> > > along with a new location for all licenses, so change the hash file to
> > > reflect these changes
> > >
> https://github.com/qt/qtserialport/commit/bb05a26d52c834cc7f3c549f3e5d66f76baf42a2
> > >
> > > Changes for v2:
> > >  - Also adjust the makefiles to refer to these new license file names
> > >  - Added myself to the developers for the qt6 package for good measure
> > >
> > > Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
> >
> > Again, sorry that I missed that patch of yours, I applied Fabrice's
> > patches instead.
> >
> > Still, I applied the part adding yourself to DEVELOPERS for the qt6
> > package.
> >
> > Thank you!
> >
> > Regards,
> > Yann E. MORIN.
> >
>
> Hello Yann, all,
>
> No problem at all, those things happen.
> But on a similar note, would it be possible for my other outstanding
> patches to  get a look?
>
> http://patchwork.ozlabs.org/project/buildroot/list/?series=&submitter=84716&state=&q=&archive=&delegate=
> I'm currently holding off from committing more qt related
> patches/functionality until it's a bit more baselined,  most of that
> is still in my initial extending Qt6 patch set.
> Or if there's anything I can do to help the process here, let me know.
>

I'll do a test review as soon as possible!

Thanks!
>
> Regards,
> Jesse
>
> > > ---
> > >  DEVELOPERS                                   |  1 +
> > >  package/qt6/qt6base/qt6base.hash             | 15 ++++++++++-----
> > >  package/qt6/qt6base/qt6base.mk               |  4 ++--
> > >  package/qt6/qt6serialport/qt6serialport.hash | 12 +++++++-----
> > >  package/qt6/qt6serialport/qt6serialport.mk   |  4 ++--
> > >  5 files changed, 22 insertions(+), 14 deletions(-)
> > >
> > > diff --git a/DEVELOPERS b/DEVELOPERS
> > > index 59121c6a54..6cb8d0fc54 100644
> > > --- a/DEVELOPERS
> > > +++ b/DEVELOPERS
> > > @@ -1478,6 +1478,7 @@ F:      package/x11r7/xdriver_xf86-video-imx/
> > >  F:   package/x11r7/xdriver_xf86-video-imx-viv/
> > >
> > >  N:   Jesse Van Gavere <jesseevg@gmail.com>
> > > +F:   package/qt6/
> > >  F:   package/qt6/qt6serialport/
> > >
> > >  N:   Jianhui Zhao <zhaojh329@gmail.com>
> > > diff --git a/package/qt6/qt6base/qt6base.hash
> b/package/qt6/qt6base/qt6base.hash
> > > index 5dd26973fa..b004347a5a 100644
> > > --- a/package/qt6/qt6base/qt6base.hash
> > > +++ b/package/qt6/qt6base/qt6base.hash
> > > @@ -2,8 +2,13 @@
> > >  sha256
> cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55db75b22b94ead9b37d
> qtbase-everywhere-src-6.4.0.tar.xz
> > >
> > >  # Hashes for license files
> > > -sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSE.GPL2
> > > -sha256
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSE.GPL3
> > > -sha256
> 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652
> LICENSE.GPL3-EXCEPT
> > > -sha256
> da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSE.LGPL3
> > > -sha256
> 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSE.FDL
> > > +sha256
> e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afbbf5ff9e1c89cb
> LICENSES/Apache-2.0.txt
> > > +sha256
> 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> > > +sha256
> 3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d476935a6b049653f5
> LICENSES/BSL-1.0.txt
> > > +sha256
> 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/GFDL-1.3-no-invariants-only.txt
> > > +sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSES/GPL-2.0-only.txt
> > > +sha256
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/GPL-3.0-only.txt
> > > +sha256
> da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSES/LGPL-3.0-only.txt
> > > +sha256
> 9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700
> LICENSES/LicenseRef-Qt-Commercial.txt
> > > +sha256
> d040359701c01996a017d5c515678929cd1b0625e64cb86db44025fbb6cdf1fc
> LICENSES/MIT.txt
> > > +sha256
> 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
> > > diff --git a/package/qt6/qt6base/qt6base.mk b/package/qt6/qt6base/
> qt6base.mk
> > > index b7ee6037f3..b53d53c653 100644
> > > --- a/package/qt6/qt6base/qt6base.mk
> > > +++ b/package/qt6/qt6base/qt6base.mk
> > > @@ -7,8 +7,8 @@
> > >  QT6BASE_VERSION = $(QT6_VERSION)
> > >  QT6BASE_SITE = $(QT6_SITE)
> > >  QT6BASE_SOURCE =
> qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6BASE_VERSION).tar.xz
> > > -QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception
> (tools), GFDL-1.3 (docs)
> > > -QT6BASE_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3-EXCEPT
> LICENSE.LGPL3 LICENSE.FDL
> > > +QT6BASE_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception
> (tools), GFDL-1.3 no invariants (docs)
> > > +QT6BASE_LICENSE_FILES = LICENSES/GPL-2.0-only.txt
> LICENSES/GPL-3.0-only.txt LICENSES/Qt-GPL-exception-1.0.txt
> LICENSES/LGPL-3.0-only.txt LICENSES/GFDL-1.3-no-invariants-only.txt
> > >  QT6BASE_DEPENDENCIES = \
> > >       host-ninja \
> > >       host-qt6base \
> > > diff --git a/package/qt6/qt6serialport/qt6serialport.hash
> b/package/qt6/qt6serialport/qt6serialport.hash
> > > index fb1b3dcf6b..887f67b2ae 100644
> > > --- a/package/qt6/qt6serialport/qt6serialport.hash
> > > +++ b/package/qt6/qt6serialport/qt6serialport.hash
> > > @@ -2,8 +2,10 @@
> > >  sha256
> f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa43b91bac614f4a4483
> qtserialport-everywhere-src-6.4.0.tar.xz
> > >
> > >  # Hashes for license files:
> > > -sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSE.GPL2
> > > -sha256
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSE.GPL3
> > > -sha256
> 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d96cb819dd5652
> LICENSE.GPL3-EXCEPT
> > > -sha256
> da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSE.LGPL3
> > > -sha256
> ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f2a4e1892f6c0d
> LICENSE.FDL
> > > +sha256
> 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce43abb42ed1dcce
> LICENSES/BSD-3-Clause.txt
> > > +sha256
> 110535522396708cea37c72a802c5e7e81391139f5f7985631c93ef242b206a4
> LICENSES/GFDL-1.3-no-invariants-only.txt
> > > +sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643
> LICENSES/GPL-2.0-only.txt
> > > +sha256
> 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903
> LICENSES/GPL-3.0-only.txt
> > > +sha256
> da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768
> LICENSES/LGPL-3.0-only.txt
> > > +sha256
> 9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151fe5d3f18a4700
> LICENSES/LicenseRef-Qt-Commercial.txt
> > > +sha256
> 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c462b0530846b2
> LICENSES/Qt-GPL-exception-1.0.txt
> > > diff --git a/package/qt6/qt6serialport/qt6serialport.mk
> b/package/qt6/qt6serialport/qt6serialport.mk
> > > index 01763657b8..03197fd60d 100644
> > > --- a/package/qt6/qt6serialport/qt6serialport.mk
> > > +++ b/package/qt6/qt6serialport/qt6serialport.mk
> > > @@ -9,8 +9,8 @@ QT6SERIALPORT_SITE = $(QT6_SITE)
> > >  QT6SERIALPORT_SOURCE =
> qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz
> > >  QT6SERIALPORT_INSTALL_STAGING = YES
> > >  QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD = NO
> > > -QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception
> (tools), GFDL-1.3 (docs)
> > > -QT6SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3
> LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
> > > +QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception
> (tools), GFDL-1.3 no invariants (docs)
> > > +QT6SERIALPORT_LICENSE_FILES = LICENSES/GPL-2.0-only.txt
> LICENSES/GPL-3.0-only.txt LICENSES/Qt-GPL-exception-1.0.txt
> LICENSES/LGPL-3.0-only.txt LICENSES/GFDL-1.3-no-invariants-only.txt
> > >  QT6SERIALPORT_CONF_OPTS = \
> > >       -GNinja \
> > >       -DQT_HOST_PATH=$(HOST_DIR) \
> > > --
> > > 2.34.1
> > >
> > > _______________________________________________
> > > buildroot mailing list
> > > buildroot@buildroot.org
> > > https://lists.buildroot.org/mailman/listinfo/buildroot
> >
> > --
> >
> .-----------------.--------------------.------------------.--------------------.
> > |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> > | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>        |
> > | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There
> is no  |
> > | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
> >
> '------------------------------^-------^------------------^--------------------'
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>


-- 

Angelo Compagnucci

Software Engineer

angelo@amarulasolutions.com
__________________________________
Amarula Solutions SRL

Via le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 (0)42 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
[`as] https://www.amarulasolutions.com|

--0000000000007dea8c05ef11f272
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Dec 5, 2022 at 11:01 AM Jesse=
 Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com">jesseevg@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Op =
zo 4 dec. 2022 om 21:35 schreef Yann E. MORIN &lt;<a href=3D"mailto:yann.mo=
rin.1998@free.fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt;:<br>
&gt;<br>
&gt; Jesse, All,<br>
&gt;<br>
&gt; On 2022-10-13 14:10 +0200, Jesse Van Gavere spake thusly:<br>
&gt; &gt; There was a major rework of how licenses are used in the Qt codeb=
ase<br>
&gt; &gt; along with a new location for all licenses, so change the hash fi=
le to<br>
&gt; &gt; reflect these changes<br>
&gt; &gt; <a href=3D"https://github.com/qt/qtserialport/commit/bb05a26d52c8=
34cc7f3c549f3e5d66f76baf42a2" rel=3D"noreferrer" target=3D"_blank">https://=
github.com/qt/qtserialport/commit/bb05a26d52c834cc7f3c549f3e5d66f76baf42a2<=
/a><br>
&gt; &gt;<br>
&gt; &gt; Changes for v2:<br>
&gt; &gt;=C2=A0 - Also adjust the makefiles to refer to these new license f=
ile names<br>
&gt; &gt;=C2=A0 - Added myself to the developers for the qt6 package for go=
od measure<br>
&gt; &gt;<br>
&gt; &gt; Signed-off-by: Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gm=
ail.com" target=3D"_blank">jesseevg@gmail.com</a>&gt;<br>
&gt;<br>
&gt; Again, sorry that I missed that patch of yours, I applied Fabrice&#39;=
s<br>
&gt; patches instead.<br>
&gt;<br>
&gt; Still, I applied the part adding yourself to DEVELOPERS for the qt6<br=
>
&gt; package.<br>
&gt;<br>
&gt; Thank you!<br>
&gt;<br>
&gt; Regards,<br>
&gt; Yann E. MORIN.<br>
&gt;<br>
<br>
Hello Yann, all,<br>
<br>
No problem at all, those things happen.<br>
But on a similar note, would it be possible for my other outstanding<br>
patches to=C2=A0 get a look?<br>
<a href=3D"http://patchwork.ozlabs.org/project/buildroot/list/?series=3D&am=
p;submitter=3D84716&amp;state=3D&amp;q=3D&amp;archive=3D&amp;delegate=3D" r=
el=3D"noreferrer" target=3D"_blank">http://patchwork.ozlabs.org/project/bui=
ldroot/list/?series=3D&amp;submitter=3D84716&amp;state=3D&amp;q=3D&amp;arch=
ive=3D&amp;delegate=3D</a><br>
I&#39;m currently holding off from committing more qt related<br>
patches/functionality until it&#39;s a bit more baselined,=C2=A0 most of th=
at<br>
is still in my initial extending Qt6 patch set.<br>
Or if there&#39;s anything I can do to help the process here, let me know.<=
br></blockquote><div><br></div><div>I&#39;ll do a test review as soon as po=
ssible!</div><div> <br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">
Thanks!<br>
<br>
Regards,<br>
Jesse<br>
<br>
&gt; &gt; ---<br>
&gt; &gt;=C2=A0 DEVELOPERS=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|=C2=A0 1 +<br>
&gt; &gt;=C2=A0 package/qt6/qt6base/qt6base.hash=C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0| 15 ++++++++++-----<br>
&gt; &gt;=C2=A0 package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"no=
referrer" target=3D"_blank">qt6base.mk</a>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 4 ++--<br>
&gt; &gt;=C2=A0 package/qt6/qt6serialport/qt6serialport.hash | 12 +++++++--=
---<br>
&gt; &gt;=C2=A0 package/qt6/qt6serialport/<a href=3D"http://qt6serialport.m=
k" rel=3D"noreferrer" target=3D"_blank">qt6serialport.mk</a>=C2=A0 =C2=A0|=
=C2=A0 4 ++--<br>
&gt; &gt;=C2=A0 5 files changed, 22 insertions(+), 14 deletions(-)<br>
&gt; &gt;<br>
&gt; &gt; diff --git a/DEVELOPERS b/DEVELOPERS<br>
&gt; &gt; index 59121c6a54..6cb8d0fc54 100644<br>
&gt; &gt; --- a/DEVELOPERS<br>
&gt; &gt; +++ b/DEVELOPERS<br>
&gt; &gt; @@ -1478,6 +1478,7 @@ F:=C2=A0 =C2=A0 =C2=A0 package/x11r7/xdrive=
r_xf86-video-imx/<br>
&gt; &gt;=C2=A0 F:=C2=A0 =C2=A0package/x11r7/xdriver_xf86-video-imx-viv/<br=
>
&gt; &gt;<br>
&gt; &gt;=C2=A0 N:=C2=A0 =C2=A0Jesse Van Gavere &lt;<a href=3D"mailto:jesse=
evg@gmail.com" target=3D"_blank">jesseevg@gmail.com</a>&gt;<br>
&gt; &gt; +F:=C2=A0 =C2=A0package/qt6/<br>
&gt; &gt;=C2=A0 F:=C2=A0 =C2=A0package/qt6/qt6serialport/<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 N:=C2=A0 =C2=A0Jianhui Zhao &lt;<a href=3D"mailto:zhaojh329=
@gmail.com" target=3D"_blank">zhaojh329@gmail.com</a>&gt;<br>
&gt; &gt; diff --git a/package/qt6/qt6base/qt6base.hash b/package/qt6/qt6ba=
se/qt6base.hash<br>
&gt; &gt; index 5dd26973fa..b004347a5a 100644<br>
&gt; &gt; --- a/package/qt6/qt6base/qt6base.hash<br>
&gt; &gt; +++ b/package/qt6/qt6base/qt6base.hash<br>
&gt; &gt; @@ -2,8 +2,13 @@<br>
&gt; &gt;=C2=A0 sha256=C2=A0 cb6475a0bd8567c49f7ffbb072a05516ee6671171bed55=
db75b22b94ead9b37d=C2=A0 qtbase-everywhere-src-6.4.0.tar.xz<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # Hashes for license files<br>
&gt; &gt; -sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404=
010521b880643=C2=A0 LICENSE.GPL2<br>
&gt; &gt; -sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c=
7c545eb65b903=C2=A0 LICENSE.GPL3<br>
&gt; &gt; -sha256=C2=A0 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d=
96cb819dd5652=C2=A0 LICENSE.GPL3-EXCEPT<br>
&gt; &gt; -sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b0=
37520b4464768=C2=A0 LICENSE.LGPL3<br>
&gt; &gt; -sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c=
93ef242b206a4=C2=A0 LICENSE.FDL<br>
&gt; &gt; +sha256=C2=A0 e3ba223bb1423f0aad8c3dfce0fe3148db48926d41e6fbc3afb=
bf5ff9e1c89cb=C2=A0 LICENSES/Apache-2.0.txt<br>
&gt; &gt; +sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce4=
3abb42ed1dcce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
&gt; &gt; +sha256=C2=A0 3abd6471b9a9a08d65ce771143f8e278bb4c1aeb10c1c2d4769=
35a6b049653f5=C2=A0 LICENSES/BSL-1.0.txt<br>
&gt; &gt; +sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c=
93ef242b206a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
&gt; &gt; +sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404=
010521b880643=C2=A0 LICENSES/GPL-2.0-only.txt<br>
&gt; &gt; +sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c=
7c545eb65b903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
&gt; &gt; +sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b0=
37520b4464768=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
&gt; &gt; +sha256=C2=A0 9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151=
fe5d3f18a4700=C2=A0 LICENSES/LicenseRef-Qt-Commercial.txt<br>
&gt; &gt; +sha256=C2=A0 d040359701c01996a017d5c515678929cd1b0625e64cb86db44=
025fbb6cdf1fc=C2=A0 LICENSES/MIT.txt<br>
&gt; &gt; +sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c=
462b0530846b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
&gt; &gt; diff --git a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" re=
l=3D"noreferrer" target=3D"_blank">qt6base.mk</a> b/package/qt6/qt6base/<a =
href=3D"http://qt6base.mk" rel=3D"noreferrer" target=3D"_blank">qt6base.mk<=
/a><br>
&gt; &gt; index b7ee6037f3..b53d53c653 100644<br>
&gt; &gt; --- a/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"no=
referrer" target=3D"_blank">qt6base.mk</a><br>
&gt; &gt; +++ b/package/qt6/qt6base/<a href=3D"http://qt6base.mk" rel=3D"no=
referrer" target=3D"_blank">qt6base.mk</a><br>
&gt; &gt; @@ -7,8 +7,8 @@<br>
&gt; &gt;=C2=A0 QT6BASE_VERSION =3D $(QT6_VERSION)<br>
&gt; &gt;=C2=A0 QT6BASE_SITE =3D $(QT6_SITE)<br>
&gt; &gt;=C2=A0 QT6BASE_SOURCE =3D qtbase-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT=
6BASE_VERSION).tar.xz<br>
&gt; &gt; -QT6BASE_LICENSE =3D GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception=
 (tools), GFDL-1.3 (docs)<br>
&gt; &gt; -QT6BASE_LICENSE_FILES =3D LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL3=
-EXCEPT LICENSE.LGPL3 LICENSE.FDL<br>
&gt; &gt; +QT6BASE_LICENSE =3D GPL-2.0+ or LGPL-3.0, GPL-3.0 with exception=
 (tools), GFDL-1.3 no invariants (docs)<br>
&gt; &gt; +QT6BASE_LICENSE_FILES =3D LICENSES/GPL-2.0-only.txt LICENSES/GPL=
-3.0-only.txt LICENSES/Qt-GPL-exception-1.0.txt LICENSES/LGPL-3.0-only.txt =
LICENSES/GFDL-1.3-no-invariants-only.txt<br>
&gt; &gt;=C2=A0 QT6BASE_DEPENDENCIES =3D \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-ninja \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0host-qt6base \<br>
&gt; &gt; diff --git a/package/qt6/qt6serialport/qt6serialport.hash b/packa=
ge/qt6/qt6serialport/qt6serialport.hash<br>
&gt; &gt; index fb1b3dcf6b..887f67b2ae 100644<br>
&gt; &gt; --- a/package/qt6/qt6serialport/qt6serialport.hash<br>
&gt; &gt; +++ b/package/qt6/qt6serialport/qt6serialport.hash<br>
&gt; &gt; @@ -2,8 +2,10 @@<br>
&gt; &gt;=C2=A0 sha256=C2=A0 f148cc9e87ce2228e82bff7a64d9521339ece66c4c66aa=
43b91bac614f4a4483=C2=A0 qtserialport-everywhere-src-6.4.0.tar.xz<br>
&gt; &gt;<br>
&gt; &gt;=C2=A0 # Hashes for license files:<br>
&gt; &gt; -sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404=
010521b880643=C2=A0 LICENSE.GPL2<br>
&gt; &gt; -sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c=
7c545eb65b903=C2=A0 LICENSE.GPL3<br>
&gt; &gt; -sha256=C2=A0 0dbe024961f6ab5c52689cbd036c977975d0d0f6a67ff97762d=
96cb819dd5652=C2=A0 LICENSE.GPL3-EXCEPT<br>
&gt; &gt; -sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b0=
37520b4464768=C2=A0 LICENSE.LGPL3<br>
&gt; &gt; -sha256=C2=A0 ed8742a95cb9db653a09b050e27ccff5e67ba69c14aa2c3137f=
2a4e1892f6c0d=C2=A0 LICENSE.FDL<br>
&gt; &gt; +sha256=C2=A0 9f0490f18656c6f2435bd14f603ef0c96434d1825615363dce4=
3abb42ed1dcce=C2=A0 LICENSES/BSD-3-Clause.txt<br>
&gt; &gt; +sha256=C2=A0 110535522396708cea37c72a802c5e7e81391139f5f7985631c=
93ef242b206a4=C2=A0 LICENSES/GFDL-1.3-no-invariants-only.txt<br>
&gt; &gt; +sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404=
010521b880643=C2=A0 LICENSES/GPL-2.0-only.txt<br>
&gt; &gt; +sha256=C2=A0 8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c=
7c545eb65b903=C2=A0 LICENSES/GPL-3.0-only.txt<br>
&gt; &gt; +sha256=C2=A0 da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b0=
37520b4464768=C2=A0 LICENSES/LGPL-3.0-only.txt<br>
&gt; &gt; +sha256=C2=A0 9b1f50aae6267f9d5e0ceb6775ee86450262c25ec7c0573e151=
fe5d3f18a4700=C2=A0 LICENSES/LicenseRef-Qt-Commercial.txt<br>
&gt; &gt; +sha256=C2=A0 40678d338ce53cd93f8b22b281a2ecbcaa3ee65ce60b25ffb0c=
462b0530846b2=C2=A0 LICENSES/Qt-GPL-exception-1.0.txt<br>
&gt; &gt; diff --git a/package/qt6/qt6serialport/<a href=3D"http://qt6seria=
lport.mk" rel=3D"noreferrer" target=3D"_blank">qt6serialport.mk</a> b/packa=
ge/qt6/qt6serialport/<a href=3D"http://qt6serialport.mk" rel=3D"noreferrer"=
 target=3D"_blank">qt6serialport.mk</a><br>
&gt; &gt; index 01763657b8..03197fd60d 100644<br>
&gt; &gt; --- a/package/qt6/qt6serialport/<a href=3D"http://qt6serialport.m=
k" rel=3D"noreferrer" target=3D"_blank">qt6serialport.mk</a><br>
&gt; &gt; +++ b/package/qt6/qt6serialport/<a href=3D"http://qt6serialport.m=
k" rel=3D"noreferrer" target=3D"_blank">qt6serialport.mk</a><br>
&gt; &gt; @@ -9,8 +9,8 @@ QT6SERIALPORT_SITE =3D $(QT6_SITE)<br>
&gt; &gt;=C2=A0 QT6SERIALPORT_SOURCE =3D qtserialport-$(QT6_SOURCE_TARBALL_=
PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz<br>
&gt; &gt;=C2=A0 QT6SERIALPORT_INSTALL_STAGING =3D YES<br>
&gt; &gt;=C2=A0 QT6SERIALPORT_SUPPORTS_IN_SOURCE_BUILD =3D NO<br>
&gt; &gt; -QT6SERIALPORT_LICENSE =3D GPL-2.0+ or LGPL-3.0, GPL-3.0 with exc=
eption (tools), GFDL-1.3 (docs)<br>
&gt; &gt; -QT6SERIALPORT_LICENSE_FILES =3D LICENSE.GPL2 LICENSE.GPL3 LICENS=
E.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL<br>
&gt; &gt; +QT6SERIALPORT_LICENSE =3D GPL-2.0+ or LGPL-3.0, GPL-3.0 with exc=
eption (tools), GFDL-1.3 no invariants (docs)<br>
&gt; &gt; +QT6SERIALPORT_LICENSE_FILES =3D LICENSES/GPL-2.0-only.txt LICENS=
ES/GPL-3.0-only.txt LICENSES/Qt-GPL-exception-1.0.txt LICENSES/LGPL-3.0-onl=
y.txt LICENSES/GFDL-1.3-no-invariants-only.txt<br>
&gt; &gt;=C2=A0 QT6SERIALPORT_CONF_OPTS =3D \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-GNinja \<br>
&gt; &gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
&gt; &gt; --<br>
&gt; &gt; 2.34.1<br>
&gt; &gt;<br>
&gt; &gt; _______________________________________________<br>
&gt; &gt; buildroot mailing list<br>
&gt; &gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buil=
droot@buildroot.org</a><br>
&gt; &gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot=
" rel=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/=
listinfo/buildroot</a><br>
&gt;<br>
&gt; --<br>
&gt; .-----------------.--------------------.------------------.-----------=
---------.<br>
&gt; |=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBB=
ON | Erics&#39; conspiracy: |<br>
&gt; | +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=
=A0 =C2=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0|<br>
&gt; | +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =
=C2=A0 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
&gt; | <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer" target=
=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=A0 =
=C2=A0 |=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&gt; &#39;------------------------------^-------^------------------^-------=
-------------&#39;<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr" class=3D"g=
mail_signature"><div dir=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:11pt;font-family:=
Arial;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-st=
yle:normal;font-variant:normal;text-decoration:none;vertical-align:baseline=
;white-space:pre-wrap"></span><span style=3D"font-size:10pt;font-family:Ubu=
ntu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:50=
0;font-style:normal;font-variant:normal;text-decoration:none;vertical-align=
:baseline;white-space:pre-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr"=
 style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"=
font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,=
0);background-color:transparent;font-weight:400;font-style:normal;font-vari=
ant:normal;text-decoration:none;vertical-align:baseline;white-space:pre-wra=
p">Software Engineer</span></p><p dir=3D"ltr" style=3D"line-height:1.8;marg=
in-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&qu=
ot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparen=
t;font-weight:400;font-style:normal;font-variant:normal;text-decoration:non=
e;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:angelo@am=
arulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0=
<br></span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot=
;,monospace;color:rgb(241,194,50);background-color:transparent;font-weight:=
400;font-style:normal;font-variant:normal;text-decoration:none;vertical-ali=
gn:baseline;white-space:pre-wrap">__________________________________</span>=
<span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace=
;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-style:n=
ormal;font-variant:normal;text-decoration:none;vertical-align:baseline;whit=
e-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:Ubun=
tu,sans-serif;color:rgb(0,0,0);background-color:transparent;font-weight:500=
;font-style:normal;font-variant:normal;text-decoration:none;vertical-align:=
baseline;white-space:pre-wrap">Amarula Solutions SRL</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">Via le Canevare 30, 31100 Treviso, Veneto, IT</span></p><p dir=3D"lt=
r" style=3D"line-height:1.8;margin-top:0pt;margin-bottom:0pt"><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap">T. +39 (0)42 243 5310</span><span style=3D"font-size:10pt;font-famil=
y:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:trans=
parent;font-weight:400;font-style:normal;font-variant:normal;text-decoratio=
n:none;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
0,0,0);background-color:transparent;font-weight:400;font-style:normal;font-=
variant:normal;text-decoration:none;vertical-align:baseline;white-space:pre=
-wrap"><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@=
amarulasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.8;=
margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.co=
m/" style=3D"text-decoration:none" target=3D"_blank"><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap">www.=
amarulasolutions.com</span></a></p><div>[`as] <a href=3D"https://www.amarul=
asolutions.com" target=3D"_blank">https://www.amarulasolutions.com</a>|</di=
v></div></div></div>

--0000000000007dea8c05ef11f272--

--===============7042633654431025837==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7042633654431025837==--
