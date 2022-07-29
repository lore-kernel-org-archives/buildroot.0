Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E4DDC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 22:06:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DB5A283F19;
	Fri, 29 Jul 2022 22:06:51 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DB5A283F19
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WZjMp7i0mwGz; Fri, 29 Jul 2022 22:06:50 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B1D8B83F10;
	Fri, 29 Jul 2022 22:06:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1D8B83F10
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 345A11BF45A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:06:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C8C183F10
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:06:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C8C183F10
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q6d1vtfbJJZp for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 22:06:47 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC5E983E35
Received: from mail-vs1-xe34.google.com (mail-vs1-xe34.google.com
 [IPv6:2607:f8b0:4864:20::e34])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EC5E983E35
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 22:06:46 +0000 (UTC)
Received: by mail-vs1-xe34.google.com with SMTP id 125so5894884vsd.5
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 15:06:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=opgVNfXpSUfjT5YSatzhsUbv5ZEbLUF5b/sVnPfLQsI=;
 b=J9f/YEUR+PcL7LFgWkdNdn6EJXaCLH5/jx951Ad/PXzfPrO+6IBK8LIRFJlaSnIMcl
 A3o5A/SUwIJnHFNc7UAC64x9AdWEBnjq4tGEANwo+oORpuGQKoSg+MySwujUpphnqLp8
 RepqMccy3kqqI10cNm1iZk9NPTySAu1x44QktW0Nmo1ef3QdEVEK2DmZk7Gg3sQ3lynz
 efCGCuJpFzQAkyhyHDnN98AAh9q5e0gT5LU1ro2rvIPVoMfH2aGaZ/qm5KXEUBR1Fx1e
 LlN/7tO4DoRBEAhPLCPALEHzFNs4wKgdsZLGJCIzjN0Iym5Zo9rXzfCNdrU/HyDf28GV
 93Kg==
X-Gm-Message-State: AJIora8awaw4oeOdKJgSv4tpiYGocfADKnsqNQrBcHdMt8hawuF9jGZm
 a5SBVdoMbfIm4RLGBU21NmgmJTNRHqdmA41o7wiEiA==
X-Google-Smtp-Source: AGRyM1uD6i/nRT7WqHPQ22wglKZOjWg9Gyuw8sX0+Rkvl2RmLqxnUrmsR+JcbA6kt641oyozWolKZWc6VdlqC6Nipoc=
X-Received: by 2002:a05:6102:2387:b0:34b:9f6d:10da with SMTP id
 v7-20020a056102238700b0034b9f6d10damr2315789vsr.28.1659132405548; Fri, 29 Jul
 2022 15:06:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220728211259.121416-1-angelo@amarulasolutions.com>
 <20220729104754.2beb327c@windsurf>
In-Reply-To: <20220729104754.2beb327c@windsurf>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sat, 30 Jul 2022 00:06:08 +0200
Message-ID: <CA+_SqVYjMLcVccERhqy2sTZkPLPxmtdvRCAs6-TXtz4OvcBpdA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=opgVNfXpSUfjT5YSatzhsUbv5ZEbLUF5b/sVnPfLQsI=;
 b=RcZN9GoKzoJJcpj28B8rAaOug2rcguBOWY9bPI73ymUZoQpFcUlZYhKUwP9Ju57Jsp
 fPKZiWvE3Yc4LfiGhERYf3DvfpVNUPVEbcTS7MFCOk4ueWhsXeyT9D1V+EbVAT044hSA
 qCPZdV+oIy5VLQFJThJRfXic0TO/cUwREjK2Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=RcZN9GoK
Subject: Re: [Buildroot] [PATCH v2] package/libdill: new package
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2924766246433842939=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2924766246433842939==
Content-Type: multipart/alternative; boundary="000000000000ab211805e4f8dde5"

--000000000000ab211805e4f8dde5
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 29, 2022 at 10:47 AM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Angelo,
>
> On Thu, 28 Jul 2022 23:12:59 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > Libdill is a C library that makes writing structured concurrent programs
> > easy.
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> Looks good. A few comments/questions.
>
>
> > diff --git a/package/libdill/Config.in b/package/libdill/Config.in
> > new file mode 100644
> > index 0000000000..0e6757b809
> > --- /dev/null
> > +++ b/package/libdill/Config.in
> > @@ -0,0 +1,7 @@
> > +config BR2_PACKAGE_LIBDILL
> > +     bool "libdill"
>
> No dependencies at all? Tested with test-pkg?
>

Yes. tested with

BR2_PACKAGE_OPENSSL=y
BR2_PACKAGE_LIBDILL=y


