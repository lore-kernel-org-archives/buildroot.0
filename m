Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B94B7ECAAD5
	for <buildroot@archiver.kernel.org>; Fri,  2 Sep 2022 18:23:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 12ED060D80;
	Fri,  2 Sep 2022 18:23:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 12ED060D80
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wuJyYLpxwaT9; Fri,  2 Sep 2022 18:23:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 49C0960634;
	Fri,  2 Sep 2022 18:23:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 49C0960634
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9C42F1BF5DA
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 18:23:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1663E600BB
 for <buildroot@lists.busybox.net>; Fri,  2 Sep 2022 18:23:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1663E600BB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id W50O1CO3fRxU for <buildroot@lists.busybox.net>;
 Fri,  2 Sep 2022 18:23:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BAF4960D75
Received: from mail-oa1-x34.google.com (mail-oa1-x34.google.com
 [IPv6:2001:4860:4864:20::34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BAF4960D75
 for <buildroot@buildroot.org>; Fri,  2 Sep 2022 18:23:00 +0000 (UTC)
Received: by mail-oa1-x34.google.com with SMTP id
 586e51a60fabf-11f4e634072so6624527fac.13
 for <buildroot@buildroot.org>; Fri, 02 Sep 2022 11:23:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=LTZ0jrvFbyEoZUtRbtzlYAU4HMqfwd3tUJ2o04pdzPQ=;
 b=spEazbr/aRs64yNtK621r9GQAfMzCTltz00YcSIYaGI3RnYYgxq8jj5lO7Yr7haanr
 QfSLFuhfb+FKD4JpuLcD/paw4nGWY1uMT/fGjUG3LqXpq843Y2CgkbMf9wGXTebGKTxK
 Lbz6aKfdRdOW82KjIsWamxTr6M5JEiCBugFRx3nsmNqoGN5hkQqGs2/PeJt0ORsTaAJd
 BfsfJsQfsoxU8RCDTRdVNzndx3DIfSLudknQj2NipRG23CDV68+WX1YXJ2fElu2+OhuU
 8czuJReX5C0YL3Q/+lzT8ll2TDd36HcL9AEa5sqZVx7WsA92AHbna9KeSsG3c5MbILEv
 xHAA==
X-Gm-Message-State: ACgBeo07Xi+NpPQUQzq/fLN34GTi9YWzod9JuPV/Tby2c3BNB9Wl6wbd
 Ux1gYpLhCiKuAvwf441yMv+UbwssCOJ0IEx9S13H3A==
X-Google-Smtp-Source: AA6agR6ux+4TmqeNJhXFgpICYzaa695wAyeoXHe9N2hf/uWUsyGViogyWVSZZuqzpUoSfRpnNRpER4kTENnZVzXvMNE=
X-Received: by 2002:a05:6870:a925:b0:122:8314:b7a4 with SMTP id
 eq37-20020a056870a92500b001228314b7a4mr2916501oab.118.1662142979626; Fri, 02
 Sep 2022 11:22:59 -0700 (PDT)
MIME-Version: 1.0
References: <20220824192604.2549356-8-chris.dimich@boundarydevices.com>
 <20220824192604.2549356-9-chris.dimich@boundarydevices.com>
 <20220828151512.GD2569@scaer>
In-Reply-To: <20220828151512.GD2569@scaer>
From: Chris Dimich <chris.dimich@boundarydevices.com>
Date: Fri, 2 Sep 2022 11:22:49 -0700
Message-ID: <CALsU4Cf=jDO3NeBwQ8dQ72G-MOR19hWLahVfM-rX7pYKC0H5_Q@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=boundarydevices.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=LTZ0jrvFbyEoZUtRbtzlYAU4HMqfwd3tUJ2o04pdzPQ=;
 b=Gnud97MVQ/n/CNw6wausO9aIuoArMhyegZZnn/pPzVql6g/w3ACNEIjYQ5WIbsfsO4
 /sOtgdQQhlGLq7vzRTWgjJ+uavzK1OEtGpFHfchk2gFO2AFU9/A0PkDK4BcKdNjcw7gv
 RbprVjie61I/RoY85D/pc9J97PAWBg8XGkJ1E=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=boundarydevices.com
 header.i=@boundarydevices.com header.a=rsa-sha256 header.s=google
 header.b=Gnud97MV
Subject: Re: [Buildroot] [PATCH 2/7] package/weston: add
 BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL config
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
Cc: Gary Bisson <bisson.gary@gmail.com>,
 Refik Tuzakli <tuzakli.refik@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Romain Naour <romain.naour@gmail.com>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: multipart/mixed; boundary="===============2677217540962688005=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2677217540962688005==
Content-Type: multipart/alternative; boundary="000000000000dde99705e7b5d1a8"

--000000000000dde99705e7b5d1a8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

Okay, understood. This should be dropped if mainline removed it completely.

Thanks,

Chris Dimich
Boundary Devices, LLC
www.boundarydevices.com
7 Orchard Road, Suite 102*=EF=BD=9C*Lake Forest, CA 92630



On Sun, Aug 28, 2022 at 8:15 AM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Chris, All,
>
> On 2022-08-24 12:25 -0700, Chris Dimich spake thusly:
> > In the case of the vivante sdk, the deprecated-wl-shell option needs to
> > be enabled. Otherwise, apps using the sdk cannot run on weston/wayland.
>
> Note that this option has been entirely removed upstream in e6b8f5a5e40c
> (remove wl_shell), commited 2022-03-08, and present in tag 10.0.91,
> which means that the next release of weston will no longer have that
> option.
>
> I am a bit relunctant at adding this in Buildroot, because that means
> the vivante stuff will be broken when we bump weston, or we won't be
> able to bump weston.
>
> Besides, your series does not even make use of that new option; i.e.
> nothing selects BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL.
>
> So, I would prefer not to add that option at all, knowing that it will
> soon be removed.
>
> Regards,
> Yann E. MORIN.
>
> > Signed-off-by: Chris Dimich <chris.dimich@boundarydevices.com>
> > ---
> >  package/weston/Config.in | 7 +++++++
> >  package/weston/weston.mk | 4 ++++
> >  2 files changed, 11 insertions(+)
> >
> > diff --git a/package/weston/Config.in b/package/weston/Config.in
> > index 3b4e932b7d..c560c32b50 100644
> > --- a/package/weston/Config.in
> > +++ b/package/weston/Config.in
> > @@ -164,4 +164,11 @@ comment "demo clients needs an OpenGL ES provider,
> an OpenEGL-capable Wayland ba
> >               !BR2_USE_WCHAR || !BR2_PACKAGE_HAS_LIBGLES || \
> >               !BR2_PACKAGE_HAS_LIBEGL_WAYLAND ||
> !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
> >
> > +config BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL
> > +     bool "deprecated wl shell"
> > +     help
> > +       In the case of the vivante sdk, the deprecated-wl-shell option
> > +       needs to be enabled. Otherwise, apps using the sdk cannot
> > +       run on weston/wayland.
> > +
> >  endif
> > diff --git a/package/weston/weston.mk b/package/weston/weston.mk
> > index e6c54ee7aa..ad4d81425e 100644
> > --- a/package/weston/weston.mk
> > +++ b/package/weston/weston.mk
> > @@ -186,4 +186,8 @@ else
> >  WESTON_CONF_OPTS +=3D -Ddemo-clients=3Dfalse
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL),y)
> > +WESTON_CONF_OPTS +=3D -Ddeprecated-wl-shell=3Dtrue
> > +endif
> > +
> >  $(eval $(meson-package))
> > --
> > 2.34.1
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

