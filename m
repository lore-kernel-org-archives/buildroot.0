Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6E3EC43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 10:22:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3E456415DE;
	Tue,  7 Jun 2022 10:22:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MoJUYtZMxW_4; Tue,  7 Jun 2022 10:22:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 17199415E9;
	Tue,  7 Jun 2022 10:22:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D10A31BF846
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 10:22:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BFB3D60B55
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 10:22:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JPWH8FcYrazA for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 10:22:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6A7B760806
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 10:22:00 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id gl15so20356186ejb.4
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 03:22:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=QWhRvp4Om2HOhPSpz9sjT0wqBbxxERzVUaeDJRH4kUQ=;
 b=IOrEXVh0Q14aoqgXSA8KaC+pXTH36rgjbgS+G0ho6G/zpBYnWJVqmvANu2mmpmLyaL
 o7XGHRl5v6F3RMxkRA8KASKTYYLoZNbIk9bVpu1+VUb2upZcfH5UD6jC6PowZTex9yXA
 F0hrk57etwkQY4krKHsN06RIX02hx8EofAuyY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=QWhRvp4Om2HOhPSpz9sjT0wqBbxxERzVUaeDJRH4kUQ=;
 b=A2xrXsD93wCcx8A0FiUnAv89QXfDGd+H47L/N8Z1AzIP5hpkdwVhXgBgra1Rl/CtsS
 ASoE6WG/G/jcyGWPihR6E82YJnP7YllwJDmXEWK6VD27NX1YI965FSS6XRmEiX8Igicy
 v/FsGPuAB+dqQQo6P7dzaYDx0slQYIhKoAcz30tZg+xNyMXfbQkSh1dLHrnVg5pe5DQN
 Idw/8bWGhrk7Av12xPE4QlYj5xacmsNoGWPL5PmEo747KYA2Q6FUOoKXk/y6tLeieJIF
 GjmAm/iAotLeBW6pn3+Yl2IGhscdE5nRjUSnRsRFzOVN7eR/fuZMBbmJD3qtznOzkfN3
 voMg==
X-Gm-Message-State: AOAM533mkZGLwFatzg1FqjtL4JZIZ7tp9ULe965d7ggEL1L//kJv6Oe0
 oWQXD8crNI92e8V3QscAejbKAWjQc9ijdwtbm55KxUMMCODKLA==
X-Google-Smtp-Source: ABdhPJzzBRqJauv9rSH6VvxEG7HgdkDJxVc8pHWLBxh6gGhwOth5hPT4Yuo7dC/tXxqdKwtLghtDc0U5EtNOUjT/uUw=
X-Received: by 2002:a17:907:1b1a:b0:703:a290:98f1 with SMTP id
 mp26-20020a1709071b1a00b00703a29098f1mr25836854ejc.418.1654597318344; Tue, 07
 Jun 2022 03:21:58 -0700 (PDT)
MIME-Version: 1.0
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-2-angelo@amarulasolutions.com>
 <20220601212111.716a33cd@windsurf>
 <CA+_SqVacVxJkhC13fussgw9Pctmr8zrbc2DBs0m0+sqxNFfQZw@mail.gmail.com>
 <e3ffcc1c-518a-65f4-d713-2b31254238d8@mind.be>
In-Reply-To: <e3ffcc1c-518a-65f4-d713-2b31254238d8@mind.be>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 7 Jun 2022 12:21:22 +0200
Message-ID: <CA+_SqVZiyKDxz=+0391_0jbdnE+Qt06NnT=i=n1e0zZiPN0G6g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
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
Cc: jagan@amarulasolutions.com, Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============7747761321623925339=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7747761321623925339==
Content-Type: multipart/alternative; boundary="00000000000068322c05e0d8f5f1"

