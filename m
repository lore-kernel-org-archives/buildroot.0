Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E75C43334
	for <buildroot@archiver.kernel.org>; Tue,  7 Jun 2022 13:23:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D7DC28440C;
	Tue,  7 Jun 2022 13:23:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YKhG-cPzIUDs; Tue,  7 Jun 2022 13:23:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9ACDB843F5;
	Tue,  7 Jun 2022 13:23:21 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 641D61BF360
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 13:23:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 60AF1410E3
 for <buildroot@lists.busybox.net>; Tue,  7 Jun 2022 13:23:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rB7NHNzsHe7g for <buildroot@lists.busybox.net>;
 Tue,  7 Jun 2022 13:23:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com
 [IPv6:2a00:1450:4864:20::62f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0BA05410C7
 for <buildroot@buildroot.org>; Tue,  7 Jun 2022 13:23:17 +0000 (UTC)
Received: by mail-ej1-x62f.google.com with SMTP id fu3so33688881ejc.7
 for <buildroot@buildroot.org>; Tue, 07 Jun 2022 06:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bA21EaG7G/zLoV7gUjv9SVIL3ZfmvMo9BLb1BGlIius=;
 b=QwGI0e7ovctEEXKSx0JIaYJT9frk21x081kCpajVqObMWFOXfh47cpTTphWXpmFLur
 w1UJyH9OzMQnwh1mycGd997aWhfleQ17iW2rxNYoCrjIjzAItMLwXxpaFuLLDmDuIZYb
 OkI3GZK2bzKlAFFcabf9+KDgtJc4nuOc687zM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bA21EaG7G/zLoV7gUjv9SVIL3ZfmvMo9BLb1BGlIius=;
 b=3TsBa+BnqDLZNG8A6LwIaoyqg9voqmhvPtWioWcIgRaPggjk845j7ki8OYEBdRYfoZ
 BhcVJhZ7hTUCHCXa1pKq4uOoRItyge+d9UGlp1Xmcxx2hmUERq6J/AUmbwtR6MUMXLre
 kTvHFxXay49tjqOgE9mTAv00RWFs8eqmLlHyKHmQOXT3BEtn1YTjbOavTERN0hknR3Kq
 nVP6g8QvkBOEcWyJUHWUaMxMCIDcx7ZA9JhTX41WSfOuadncrM+FTfMRWKqi0vMUhiGZ
 uwrTkGGayZuLDnLyzWchY0BJIHrK76/cPzFxMkrAg8VGWgt6RnGqMyVJ4YYuhsIklKR/
 P0og==
X-Gm-Message-State: AOAM532c5AymyohA1MX+CKvNMQSDgINo8DsCI26jyFrLg7kmGAQAN0tv
 6PngVv4B154FF9WlmfLzSbN1OKnxlUedJ/aaBzLS09tdFAQ=
X-Google-Smtp-Source: ABdhPJxFOZIcCHXhWpafOBC8XqZY3bfqR52jt+llUk2B5fpvwqjlNA8jCj3qNi2iPUSzD+uYc1jYC54JcENe8w09GCY=
X-Received: by 2002:a17:907:6d07:b0:6ff:9d0:d492 with SMTP id
 sa7-20020a1709076d0700b006ff09d0d492mr26557275ejc.208.1654608196050; Tue, 07
 Jun 2022 06:23:16 -0700 (PDT)
MIME-Version: 1.0
References: <20220527103335.1968203-1-angelo@amarulasolutions.com>
 <20220527103335.1968203-2-angelo@amarulasolutions.com>
 <20220601212111.716a33cd@windsurf>
 <CA+_SqVacVxJkhC13fussgw9Pctmr8zrbc2DBs0m0+sqxNFfQZw@mail.gmail.com>
 <e3ffcc1c-518a-65f4-d713-2b31254238d8@mind.be>
 <CA+_SqVZiyKDxz=+0391_0jbdnE+Qt06NnT=i=n1e0zZiPN0G6g@mail.gmail.com>
 <20220607134803.630edcd7@windsurf>
 <CA+_SqVa+fn-_c6cEfeVZaDy7VYWw7zMY8Sy4kmG1jfcmMnt3RA@mail.gmail.com>
 <20220607151246.3f916b36@windsurf>
In-Reply-To: <20220607151246.3f916b36@windsurf>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 7 Jun 2022 15:22:39 +0200
Message-ID: <CA+_SqVZH0Wzov+FDj0mVtVRYVTgW-bYCLXwWUr4CPHjnL4pmng@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============3765686622395579311=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3765686622395579311==
Content-Type: multipart/alternative; boundary="000000000000c4bd9105e0db7d25"

--000000000000c4bd9105e0db7d25
Content-Type: text/plain; charset="UTF-8"

On Tue, Jun 7, 2022 at 3:12 PM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Tue, 7 Jun 2022 14:16:19 +0200
> Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
>
> > > Then why do we provide an example configuration file? :-)
> >
> > Is the one we provide really an example configuration file?  An example
> > configuration file usually looks quite different!
>
> Sorry I don't follow you. We provide and install
> package/wpa_supplicant/wpa_supplicant.conf, which is an example
> configuration.
>
> Or perhaps your question was ironic/cynical, and I didn't get the joke?
>

