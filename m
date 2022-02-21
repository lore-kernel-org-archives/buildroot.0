Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47680C433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 09:33:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ACDC560E26;
	Mon, 21 Feb 2022 09:33:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iH7lcg6NtPBj; Mon, 21 Feb 2022 09:33:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 89CA460E1E;
	Mon, 21 Feb 2022 09:33:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 466A61BF2BA
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 09:33:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 311D260E1E
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 09:33:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lTHd-zXc5Dft for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 09:33:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C462460E18
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 09:33:15 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id o24so25943275wro.3
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 01:33:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RaydjXyws23pF1At/T2MDO6D8FzoeVKhJvPTmn1+Vt8=;
 b=ZRZsaW4J6VnENmT76BLZmdLSB/ywsuMjZGGGfTzv5wMvNtgZ8/YLd9/2NT0QEe+dKq
 TNs0aI1QcVG1hnVx2lUG85yHG/qMQ+LkNeuL4DornaJBUARMGCs0nUBxZKrz1y6OwpnZ
 dqXi1tJ0ibz5w5T/O50/5iMPcoYIo+UK5qfA+6NTTI54e9sUhoCOj71xo3exzRKLt00Z
 Thr2BHLIOM5gl+9/4lEUHN4WA6kKoShOG0cYQK8h1Dm3d3miaUKb+uIAtSarjb6PMHK6
 BjzQ6Ne7/ktUafBeozfVv1mH5GDUCd5gKs93mvqIL9Osiwjp/E/lCpBihtaXGxLwG8sb
 soTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RaydjXyws23pF1At/T2MDO6D8FzoeVKhJvPTmn1+Vt8=;
 b=y68GK5IlvAZEIMGHd+OSBnx91YdYM78DOJ2Z0ZWm5TLL2t1Jyz2Dih57REcd2O+AtV
 jFWwSOII1LvepGdtH+CxZK3jOIfgoHnzBeVo2Fb4/XGGx1z83vaSbo9QdSXKxq3AzRqC
 XKziZLOZsdc6GCBWq7XkmaEp7OciYVc/euZm9cTGL5dK5q9yNDxkCjOIvfNqnycKNAXv
 c1e1KSyixTBOcmTEb7ITMZDGH0KlzsTNl50WB60B9WOWyeSe7atLwoX0S0U2cxU2CK9W
 uvHPk90JxKmp/zbTuE6Le0cDKorkYda2kp9hwjx4jGE0jIEQdNv6UF7kY+XfsFb19xi+
 bl7A==
X-Gm-Message-State: AOAM533qulGQhR12ibzdviXMBwD0FLFBDsmNPll+V5ZkyfeSi6cKu9p0
 q3NnwtoeCVW/dTf9hDiShiv5xQFXzZZ53gv3k7Ad4DfDlMM=
X-Google-Smtp-Source: ABdhPJwKFESbh1WTKLjvYZbpqmi2DjDrc5q82RMZfBjKK76Rb4AAuQQlWdAqCRjj3PBrGTKiNLVgCptz/Cf+x8ns/jA=
X-Received: by 2002:adf:eb86:0:b0:1e6:8c92:af6b with SMTP id
 t6-20020adfeb86000000b001e68c92af6bmr15124640wrn.116.1645435993836; Mon, 21
 Feb 2022 01:33:13 -0800 (PST)
MIME-Version: 1.0
References: <CAHnHX5jAJw2ON8-e6UBmvDLR6j3p1iUYY1GvRpbULHBjF80SrQ@mail.gmail.com>
 <186B6238-5452-4211-BD9D-29A3C921DE42@benettiengineering.com>
 <CAHnHX5grmd94PGaBJn=XkJttwCEFdc=tWaE6v7PpZCN5UL8tSg@mail.gmail.com>
 <469c0dbc-6101-be6c-7272-400ac4512b86@grenoble.cnrs.fr>
 <4d8f6289-f16f-9602-a458-2b5836a817e6@benettiengineering.com>
 <CAHnHX5gJ2_=u09ntg_WxJeM1XwHrgOsgvjDYrUsHJk7AdUVyLQ@mail.gmail.com>
 <CAHnHX5i3M890wBfkx_C4QEAKHv3S-Np2mEqZX=nEySXrQ8Bg=g@mail.gmail.com>
 <71b0c2b1-0b71-9aca-5209-33ea3a6cacf1@benettiengineering.com>