--00000000000068322c05e0d8f5f1
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 6, 2022 at 2:42 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 01/06/2022 23:55, Angelo Compagnucci wrote:
> >
> >
> > On Wed, Jun 1, 2022 at 9:21 PM Thomas Petazzoni <
> thomas.petazzoni@bootlin.com
> > <mailto:thomas.petazzoni@bootlin.com>> wrote:
> >
> >     On Fri, 27 May 2022 12:33:32 +0200
> >     Angelo Compagnucci <angelo@amarulasolutions.com
> >     <mailto:angelo@amarulasolutions.com>> wrote:
> >
> >      > Default configuration file is wrong for the default compiling
> options.
> >      >
> >      > Fixes:
> >      >
> >      > Successfully initialized wpa_supplicant
> >      > Line 1: unknown global field
> 'ctrl_interface=/var/run/wpa_supplicant'.
> >      > Line 1: Invalid configuration line
> >      > 'ctrl_interface=/var/run/wpa_supplicant'.
> >      > Failed to read or parse configuration '/etc/wpa_supplicant.conf'.
> >      >
> >      > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com
> >     <mailto:angelo@amarulasolutions.com>>
> >
> >     Indeed, this option only makes sense when
> >     BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y I suppose. However, in this
> >     case, it makes sense a lot of sense to have this option in the config
> >     file.
> >
> >     Should we have some kind of logic to add this line when
> >     BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=y ?
> >
> >     Maybe something like this:
> >
> >     # ctrl_interface=/var/run/wpa_supplicant #
> BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE
> >
> >     and a bit of $(SED) magic in the .mk file ?
> >
> >
> > No need to have this logic in my opinion:
> > * the option has a sensible default when enabled
>
>   Does it? AFAIK, if ctrl_interface is not specified in the config file or
> on
> the command line with -C, then no control socket will be created.
>
> > * If a user really needs to change the default, he can add that line
> manually in
> > an overlay file.
>
>   Yeah, but we prefer that if a user selects
> BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE, that the control socket actually
> appears
> in the expected place (/var/run/wpa_supplicant).
>

The problem here is that wpa_supplicant.conf file will always be provided
in a user overlay, because to connect to a wifi a proper `network=`
configuration settings must be provided.
Would we really like to mess with a user overlay provided configuration
file? I think that a user must ensure the configuration file is in good
shape for the service to work.