--000000000000dde99705e7b5d1a8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hi Yann,<div><br></div><div>Okay, understood. This should =
be dropped if mainline removed it completely.</div><div><br clear=3D"all"><=
div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmail_sign=
ature"><div dir=3D"ltr"><div><div dir=3D"ltr">Thanks,<div><br></div><div>Ch=
ris Dimich</div><div>Boundary Devices, LLC</div><div><a href=3D"http://www.=
boundarydevices.com" target=3D"_blank">www.boundarydevices.com</a>=C2=A0</d=
iv><div><span style=3D"font-size:10pt;font-family:Arial,sans-serif;color:rg=
b(22,41,82)">7 Orchard Road, Suite 102</span><b style=3D"font-size:12.8px">=
<span style=3D"font-size:10pt;font-family:&quot;MS Gothic&quot;;color:rgb(2=
2,41,82);background-image:initial;background-position:initial;background-re=
peat:initial">=EF=BD=9C</span></b><font color=3D"#939598" face=3D"Arial, sa=
ns-serif" style=3D"font-size:12.8px"><span style=3D"font-size:10pt">Lake Fo=
rest, CA 92630<br></span></font><img src=3D"https://boundarydevices.com/wp-=
content/uploads/2014/05/BoundaryDevices_Logo-01.png" width=3D"96" height=3D=
"24"><br></div></div></div></div></div></div><br></div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 28, 2022=
 at 8:15 AM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">ya=
