Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76B96C43334
	for <buildroot@archiver.kernel.org>; Wed,  1 Jun 2022 21:55:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 19B058333E;
	Wed,  1 Jun 2022 21:55:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S3COY7WcHhiZ; Wed,  1 Jun 2022 21:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB7D083148;
	Wed,  1 Jun 2022 21:55:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 02AB21BF36A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DD45760C1A
 for <buildroot@lists.busybox.net>; Wed,  1 Jun 2022 21:55:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wsngiX5jiARV for <buildroot@lists.busybox.net>;
 Wed,  1 Jun 2022 21:55:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BD0ED60B2C
 for <buildroot@buildroot.org>; Wed,  1 Jun 2022 21:55:38 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id gi33so6414614ejc.3
 for <buildroot@buildroot.org>; Wed, 01 Jun 2022 14:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JPGMGBueHlcYS2fpXdLhgK3DQUqfnw73PCUwZvkZ8E4=;
 b=qMdkQZDGSlqeiUArCWhbPmfQ+ACeZXzGbSFsCQqPLwhseUeuyF8fcP0gJmAwbiywrV
 315gRKFvvwkaGkKfevZKpIgdTKDvsFrqGQGFWTCq3unQWAK7zMzjuhBTocCTGsOQkKrR
 iGdjHNv0NQdz+BvA/d5TLcMOUndJ9YYbm7PM0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JPGMGBueHlcYS2fpXdLhgK3DQUqfnw73PCUwZvkZ8E4=;
 b=w3QEkP1VMWXDTjN+SxVOfxsfQhp6UtKKxDdvobW2lUL6y9H0Q+1dmwtVtosILQVHr6
 C8JvrAFbNgBhkyl4c2ZBSadQ+TRJGmkSDdpC7Us+Qyh0PLDaFZCfZ3Or7/K5TOM7KaPQ
 e7WcHRMSuyFm19RzEZMRkYd7xe8wwZv4auOM2PpsEQoQImVGd4wabOkfZmBZcoCxY13k
 xlx8B3e3A7qpYciIz3NHaFPOVEKjjeT8BQwqrYFKdTACXHTZmRP3vOM3ZO3u/WkAuHRJ
 c7lhkjcJLFUMFgVQh+Lsoz0fGi274FtDqx5kmFiLG+VWJqpkkdZHddOKNtoCrpOdjFdU
 QFww==
X-Gm-Message-State: AOAM533+xOexY5t6C+YOiCQzIWk9Mcm3jWOMQWROexshQHK5Z2GEc9CK
 Duci53bCgjlMoAmObYRH95GbI0DGz2z15BPk05PN1g==
X-Google-Smtp-Source: ABdhPJwr0huP28H8kE73o1kzfKTE++CFFBpKsGLdm4eE2MuLm3KOMo/8DgqP5fSgiFCBso+fo+UoZUysnkn7sdtEAb4=
X-Received: by 2002:a17:906:a397:b0:6fe:a1e5:de70 with SMTP id
 k23-20020a170906a39700b006fea1e5de70mr1497707ejz.2.1654120536845; Wed, 01 Jun
 2022 14:55:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-2-angelo@amarulasolutions.com>
 <20220601212111.716a33cd@windsurf>
In-Reply-To: <20220601212111.716a33cd@windsurf>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Wed, 1 Jun 2022 23:55:00 +0200
Message-ID: <CA+_SqVacVxJkhC13fussgw9Pctmr8zrbc2DBs0m0+sqxNFfQZw@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Subject: Re: [Buildroot] [PATCH 1/4] package/wpa_supplicant: fixing "Invalid
 configuration line"
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
Cc: jagan@amarulasolutions.com, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1583983797261571825=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1583983797261571825==
Content-Type: multipart/alternative; boundary="00000000000003ca6c05e069f3dd"

--00000000000003ca6c05e069f3dd
Content-Type: text/plain; charset="UTF-8"

On Wed, Jun 1, 2022 at 9:21 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Fri, 27 May 2022 12:33:32 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > Default configuration file is wrong for the default compiling options.
> >
> > Fixes:
> >
> > Successfully initialized wpa_supplicant
> > Line 1: unknown global field 'ctrl_interface=/var/run/wpa_supplicant'.
> > Line 1: Invalid configuration line
> > 'ctrl_interface=/var/run/wpa_supplicant'.
> > Failed to read or parse configuration '/etc/wpa_supplicant.conf'.
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>
> Indeed, this option only makes sense when
> BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y I suppose. However, in this
> case, it makes sense a lot of sense to have this option in the config
> file.
>
> Should we have some kind of logic to add this line when
> BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y ?
>
> Maybe something like this:
>
> # ctrl_interface=/var/run/wpa_supplicant #
> BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE
>
> and a bit of $(SED) magic in the .mk file ?
>

No need to have this logic in my opinion:
* the option has a sensible default when enabled
* If a user really needs to change the default, he can add that line
manually in an overlay file.


>
> Best regards,
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

--00000000000003ca6c05e069f3dd
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Wed, Jun 1, 2022 at 9:21 PM Thomas=
 Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petaz=
zoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Fri, 27 May 2022 12:33:32 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com" targe=
t=3D"_blank">angelo@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; Default configuration file is wrong for the default compiling options.=
<br>
&gt; <br>
&gt; Fixes:<br>
&gt; <br>
&gt; Successfully initialized wpa_supplicant<br>
&gt; Line 1: unknown global field &#39;ctrl_interface=3D/var/run/wpa_suppli=
cant&#39;.<br>
&gt; Line 1: Invalid configuration line<br>
&gt; &#39;ctrl_interface=3D/var/run/wpa_supplicant&#39;.<br>
&gt; Failed to read or parse configuration &#39;/etc/wpa_supplicant.conf&#3=
9;.<br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarula=
solutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
<br>
Indeed, this option only makes sense when<br>
BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=3Dy I suppose. However, in this<br>
case, it makes sense a lot of sense to have this option in the config<br>
file.<br>
<br>
Should we have some kind of logic to add this line when<br>
BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=3Dy ?<br>
<br>
Maybe something like this:<br>
<br>
# ctrl_interface=3D/var/run/wpa_supplicant # BR2_PACKAGE_WPA_SUPPLICANT_CTR=
L_IFACE<br>
<br>
and a bit of $(SED) magic in the .mk file ?<br></blockquote><div><br></div>=
<div>No need to have this logic in my opinion:</div><div>* the option has a=
 sensible default when enabled</div><div>* If a user really needs to change=
 the default, he can add that line manually in an overlay file.</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Best regards,<br>
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

--00000000000003ca6c05e069f3dd--

--===============1583983797261571825==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1583983797261571825==--
