Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34F82CDB482
	for <buildroot@archiver.kernel.org>; Fri, 13 Oct 2023 13:57:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C74AD41EB0;
	Fri, 13 Oct 2023 13:57:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C74AD41EB0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pG3aPKp5mGhD; Fri, 13 Oct 2023 13:57:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0A07C41FEA;
	Fri, 13 Oct 2023 13:57:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0A07C41FEA
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7024B1BF995
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 13:57:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4940660644
 for <buildroot@lists.busybox.net>; Fri, 13 Oct 2023 13:57:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4940660644
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7HXzhlbWgz4t for <buildroot@lists.busybox.net>;
 Fri, 13 Oct 2023 13:57:43 +0000 (UTC)
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 98D3B600B9
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 13:57:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 98D3B600B9
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-9ada2e6e75fso372702366b.2
 for <buildroot@buildroot.org>; Fri, 13 Oct 2023 06:57:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697205462; x=1697810262;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SsDqStHWxLN6ncp+4aGp8ojOnhC+EhZwto/OIEBzWMQ=;
 b=LhP6IO+TZ28/bQO6Oe2/KXZz8h6pmRZ7IKug/Tke1NKG21UzcEKW0EozNm8LEDOTdw
 WEHdvx5Qp+4Ea/1Gi1yyt93lQtqnlzOFhhbvzLb/BdB3VvEjyuld2JttgXAW1TiS7veY
 YRzQqeLFbr2opx5BmMIH8qPkzsoYgM9MS7zi2f9fkM9tLRgpHvGPcYEpno5kSVqcxw4H
 J9pdMThBXTqIk9xQAr/TJLYwHriIN2Uk3NfUHww0dJp1GDzEUM7WWGbABsBmbcWiIMC3
 9iNXYqOf36OcG5WkWvBGAJ0IQ8U8M6EX0eHy7vefDROeEgdGbZFZSPmmXC5vqAdrEjym
 BLBQ==
X-Gm-Message-State: AOJu0YwVIOhPA+aW/5IyP+z16DPleZ77/CGtgAYAVizfKq23x2ey75oG
 whNIInMQGPgL2PFnTV2/Bf2fXZMXKY2ehqDkyr6FAg==
X-Google-Smtp-Source: AGHT+IEBh1lyUpxs985dCl636XXEyDGC7VDdwm3EbhuplA4BBJ1KyLjuJs1aeT5MjHbTHxM3m5RwSNImwtWyd3FaUSw=
X-Received: by 2002:a17:906:30d6:b0:9ad:a59f:331a with SMTP id
 b22-20020a17090630d600b009ada59f331amr22924410ejb.57.1697205461503; Fri, 13
 Oct 2023 06:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <4fa235baaa88440e806f3c5f8f8bcb58@physiomed.de>
 <94908e37-932a-4626-8fcb-c39d3293fe38@benettiengineering.com>
 <5ea9bca9-6e26-ad12-6bd0-c131a3281460@mind.be>
 <CAMdwsN-jxks4PzNd5dSZufgWVRSkBKMNMVzrTUv5ermh8TyY1A@mail.gmail.com>
 <CAHDQB6PpKpX_1nZtRaX_evWxa35GfOyXa4gVF2qvFKOJR0cyVQ@mail.gmail.com>
 <0df9596a80db41b88f9b83c5c254ea97@physiomed.de>
In-Reply-To: <0df9596a80db41b88f9b83c5c254ea97@physiomed.de>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Fri, 13 Oct 2023 15:57:29 +0200
Message-ID: <CAHDQB6MZjHG9EyUgugCbWgRQ=N0f0319817w4cb41DEvtRwSCg@mail.gmail.com>
To: =?UTF-8?Q?Sch=C3=A4ffner=2C_Florian?= <florian.schaeffner@physiomed.de>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1697205462; x=1697810262;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=SsDqStHWxLN6ncp+4aGp8ojOnhC+EhZwto/OIEBzWMQ=;
 b=NZiG8GiZF6Ex0KZiR1BgVadjhko6l5/Xb7ZUuIg1871FCSzT69U7e0/7cEKKJVNjth
 y/jrJy5uA1rXVULxVStVXXFDKvHXgAuLWOABXtjqUcMUvI/i240JHJdiRncG1nZnLbxY
 AYz5RdZPLljSFc9/eom18VOjtTRPcL5w6Q9B0=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=NZiG8GiZ
