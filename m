Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EE55C38142
	for <buildroot@archiver.kernel.org>; Wed,  1 Feb 2023 17:35:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8AD1981F50;
	Wed,  1 Feb 2023 17:35:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8AD1981F50
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tXtsSMuu_IKD; Wed,  1 Feb 2023 17:35:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0A4581F4B;
	Wed,  1 Feb 2023 17:35:32 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0A4581F4B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C60C21BF29F
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 17:35:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A6ACA6109E
 for <buildroot@lists.busybox.net>; Wed,  1 Feb 2023 17:35:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A6ACA6109E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9TsmAfud7mvz for <buildroot@lists.busybox.net>;
 Wed,  1 Feb 2023 17:35:29 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5950B6107A
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5950B6107A
 for <buildroot@buildroot.org>; Wed,  1 Feb 2023 17:35:28 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id 5so19188551plo.3
 for <buildroot@buildroot.org>; Wed, 01 Feb 2023 09:35:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PUmW4UQWVM4c9QT+afUFz7Ic95NZkCHOJr02X8l7yww=;
 b=QxRqOPGlatSp9Lb0en0isYLstgNLyvPoZS7HX3Mg4D5qPGD2Cef1++ln4s8X7O4SXd
 vKtbCsAoeSd9vvY+Q0px+2R8MY5P55C/dr2TLpiZmkzYoeRwPuRtYP/bdKFqJQNeLqo4
 3K1zxxneFcVwEECA4EBHejhuXkMBdold3iwU3AufjRci5gCSyLwsrjfUQ+Eb+6oxuLSI
 uxhOkNf45trBD2sMW3B3/PxqcxPQOfnw+7jJZoNNg6k+6rdheBIOTFv5vOj8uO4yTJMI
 hf31EZE7YBiv5sm98RatGjv6uk29eHUwoZSSypp8puIdmO2w/kXSNEyRj/DhY+uPoWvo
 ioPw==
X-Gm-Message-State: AO0yUKUYGfhYtCOgVWLTIgP+PP3bzNXtJcU0AOEpd8KS+NfJlRup5JL2
 zzGvEy7Q0vJWVVSPeUgcVQcBaPGXpJ9Z41q6OaI=
X-Google-Smtp-Source: AK7set9ce05kDrk2v62feTzB3xpIkwFHalbv9POcgoRQDdckj8KnS+I0u18d+900Kom040xTtXadxpm6BXKX/i6cddo=
X-Received: by 2002:a17:90a:a60f:b0:22c:3a1b:631c with SMTP id
 c15-20020a17090aa60f00b0022c3a1b631cmr508205pjq.54.1675272928221; Wed, 01 Feb
 2023 09:35:28 -0800 (PST)
MIME-Version: 1.0
References: <20230114161002.35480-1-fontaine.fabrice@gmail.com>
 <20230130205603.GA3864@scaer>
In-Reply-To: <20230130205603.GA3864@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Wed, 1 Feb 2023 18:35:17 +0100
Message-ID: <CAPi7W82--bdBw2xRnVq+gVwnfrzcbUzmpQT24FbRAaZWqkDu4w@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PUmW4UQWVM4c9QT+afUFz7Ic95NZkCHOJr02X8l7yww=;
 b=VFwcgUlW4j5r9Cka/dIPU9T9ejbIxTh0n5tmLbC2fVtR1d2avyLvIUE4IgsAVseLAl
 UJi9ewIfcL8Qtucf1CQQ/Zoyi4wJRAxD+iakA5lkUVc0oP75vs1EiAn9jF9HUiEY2Nii
 8egqAKBz0Y3p3qwCrKzMBgYW4zbIMWGbrH7d6iIMMr6tCtSJQobCFCCMYJu+SqHWNtLS
 resc5mgSZeF61l3GOhYGtR9f2jh2duzkLA8W7tkjAYAZJBoJ1kDl1gtb9OVcbDiGFvhr
 wqNcNZWu8q7dL1tHZ7E/TfHmst1P1Tmc+je7nQid2VgbN6L+coOUJsLH1Pa1hDeTyRkw
 vY7A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=VFwcgUlW
Subject: Re: [Buildroot] [PATCH 1/1] package/rng-tools: bump to version 6.16
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
Cc: Matt Weber <matthew.weber@collins.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7380285708932139386=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7380285708932139386==
Content-Type: multipart/alternative; boundary="000000000000c9e13405f3a6df52"

--000000000000c9e13405f3a6df52
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Yann,

Le lun. 30 janv. 2023 =C3=A0 21:56, Yann E. MORIN <yann.morin.1998@free.fr>=
 a
=C3=A9crit :

