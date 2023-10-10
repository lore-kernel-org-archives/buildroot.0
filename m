Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6104CD8CB7
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 19:52:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03C8D40544;
	Tue, 10 Oct 2023 19:52:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 03C8D40544
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ox_eNXnYIvTE; Tue, 10 Oct 2023 19:52:35 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 819CC405B7;
	Tue, 10 Oct 2023 19:52:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 819CC405B7
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 2CD281BF2CD
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 19:52:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 055C5401D5
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 19:52:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 055C5401D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CLEvsIUw0rAp for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 19:52:31 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 86ED3400B9
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 19:52:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 86ED3400B9
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99c1c66876aso1098356866b.2
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 12:52:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696967549; x=1697572349;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Kc4iisFBMLtat0nOGE4bLcsIcGtOVScogLMWLid9eiU=;
 b=GcV8bMOStRij+GkcllDFLnsUdTDlrry0IQlQI/SPV1bYsGb28K7/eLCMLr2KrZvpvH
 iLxLs2s0ab5JJqdqABWP75b/iGIZP5ja5yYKwcdSc6BAG6VxU0802rhBdYSwQ2NM6k8m
 b7fY8YL8TElj+blvs9ZHP89rTexxqq5SQbp2uAH01YOwqVg2KIF1YEqXtmUo5X4nAhWc
 +BxbtBS76b8CUgMxzQggF0/QlgtSFA00hkQy2u+Kslepc/YMcFTAihN96g/MNVzCrFUJ
 WEUyJBghMyazrEza0+MOgTDUCvs3LPqEOTMd4o6qSrvExwtbBpjvSSv4KBxgW+yw5XV8
 5Zmw==
X-Gm-Message-State: AOJu0YxFc8aeBj/m2oWSB5Q/YsGXPevfIMzApmdBejSBCFcui5r2DS9Y
 2FHfnU2szjEThMl7WtH61xo1WBUy1o2r26jyp55VThzZsJg9G6OlE1g=
X-Google-Smtp-Source: AGHT+IGw2Fl1w2nRWY1cGGWN/oOf4a5f1m/HJyqI0kz0kV/Gc3YoX6uENlgjNxp+xk3zoicp5Lj8CneF1P/kt7TyFmw=
X-Received: by 2002:a17:906:319a:b0:9a5:9f8d:770 with SMTP id
 26-20020a170906319a00b009a59f8d0770mr17440459ejy.46.1696967549282; Tue, 10
 Oct 2023 12:52:29 -0700 (PDT)
MIME-Version: 1.0
References: <4fa235baaa88440e806f3c5f8f8bcb58@physiomed.de>
 <94908e37-932a-4626-8fcb-c39d3293fe38@benettiengineering.com>
 <5ea9bca9-6e26-ad12-6bd0-c131a3281460@mind.be>
 <CAMdwsN-jxks4PzNd5dSZufgWVRSkBKMNMVzrTUv5ermh8TyY1A@mail.gmail.com>
In-Reply-To: <CAMdwsN-jxks4PzNd5dSZufgWVRSkBKMNMVzrTUv5ermh8TyY1A@mail.gmail.com>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 10 Oct 2023 21:52:18 +0200
Message-ID: <CAHDQB6PpKpX_1nZtRaX_evWxa35GfOyXa4gVF2qvFKOJR0cyVQ@mail.gmail.com>
To: Jesse Van Gavere <jesseevg@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1696967549; x=1697572349;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Kc4iisFBMLtat0nOGE4bLcsIcGtOVScogLMWLid9eiU=;
 b=ZDCLCh8/eob4bM7pyd/uJ8j4uHBwFnj2eGn3PFUwktCoJd/KmvxvCffJTceVfE9Yc3
 90VTZaufJV+RTdQrbOA5wvIoyc6kREb8Dpzk+/CumvJi/KZRnQsAMFzDufbLCUX8S76y
 IAOHAZdNnwdtnueE+s47Jq8Q+uSs5a2j6rHzQ=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=ZDCLCh8/
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
 =?UTF-8?Q?Sch=C3=A4ffner=2C_Florian?= <florian.schaeffner@physiomed.de>,
 "buildroot@buildroot.org" <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1188754780245114506=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1188754780245114506==
Content-Type: multipart/alternative; boundary="000000000000f88aa70607620b4d"

--000000000000f88aa70607620b4d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I can see about porting the package tomorrow! No worries!

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



On Tue, Oct 10, 2023 at 8:55=E2=80=AFPM Jesse Van Gavere <jesseevg@gmail.co=
m> wrote:

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

--000000000000f88aa70607620b4d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">I can see about porting the package tomorrow! No worries!<=
div><br></div><div><div dir=3D"ltr" class=3D"gmail_signature" data-smartmai=
l=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" style=3D"line-h=
eight:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span style=3D"f=
ont-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-col=
or:transparent;vertical-align:baseline;white-space:pre-wrap">Adam Duskett</=
span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubun=
tu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;verti=
cal-align:baseline;white-space:pre-wrap">Senior Embedded Systems Developer<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubu=
ntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vert=
ical-align:baseline;white-space:pre-wrap">M. +1208-515-8102</span></p><p di=
r=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,=
monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:base=
line;white-space:pre-wrap"><a href=3D"mailto:adam.duskett@amarulasolutions.=
com" target=3D"_blank">adam.duskett@amarulasolutions.com</a></span></p><p d=
ir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bo=
ttom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;=
,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:bas=
eline;white-space:pre-wrap">__________________________________</span></p><p=
 dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-=
bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quo=
t;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:b=
aseline;white-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font=
-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:transparent;ver=
tical-align:baseline;white-space:pre-wrap">Amarula Solutions BV</span></p><=
p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin=
-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&qu=
ot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-align:=
baseline;white-space:pre-wrap">Joop Geesinkweg 125, 1114 AB, Amsterdam, NL<=
/span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top=
:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubu=
ntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vert=
ical-align:baseline;white-space:pre-wrap">T. +31 (0)85 111 9170</span><span=
 style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;colo=
r:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-spa=
ce:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family:&quot;Ubu=
ntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vert=
ical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:info@amarulasol=
utions.com" target=3D"_blank">info@amarulasolutions.com</a></span></p><p di=
r=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bot=
tom:0pt"><a href=3D"http://www.amarulasolutions.com/" target=3D"_blank"><sp=
an style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;co=
lor:rgb(0,0,0);background-color:transparent;vertical-align:baseline;white-s=
pace:pre-wrap">www.amarulasolutions.com</span></a></p><div><br></div></span=
></div></div></div><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr=
" class=3D"gmail_attr">On Tue, Oct 10, 2023 at 8:55=E2=80=AFPM Jesse Van Ga=
vere &lt;<a href=3D"mailto:jesseevg@gmail.com">jesseevg@gmail.com</a>&gt; w=
rote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi,<br>
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
61-7455-19dce724c158@benettiengineering.com/" rel=3D"noreferrer" target=3D"=
_blank">https://lore.kernel.org/buildroot/f22ce06d-d9cf-c561-7455-19dce724c=
158@benettiengineering.com/</a><br>
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
31.1114696-1-jesse.vangavere@scioteq.com/" rel=3D"noreferrer" target=3D"_bl=
ank">http://patchwork.ozlabs.org/project/buildroot/patch/20230808172231.111=
4696-1-jesse.vangavere@scioteq.com/</a><br>
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
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div>

--000000000000f88aa70607620b4d--

--===============1188754780245114506==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1188754780245114506==--
