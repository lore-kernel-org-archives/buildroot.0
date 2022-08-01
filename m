Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A451FC00144
	for <buildroot@archiver.kernel.org>; Mon,  1 Aug 2022 17:58:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C43F60BA9;
	Mon,  1 Aug 2022 17:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C43F60BA9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id dyE52hoS8mUR; Mon,  1 Aug 2022 17:58:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 62FD560B3B;
	Mon,  1 Aug 2022 17:58:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 62FD560B3B
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D026F1BF33D
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:58:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B6EE640556
 for <buildroot@lists.busybox.net>; Mon,  1 Aug 2022 17:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B6EE640556
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y3u3xMQqfQAm for <buildroot@lists.busybox.net>;
 Mon,  1 Aug 2022 17:58:52 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 357B8400F2
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 357B8400F2
 for <buildroot@buildroot.org>; Mon,  1 Aug 2022 17:58:52 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id m8so14731885edd.9
 for <buildroot@buildroot.org>; Mon, 01 Aug 2022 10:58:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uYGIGKDceXONhS/ax3x9hfmCeG9AQYJY058zL5uL0Uw=;
 b=Rn3i2tyVzl8AkIMIoUagnLpzI1IwYjAUMgI7m/6N/vz1HgT7e3i7YLeGYYxGsFlwRj
 AHxw0Tko4YAS1V+t0yABCCklABCj6ejYzZF6clLbE1has4kNZKHP93h7Dcbe0pS0dWcX
 aKduyx2jAdJ2zGyOsCNjZQ5oglXchTDnGRXcsPimpurzAuvbpvW5BpNs/RntsPtlRGcq
 5KBiRx8+db7ZKdoAS8Y/kYW2AVydtjxhputKDYmiuJcNbdqV7DdZPsrmLhrZ8yZalqf+
 AdOnTJljTZj3ckSMI+tFqYwfLB3OyHXyNQgRFLhRmB0QmezFMxMx7vJ7QljSyrMMKOev
 n2QQ==
X-Gm-Message-State: ACgBeo02VbAd2MyIRpg9p/NNFWJ7n4Wl8DibRYtkoj+zNPIQUbmgIG9i
 XsRGTj+X6P8pewdtRExvuEXTmvB0/Uwgmj0jWqA=
X-Google-Smtp-Source: AA6agR7Rs5LO7SJ0D3LsBphsFeiKsrgvT1eMEVRvSipPMZAQK8rhv0xU+Gue5j/+OcakHPovtAvaPvaXdjdwqivHpRk=
X-Received: by 2002:a05:6402:2684:b0:43d:9964:d2a0 with SMTP id
 w4-20020a056402268400b0043d9964d2a0mr7186189edd.250.1659376730310; Mon, 01
 Aug 2022 10:58:50 -0700 (PDT)
MIME-Version: 1.0
References: <20220727192948.18653-1-guillaume.bressaix@gmail.com>
 <20220727192948.18653-4-guillaume.bressaix@gmail.com>
 <20220801194254.118219ec@windsurf>
In-Reply-To: <20220801194254.118219ec@windsurf>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Mon, 1 Aug 2022 19:58:23 +0200
Message-ID: <CAJe0E3e4wE+v16v9JQE-NDaXH+_9icVtHfPbTBW=ng5rr2EEYg@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=uYGIGKDceXONhS/ax3x9hfmCeG9AQYJY058zL5uL0Uw=;
 b=Phx4ikYpPdImi88KJdpO1//4/KAN1weYbJiPWFjwEVCd3PRF57a+m9FkkwaqACetPp
 sYvX2m3snHjNpfipCCo8J0mKz0Y9ODoQjvPqRRv0wb95IqZYdHzy5Wr80zgGtsE0wtQr
 /uj9Nc/VPWXV4QwZ5xXAUwkyaRiYZDgZRflD2AjQ98d5/S5iqvBO3Jq4b6Yv4VYbGxSL
 DWP3dUmPeAI/eEYl3bKcwAU2dgRY+EYdrZhzSLAzo25671bauZSmCF54/grcnhJgUywP
 sK/98+v+YdvcT1PLeIMemqhXXsHsbbRePInuT+m/hNHxhBgVGenadoYoaqKyO2RZqoKD
 CdUw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Phx4ikYp