> Fabrice, All,
>
> On 2023-01-14 17:10 +0100, Fabrice Fontaine spake thusly:
> > https://github.com/nhorman/rng-tools/releases/tag/v6.16
> [--SNIP--]
> > diff --git a/package/rng-tools/rng-tools.hash
> b/package/rng-tools/rng-tools.hash
> > index be2ee13969..4c86791267 100644
> > --- a/package/rng-tools/rng-tools.hash
> > +++ b/package/rng-tools/rng-tools.hash
> > @@ -1,3 +1,3 @@
> >  # Locally computed
> > -sha256
> bff0c58dff90ec10bd61f672e48618e045155eabd60b32d63a9c4ffbdad05f3a
> rng-tools-6.15.tar.gz
> > +sha256
> 17666c4745fb635d91df293be188daf94b9e465d51d8503c0195fa3beb390894
> rng-tools-6.16.tar.gz
>
> This hash does not match here, and we've had a report on IRC that it
> does not work either. In both cases, we get this hash instead:
>     8e518d45be68f42d0873732a9ac3ecfe0f10c4a9bd5d5f44180a49be8ebda96f
>
> Can you check on your side, how you ended up with 17666...90894?
>

I see that there is, only, one autobuilder failure.
However, I retested again on a fresh tarball and
17666c4745fb635d91df293be188daf94b9e465d51d8503c0195fa3beb390894 is the
correct sha256 for
https://github.com/nhorman/rng-tools/archive/v6.16/rng-tools-6.16.tar.gz.


> Regards,
> Yann E. MORIN.
>
> >  sha256
> 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
> > diff --git a/package/rng-tools/rng-tools.mk b/package/rng-tools/
> rng-tools.mk
> > index f736193a23..3e565103e4 100644
> > --- a/package/rng-tools/rng-tools.mk
> > +++ b/package/rng-tools/rng-tools.mk
> > @@ -4,14 +4,14 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -RNG_TOOLS_VERSION =3D 6.15
> > +RNG_TOOLS_VERSION =3D 6.16
> >  RNG_TOOLS_SITE =3D $(call
> github,nhorman,$(RNG_TOOLS_NAME),v$(RNG_TOOLS_VERSION))
> >  RNG_TOOLS_LICENSE =3D GPL-2.0
> >  RNG_TOOLS_LICENSE_FILES =3D COPYING
> >  RNG_TOOLS_CPE_ID_VENDOR =3D rng-tools_project
> >  RNG_TOOLS_SELINUX_MODULES =3D rngd
> >
> > -RNG_TOOLS_DEPENDENCIES =3D host-pkgconf openssl
> > +RNG_TOOLS_DEPENDENCIES =3D host-pkgconf libcap openssl
> >  # From git
> >  RNG_TOOLS_AUTORECONF =3D YES
> >
> > @@ -45,6 +45,13 @@ else
> >  RNG_TOOLS_CONF_OPTS +=3D --without-nistbeacon
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_RNG_TOOLS_QRYPT),y)
> > +RNG_TOOLS_DEPENDENCIES +=3D jansson libcurl
> > +RNG_TOOLS_CONF_OPTS +=3D --with-qrypt
> > +else
> > +RNG_TOOLS_CONF_OPTS +=3D --without-qrypt
> > +endif
> > +
> >  define RNG_TOOLS_INSTALL_INIT_SYSV
> >       $(INSTALL) -D -m 755 package/rng-tools/S21rngd \
> >               $(TARGET_DIR)/etc/init.d/S21rngd
> > --
> > 2.39.0
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

Best Regards,

Fabrice