Subject: Re: [Buildroot] Future buildroot with QtQuick/QML Support
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Jesse Van Gavere <jesseevg@gmail.com>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4713333127969824444=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4713333127969824444==
Content-Type: multipart/alternative; boundary="000000000000a4f3e00607997013"

--000000000000a4f3e00607997013
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Jesse;

I have submitted an initial patch series to add the qt6shadertools package
to buildroot. Could you please test it and let me know if it works for you?
https://patchwork.ozlabs.org/project/buildroot/list/?series=3D377514

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



On Fri, Oct 13, 2023 at 1:24=E2=80=AFPM Sch=C3=A4ffner, Florian <
florian.schaeffner@physiomed.de> wrote:

> Hello all,
>
>
>
> thank you all for your support and offers. It would be great to give
> something back, but i=E2=80=99m afraid that i=E2=80=99m not able to finis=
h your work Jesse.
> Sadly by now i was just a user of the given configurations that could be
> downloaded. I=E2=80=99ll try to use Qt5 or hire some help. Thanks again f=
or your
> support.
>
> Kind regards
>
> Florian
>
>
>
> *Von:* Adam Duskett <adam.duskett@amarulasolutions.com>
> *Gesendet:* Dienstag, 10. Oktober 2023 21:52
> *An:* Jesse Van Gavere <jesseevg@gmail.com>
> *Cc:* Arnout Vandecappelle <arnout@mind.be>; Giulio Benetti <
> giulio.benetti@benettiengineering.com>; Sch=C3=A4ffner, Florian <
> florian.schaeffner@physiomed.de>; buildroot@buildroot.org
> *Betreff:* Re: [Buildroot] Future buildroot with QtQuick/QML Support
>
>
>
> I can see about porting the package tomorrow! No worries!
>
>
>
> Adam Duskett
>
> Senior Embedded Systems Developer
>
> M. +1208-515-8102
>
> adam.duskett@amarulasolutions.com
>
> __________________________________
>
>
> Amarula Solutions BV
>
> Joop Geesinkweg 125, 1114 AB, Amsterdam, NL
>
> T. +31 (0)85 111 9170
> info@amarulasolutions.com
>
> www.amarulasolutions.com
>
>
>
>
>
>
>
> On Tue, Oct 10, 2023 at 8:55=E2=80=AFPM Jesse Van Gavere <jesseevg@gmail.=
com>
> wrote:
>
> Hi,
>
> Op di 10 okt 2023 om 20:24 schreef Arnout Vandecappelle <arnout@mind.be>:
> >
> >
> >
> > On 10/10/2023 15:18, Giulio Benetti wrote:
> > > Hello Florian,
> > >
> > > On 10/10/23 14:59, Sch=C3=A4ffner, Florian wrote:
> > >> Hello,
> > >>
> > >> our application is built in the development environment with Qt 6 an=
d
> > >> QtQuick/QML. Now i tried, but wasn=E2=80=99t able to setup a working
> buildroot for our
> > >> application to run on a embedded device.
> > >>
> > >> I found the conversation about qt6 and QML Support on the buildroot
> mailing
> > >> list and that it seems to be not possible to setup a buildroot for
> our needs
> > >> with Qt6 and QML support.
> > >>
> > >>
> https://lore.kernel.org/buildroot/f22ce06d-d9cf-c561-7455-19dce724c158@be=
nettiengineering.com/
> > >>
> > >> If I understood the answer from Giulio Benetti correctly, there is
> currently
> > >> no chance to make this configuration work for our embedded board wit=
h
> buildroot?
> > >>
> > >> Can you please tell me if there will be support for this in the next
> major
> > >> buildroot version? Or is it not planned or foreseeable when a QML
> support is
> > >> possible with buildroot?
> >
> >   Buildroot is a volunteer project - nothing is "planned" unless someon=
e
> goes
> > through the effort of contributing it.
> >
> > > as I can see from Buildroot patchork at the moment there is no pendin=
g
> > > patches to add features, but this doesn't mean it won't be added.
> > >
> > > Which modules would you be interested in most of all?
> >
> >   If you're not able or willing to develop the Qt6 QML support yourself=
,
> you may
> > want to hire some help to do it. At the bottom of the "support" page on
> the
> > website [1] some companies are mentioned that can provide that help (I
> work for
> > one of them). Or you can find a freelancer - like Giulio.
> >
> >   You can also ask the original contributor of Qt6 (Jesse, added in Cc)
> if they
> > perhaps have some PoC for QML already. Or perhaps their employer would =
be
> > willing to share the cost of developing it.
>
> I do have a working POC to build QML with a plan for supporting
> QtQuick, which I very much wanted to get upstreamed, however I've been
> swamped with other non-buildroot work sadly.
> That said, it should be very doable to add this support with not too much
> work.
> In a nutshell:
> You need to add qtshadertools because of the qsb tool it builds, this
> is a dependency for qtdeclarative to build QtQuick
> This patch will be important:
>
> http://patchwork.ozlabs.org/project/buildroot/patch/20230808172231.111469=
6-1-jesse.vangavere@scioteq.com/
> The tricky thing there is that the host qt package does not build the
> GUI by default, however since qt6 certain tools need to be built
> through the host package, qsb is one of those, and to actually build
> qsb through the qtshadertools package you need GUI support in the host
> build, Thomas has provided some valuable feedback there how a proper
> follow up patch could look like to add this functionality the right
> way.
>
> Once that's done QML/QtQuick will be quite trivial to add, I already
> have a qt6declarative package you could work with and (with some
> refreshing of my memory) I could provide you the necessary config
> options to add QtQuick alongside it.
>
> As said I don't have the time myself at the moment to do it right, and
> I don't have a timeline for when I'll be able to do so, but if you're
> willing to continue on the work I have to get it merged in, I'll
> gladly help out where I can with some of my initial work and what I
> know of how to get it all working, the finishing touches and testing
> will be up to you however :)
>
> >
> >   Regards,
> >   Arnout
> >
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>
>

