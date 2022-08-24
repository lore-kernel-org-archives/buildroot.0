Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63279C00140
	for <buildroot@archiver.kernel.org>; Wed, 24 Aug 2022 11:27:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3DBD40298;
	Wed, 24 Aug 2022 11:27:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D3DBD40298
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XFgdGPLhMPF4; Wed, 24 Aug 2022 11:27:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 49FD14092D;
	Wed, 24 Aug 2022 11:27:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49FD14092D
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CA34F1BF407
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:27:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A57D3401A3
 for <buildroot@lists.busybox.net>; Wed, 24 Aug 2022 11:27:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A57D3401A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AuqxLBoKpnxW for <buildroot@lists.busybox.net>;
 Wed, 24 Aug 2022 11:27:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 78AD4400F8
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 78AD4400F8
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 11:27:34 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id x15so15297886pfp.4
 for <buildroot@buildroot.org>; Wed, 24 Aug 2022 04:27:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=A+3eaM66B9epv0kjIsxh91q3Ig5r7sbcj2vOv+PtzyY=;
 b=ygc5uH5HJj5hDsSQLGQ8ZD+n2DXpNYMK2yIHno1Sd2oH5oWKMV93uyGq2QWHxxh4bK
 0FXjJ431P5XvAP2Ijpa1blqDX6Tf+N98ot2bylyTON80rY4nEGZEMunO/A/sB54TuDbr
 /TaUhbu3yv1lwJgphrihFLvQPk+SEjTDGrUyJqW1Pv8DK+ZCgpXS1+fJ2J26wv7l5un/
 UwvCWDgpdLubhBQiP7w9jaHV1AUcPpOwJh4+Ax4uKtFUAn4dp8fQg9J31oADTkuE0RxK
 HXIcsT2wJ9LdQ7FNDr/RUNIuiwLl41s7yeYSOmcR/Puc7AKLJLbYuuwY663sDPq7A0RC
 NHgw==
X-Gm-Message-State: ACgBeo0a82XekfSNc+pm4JmAHf+7yV/K81ZzzSh+qtX3cgECJMADmwzK
 dyzRZqSumBUZ8IQ6FPUPd0JsyNlW/ncDI7A+5mLBSlUv
X-Google-Smtp-Source: AA6agR5/vlgzjzS1H4VblvHh6tKfJhbBSIq88vEWKeUsemwbdLQtfM7Idl4GvCK9AeBPGVbwVfB9ezfIabPevcfRgAY=
X-Received: by 2002:a63:8ac3:0:b0:429:f580:fce2 with SMTP id
 y186-20020a638ac3000000b00429f580fce2mr24204703pgd.558.1661340453646; Wed, 24
 Aug 2022 04:27:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220824094900.3639681-1-jesseevg@gmail.com>
 <20220824123852.489214fa@windsurf>
In-Reply-To: <20220824123852.489214fa@windsurf>
From: Jesse Van Gavere <jesseevg@gmail.com>
Date: Wed, 24 Aug 2022 13:27:21 +0200
Message-ID: <CAMdwsN8qeVFHWdSGSHam22UqmEwT4mK2qguHZqsBdcQfcO=5yw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=A+3eaM66B9epv0kjIsxh91q3Ig5r7sbcj2vOv+PtzyY=;
 b=fLE9oq8Nj/ZctTklTjetwDCKi2eorNhvtuQEcM2KQjEKwRNzonsWSKve5VFgElUCGW
 rVEtMr8Bt+zE3kB2qPmSJXFVkd/iN0Er0+58F+kgNyw3J9T+aostAI7Tyz/jZH71Ewf0
 I0LYhwYXIBz6ZXAMGpMBg2dx4hZS/7jqG1Ixzc1gjjRwylQMUW5tsGBi45P2wi+uiXCx
 VRJXKiUOiogjtrboLmRsmrz437nYKbu8ZPwpFpOGRi7bCZK7OBZD5dCo4lPTe7gvJNdU
 R5xTAuIPGss97PwAUFuWxz062BCqn2a6KJw8iWSIAHmZtgBG64cfuMyNouVcAP/loqQh
 Hp0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=fLE9oq8N
Subject: Re: [Buildroot] [PATCH 1/1] package/qt6/qt6serialport: add package
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
Cc: Samuel Martin <s.martin49@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4869577682232801729=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4869577682232801729==
Content-Type: multipart/alternative; boundary="00000000000097375705e6faf76c"

--00000000000097375705e6faf76c
Content-Type: text/plain; charset="UTF-8"

Hello,