>
>   Regards,
>   Arnout
>
> >
> >
> >     Best regards,
> >
> >     Thomas
> >     --
> >     Thomas Petazzoni, co-owner and CEO, Bootlin
> >     Embedded Linux and Kernel engineering and training
> >     https://bootlin.com <https://bootlin.com>
> >
> >
> >
> > --
> >
> > Angelo Compagnucci
> >
> > Software Engineer
> >
> > angelo@amarulasolutions.com <mailto:angelo@amarulasolutions.com>
> > __________________________________
> > Amarula Solutions SRL
> >
> > Via le Canevare 30, 31100 Treviso, Veneto, IT
> >
> > T. +39 (0)42 243 5310
> > info@amarulasolutions.com <mailto:info@amarulasolutions.com>
> >
> > www.amarulasolutions.com <http://www.amarulasolutions.com/>
> >
> > [`as] https://www.amarulasolutions.com <https://www.amarulasolutions.com
> >|
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
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

--00000000000068322c05e0d8f5f1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Mon, Jun 6, 2022 at 2:42 PM Arnout=
 Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 01/06/2022 23:55, Angelo Compagnucci wrote:<br>
&gt; <br>
&gt; <br>
&gt; On Wed, Jun 1, 2022 at 9:21 PM Thomas Petazzoni &lt;<a href=3D"mailto:=
thomas.petazzoni@bootlin.com" target=3D"_blank">thomas.petazzoni@bootlin.co=
m</a> <br>
&gt; &lt;mailto:<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_=
blank">thomas.petazzoni@bootlin.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0On Fri, 27 May 2022 12:33:32 +0200<br>
&gt;=C2=A0 =C2=A0 =C2=A0Angelo Compagnucci &lt;<a href=3D"mailto:angelo@ama=
rulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:angelo@amarulasolution=
s.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Default configuration file is wrong for the d=
efault compiling options.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Fixes:<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Successfully initialized wpa_supplicant<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Line 1: unknown global field &#39;ctrl_interf=
ace=3D/var/run/wpa_supplicant&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Line 1: Invalid configuration line<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; &#39;ctrl_interface=3D/var/run/wpa_supplicant=
&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Failed to read or parse configuration &#39;/e=
tc/wpa_supplicant.conf&#39;.<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 &gt; Signed-off-by: Angelo Compagnucci &lt;<a href=
=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angelo@amarulasol=
utions.com</a><br>
&gt;=C2=A0 =C2=A0 =C2=A0&lt;mailto:<a href=3D"mailto:angelo@amarulasolution=
s.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;&gt;<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Indeed, this option only makes sense when<br>
&gt;=C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=3Dy I suppose=
. However, in this<br>
&gt;=C2=A0 =C2=A0 =C2=A0case, it makes sense a lot of sense to have this op=
tion in the config<br>
&gt;=C2=A0 =C2=A0 =C2=A0file.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Should we have some kind of logic to add this line =
when<br>
&gt;=C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE=3Dy ?<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Maybe something like this:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0# ctrl_interface=3D/var/run/wpa_supplicant # BR2_PA=
CKAGE_WPA_SUPPLICANT_CTRL_IFACE<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0and a bit of $(SED) magic in the .mk file ?<br>
&gt; <br>
&gt; <br>
&gt; No need to have this logic in my opinion:<br>
&gt; * the option has a sensible default when enabled<br>
<br>
=C2=A0 Does it? AFAIK, if ctrl_interface is not specified in the config fil=
e or on <br>
the command line with -C, then no control socket will be created.<br>
<br>
&gt; * If a user really needs to change the default, he can add that line m=
anually in <br>
&gt; an overlay file.<br>
<br>
=C2=A0 Yeah, but we prefer that if a user selects <br>
BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE, that the control socket actually app=
ears <br>
in the expected place (/var/run/wpa_supplicant).<br></blockquote><div><br><=
/div><div>The problem here is that wpa_supplicant.conf file will always be =
provided in a user overlay, because to connect to a wifi a proper `network=
=3D` configuration settings must be provided.</div><div>Would we really lik=
e to mess with a user overlay provided configuration file? I think that a u=
ser must ensure the configuration file is in good shape for the service to =
work.</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt; <br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Best regards,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thomas<br>
&gt;=C2=A0 =C2=A0 =C2=A0-- <br>
&gt;=C2=A0 =C2=A0 =C2=A0Thomas Petazzoni, co-owner and CEO, Bootlin<br>
&gt;=C2=A0 =C2=A0 =C2=A0Embedded Linux and Kernel engineering and training<=
br>
&gt;=C2=A0 =C2=A0 =C2=A0<a href=3D"https://bootlin.com" rel=3D"noreferrer" =
target=3D"_blank">https://bootlin.com</a> &lt;<a href=3D"https://bootlin.co=
m" rel=3D"noreferrer" target=3D"_blank">https://bootlin.com</a>&gt;<br>
&gt; <br>
&gt; <br>
&gt; <br>
&gt; -- <br>
&gt; <br>
&gt; Angelo Compagnucci<br>
&gt; <br>
&gt; Software Engineer<br>
&gt; <br>
&gt; <a href=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angel=
o@amarulasolutions.com</a> &lt;mailto:<a href=3D"mailto:angelo@amarulasolut=
ions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
&gt; __________________________________<br>
&gt; Amarula Solutions SRL<br>
&gt; <br>
&gt; Via le Canevare 30, 31100 Treviso, Veneto, IT<br>
&gt; <br>
&gt; T. +39 (0)42 243 5310<br>
&gt; <a href=3D"mailto:info@amarulasolutions.com" target=3D"_blank">info@am=
arulasolutions.com</a> &lt;mailto:<a href=3D"mailto:info@amarulasolutions.c=
om" target=3D"_blank">info@amarulasolutions.com</a>&gt;<br>
&gt; <br>
&gt; <a href=3D"http://www.amarulasolutions.com" rel=3D"noreferrer" target=
=3D"_blank">www.amarulasolutions.com</a> &lt;<a href=3D"http://www.amarulas=
olutions.com/" rel=3D"noreferrer" target=3D"_blank">http://www.amarulasolut=
ions.com/</a>&gt;<br>
&gt; <br>
&gt; [`as] <a href=3D"https://www.amarulasolutions.com" rel=3D"noreferrer" =
target=3D"_blank">https://www.amarulasolutions.com</a> &lt;<a href=3D"https=
://www.amarulasolutions.com" rel=3D"noreferrer" target=3D"_blank">https://w=
ww.amarulasolutions.com</a>&gt;|<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
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

--00000000000068322c05e0d8f5f1--

--===============7747761321623925339==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7747761321623925339==--
