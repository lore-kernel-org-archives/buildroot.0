Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 384CDC4332F
	for <buildroot@archiver.kernel.org>; Tue,  7 Nov 2023 15:44:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C176541E39;
	Tue,  7 Nov 2023 15:44:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C176541E39
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PIbpKCLyUEtg; Tue,  7 Nov 2023 15:43:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 95E5F4206F;
	Tue,  7 Nov 2023 15:43:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 95E5F4206F
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E9B4E1BF32E
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 15:43:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C27B460A94
 for <buildroot@lists.busybox.net>; Tue,  7 Nov 2023 15:43:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C27B460A94
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0-v41gto77-W for <buildroot@lists.busybox.net>;
 Tue,  7 Nov 2023 15:43:55 +0000 (UTC)
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4D5A0605E9
 for <buildroot@buildroot.org>; Tue,  7 Nov 2023 15:43:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4D5A0605E9
Received: by mail-ej1-x633.google.com with SMTP id
 a640c23a62f3a-9c5b313b3ffso880971666b.0
 for <buildroot@buildroot.org>; Tue, 07 Nov 2023 07:43:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699371833; x=1699976633;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yS0s+tUbztRGQNOFCChKQXO7ZEtsXUhl2vdMqX4glKA=;
 b=NWYGDihdSqD8yg9q7kjeHDlrGeZ5yI8mt00EbxIdtDnDCXakA/IdM+/2+8smTafcNN
 T4TjOkvuHDCf1bztnDnQjJ7FZT0r6LJIecnVMrET/z3IkFf0rfBiAM1Z2fvTEoPNJ6de
 a9NOiqj4bKVqvLvmjuZVjIgrV26BquMbJj+71cpLuXf6ZSevqlHYkeVooeDC1aYihqVa
 pXeJ/nNZjmmAS8WetGbZZ7LG+26iITvhGfK97I6QeGEHV+diFFEo9lzjjm1qDca94433
 Bn1OtHTbU1O2GNbfNExATVOviGtX8pyS3KeBrgvsoV4Q3TKYOdUC6Hy64WZ2qNhV6pjY
 gecw==
X-Gm-Message-State: AOJu0YzMcXS1PIFlzFdn5D7yjp54W5d1RycT9mLdpBLqVmSnbx1Dohfv
 B94+odeAfNRb4Lr4mg3c0BAAdtqPP2L7dWZLjcqlR+7K+ESrhfuE
X-Google-Smtp-Source: AGHT+IEBGuWnHTBcXTDM99KuJtZVr1EM6i8u8PlyMwuU2ro6mKPFsk/X117RCi/KB05cwEOWDlC1LqLneNunpVuGRqI=
X-Received: by 2002:a17:907:3e25:b0:9be:562:a44a with SMTP id
 hp37-20020a1709073e2500b009be0562a44amr18263821ejc.23.1699371833212; Tue, 07
 Nov 2023 07:43:53 -0800 (PST)
MIME-Version: 1.0
References: <20231105202555.359391-1-adam.duskett@amarulasolutions.com>
 <6d9e618d-0cfa-4f13-9cfa-bb677fb9c29b@mind.be>
 <CAHDQB6Opc5ZwVXu=iXFHTj3J-2xJAjSq14fkJ23kv597R3tkSQ@mail.gmail.com>
 <1ad60088-4e13-41ee-bb74-b1ef96ccb153@mind.be> <20231107101652.GB229059@scaer>
In-Reply-To: <20231107101652.GB229059@scaer>
From: Adam Duskett <adam.duskett@amarulasolutions.com>
Date: Tue, 7 Nov 2023 08:43:43 -0700
Message-ID: <CAHDQB6M6QBbUturRZU46kzzo-+Oqn-z5uQMCea7GMiaKFj0f=A@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1699371833; x=1699976633;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yS0s+tUbztRGQNOFCChKQXO7ZEtsXUhl2vdMqX4glKA=;
 b=VSi7qbPD539xydnaH8BRkJMEO5aiCNH+R7eGKSCM5qoKNcrtpJiVLssbiTGzzBSMN7
 6aSyhGwSEfj+LYRHV8sae71TXkXLCPWFzzB+xII0w/inyGP3cVCB4wINxnxiJc19y4HT
 vwRiDreLdrIM3iziP3yP1x4Y5uXK7FXuSZU0w=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=VSi7qbPD
Subject: Re: [Buildroot] [PATCH v2 01/24] package/python3: use upstream
 build system to disable berkeleydb module
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
Cc: Bernd Kuhls <bernd@kuhls.net>, James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org,
 Adam Duskett <aduskett@gmail.com>
Content-Type: multipart/mixed; boundary="===============4457554634594993403=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4457554634594993403==
Content-Type: multipart/alternative; boundary="00000000000075d365060991d6f0"