It was! Sorry! The example configuration file for wpa_supplicant is 2K+
line with explained each one of the configuration options.
Our is a highly opinionated minimal configuration file to run the service,
which in turn doesn't work due to an incompatible configuration line!


>
> > Indeed. It looks useless doing some configuration file mangling only to
> > have it overwritten. We don't do that for other parameters, like autoscan
> > for example, which in turn we should do following this logic.
> > I think that the provided configuration file should work with provided
> > default options, or we should consider all the optional values too, they
> > are many more for wpa_supplicant. What happens if I configure EAP, or AP
> > mode or the hotspot? Should we have "example" configuration sections
> > enabled by those options?
>
> I understand your point, and I agree it's difficult and probably too
> complicated to have all the logic to adjust the example configuration
> file to all possible sub-options of wpa_supplicant. We have to draw the
> line somewhere and it's not very clear cut where to draw this line.
>
> I just though a working wpa_cli / wpa_supplicant combo would be useful
> to have as an out-of-the box experience when
> BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE is enabled. I guess this was the
> intention of the currently provided wpa_supplicant.conf.
>

It could, but the outcome was poor, due to the fact the configuration
option kills the service with an error.
I still think we should stick with something that works for our default and
minimal configuration and let the user decide what to do.
I think it's cleaner to have a service that works "out of the box" and
complains with an error when you enable some options not properly
configured.


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

--000000000000c4bd9105e0db7d25
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Tue, Jun 7, 2022 at 3:12 PM Thomas=
 Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petaz=
zoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">On Tue, 7 Jun 2022 14:16:19 +0200<br>
Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com" targe=
t=3D"_blank">angelo@amarulasolutions.com</a>&gt; wrote:<br>
<br>
&gt; &gt; Then why do we provide an example configuration file? :-)<br>
&gt; <br>
&gt; Is the one we provide really an example configuration file?=C2=A0 An e=
xample<br>
&gt; configuration file usually looks quite different!<br>
<br>
Sorry I don&#39;t follow you. We provide and install<br>
package/wpa_supplicant/wpa_supplicant.conf, which is an example<br>
configuration.<br>
<br>
Or perhaps your question was ironic/cynical, and I didn&#39;t get the joke?=
<br></blockquote><div><br></div><div>It was! Sorry! The example configurati=
on file for wpa_supplicant is 2K+ line with explained each one of the confi=
guration options.</div><div>Our is a highly opinionated minimal configurati=
on file to run the service, which in turn doesn&#39;t work due to an incomp=
atible configuration line!<br></div><div>=C2=A0<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
<br>
&gt; Indeed. It looks useless doing some configuration file mangling only t=
o<br>
&gt; have it overwritten. We don&#39;t do that for other parameters, like a=
utoscan<br>
&gt; for example, which in turn we should do following this logic.<br>
&gt; I think that the provided configuration file should work with provided=
<br>
&gt; default options, or we should consider all the optional values too, th=
ey<br>
&gt; are many more for wpa_supplicant. What happens if I configure EAP, or =
AP<br>
&gt; mode or the hotspot? Should we have &quot;example&quot; configuration =
sections<br>
&gt; enabled by those options?<br>
<br>
I understand your point, and I agree it&#39;s difficult and probably too<br=
>
complicated to have all the logic to adjust the example configuration<br>
file to all possible sub-options of wpa_supplicant. We have to draw the<br>
line somewhere and it&#39;s not very clear cut where to draw this line.<br>
<br>
I just though a working wpa_cli / wpa_supplicant combo would be useful<br>
to have as an out-of-the box experience when<br>
BR2_PACKAGE_WPA_SUPPLICANT_CTRL_IFACE is enabled. I guess this was the<br>
intention of the currently provided wpa_supplicant.conf.<br></blockquote><d=
iv><br></div><div>It could, but the outcome was poor, due to the fact the c=
onfiguration option kills the service with an error.</div><div>I still thin=
k we should stick with something that works for our default and minimal con=
figuration and let the user decide what to do.</div><div>I think it&#39;s c=
leaner to have a service that works &quot;out of the box&quot; and complain=
s with an error when you enable some options not properly configured.<br></=
div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px =
0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
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

--000000000000c4bd9105e0db7d25--

--===============3765686622395579311==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3765686622395579311==--