In-Reply-To: <71b0c2b1-0b71-9aca-5209-33ea3a6cacf1@benettiengineering.com>
From: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
Date: Mon, 21 Feb 2022 17:33:01 +0800
Message-ID: <CAHnHX5gEBk0L3OT5J-RR-H-QCRgJQeO_Hnujz2rxObOmJHMscw@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] Issue with login
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8625626139481253297=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8625626139481253297==
Content-Type: multipart/alternative; boundary="000000000000e9cf9805d883eb4c"

--000000000000e9cf9805d883eb4c
Content-Type: text/plain; charset="UTF-8"

Btw, is the mailing list correct platform for Buildroot Q&A? Do you have
any related forum for the purpose? Thanks

On Mon, Feb 21, 2022, 4:44 PM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> Hi Mohd,
>
> On 21/02/22 06:16, Mohd Faiz Rohani wrote:
> > Hi guys,
> >
> > Thank you for your help.I have overlooked the required setting as
> > normally I will leave the setting to the default, as I assume Buildroot
> > has selected the required settings. Anyway I have managed to login
> > successfully now.
> >
> > I have turned on BR2_PACKAGE_SYSTEMD_LOGIND and
> > BR2_PACKAGE_UTIL_LINUX_LOGIN settings, while the rest does not change.
>
> Perfect, team working with Edgar worked :-)
>
> > Fyi, I have tried the newer versions of Linux Kernel (5.15) and Uboot
> > (v2022.01) with the Linaro 7.5 toolchain, but got an error during the
> > booting process where the RFS cannot be mounted. It may be my fault
> > through the settings though, that is why I am trying the old version and
> > it worked.
>
> I would avoid using gcc 7.5 on such new kernel/uboot. Maybe if you try
> to rebuild using an external prebuilt toolchain like the Bootlin one, or
> you build a Buildroot toolchain with latest versions, like gcc 10.x you
> could obtain different results.
>
> > I am planning to use Buildroot for my future development and keen to
> > contribute wherever I can. Still lots to learn though.
>
> Well!
>
> > Thank you again guys.
>
> You're welcome
>
> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas
>
> > Regards.
> > Faiz
> >
> >
> >
> >
> > On Mon, Feb 21, 2022 at 2:33 AM Mohd Faiz Rohani
> > <mohd.faiz.rohani@gmail.com <mailto:mohd.faiz.rohani@gmail.com>> wrote:
> >
> >     Thanks, I'll check them out. Will update the outcome once the
> >     installation is done.
> >
> >     Thank you.
> >
> >     On Mon, Feb 21, 2022, 1:56 AM Giulio Benetti
> >     <giulio.benetti@benettiengineering.com
> >     <mailto:giulio.benetti@benettiengineering.com>> wrote:
> >
> >         Hi Edgar,
> >
> >         please reply to all in Mailing List, I add Mohd in Cc,
> >
> >         On 20/02/22 17:18, Edgar Bonet wrote:
> >          > Hi!
> >          >
> >          > In his config file, Mohd wrote:
> >          >> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
> >          >> BR2_LINUX_KERNEL_VERSION="4.4.155"
> >          >
> >          > This may cause problems. C.f. docs/manual/configure.txt:
> >          >
> >          >      If you use kernel headers that are more recent than the
> >         Linux
> >          >      kernel you run on your embedded system, then the C
> >         library might
> >          >      be using interfaces that are not provided by your Linux
> >         kernel.
> >
> >         Good catch Edgar!
> >         So Mohd, what you need here is a toolchain with older libc.
> >
> https://buildroot.org/downloads/manual/manual.html#_cross_compilation_toolchain
> >         <
> https://buildroot.org/downloads/manual/manual.html#_cross_compilation_toolchain
> >
> >
> >         But again, do you really need to use so such old versions
> >         instead of try
> >         to use buildroot's beaglebone_defconfig?
> >
> >          > In the same config file, there is:
> >          >> # BR2_PACKAGE_BUSYBOX is not set
> >          >
> >          > When disabling busybox, you should have seen the message:
> >          >
> >          >      You may need to enable other packages to get a working
> >         system
> >          >      You better know what you're doing!
> >
> >         Despite of what I've written on my previous e-mail(my test was
> >         wrong),
> >         he has BR2_INIT_SYSTEMD=y that works as Init System, so that's
> ok.
> >
> >          > And then:
> >          >> # BR2_PACKAGE_SYSTEMD_LOGIND is not set
> >
> >         Good catch again Edgar! This ^^^ should be the point. Because
> it's
> >         exactly the systemd login dameon.
> >
> >          >> # BR2_PACKAGE_UTIL_LINUX_LOGIN is not set
> >
> >         This ^^^ is not selected by systemd, so I expect
> >         BR2_PACKAGE_SYSTEMD_LOGIND to do the job(even if I'm not a
> systemd
> >         expoert at all).
> >
> >         But as Edgar pointed linux headers don't match so you have 3
> >         choices:
> >         1) find a toolchain with linux-headers <= 4.4.*
> >         2) update linux version
> >         3) start from scratch using buildroot beaglebone_defconfig
> >
> >         Best regards
> >         --
> >         Giulio Benetti
> >         Benetti Engineering sas
> >
>
>