Yes very interested, I actually started work on this before Samuel had
committed a first base package so I've been reworking a little what I got
to conform more to what's already there, I've been getting all our internal
code up to date to work with Qt6 so I've got a more fleshed out qt6base
package from my struggles getting that working along with the
qt6declarative package, I'll submit those qt6base changes later once I got
the chance to rework a little taking your comments into account so you can
have a look (because it does have some quirk in GUI/fontconfig I had to
temporarily solve with patches and forced dependencies) and once that's
done I'll submit the declarative package, my hope is that I can also then
add some of the more straightforward modules from qt6 we also had in qt5.

Best regards,
Jesse

Op wo 24 aug. 2022 om 12:38 schreef Thomas Petazzoni <
thomas.petazzoni@bootlin.com>:

> Hello,
>
> On Wed, 24 Aug 2022 11:49:00 +0200
> Jesse Van Gavere <jesseevg@gmail.com> wrote:
>
> > Signed-off-by: Jesse Van Gavere <jesseevg@gmail.com>
>
> Wow, great, someone interested in Qt6! I've applied your patch to our
> next branch, with some changes. See below.
>
> > ---
> >  package/qt6/Config.in                        |  1 +
> >  package/qt6/qt6serialport/Config.in          | 11 ++++++
> >  package/qt6/qt6serialport/qt6serialport.hash |  9 +++++
> >  package/qt6/qt6serialport/qt6serialport.mk   | 41 ++++++++++++++++++++
> >  4 files changed, 62 insertions(+)
>
> You forgot to add an entry to the DEVELOPERS file for this new package,
> so I've added that. This way you will receive e-mail notifications if
> we have build failures on qt6serialport, or if new versions become
> available upstream.
>
> > diff --git a/package/qt6/qt6serialport/qt6serialport.mk
> b/package/qt6/qt6serialport/qt6serialport.mk
> > new file mode 100644
> > index 0000000000..5bfae1ca0c
> > --- /dev/null
> > +++ b/package/qt6/qt6serialport/qt6serialport.mk
> > @@ -0,0 +1,41 @@
> >
> +################################################################################
> > +#
> > +# qt6serialport
> > +#
> >
> +################################################################################
> > +
> > +QT6SERIALPORT_VERSION = $(QT6_VERSION)
> > +QT6SERIALPORT_SITE = $(QT6_SITE)
> > +QT6SERIALPORT_SOURCE =
> qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(QT6SERIALPORT_VERSION).tar.xz
> > +QT6SERIALPORT_INSTALL_STAGING = YES
> > +QT6SERIALPORT_LICENSE = GPL-2.0+ or LGPL-3.0, GPL-3.0 with
> exception(tools), GFDL-1.3 (docs)
>
>                                                                       ^^^
> missing space her
>
> > +QT6SERIALPORT_LICENSE_FILES = LICENSE.GPL2 LICENSE.GPL3
> LICENSE.GPL3-EXCEPT LICENSE.LGPL3 LICENSE.FDL
> > +QT6SERIALPORT_CONF_OPTS += \
>
> += was not needed here, a simple = was enough.
>
> > +        -GNinja \
>
> This option was intended with spaces instead of one tab.
>
> > +     -DQT_HOST_PATH=$(HOST_DIR) \
> > +     -DBUILD_SHARED_LIBS=ON \
>
> This option is not needed, it's passed by the cmake-package infrastructure
> already.
>
> > +     -DBUILD_WITH_PCH=OFF \
> > +     -DQT_BUILD_EXAMPLES=OFF \
> > +     -DQT_BUILD_TESTS=OFF
>
> > +
> > +QT6SERIALPORT_DEPENDENCIES = \
> > +        host-pkgconf \
> > +        host-ninja \
>
> These options were intended with spaces instead of one tab.
>
> > +     qt6base
> > +
> > +QT6SERIALPORT_INSTALL_STAGING = YES
>
> This was already present earlier in your .mk file.
>
> Again, thanks for this contribution!
>
> Best regards,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000097375705e6faf76c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hello,</div><div><br></div><div>Yes very interested, =
I actually started work on this before Samuel had committed a first base pa=
ckage so I&#39;ve been reworking a little what I got to conform more to wha=
t&#39;s already there, I&#39;ve been getting all our internal code up to da=
te to work with Qt6 so I&#39;ve got a more fleshed out qt6base package from=
 my struggles getting that working along with the qt6declarative package, I=