--000000000000a4f3e00607997013
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Jesse;<div><br></div><div>I have submitted an initial patc=
h series to add the qt6shadertools package to buildroot. Could you please t=
est it and let me know if it works for you?</div><div><a href=3D"https://pa=
tchwork.ozlabs.org/project/buildroot/list/?series=3D377514">https://patchwo=
rk.ozlabs.org/project/buildroot/list/?series=3D377514</a><br></div><div><br=
></div><div>Thanks!</div><div><br clear=3D"all"><div><div dir=3D"ltr" class=
=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D"ltr"><s=
pan><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;m=
argin-bottom:0pt"><span style=3D"font-size:10pt;font-family:Ubuntu,sans-ser=
if;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline;wh=
ite-space:pre-wrap">Adam Duskett</span></p><p dir=3D"ltr" style=3D"line-hei=
ght:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"fon=
t-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);=
background-color:transparent;vertical-align:baseline;white-space:pre-wrap">=
Senior Embedded Systems Developer</span></p><p dir=3D"ltr" style=3D"line-he=
ight:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
>M. +1208-515-8102</span></p><p dir=3D"ltr" style=3D"line-height:1.79999999=
99999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;fo=
nt-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-col=
or:transparent;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mai=
lto:adam.duskett@amarulasolutions.com" target=3D"_blank">adam.duskett@amaru=
lasolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.7999999=
999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;f=
ont-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-co=
lor:transparent;vertical-align:baseline;white-space:pre-wrap">_____________=
_____________________</span></p><p dir=3D"ltr" style=3D"line-height:1.79999=
99999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt=
;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-=
color:transparent;vertical-align:baseline;white-space:pre-wrap"><br></span>=
<span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0=
);background-color:transparent;vertical-align:baseline;white-space:pre-wrap=
">Amarula Solutions BV</span></p><p dir=3D"ltr" style=3D"line-height:1.7999=
999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10p=
t;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background=
-color:transparent;vertical-align:baseline;white-space:pre-wrap">Joop Geesi=
nkweg 125, 1114 AB, Amsterdam, NL</span></p><p dir=3D"ltr" style=3D"line-he=
ight:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"fo=
nt-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
>T. +31 (0)85 111 9170</span><span style=3D"font-size:10pt;font-family:&quo=
t;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent=
;vertical-align:baseline;white-space:pre-wrap"><br></span><span style=3D"fo=
nt-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0)=
;background-color:transparent;vertical-align:baseline;white-space:pre-wrap"=
><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@amarul=
asolutions.com</a></span></p><p dir=3D"ltr" style=3D"line-height:1.79999999=
99999998;margin-top:0pt;margin-bottom:0pt"><a href=3D"http://www.amarulasol=
utions.com/" target=3D"_blank"><span style=3D"font-size:10pt;font-family:&q=
uot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transpare=
nt;vertical-align:baseline;white-space:pre-wrap">www.amarulasolutions.com</=
span></a></p><div><br></div></span></div></div></div><br></div></div><br><d=
iv class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Oct =
13, 2023 at 1:24=E2=80=AFPM Sch=C3=A4ffner, Florian &lt;<a href=3D"mailto:f=
lorian.schaeffner@physiomed.de">florian.schaeffner@physiomed.de</a>&gt; wro=
te:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px =
0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><div class=
=3D"msg2333670405935691736">