>
> > diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
> > new file mode 100644
> > index 0000000000..822f07b939
> > --- /dev/null
> > +++ b/package/libdill/libdill.mk
> > @@ -0,0 +1,26 @@
> >
> +################################################################################
> > +#
> > +# libdill
> > +#
> >
> +################################################################################
> > +
> > +LIBDILL_VERSION = fa01648cf2a8d06e53c965b45eeacfb3ac57bd04
> > +LIBDILL_SITE = $(call github,sustrik,libdill,$(LIBDILL_VERSION))
> > +LIBDILL_LICENSE = MIT
> > +LIBDILL_LICENSE_FILES = COPYING
> > +LIBDILL_CPE_ID_VENDOR = libdill
> > +LIBDILL_CPE_ID_PRODUCT = libdill
>
> Could you add a link in the commit log that shows you have verified these?
>

I removed those in V3 because I was unable to find proper CPE id.


>
> > +LIBDILL_INSTALL_STAGING = YES
> > +# Fetched from Github, with no configure script
> > +LIBDILL_AUTORECONF = YES
> > +
> > +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
>
> ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
>
> > +LIBDILL_CONF_OPTS += --disable-threads
> > +endif
> > +
> > +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> > +LIBDILL_DEPENDENCIES = openssl
> > +LIBDILL_CONF_OPTS += --enable-tls
>
> No "else" clause to explicitly disable?
>

Done.


> > +endif
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
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

--000000000000ab211805e4f8dde5
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 29, 2022 at 10:47 AM Thom=
as Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.pet=
azzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Hello Angelo,<br>
<br>
On Thu, 28 Jul 2022 23:12:59 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com" targe=
t=3D"_blank">angelo@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; Libdill is a C library that makes writing structured concurrent progra=
ms<br>
&gt; easy.<br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarula=
solutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
<br>
Looks good. A few comments/questions.<br>
<br>
<br>
&gt; diff --git a/package/libdill/Config.in b/package/libdill/Config.in<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..0e6757b809<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/libdill/Config.in<br>
&gt; @@ -0,0 +1,7 @@<br>
&gt; +config BR2_PACKAGE_LIBDILL<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;libdill&quot;<br>
<br>
No dependencies at all? Tested with test-pkg?<br></blockquote><div><br></di=
v><div>Yes. tested with</div><div><br></div><div>BR2_PACKAGE_OPENSSL=3Dy<br=
>BR2_PACKAGE_LIBDILL=3Dy<br></div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
&gt; diff --git a/package/libdill/<a href=3D"http://libdill.mk" rel=3D"nore=
ferrer" target=3D"_blank">libdill.mk</a> b/package/libdill/<a href=3D"http:=
//libdill.mk" rel=3D"noreferrer" target=3D"_blank">libdill.mk</a><br>
&gt; new file mode 100644<br>
&gt; index 0000000000..822f07b939<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/libdill/<a href=3D"http://libdill.mk" rel=3D"noreferrer"=
 target=3D"_blank">libdill.mk</a><br>
&gt; @@ -0,0 +1,26 @@<br>
&gt; +#####################################################################=
###########<br>
&gt; +#<br>
&gt; +# libdill<br>
&gt; +#<br>
&gt; +#####################################################################=
###########<br>
&gt; +<br>
&gt; +LIBDILL_VERSION =3D fa01648cf2a8d06e53c965b45eeacfb3ac57bd04<br>
&gt; +LIBDILL_SITE =3D $(call github,sustrik,libdill,$(LIBDILL_VERSION))<br=
>
&gt; +LIBDILL_LICENSE =3D MIT<br>
&gt; +LIBDILL_LICENSE_FILES =3D COPYING<br>
&gt; +LIBDILL_CPE_ID_VENDOR =3D libdill<br>
&gt; +LIBDILL_CPE_ID_PRODUCT =3D libdill<br>
<br>
Could you add a link in the commit log that shows you have verified these?<=
br></blockquote><div><br></div><div>I removed those in V3 because I was una=
ble to find proper CPE id.</div><div>=C2=A0 <br></div><blockquote class=3D"=
gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(20=
4,204,204);padding-left:1ex">
<br>
&gt; +LIBDILL_INSTALL_STAGING =3D YES<br>
&gt; +# Fetched from Github, with no configure script<br>
&gt; +LIBDILL_AUTORECONF =3D YES<br>
&gt; +<br>
&gt; +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)<br>
<br>
ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)<br>
<br>
&gt; +LIBDILL_CONF_OPTS +=3D --disable-threads<br>
&gt; +endif<br>
&gt; +<br>
&gt; +ifeq ($(BR2_PACKAGE_OPENSSL),y)<br>
&gt; +LIBDILL_DEPENDENCIES =3D openssl<br>
&gt; +LIBDILL_CONF_OPTS +=3D --enable-tls<br>
<br>
No &quot;else&quot; clause to explicitly disable?<br></blockquote><div><br>=
</div><div>Done.</div><div> <br></div><blockquote class=3D"gmail_quote" sty=
le=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddi=
ng-left:1ex">
<br>
&gt; +endif<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
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

--000000000000ab211805e4f8dde5--

--===============2924766246433842939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2924766246433842939==--