&#39;ll submit those qt6base changes later once I got the chance to rework =
a little taking your comments into account so you can have a look (because =
it does have some quirk in GUI/fontconfig I had to temporarily solve with p=
atches and forced dependencies) and once that&#39;s done I&#39;ll submit th=
e declarative package, my hope is that I can also then add some of the more=
 straightforward modules from qt6 we also had in qt5.</div><div><br></div><=
div>Best regards,</div><div>Jesse<br></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Op wo 24 aug. 2022 om 12:38 schr=
eef Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">th=
omas.petazzoni@bootlin.com</a>&gt;:<br></div><blockquote class=3D"gmail_quo=
te" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204=
);padding-left:1ex">Hello,<br>
<br>
On Wed, 24 Aug 2022 11:49:00 +0200<br>
Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com" target=3D"_blank=
">jesseevg@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.c=
om" target=3D"_blank">jesseevg@gmail.com</a>&gt;<br>
<br>
Wow, great, someone interested in Qt6! I&#39;ve applied your patch to our<b=
r>
next branch, with some changes. See below.<br>
<br>
&gt; ---<br>
&gt;=C2=A0 package/qt6/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=C2=A0 1 +<br>
&gt;=C2=A0 package/qt6/qt6serialport/Config.in=C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 | 11 ++++++<br>
&gt;=C2=A0 package/qt6/qt6serialport/qt6serialport.hash |=C2=A0 9 +++++<br>
&gt;=C2=A0 package/qt6/qt6serialport/<a href=3D"http://qt6serialport.mk" re=
l=3D"noreferrer" target=3D"_blank">qt6serialport.mk</a>=C2=A0 =C2=A0| 41 ++=
++++++++++++++++++<br>
&gt;=C2=A0 4 files changed, 62 insertions(+)<br>
<br>
You forgot to add an entry to the DEVELOPERS file for this new package,<br>
so I&#39;ve added that. This way you will receive e-mail notifications if<b=
r>
we have build failures on qt6serialport, or if new versions become<br>
available upstream.<br>
<br>
&gt; diff --git a/package/qt6/qt6serialport/<a href=3D"http://qt6serialport=
.mk" rel=3D"noreferrer" target=3D"_blank">qt6serialport.mk</a> b/package/qt=
6/qt6serialport/<a href=3D"http://qt6serialport.mk" rel=3D"noreferrer" targ=
et=3D"_blank">qt6serialport.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..5bfae1ca0c<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/qt6/qt6serialport/<a href=3D"http://qt6serialport.mk" re=
l=3D"noreferrer" target=3D"_blank">qt6serialport.mk</a><br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# qt6serialport<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +QT6SERIALPORT_VERSION =3D $(QT6_VERSION)<br>
&gt; +QT6SERIALPORT_SITE =3D $(QT6_SITE)<br>
&gt; +QT6SERIALPORT_SOURCE =3D qtserialport-$(QT6_SOURCE_TARBALL_PREFIX)-$(=
QT6SERIALPORT_VERSION).tar.xz<br>
&gt; +QT6SERIALPORT_INSTALL_STAGING =3D YES<br>
&gt; +QT6SERIALPORT_LICENSE =3D GPL-2.0+ or LGPL-3.0, GPL-3.0 with exceptio=
n(tools), GFDL-1.3 (docs)<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 ^^^ missing space her<br>
<br>
&gt; +QT6SERIALPORT_LICENSE_FILES =3D LICENSE.GPL2 LICENSE.GPL3 LICENSE.GPL=
3-EXCEPT LICENSE.LGPL3 LICENSE.FDL<br>
&gt; +QT6SERIALPORT_CONF_OPTS +=3D \<br>
<br>
+=3D was not needed here, a simple =3D was enough.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 -GNinja \<br>
<br>
This option was intended with spaces instead of one tab.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_HOST_PATH=3D$(HOST_DIR) \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DBUILD_SHARED_LIBS=3DON \<br>
<br>
This option is not needed, it&#39;s passed by the cmake-package infrastruct=
ure already.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DBUILD_WITH_PCH=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_BUILD_EXAMPLES=3DOFF \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-DQT_BUILD_TESTS=3DOFF<br>
<br>
&gt; +<br>
&gt; +QT6SERIALPORT_DEPENDENCIES =3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-pkgconf \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 host-ninja \<br>
<br>
These options were intended with spaces instead of one tab.<br>
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0qt6base<br>
&gt; +<br>
&gt; +QT6SERIALPORT_INSTALL_STAGING =3D YES<br>
<br>
This was already present earlier in your .mk file.<br>
<br>
Again, thanks for this contribution!<br>
<br>
Best regards,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000097375705e6faf76c--

--===============4869577682232801729==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4869577682232801729==--