<div lang=3D"DE" style=3D"overflow-wrap: break-word;">
<div class=3D"m_2333670405935691736WordSection1">
<p class=3D"MsoNormal"><span>Hello all,<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<p class=3D"MsoNormal"><span>thank you all for your support and offers. It =
would be great to give something back, but i=E2=80=99m afraid that i=E2=80=
=99m not able to finish your work Jesse. Sadly by now i was just a user of =
the given configurations
 that could be downloaded. I=E2=80=99ll try to use Qt5 or hire some help. T=
hanks again for your support.<br>
<br>
Kind regards<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span>Florian<u></u><u></u></span></p>
<p class=3D"MsoNormal"><span><u></u>=C2=A0<u></u></span></p>
<div style=3D"border-right:none;border-bottom:none;border-left:none;border-=
top:1pt solid rgb(225,225,225);padding:3pt 0cm 0cm">
<p class=3D"MsoNormal"><b>Von:</b> Adam Duskett &lt;<a href=3D"mailto:adam.=
duskett@amarulasolutions.com" target=3D"_blank">adam.duskett@amarulasolutio=
ns.com</a>&gt;
<br>
<b>Gesendet:</b> Dienstag, 10. Oktober 2023 21:52<br>
<b>An:</b> Jesse Van Gavere &lt;<a href=3D"mailto:jesseevg@gmail.com" targe=
t=3D"_blank">jesseevg@gmail.com</a>&gt;<br>
<b>Cc:</b> Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be" targe=
t=3D"_blank">arnout@mind.be</a>&gt;; Giulio Benetti &lt;<a href=3D"mailto:g=
iulio.benetti@benettiengineering.com" target=3D"_blank">giulio.benetti@bene=
ttiengineering.com</a>&gt;; Sch=C3=A4ffner, Florian &lt;<a href=3D"mailto:f=
lorian.schaeffner@physiomed.de" target=3D"_blank">florian.schaeffner@physio=
med.de</a>&gt;; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank=
">buildroot@buildroot.org</a><br>
<b>Betreff:</b> Re: [Buildroot] Future buildroot with QtQuick/QML Support<u=
></u><u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<p class=3D"MsoNormal">I can see about porting the package tomorrow! No wor=
ries!<u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<div>
<div>
<div>
<p style=3D"margin:0cm"><span style=3D"font-size:10pt;font-family:Ubuntu,sa=
ns-serif;color:black">Adam Duskett</span><u></u><u></u></p>
<p style=3D"margin:0cm"><span style=3D"font-size:10pt;font-family:&quot;Ubu=
ntu Mono&quot;;color:black">Senior Embedded Systems Developer</span><u></u>=
<u></u></p>
<p style=3D"margin:0cm"><span style=3D"font-size:10pt;font-family:&quot;Ubu=
ntu Mono&quot;;color:black">M. +1208-515-8102</span><u></u><u></u></p>
<p style=3D"margin:0cm"><a href=3D"mailto:adam.duskett@amarulasolutions.com=
" target=3D"_blank"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu =
Mono&quot;">adam.duskett@amarulasolutions.com</span></a><u></u><u></u></p>
<p style=3D"margin:0cm"><span style=3D"font-size:10pt;font-family:&quot;Ubu=
ntu Mono&quot;;color:black">__________________________________</span><u></u=
><u></u></p>
<p style=3D"margin:0cm"><span style=3D"font-size:10pt;font-family:&quot;Ubu=
ntu Mono&quot;;color:black"><br>
</span><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:bl=
ack">Amarula Solutions BV</span><u></u><u></u></p>
<p style=3D"margin:0cm"><span style=3D"font-size:10pt;font-family:&quot;Ubu=
ntu Mono&quot;;color:black">Joop Geesinkweg 125, 1114 AB, Amsterdam, NL</sp=
an><u></u><u></u></p>
<p style=3D"margin:0cm"><span style=3D"font-size:10pt;font-family:&quot;Ubu=
ntu Mono&quot;;color:black">T. +31 (0)85 111 9170<br>
</span><a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank"><span=
 style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;">info@amarulas=