--000000000000c9e13405f3a6df52
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hi Yann,<br></div><br><div class=3D"gmail=
_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0lun. 30 janv. 2023 =
=C3=A0=C2=A021:56, Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free=
.fr" target=3D"_blank">yann.morin.1998@free.fr</a>&gt; a =C3=A9crit=C2=A0:<=
br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">Fabrice, All,<br=
>
<br>
On 2023-01-14 17:10 +0100, Fabrice Fontaine spake thusly:<br>
&gt; <a href=3D"https://github.com/nhorman/rng-tools/releases/tag/v6.16" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/nhorman/rng-tools/rel=
eases/tag/v6.16</a><br>
[--SNIP--]<br>
&gt; diff --git a/package/rng-tools/rng-tools.hash b/package/rng-tools/rng-=
tools.hash<br>
&gt; index be2ee13969..4c86791267 100644<br>
&gt; --- a/package/rng-tools/rng-tools.hash<br>
&gt; +++ b/package/rng-tools/rng-tools.hash<br>
&gt; @@ -1,3 +1,3 @@<br>
&gt;=C2=A0 # Locally computed<br>
&gt; -sha256=C2=A0 bff0c58dff90ec10bd61f672e48618e045155eabd60b32d63a9c4ffb=
dad05f3a=C2=A0 rng-tools-6.15.tar.gz<br>
&gt; +sha256=C2=A0 17666c4745fb635d91df293be188daf94b9e465d51d8503c0195fa3b=
eb390894=C2=A0 rng-tools-6.16.tar.gz<br>
<br>
This hash does not match here, and we&#39;ve had a report on IRC that it<br=
>
does not work either. In both cases, we get this hash instead:<br>
=C2=A0 =C2=A0 8e518d45be68f42d0873732a9ac3ecfe0f10c4a9bd5d5f44180a49be8ebda=
96f<br>
<br>
Can you check on your side, how you ended up with 17666...90894?<br></block=
quote></div><div class=3D"gmail_quote"><br></div><div class=3D"gmail_quote"=
>I see that there is, only, one autobuilder failure.</div><div class=3D"gma=
il_quote">However, I retested again on a fresh tarball and 17666c4745fb635d=
91df293be188daf94b9e465d51d8503c0195fa3beb390894 is the correct sha256 for =
<a href=3D"https://github.com/nhorman/rng-tools/archive/v6.16/rng-tools-6.1=
6.tar.gz" target=3D"_blank">https://github.com/nhorman/rng-tools/archive/v6=
.16/rng-tools-6.16.tar.gz</a>.<br></div><div class=3D"gmail_quote"><br><blo=
ckquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left=
:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt;=C2=A0 sha256=C2=A0 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404=
010521b880643=C2=A0 COPYING<br>
&gt; diff --git a/package/rng-tools/<a href=3D"http://rng-tools.mk" rel=3D"=
noreferrer" target=3D"_blank">rng-tools.mk</a> b/package/rng-tools/<a href=
=3D"http://rng-tools.mk" rel=3D"noreferrer" target=3D"_blank">rng-tools.mk<=
/a><br>
&gt; index f736193a23..3e565103e4 100644<br>
&gt; --- a/package/rng-tools/<a href=3D"http://rng-tools.mk" rel=3D"norefer=
rer" target=3D"_blank">rng-tools.mk</a><br>
&gt; +++ b/package/rng-tools/<a href=3D"http://rng-tools.mk" rel=3D"norefer=
rer" target=3D"_blank">rng-tools.mk</a><br>
&gt; @@ -4,14 +4,14 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -RNG_TOOLS_VERSION =3D 6.15<br>
&gt; +RNG_TOOLS_VERSION =3D 6.16<br>
&gt;=C2=A0 RNG_TOOLS_SITE =3D $(call github,nhorman,$(RNG_TOOLS_NAME),v$(RN=
G_TOOLS_VERSION))<br>
&gt;=C2=A0 RNG_TOOLS_LICENSE =3D GPL-2.0<br>
&gt;=C2=A0 RNG_TOOLS_LICENSE_FILES =3D COPYING<br>
&gt;=C2=A0 RNG_TOOLS_CPE_ID_VENDOR =3D rng-tools_project<br>
&gt;=C2=A0 RNG_TOOLS_SELINUX_MODULES =3D rngd<br>
&gt;=C2=A0 <br>
&gt; -RNG_TOOLS_DEPENDENCIES =3D host-pkgconf openssl<br>
&gt; +RNG_TOOLS_DEPENDENCIES =3D host-pkgconf libcap openssl<br>
&gt;=C2=A0 # From git<br>
&gt;=C2=A0 RNG_TOOLS_AUTORECONF =3D YES<br>
&gt;=C2=A0 <br>
&gt; @@ -45,6 +45,13 @@ else<br>
&gt;=C2=A0 RNG_TOOLS_CONF_OPTS +=3D --without-nistbeacon<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +ifeq ($(BR2_PACKAGE_RNG_TOOLS_QRYPT),y)<br>
&gt; +RNG_TOOLS_DEPENDENCIES +=3D jansson libcurl<br>
&gt; +RNG_TOOLS_CONF_OPTS +=3D --with-qrypt<br>
&gt; +else<br>
&gt; +RNG_TOOLS_CONF_OPTS +=3D --without-qrypt<br>
&gt; +endif<br>
&gt; +<br>
&gt;=C2=A0 define RNG_TOOLS_INSTALL_INIT_SYSV<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0$(INSTALL) -D -m 755 package/rng-tools/S21rn=
gd \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0$(TARGET_DIR)/et=
c/init.d/S21rngd<br>
&gt; -- <br>
&gt; 2.39.0<br>
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
--------&#39;<br></blockquote><div><br></div><div>Best Regards,</div><div><=
br></div><div>Fabrice <br></div></div></div>

--000000000000c9e13405f3a6df52--

--===============7380285708932139386==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7380285708932139386==--