--00000000000075d365060991d6f0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

To be clear, I don't care either way. Feel free to squash or not. So long
as Python is at 3.12.0 the end goal is the same!

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



On Tue, Nov 7, 2023 at 3:17=E2=80=AFAM Yann E. MORIN <yann.morin.1998@free.=
fr>
wrote:

> Arnout, Adam, All,
>
> On 2023-11-07 09:50 +0100, Arnout Vandecappelle spake thusly:
> > On 06/11/2023 21:20, Adam Duskett wrote:
> > >Ah, I missed that comment.
> > >
> > >This would be up to you and Yann to deliberate on. I was told by Yann =
to
> > >run a `git am` on Bernds patch
> > >series and apply it to the beginning of the series. It's a good idea a=
s
> it
> > >makes migrating to Python 3.12.0
> > >easier in the case we need to revert, as the series has been
> > >thoroughly tested on 3.11 as well.
> >
> >  In that case, I disagree with Yann on this point :-)
> >
> >  The "use upstream build system" patches have little value by themselve=
s;
> > they're only useful to make updating the package easier. So it's totall=
y
> OK
> > to also revert all of those if we decide to revert the version bump.
>
> When I suggested Adam grab the series from Bernd, that series was not
> reviewed; it was not an endorsement of that series. Sorry if I did not
> make that clear enough...
>
> But since Adam was doing the version bump, and the version bump requires
> the migration, it made sense for the migration to be part of the series
> from Adam. Then I would have expected those preparatory patches to be
> reworked if needed, i.e. with a proper review of said patches while they
> were included in the series, rather than a mere git-am.
>
> My hope was that it would make the incremental migration easier to
> review, and the actual, final version bump also easier to digest.
>
> >  So the overriding concern in that case should be ease of review, I
> think.
> > And I expect that it will be a _lot_ easier to review if it's part of t=
he
> > version bump, because then it's just "use the upstream way of specifyin=
g
> > features to disable, and drop the now-redundant patches". With the
> > individual "use upstream build system" patches we have to check for eve=
ry
> > patch if it really does what it is supposed to do.
> >
> >  Now, this isn't sufficient reason to ask you to spin a v3, it should b=
e
> > easy enough to do the squashing while applying. That said, it's still a
> bit
> > of work, so we definitely won't complain if you spin a v3 :-)
> >
> >  But let's first wait if Yann has a counter-argument to me.
>
> Now that I briefly looked at the patches, I basically agree with Arnout,
> but...
>
> Not all patches migrating to the upstream build system need backports;
> such patches that do the migration *without backports* are interesting
> to have before the bumpi; some even allow us to drop our patches, which
> is a very good thing. The others, which require backports, should indeed
> be done with the version bump.
>
> *Unless* one of the no-backport options depends on another that requires
> a backport, of course. I understand that might be a bit difficult to
> assess, though.
>
> So, given Arnout's position, and the above point, I have not strong
> opinion about that; squashing all into the version bump might indeed be
> the easiest after all... In any case, squashing at the sender's or the
> receiver's end is easy enough.
>
> Regards,
> Yann E. MORIN.
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

--00000000000075d365060991d6f0
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">To be clear, I don&#39;t care either way. Feel free to squ=
ash=C2=A0or not. So long as Python is at 3.12.0 the end goal is the same!<d=
iv><br></div><div><div><div><div dir=3D"ltr" class=3D"gmail_signature" data=
-smartmail=3D"gmail_signature"><div dir=3D"ltr"><span><p dir=3D"ltr" style=
=3D"line-height:1.7999999999999998;margin-top:0pt;margin-bottom:0pt"><span =
style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);back=
ground-color:transparent;vertical-align:baseline;white-space:pre-wrap">Adam=
 Duskett</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;m=