olutions.com</span></a><u></u><u></u></p>
<p style=3D"margin:0cm"><a href=3D"http://www.amarulasolutions.com/" target=
=3D"_blank"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quo=
t;;color:black">www.amarulasolutions.com</span></a><u></u><u></u></p>
<div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
</div>
</div>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
</div>
<p class=3D"MsoNormal"><u></u>=C2=A0<u></u></p>
<div>
<div>
<p class=3D"MsoNormal">On Tue, Oct 10, 2023 at 8:55=E2=80=AFPM Jesse Van Ga=
vere &lt;<a href=3D"mailto:jesseevg@gmail.com" target=3D"_blank">jesseevg@g=
mail.com</a>&gt; wrote:<u></u><u></u></p>
</div>
<blockquote style=3D"border-top:none;border-right:none;border-bottom:none;b=
order-left:1pt solid rgb(204,204,204);padding:0cm 0cm 0cm 6pt;margin:5pt 0c=
m 5pt 4.8pt">
<p class=3D"MsoNormal">Hi,<br>
<br>
Op di 10 okt 2023 om 20:24 schreef Arnout Vandecappelle &lt;<a href=3D"mail=
to:arnout@mind.be" target=3D"_blank">arnout@mind.be</a>&gt;:<br>
&gt;<br>
&gt;<br>
&gt;<br>
&gt; On 10/10/2023 15:18, Giulio Benetti wrote:<br>
&gt; &gt; Hello Florian,<br>
&gt; &gt;<br>
&gt; &gt; On 10/10/23 14:59, Sch=C3=A4ffner, Florian wrote:<br>
&gt; &gt;&gt; Hello,<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; our application is built in the development environment with =
Qt 6 and<br>
&gt; &gt;&gt; QtQuick/QML. Now i tried, but wasn=E2=80=99t able to setup a =
working buildroot for our<br>
&gt; &gt;&gt; application to run on a embedded device.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; I found the conversation about qt6 and QML Support on the bui=
ldroot mailing<br>
&gt; &gt;&gt; list and that it seems to be not possible to setup a buildroo=
t for our needs<br>
&gt; &gt;&gt; with Qt6 and QML support.<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; <a href=3D"https://lore.kernel.org/buildroot/f22ce06d-d9cf-c5=
61-7455-19dce724c158@benettiengineering.com/" target=3D"_blank">
https://lore.kernel.org/buildroot/f22ce06d-d9cf-c561-7455-19dce724c158@bene=
ttiengineering.com/</a><br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; If I understood the answer from Giulio Benetti correctly, the=
re is currently<br>
&gt; &gt;&gt; no chance to make this configuration work for our embedded bo=
ard with buildroot?<br>
&gt; &gt;&gt;<br>
&gt; &gt;&gt; Can you please tell me if there will be support for this in t=
he next major<br>
&gt; &gt;&gt; buildroot version? Or is it not planned or foreseeable when a=
 QML support is<br>
