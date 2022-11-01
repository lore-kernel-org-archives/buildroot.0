Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5595FC433FE
	for <buildroot@archiver.kernel.org>; Tue,  1 Nov 2022 20:31:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 04588409F1;
	Tue,  1 Nov 2022 20:31:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 04588409F1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2ogvyOakOMZi; Tue,  1 Nov 2022 20:31:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 838DE40A00;
	Tue,  1 Nov 2022 20:31:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 838DE40A00
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id CF55B1BF834
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:31:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A89E240A00
 for <buildroot@lists.busybox.net>; Tue,  1 Nov 2022 20:31:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A89E240A00
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kC-siZ1PyqrP for <buildroot@lists.busybox.net>;
 Tue,  1 Nov 2022 20:31:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 130D640868
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 130D640868
 for <buildroot@buildroot.org>; Tue,  1 Nov 2022 20:31:21 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-13bd19c3b68so18108722fac.7
 for <buildroot@buildroot.org>; Tue, 01 Nov 2022 13:31:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=HwLAsREMrFAQV3uU4T2PQcqXg32a79GwMas+xxcyslo=;
 b=Jgqc6Q0S7+ujmZdm1exERCl23gLbh3gvD9EQoYUsBaArsx9B6mFEdKQe8JpmeWUmvT
 6QDEfCwzZEXiFLTuxVp+Mx6u8FE6daqp7SYJHQZFCTULtO2I7kbDCfQF811B/F0nKuKY
 2fs4OB848g515V7T33XS1umqkXUgwQ5fNvbljhWDFohiPJobvpawtOfUHJdGObkeXGBJ
 XH11nVcSz72nQnkgEoeIDmVWHP/KquSsBnAq4TcS+lmMi+ND+4/uh3xU3MynNPbDBC+5
 iHM14sglp5cfrpmV0sWeAK6IuRd68SMC1hQey2UcOiwVz/zg4In0vqHJNr+m8oSRhOlK
 xEuQ==
X-Gm-Message-State: ACrzQf2dLTNsZDnmCEEOvTjc1TI9bHXuZP1FavH1Qc13/VO/BdWeRb+Q
 6cW6CeGWZPQDg1hbn7WWFSAIyQhojecS61XtjYwdpg==
X-Google-Smtp-Source: AMsMyM7xznZwJ6uBkN9iMavqwncLZMcBG4Fsd5xxYRPlW9wWISGruNJyvvQijbZz4ZjPB8HFiFR8AdMXTOJ9GgPeQBk=
X-Received: by 2002:a05:6870:3484:b0:136:c1aa:1da6 with SMTP id
 n4-20020a056870348400b00136c1aa1da6mr12525953oah.254.1667334681026; Tue, 01
 Nov 2022 13:31:21 -0700 (PDT)
MIME-Version: 1.0
References: <20221018234617.225947-1-giulio.benetti@benettiengineering.com>
 <20221031132519.4e5ebc69@windsurf> <20221031125405.GC1058960@scaer>
 <1e71c677-05cf-89b1-419f-df8e0f73ae63@benettiengineering.com>
 <20221101083206.GI2992523@scaer>
 <CA+_SqVZMnZvF2-n4HvrUUg1=k-VT4QBZGNAHZpoGM86y37fyuw@mail.gmail.com>
 <20221101174200.GJ2992523@scaer>
In-Reply-To: <20221101174200.GJ2992523@scaer>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 1 Nov 2022 21:30:46 +0100
Message-ID: <CA+_SqVb98RDNDW1F1SxrwKzti7A5M-M61r6A0uiXvaV3Ma4Krg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=HwLAsREMrFAQV3uU4T2PQcqXg32a79GwMas+xxcyslo=;
 b=FH0IFVpzwJEpceoYgnM6BBN83Y849BIHwkrer7xJ+novc+0DK03gUmIyM8clvd/DLp
 HcuE6pddOV8K8fe3oALv6HJRGqXbeZUM5YO6samz5CKe7PgXYQMNnlHNr56g500gO6TE
 Xt8iLWcmNXWhqpkqNzlOzZ8d4l17SQ0FVXMFw=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=FH0IFVpz
Subject: Re: [Buildroot] [PATCH] package/mono: allow to select which folders
 to install to target
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
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============1269528304572241236=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1269528304572241236==
Content-Type: multipart/alternative; boundary="000000000000627b0705ec6e9bdf"

--000000000000627b0705ec6e9bdf
Content-Type: text/plain; charset="UTF-8"

On Tue, Nov 1, 2022 at 6:42 PM Yann E. MORIN <yann.morin.1998@free.fr>
wrote:

