Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0831DC433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 12:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7113D60F43;
	Tue,  7 Jun 2022 12:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aj12vTJl5kzX; Tue,  7 Jun 2022 12:17:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 69AF260F30;
	Tue,  7 Jun 2022 12:17:02 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D99371BF33A
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C7F9660F30
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 12:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 5se90OdWaRtD for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 12:16:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com
 [IPv6:2a00:1450:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A0B7B60BE8
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 12:16:57 +0000 (UTC)
Received: by mail-ed1-x536.google.com with SMTP id fd25so22754657edb.3
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 05:16:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fky1pZ1dbuVoeQi9hbBG2YyDqYuCMpAOTEJKlVROHuM=;
 b=eekmKyPx00TNIA2g2UpPZC7MIpKGpS0dkU0gry+Bf1th+QmqWCmCT50GAt5UwRYcBn
 dnfqcRoYEqKzuRpy9bl0PS8ZSn4CRJJkjRFkY6FECFAROBp/dR1UqlX2t/kDdq/F0Luc
 DmWB3eLYqMwlbk8V3zP9HXtY9YPL0CW6vG19c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fky1pZ1dbuVoeQi9hbBG2YyDqYuCMpAOTEJKlVROHuM=;
 b=FlA0nSIh5veF99A/YBUz/Xty3soRmbNF+L3BOUdtjcelJUmgx9bNGqEbywiv9tm4xn
 JFX6GlRg+IqjHnwRQExBrLd9fnZwqsd1k664QhV9Vfnm4hbNQ9r5p3HeKUeOzOlgSDe3
 yln7iyW+0mq3uAbOh34AVX3BErkHLAIerQ0l/GxcjKw97qiEb9ihzSQCD/Z2e7KeN1Bh
 N/B2Uup1JK1GlzH/6GBggW55NF4hD6R3eUtSaOAzbVg+TtOnO9r9tC3JBHdnGOl72J5W
 CCmiZ+VHTLG8Jb1ri7FJwHfsdpVuVBrdeXfh+xgNV36pFcM8vsyq+lI5aN1b7sFmKd/5
 1G5g==
X-Gm-Message-State: AOAM5302QR3OUYJQzhRumGrRMeiDAIwSZD2xmVWtGNLYpmAWxpmpGOYB
 YE4MjY4syRTMXRpSK2rP9fOz3rSMUzuENLvkUnFARwQEo0E=
X-Google-Smtp-Source: ABdhPJysDBEg8sltYRMx+QtWGYyorQxKyOEvdWDgLuVixmBt6cdRHPFC3Bm6DQAAA6OBMXP6P+mHMjgGbfKyg+9bgkI=
X-Received: by 2002:a05:6402:4145:b0:42d:842a:f916 with SMTP id
 x5-20020a056402414500b0042d842af916mr32661431eda.357.1654604215589; Tue, 07
 Jun 2022 05:16:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-2-angelo@amarulasolutions.com>
 <20220601212111.716a33cd@windsurf>
 <CA+_SqVacVxJkhC13fussgw9Pctmr8zrbc2DBs0m0+sqxNFfQZw@mail.gmail.com>
 <e3ffcc1c-518a-65f4-d713-2b31254238d8@mind.be>
 <CA+_SqVZiyKDxz=+0391_0jbdnE+Qt06NnT=i=n1e0zZiPN0G6g@mail.gmail.com>
 <20220607134803.630edcd7@windsurf>
In-Reply-To: <20220607134803.630edcd7@windsurf>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 7 Jun 2022 14:16:19 +0200
Message-ID: <CA+_SqVa+fn-_c6cEfeVZaDy7VYWw7zMY8Sy4kmG1jfcmMnt3RA@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============6523253344477201678=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6523253344477201678==
Content-Type: multipart/alternative; boundary="00000000000083cb0e05e0da9068"

--00000000000083cb0e05e0da9068
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 1:48 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Tue, 7 Jun 2022 12:21:22 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > The problem here is that wpa_supplicant.conf file will always be provided
> > in a user overlay, because to connect to a wifi a proper `network=`
> > configuration settings must be provided.
>
> Then why do we provide an example configuration file? :-)
>

Is the one we provide really an example configuration file?  An example
configuration file usually looks quite different!


> > Would we really like to mess with a user overlay provided configuration
> > file? I think that a user must ensure the configuration file is in good
> > shape for the service to work.
>
> If the wpa_supplicant.conf provided by Buildroot is overridden by a
> file in the rootfs overlay, then whatever we do in
> WPA_SUPPLICANT_INSTALL_TARGET_HOOKS will have no effect, the file in
> the rootfs overlay will win. So we are not "messing up" with the file
> provided by the user.
>

Indeed. It looks useless doing some configuration file mangling only to
have it overwritten. We don't do that for other parameters, like autoscan
for example, which in turn we should do following this logic.
I think that the provided configuration file should work with provided
default options, or we should consider all the optional values too, they
are many more for wpa_supplicant. What happens if I configure EAP, or AP
mode or the hotspot? Should we have "example" configuration sections
enabled by those options?


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

--00000000000083cb0e05e0da9068
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 7, 2022 at 1:48 PM Thomas=
 Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_b=