Subject: Re: [Buildroot] [PATCH v5 4/4] package/python-scipy: new package
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
Cc: jmfriedt <jmfriedt@femto-st.fr>, "gwenhael.goavec" <gwen@trabucayre.com>,
 Jagan Teki <jagan@amarulasolutions.com>, Asaf Kahlon <asafka7@gmail.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============3812694484502981880=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3812694484502981880==
Content-Type: multipart/alternative; boundary="0000000000008f0b3605e531c004"

--0000000000008f0b3605e531c004
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,
thank you Thomas for merging this serie and also for adding the runtime
test, I did try to provide it but could not get it to work.
I will give it a try in the next few days

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le lun. 1 ao=C3=BBt 2022 =C3=A0 19:42, Thomas Petazzoni <thomas.petazzoni@b=
ootlin.com>
a =C3=A9crit :

> Hello,
>
> On Wed, 27 Jul 2022 21:29:48 +0200
> "Guillaume W. Bres" <guillaume.bressaix@gmail.com> wrote:
>
> > From: Jagan Teki <jagan@amarulasolutions.com>
> >
> > Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
> > [Arnout:
> >  - Indent hash file with two spaces.
> >  - Bump to 1.7.3 to fix build failure with recent GCC.
> >  - Get from github instead of PyPI.
> >  - Add host-meson and host-python-pythran dependencies.
> >  - Properly propagate Config.in dependencies.
> >  - Correct usage of BR2_INSTALL_LIBSTDCPP symbol.
> >  - Remove F77, no longer used.
> > ]
> > Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
> > [Guillaume:
> >  - -lnpymath: npymath.ini localization problem
> >  - -lnpyrandom resolution problem
> >  - fix legal-info for latest version LICENSE.txt
> >  - zlib is a scipy::io module runtime requirement
> >  - update serie for scipy 1.8.1 (latest)
> > ]
> > Signed-off-by: Guillaume W. Bres <guillaume.bressaix@gmail.com>
>
> I have applied, with the following changes:
>
>     [Thomas:
>      - add runtime test
>      - drop dependency on OpenBLAS, which is not needed in a minimal
>        configuration
>      - remove PYTHON_SCIPY_NPY_PKG_CONFIG_PATH logic as it is no longer
>        needed
>     ]
>
> Could you please:
>
>  (1) Review the runtime test, to see if it can be improved with some
>      better testing.
>
>  (2) Review the OpenBLAS dependency, to see if it needs to be added as
>      an optional dependency in some way.
>
> > +# Provide system configuration options to numpy distutils extenions,
> telling
> > +# to find all include files and libraries in staging directory.
> > +define PYTHON_SCIPY_CONFIGURE_CMDS
> > +     -rm -f $(@D)/site.cfg
> > +     echo "[DEFAULT]" >> $(@D)/site.cfg
> > +     echo "library_dirs =3D $(STAGING_DIR)/usr/lib" >> $(@D)/site.cfg
> > +     echo "include_dirs =3D $(STAGING_DIR)/usr/include" >> $(@D)/site.=
cfg
> > +endef
>
> This part is a bit annoying, as it's duplicated from python-numpy.mk. I
> looked a bit, but couldn't really find a good way of avoiding this
> duplication.
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--0000000000008f0b3605e531c004
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div>Hello,<br></div>thank you Thomas for merging thi=
s serie and also for adding the runtime test, I did try to provide it but c=
ould not get it to work.<br></div>I will give it a try in the next few days=
<br><div><div><br></div><div><div><div><div dir=3D"ltr" class=3D"gmail_sign=
ature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr"=
><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><font face=3D"arial,helve=
tica,sans-serif">Guillaume W. Bres<br></font></div><font face=3D"arial,helv=
etica,sans-serif">Software engineer</font><br></div><font face=3D"arial,hel=
vetica,sans-serif"></font></div><font face=3D"arial,helvetica,sans-serif">&=
lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_blank">guilla=
ume.bressaix@gmail.com</a>&gt;<br></font></div></div></div></div></div></di=
v><br></div></div></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">Le=C2=A0lun. 1 ao=C3=BBt 2022 =C3=A0=C2=A019:42, Th=
omas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.p=
etazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Hello,<br>
<br>
On Wed, 27 Jul 2022 21:29:48 +0200<br>
&quot;Guillaume W. Bres&quot; &lt;<a href=3D"mailto:guillaume.bressaix@gmai=
l.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt; wrote:<br>
<br>
&gt; From: Jagan Teki &lt;<a href=3D"mailto:jagan@amarulasolutions.com" tar=
get=3D"_blank">jagan@amarulasolutions.com</a>&gt;<br>
&gt; <br>
&gt; Signed-off-by: Jagan Teki &lt;<a href=3D"mailto:jagan@amarulasolutions=
.com" target=3D"_blank">jagan@amarulasolutions.com</a>&gt;<br>
&gt; [Arnout:<br>
&gt;=C2=A0 - Indent hash file with two spaces.<br>
&gt;=C2=A0 - Bump to 1.7.3 to fix build failure with recent GCC.<br>
&gt;=C2=A0 - Get from github instead of PyPI.<br>
&gt;=C2=A0 - Add host-meson and host-python-pythran dependencies.<br>
&gt;=C2=A0 - Properly propagate Config.in dependencies.<br>
&gt;=C2=A0 - Correct usage of BR2_INSTALL_LIBSTDCPP symbol.<br>
&gt;=C2=A0 - Remove F77, no longer used.<br>
&gt; ]<br>
&gt; Signed-off-by: Arnout Vandecappelle (Essensium/Mind) &lt;<a href=3D"ma=
ilto:arnout@mind.be" target=3D"_blank">arnout@mind.be</a>&gt;<br>
&gt; [Guillaume:<br>
&gt;=C2=A0 - -lnpymath: npymath.ini localization problem<br>
&gt;=C2=A0 - -lnpyrandom resolution problem<br>
&gt;=C2=A0 - fix legal-info for latest version LICENSE.txt<br>
&gt;=C2=A0 - zlib is a scipy::io module runtime requirement<br>
&gt;=C2=A0 - update serie for scipy 1.8.1 (latest)<br>
&gt; ]<br>
&gt; Signed-off-by: Guillaume W. Bres &lt;<a href=3D"mailto:guillaume.bress=
aix@gmail.com" target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br>
<br>
I have applied, with the following changes:<br>
<br>
=C2=A0 =C2=A0 [Thomas:<br>
=C2=A0 =C2=A0 =C2=A0- add runtime test<br>
=C2=A0 =C2=A0 =C2=A0- drop dependency on OpenBLAS, which is not needed in a=
 minimal<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0configuration<br>
=C2=A0 =C2=A0 =C2=A0- remove PYTHON_SCIPY_NPY_PKG_CONFIG_PATH logic as it i=
s no longer<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0needed<br>
=C2=A0 =C2=A0 ]<br>
<br>
Could you please:<br>
<br>
=C2=A0(1) Review the runtime test, to see if it can be improved with some<b=
r>
=C2=A0 =C2=A0 =C2=A0better testing.<br>
<br>
=C2=A0(2) Review the OpenBLAS dependency, to see if it needs to be added as=
<br>
=C2=A0 =C2=A0 =C2=A0an optional dependency in some way.<br>
<br>
&gt; +# Provide system configuration options to numpy distutils extenions, =
telling<br>
&gt; +# to find all include files and libraries in staging directory.<br>
&gt; +define PYTHON_SCIPY_CONFIGURE_CMDS<br>
&gt; +=C2=A0 =C2=A0 =C2=A0-rm -f $(@D)/site.cfg<br>
&gt; +=C2=A0 =C2=A0 =C2=A0echo &quot;[DEFAULT]&quot; &gt;&gt; $(@D)/site.cf=
g<br>
&gt; +=C2=A0 =C2=A0 =C2=A0echo &quot;library_dirs =3D $(STAGING_DIR)/usr/li=
b&quot; &gt;&gt; $(@D)/site.cfg<br>
&gt; +=C2=A0 =C2=A0 =C2=A0echo &quot;include_dirs =3D $(STAGING_DIR)/usr/in=
clude&quot; &gt;&gt; $(@D)/site.cfg<br>
&gt; +endef<br>
<br>
This part is a bit annoying, as it&#39;s duplicated from <a href=3D"http://=
python-numpy.mk" rel=3D"noreferrer" target=3D"_blank">python-numpy.mk</a>. =
I<br>
looked a bit, but couldn&#39;t really find a good way of avoiding this<br>
duplication.<br>
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

--0000000000008f0b3605e531c004--

--===============3812694484502981880==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3812694484502981880==--