> Angelo, All,
>
> On 2022-11-01 10:19 +0100, Angelo Compagnucci spake thusly:
> [--SNIP--]
> > My two cents. Historically, the mono configure was offering some
> > options to enable only some versions of the API which was lately
> > removed
> > So, removing older compatibility API folders should be perfectly
> > fine.
>
> Thanks for the confirmation! :-)
>
> My understanding, though, would be that we may need more than one such
> versionned API. For example, I would (hypothetically!) develope my app
> agaings current version, say 4.8-api, so I am using APIs from that
> version. Then I update to a newer mono, and I start using the new APIs,
> e.g. 5.3-api, in the new parts of my app, but the existing parts are
> still using 4.8-api, so I need both.
>

> Is that sensible, or did I mis-understood?
>
> If correct, then we need to be able to select more than one versioned
> API.
>


Last time I worked on a mono project was several years ago, so I'm a bit
rusty,

Not really sure you can mix and match assemblies from different versions,
never tried really.

Usually a developer updates the API target version in the application
manifest then rebuilds everything for the newer version.

From what I know, the various API versions are used to run a compiled
application against any mono installation. Usually a mono application is
distributed in binary form and so it needs the right assemblies for the
same version the application was compiled against.


> > We cannot remove the Global Assembly Cache (GAC).
>
> So, we an' rely on it being listed by the user; we must explicitly
> install it.
>
>     MONO_INSTALL_DIRS = \
>         gac \
>         $(fitler-out gac,$(call qstrip,$(BR2_PACKAGE_MONO_API_DIRS)))
>
>     $(foreach dir,$(MONO_INSTALL_DIRS),copy the $(d) dir)
>
>
I would say this looks right to me.

> For the rest, it would be nice if Giulio could do some testing (I can
> > try it too) to understand at what extent we can remove any other
> > folder.
>
> That would be awesome, thanks!
>
> Regards,
> Yann E. MORIN.
>
> --
>
> .-----------------.--------------------.------------------.--------------------.
> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
> conspiracy: |
> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>      |
> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There is
> no  |
> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>  conspiracy.  |
>
> '------------------------------^-------^------------------^--------------------'
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

--000000000000627b0705ec6e9bdf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Nov 1, 2022 at 6:42 PM Yann E=
. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">yann.morin.1998@free=
.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">Angelo, All,<br>
<br>
On 2022-11-01 10:19 +0100, Angelo Compagnucci spake thusly:<br>
[--SNIP--]<br>
&gt; My two cents. Historically, the mono configure was offering some<br>
&gt; options to enable only some versions of the API which was lately<br>
&gt; removed=C2=A0<br>
&gt; So, removing older compatibility API folders should be perfectly<br>
&gt; fine.<br>
<br>
Thanks for the confirmation! :-)<br>
<br>
My understanding, though, would be that we may need more than one such<br>
versionned API. For example, I would (hypothetically!) develope my app<br>
agaings current version, say 4.8-api, so I am using APIs from that<br>
version. Then I update to a newer mono, and I start using the new APIs,<br>
e.g. 5.3-api, in the new parts of my app, but the existing parts are<br>
still using 4.8-api, so I need both.<br></blockquote><blockquote class=3D"g=
mail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204=
,204,204);padding-left:1ex">
<br>
Is that sensible, or did I mis-understood?<br>
<br>
If correct, then we need to be able to select more than one versioned<br>
API.<br></blockquote><div><br></div><div><div><br></div><div>Last time I wo=
rked on a mono project was several years ago, so I&#39;m a bit rusty,<br></=
div><div><br></div><div>Not really sure you can mix and match assemblies fr=
om different versions, never tried really.</div><div><br></div><div>Usually=
 a developer updates the API target version in the application manifest the=
n rebuilds everything for the newer version.</div><div><br></div><div>From =
what I know, the various API versions are used to run a compiled applicatio=
n against any mono installation. Usually a mono application is distributed =
in binary form and so it needs the right assemblies for the same version th=
e application was compiled against.<br></div><div>=C2=A0<br></div></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex">
&gt; We cannot remove the Global Assembly Cache (GAC).<br>
<br>
So, we an&#39; rely on it being listed by the user; we must explicitly<br>
install it.<br>
<br>
=C2=A0 =C2=A0 MONO_INSTALL_DIRS =3D \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 gac \<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 $(fitler-out gac,$(call qstrip,$(BR2_PACKAGE_MO=
NO_API_DIRS)))<br>
<br>
=C2=A0 =C2=A0 $(foreach dir,$(MONO_INSTALL_DIRS),copy the $(d) dir)<br>
<br></blockquote><div><br></div><div>I would say this looks right to me.</d=
iv><div> <br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0p=
x 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; For the rest, it would be nice if Giulio could do some testing (I can<=
br>
&gt; try it too) to understand at what extent we can remove any other<br>
&gt; folder.<br>
<br>
That would be awesome, thanks!<br>
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

--000000000000627b0705ec6e9bdf--

--===============1269528304572241236==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1269528304572241236==--