lank">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Tue, 7 Jun 2022 12:21:22 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com" targe=
t=3D"_blank">angelo@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; The problem here is that wpa_supplicant.conf file will always be provi=
ded<br>
&gt; in a user overlay, because to connect to a wifi a proper `network=3D`<=
br>
&gt; configuration settings must be provided.<br>
<br>
Then why do we provide an example configuration file? :-)<br></blockquote><=
div><br></div><div>Is the one we provide really an example configuration fi=
le?=C2=A0 An example configuration file usually looks quite different!</div=
><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Would we really like to mess with a user overlay provided configuratio=
n<br>
&gt; file? I think that a user must ensure the configuration file is in goo=
d<br>
&gt; shape for the service to work.<br>
<br>
If the wpa_supplicant.conf provided by Buildroot is overridden by a<br>
file in the rootfs overlay, then whatever we do in<br>
WPA_SUPPLICANT_INSTALL_TARGET_HOOKS will have no effect, the file in<br>
the rootfs overlay will win. So we are not &quot;messing up&quot; with the =
file<br>
provided by the user.<br></blockquote><div><br></div><div>Indeed. It looks =
useless doing some configuration file mangling only to have it overwritten.=
 We don&#39;t do that for other parameters, like autoscan for example, whic=
h in turn we should do following this logic.</div><div>I think that the pro=
vided configuration file should work with provided default options, or we s=
hould consider all the optional values too, they are many more for wpa_supp=
licant. What happens if I configure EAP, or AP mode or the hotspot? Should =
we have &quot;example&quot; configuration sections enabled by those options=
?<br></div><div><br></div><blockquote class=3D"gmail_quote" style=3D"margin=
:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"=
>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div><br clear=3D"all"><br>-- <br><div dir=3D"ltr"><div dir=
=3D"ltr"><p dir=3D"ltr" style=3D"line-height:1.38;margin-top:0pt;margin-bot=
tom:0pt"><span style=3D"font-size:11pt;font-family:Arial;color:rgb(0,0,0);b=
ackground-color:transparent;font-weight:400;font-style:normal;font-variant:=
normal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"><=
/span><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rgb=
(0,0,0);background-color:transparent;font-weight:500;font-style:normal;font=
-variant:normal;text-decoration:none;vertical-align:baseline;white-space:pr=
e-wrap">Angelo Compagnucci</span></p><p dir=3D"ltr" style=3D"line-height:1.=
8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fami=
ly:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tran=
sparent;font-weight:400;font-style:normal;font-variant:normal;text-decorati=
on:none;vertical-align:baseline;white-space:pre-wrap">Software Engineer</sp=
an></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bottom=
:0pt"><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,mon=
ospace;color:rgb(0,0,0);background-color:transparent;font-weight:400;font-s=
tyle:normal;font-variant:normal;text-decoration:none;vertical-align:baselin=
e;white-space:pre-wrap"><a href=3D"mailto:angelo@amarulasolutions.com" targ=
et=3D"_blank">angelo@amarulasolutions.com</a>=C2=A0<br></span><span style=
=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(=
241,194,50);background-color:transparent;font-weight:400;font-style:normal;=
font-variant:normal;text-decoration:none;vertical-align:baseline;white-spac=
e:pre-wrap">__________________________________</span><span style=3D"font-si=
ze:10pt;font-family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);back=
ground-color:transparent;font-weight:400;font-style:normal;font-variant:nor=
mal;text-decoration:none;vertical-align:baseline;white-space:pre-wrap"><br>=
</span><span style=3D"font-size:10pt;font-family:Ubuntu,sans-serif;color:rg=
b(0,0,0);background-color:transparent;font-weight:500;font-style:normal;fon=
t-variant:normal;text-decoration:none;vertical-align:baseline;white-space:p=
re-wrap">Amarula Solutions SRL</span></p><p dir=3D"ltr" style=3D"line-heigh=
t:1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-=
family:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:=
transparent;font-weight:400;font-style:normal;font-variant:normal;text-deco=
ration:none;vertical-align:baseline;white-space:pre-wrap">Via le Canevare 3=
0, 31100 Treviso, Veneto, IT</span></p><p dir=3D"ltr" style=3D"line-height:=
1.8;margin-top:0pt;margin-bottom:0pt"><span style=3D"font-size:10pt;font-fa=
mily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre-wrap">T. +39 (0)42 243 53=
10</span><span style=3D"font-size:10pt;font-family:&quot;Ubuntu Mono&quot;,=
monospace;color:rgb(0,0,0);background-color:transparent;font-weight:400;fon=
t-style:normal;font-variant:normal;text-decoration:none;vertical-align:base=
line;white-space:pre-wrap"><br></span><span style=3D"font-size:10pt;font-fa=
mily:&quot;Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:tr=
ansparent;font-weight:400;font-style:normal;font-variant:normal;text-decora=
tion:none;vertical-align:baseline;white-space:pre-wrap"><a href=3D"mailto:i=
nfo@amarulasolutions.com" target=3D"_blank">info@amarulasolutions.com</a></=
span></p><p dir=3D"ltr" style=3D"line-height:1.8;margin-top:0pt;margin-bott=
om:0pt"><a href=3D"http://www.amarulasolutions.com/" style=3D"text-decorati=
on:none" target=3D"_blank"><span style=3D"font-size:10pt;font-family:&quot;=
Ubuntu Mono&quot;,monospace;color:rgb(0,0,0);background-color:transparent;f=
ont-weight:400;font-style:normal;font-variant:normal;text-decoration:none;v=
ertical-align:baseline;white-space:pre-wrap">www.amarulasolutions.com</span=
></a></p><div>[`as] <a href=3D"https://www.amarulasolutions.com" target=3D"=
_blank">https://www.amarulasolutions.com</a>|</div></div></div></div>

--00000000000083cb0e05e0da9068--

--===============6523253344477201678==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6523253344477201678==--