argin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:=
&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transpa=
rent;vertical-align:baseline;white-space:pre-wrap">Senior Embedded Systems =
Developer</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family=
:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transp=
arent;vertical-align:baseline;white-space:pre-wrap">M. +1208-515-8102</span=
></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;=
margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu M=
ono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical-=
align:baseline;white-space:pre-wrap"><a href=3D"mailto:adam.duskett@amarula=
solutions.com" target=3D"_blank">adam.duskett@amarulasolutions.com</a></spa=
n></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt=
;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu =
Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertical=
-align:baseline;white-space:pre-wrap">__________________________________</s=
pan></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0=
pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubunt=
u Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;vertic=
al-align:baseline;white-space:pre-wrap"><br></span><span style=3D"font-size=
:10pt;font-family:Ubuntu,sans-serif;color:rgb(0,0,0);background-color:trans=
parent;vertical-align:baseline;white-space:pre-wrap">Amarula Solutions BV</=
span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:=
0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubun=
tu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;verti=
cal-align:baseline;white-space:pre-wrap">Joop Geesinkweg 125, 1114 AB, Amst=
erdam, NL</span></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;=
margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-family=
:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transp=
arent;vertical-align:baseline;white-space:pre-wrap">T. +31 (0)85 111 9170</=
span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,mono=
space;color:rgb(0,0,0);background-color:transparent;vertical-align:baseline=
;white-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-family=
:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transp=
arent;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:info@=
amarulasolutions.com" target=3D"_blank">info@amarulasolutions.com</a></span=
></p><p dir=3D"ltr" style=3D"line-height:1.7999999999999998;margin-top:0pt;=
margin-bottom:0pt"><a href=3D"http://www.amarulasolutions.com/" target=3D"_=
blank"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,mo=
nospace;color:rgb(0,0,0);background-color:transparent;vertical-align:baseli=
ne;white-space:pre-wrap">www.amarulasolutions.com</span></a></p><div><br></=
div></span></div></div></div><br></div></div></div><br><div class=3D"gmail_=
quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 7, 2023 at 3:17=E2=
=80=AFAM Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.=
morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote=
" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);=
padding-left:1ex">Arnout, Adam, All,<br>
<br>
On 2023-11-07 09:50 +0100, Arnout Vandecappelle spake thusly:<br>
&gt; On 06/11/2023 21:20, Adam Duskett wrote:<br>
&gt; &gt;Ah, I missed that comment.<br>
&gt; &gt;<br>
&gt; &gt;This would be up to you and Yann to deliberate on. I was told by Y=
ann to<br>
&gt; &gt;run a `git am` on Bernds patch<br>
&gt; &gt;series and apply it to the beginning of the series. It&#39;s a goo=
d idea as it<br>
&gt; &gt;makes migrating to Python 3.12.0<br>
&gt; &gt;easier in the case we need to revert, as the series has been<br>
&gt; &gt;thoroughly=C2=A0tested on 3.11 as well.<br>
&gt; <br>
&gt;=C2=A0 In that case, I disagree with Yann on this point :-)<br>
&gt; <br>
&gt;=C2=A0 The &quot;use upstream build system&quot; patches have little va=
lue by themselves;<br>
&gt; they&#39;re only useful to make updating the package easier. So it&#39=
;s totally OK<br>
&gt; to also revert all of those if we decide to revert the version bump.<b=
r>
<br>
When I suggested Adam grab the series from Bernd, that series was not<br>
reviewed; it was not an endorsement of that series. Sorry if I did not<br>
make that clear enough...<br>
<br>
But since Adam was doing the version bump, and the version bump requires<br=
>
the migration, it made sense for the migration to be part of the series<br>
from Adam. Then I would have expected those preparatory patches to be<br>
reworked if needed, i.e. with a proper review of said patches while they<br=
>
were included in the series, rather than a mere git-am.<br>
<br>
My hope was that it would make the incremental migration easier to<br>
review, and the actual, final version bump also easier to digest.<br>
<br>
&gt;=C2=A0 So the overriding concern in that case should be ease of review,=
 I think.<br>
&gt; And I expect that it will be a _lot_ easier to review if it&#39;s part=
 of the<br>
&gt; version bump, because then it&#39;s just &quot;use the upstream way of=
 specifying<br>
&gt; features to disable, and drop the now-redundant patches&quot;. With th=
e<br>
&gt; individual &quot;use upstream build system&quot; patches we have to ch=
eck for every<br>
&gt; patch if it really does what it is supposed to do.<br>
&gt; <br>
&gt;=C2=A0 Now, this isn&#39;t sufficient reason to ask you to spin a v3, i=
t should be<br>
&gt; easy enough to do the squashing while applying. That said, it&#39;s st=
ill a bit<br>
&gt; of work, so we definitely won&#39;t complain if you spin a v3 :-)<br>
&gt; <br>
&gt;=C2=A0 But let&#39;s first wait if Yann has a counter-argument to me.<b=
r>
<br>
Now that I briefly looked at the patches, I basically agree with Arnout,<br=
>
but...<br>
<br>
Not all patches migrating to the upstream build system need backports;<br>
such patches that do the migration *without backports* are interesting<br>
to have before the bumpi; some even allow us to drop our patches, which<br>
is a very good thing. The others, which require backports, should indeed<br=
>
be done with the version bump.<br>
<br>
*Unless* one of the no-backport options depends on another that requires<br=
>
a backport, of course. I understand that might be a bit difficult to<br>
assess, though.<br>
<br>
So, given Arnout&#39;s position, and the above point, I have not strong<br>
opinion about that; squashing all into the version bump might indeed be<br>
the easiest after all... In any case, squashing at the sender&#39;s or the<=
br>
receiver&#39;s end is easy enough.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
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

--00000000000075d365060991d6f0--

--===============4457554634594993403==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4457554634594993403==--