nn.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_qu=
ote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,20=
4);padding-left:1ex">Chris, All,<br>
<br>
On 2022-08-24 12:25 -0700, Chris Dimich spake thusly:<br>
&gt; In the case of the vivante sdk, the deprecated-wl-shell option needs t=
o<br>
&gt; be enabled. Otherwise, apps using the sdk cannot run on weston/wayland=
.<br>
<br>
Note that this option has been entirely removed upstream in e6b8f5a5e40c<br=
>
(remove wl_shell), commited 2022-03-08, and present in tag 10.0.91,<br>
which means that the next release of weston will no longer have that<br>
option.<br>
<br>
I am a bit relunctant at adding this in Buildroot, because that means<br>
the vivante stuff will be broken when we bump weston, or we won&#39;t be<br=
>
able to bump weston.<br>
<br>
Besides, your series does not even make use of that new option; i.e.<br>
nothing selects BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL.<br>
<br>
So, I would prefer not to add that option at all, knowing that it will<br>
soon be removed.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; Signed-off-by: Chris Dimich &lt;<a href=3D"mailto:chris.dimich@boundar=
ydevices.com" target=3D"_blank">chris.dimich@boundarydevices.com</a>&gt;<br=
>
&gt; ---<br>
&gt;=C2=A0 package/weston/Config.in | 7 +++++++<br>
&gt;=C2=A0 package/weston/<a href=3D"http://weston.mk" rel=3D"noreferrer" t=
arget=3D"_blank">weston.mk</a> | 4 ++++<br>
&gt;=C2=A0 2 files changed, 11 insertions(+)<br>
&gt; <br>
&gt; diff --git a/package/weston/Config.in b/package/weston/Config.in<br>
&gt; index 3b4e932b7d..c560c32b50 100644<br>
&gt; --- a/package/weston/Config.in<br>
&gt; +++ b/package/weston/Config.in<br>
&gt; @@ -164,4 +164,11 @@ comment &quot;demo clients needs an OpenGL ES pro=
vider, an OpenEGL-capable Wayland ba<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_USE_WCHAR |=
| !BR2_PACKAGE_HAS_LIBGLES || \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0!BR2_PACKAGE_HAS=
_LIBEGL_WAYLAND || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9<br>
&gt;=C2=A0 <br>
&gt; +config BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;deprecated wl shell&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0help<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0In the case of the vivante sdk, the deprec=
ated-wl-shell option<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0needs to be enabled. Otherwise, apps using=
 the sdk cannot<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0run on weston/wayland.<br>
&gt; +<br>
&gt;=C2=A0 endif<br>
&gt; diff --git a/package/weston/<a href=3D"http://weston.mk" rel=3D"norefe=
rrer" target=3D"_blank">weston.mk</a> b/package/weston/<a href=3D"http://we=
ston.mk" rel=3D"noreferrer" target=3D"_blank">weston.mk</a><br>
&gt; index e6c54ee7aa..ad4d81425e 100644<br>
&gt; --- a/package/weston/<a href=3D"http://weston.mk" rel=3D"noreferrer" t=
arget=3D"_blank">weston.mk</a><br>
&gt; +++ b/package/weston/<a href=3D"http://weston.mk" rel=3D"noreferrer" t=
arget=3D"_blank">weston.mk</a><br>
&gt; @@ -186,4 +186,8 @@ else<br>
&gt;=C2=A0 WESTON_CONF_OPTS +=3D -Ddemo-clients=3Dfalse<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +ifeq ($(BR2_PACKAGE_WESTON_DEPRECATED_WL_SHELL),y)<br>
&gt; +WESTON_CONF_OPTS +=3D -Ddeprecated-wl-shell=3Dtrue<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 $(eval $(meson-package))<br>
&gt; -- <br>
&gt; 2.34.1<br>
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

--000000000000dde99705e7b5d1a8--

--===============2677217540962688005==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2677217540962688005==--