--000000000000e9cf9805d883eb4c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Btw, is the mailing list correct platform for Buildroot Q=
&amp;A? Do you have any related forum for the purpose? Thanks</div><br><div=
 class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 21=
, 2022, 4:44 PM Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benetti=
engineering.com">giulio.benetti@benettiengineering.com</a>&gt; wrote:<br></=
div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-lef=
t:1px #ccc solid;padding-left:1ex">Hi Mohd,<br>
<br>
On 21/02/22 06:16, Mohd Faiz Rohani wrote:<br>
&gt; Hi guys,<br>
&gt; <br>
&gt; Thank you for your=C2=A0help.I have overlooked the required setting as=
 <br>
&gt; normally I will leave the setting=C2=A0to the default, as I assume Bui=
ldroot <br>
&gt; has selected=C2=A0the required settings. Anyway I have managed to logi=
n <br>
&gt; successfully=C2=A0now.<br>
&gt; <br>
&gt; I have turned on BR2_PACKAGE_SYSTEMD_LOGIND and <br>
&gt; BR2_PACKAGE_UTIL_LINUX_LOGIN settings, while the rest does not change.=
<br>
<br>
Perfect, team working with Edgar worked :-)<br>
<br>
&gt; Fyi, I have tried the newer versions of Linux Kernel (5.15) and Uboot =
<br>
&gt; (v2022.01) with the Linaro 7.5 toolchain, but got an error during the =
<br>
&gt; booting process where the RFS cannot be mounted. It may be my fault <b=
r>
&gt; through the settings though, that is why I am trying the old version a=
nd <br>
&gt; it worked.<br>
<br>
I would avoid using gcc 7.5 on such new kernel/uboot. Maybe if you try <br>
to rebuild using an external prebuilt toolchain like the Bootlin one, or <b=
r>
you build a Buildroot toolchain with latest versions, like gcc 10.x you <br=
>
could obtain different results.<br>
<br>
&gt; I am planning to use Buildroot for my future development and keen to <=
br>
&gt; contribute wherever=C2=A0I can. Still lots to learn though.<br>
<br>
Well!<br>
<br>
&gt; Thank you again guys.<br>
<br>
You&#39;re welcome<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
Benetti Engineering sas<br>
<br>
&gt; Regards.<br>
&gt; Faiz<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; On Mon, Feb 21, 2022 at 2:33 AM Mohd Faiz Rohani <br>
&gt; &lt;<a href=3D"mailto:mohd.faiz.rohani@gmail.com" target=3D"_blank" re=
l=3D"noreferrer">mohd.faiz.rohani@gmail.com</a> &lt;mailto:<a href=3D"mailt=
o:mohd.faiz.rohani@gmail.com" target=3D"_blank" rel=3D"noreferrer">mohd.fai=
z.rohani@gmail.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thanks, I&#39;ll check them out. Will update the ou=
tcome once the<br>
&gt;=C2=A0 =C2=A0 =C2=A0installation is done.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thank=C2=A0you.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Mon, Feb 21, 2022, 1:56 AM Giulio Benetti<br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"mailto:giulio.benetti@benettienginee=
ring.com" target=3D"_blank" rel=3D"noreferrer">giulio.benetti@benettiengine=
ering.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:giulio.benetti@benetti=
engineering.com" target=3D"_blank" rel=3D"noreferrer">giulio.benetti@benett=
iengineering.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Hi Edgar,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0please reply to all in Mailing List, =
I add Mohd in Cc,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0On 20/02/22 17:18, Edgar Bonet wrote:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; Hi!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; In his config file, Mohd wrote:=
<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; BR2_TOOLCHAIN_EXTERNAL_HEAD=
ERS_4_10=3Dy<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; BR2_LINUX_KERNEL_VERSION=3D=
&quot;4.4.155&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; This may cause problems. C.f. d=
ocs/manual/configure.txt:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 If you use =
kernel headers that are more recent than the<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 kernel you =
run on your embedded system, then the C<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0library might<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 be using in=
terfaces that are not provided by your Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0kernel.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Good catch Edgar!<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0So Mohd, what you need here is a tool=
chain with older libc.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://buildroot.org/down=
loads/manual/manual.html#_cross_compilation_toolchain" rel=3D"noreferrer no=
referrer" target=3D"_blank">https://buildroot.org/downloads/manual/manual.h=
tml#_cross_compilation_toolchain</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0&lt;<a href=3D"https://buildroot.org/=
downloads/manual/manual.html#_cross_compilation_toolchain" rel=3D"noreferre=
r noreferrer" target=3D"_blank">https://buildroot.org/downloads/manual/manu=
al.html#_cross_compilation_toolchain</a>&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0But again, do you really need to use =
so such old versions<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0instead of try<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0to use buildroot&#39;s beaglebone_def=
config?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; In the same config file, there =
is:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; # BR2_PACKAGE_BUSYBOX is no=
t set<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; When disabling busybox, you sho=
uld have seen the message:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 You may nee=
d to enable other packages to get a working<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;=C2=A0 =C2=A0 =C2=A0 You better =
know what you&#39;re doing!<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Despite of what I&#39;ve written on m=
y previous e-mail(my test was<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0wrong),<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0he has BR2_INIT_SYSTEMD=3Dy that work=
s as Init System, so that&#39;s ok.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt; And then:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; # BR2_PACKAGE_SYSTEMD_LOGIN=
D is not set<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Good catch again Edgar! This ^^^ shou=
ld be the point. Because it&#39;s<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0exactly the systemd login dameon.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 &gt;&gt; # BR2_PACKAGE_UTIL_LINUX_LO=
GIN is not set<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0This ^^^ is not selected by systemd, =
so I expect<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_SYSTEMD_LOGIND to do the =
job(even if I&#39;m not a systemd<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0expoert at all).<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0But as Edgar pointed linux headers do=
n&#39;t match so you have 3<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0choices:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A01) find a toolchain with linux-header=
s &lt;=3D 4.4.*<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A02) update linux version<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A03) start from scratch using buildroot=
 beaglebone_defconfig<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Best regards<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Giulio Benetti<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0Benetti Engineering sas<br>
&gt; <br>
<br>
</blockquote></div>

--000000000000e9cf9805d883eb4c--

--===============8625626139481253297==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8625626139481253297==--