&gt; &gt;&gt; possible with buildroot?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Buildroot is a volunteer project - nothing is &quot;planne=
d&quot; unless someone goes<br>
&gt; through the effort of contributing it.<br>
&gt;<br>
&gt; &gt; as I can see from Buildroot patchork at the moment there is no pe=
nding<br>
&gt; &gt; patches to add features, but this doesn&#39;t mean it won&#39;t b=
e added.<br>
&gt; &gt;<br>
&gt; &gt; Which modules would you be interested in most of all?<br>
&gt;<br>
&gt;=C2=A0 =C2=A0If you&#39;re not able or willing to develop the Qt6 QML s=
upport yourself, you may<br>
&gt; want to hire some help to do it. At the bottom of the &quot;support&qu=
ot; page on the<br>
&gt; website [1] some companies are mentioned that can provide that help (I=
 work for<br>
&gt; one of them). Or you can find a freelancer - like Giulio.<br>
&gt;<br>
&gt;=C2=A0 =C2=A0You can also ask the original contributor of Qt6 (Jesse, a=
dded in Cc) if they<br>
&gt; perhaps have some PoC for QML already. Or perhaps their employer would=
 be<br>
&gt; willing to share the cost of developing it.<br>
<br>
I do have a working POC to build QML with a plan for supporting<br>
QtQuick, which I very much wanted to get upstreamed, however I&#39;ve been<=
br>
swamped with other non-buildroot work sadly.<br>
That said, it should be very doable to add this support with not too much w=
ork.<br>
In a nutshell:<br>
You need to add qtshadertools because of the qsb tool it builds, this<br>
is a dependency for qtdeclarative to build QtQuick<br>
This patch will be important:<br>
<a href=3D"http://patchwork.ozlabs.org/project/buildroot/patch/202308081722=
31.1114696-1-jesse.vangavere@scioteq.com/" target=3D"_blank">http://patchwo=
rk.ozlabs.org/project/buildroot/patch/20230808172231.1114696-1-jesse.vangav=
ere@scioteq.com/</a><br>
The tricky thing there is that the host qt package does not build the<br>
GUI by default, however since qt6 certain tools need to be built<br>
through the host package, qsb is one of those, and to actually build<br>
qsb through the qtshadertools package you need GUI support in the host<br>
build, Thomas has provided some valuable feedback there how a proper<br>
follow up patch could look like to add this functionality the right<br>
way.<br>
<br>
Once that&#39;s done QML/QtQuick will be quite trivial to add, I already<br=
>
have a qt6declarative package you could work with and (with some<br>
refreshing of my memory) I could provide you the necessary config<br>
options to add QtQuick alongside it.<br>
<br>
As said I don&#39;t have the time myself at the moment to do it right, and<=
br>
I don&#39;t have a timeline for when I&#39;ll be able to do so, but if you&=
#39;re<br>
willing to continue on the work I have to get it merged in, I&#39;ll<br>
gladly help out where I can with some of my initial work and what I<br>
know of how to get it all working, the finishing touches and testing<br>
will be up to you however :)<br>
<br>
&gt;<br>
&gt;=C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0Arnout<br>
&gt;<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" target=
=3D"_blank">https://lists.buildroot.org/mailman/listinfo/buildroot</a><u></=
u><u></u></p>
</blockquote>
</div>
</div>
</div>

</div></blockquote></div>

--000000000000a4f3e00607997013--

--===============4713333127969824444==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4713333127969824444==--
