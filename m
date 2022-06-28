Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5DD8FC43334
	for <buildroot@archiver.kernel.org>; Tue, 28 Jun 2022 07:50:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD2C082D04;
	Tue, 28 Jun 2022 07:50:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD2C082D04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1biKIRDCmrNu; Tue, 28 Jun 2022 07:50:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B8B0B828A5;
	Tue, 28 Jun 2022 07:50:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B8B0B828A5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 06DA61BF228
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 07:50:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D53C44049A
 for <buildroot@lists.busybox.net>; Tue, 28 Jun 2022 07:50:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D53C44049A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6xKIAuoCFyRP for <buildroot@lists.busybox.net>;
 Tue, 28 Jun 2022 07:50:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7299B40155
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 7299B40155
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 07:50:22 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id c65so16322390edf.4
 for <buildroot@buildroot.org>; Tue, 28 Jun 2022 00:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XGG7oVVFeSR1T2E9wrkaEckDTpbpf5GMEzrCyjpsP2k=;
 b=FZf0UTP/NOFJNKsKCNzBZgXrsp1VJRObDN1CsHzZZwmHGt3ZLmJy0FRGHklubeMtq3
 LIEBLNOm4CFsu3SK3ESHaiBytz99i1/lj82kkHU9xDKqtxs9QecfF9avuJQqiixGuJ8x
 DiRDiipYrMKXSLg+G1Zl6i4imkEySaPk5bvsdOazBId5MbNhrdpHyf7JldHpdMUvFCfU
 bi7l/lpFhU9B6x5SnpuWauaHOVoTDbeov9LXRaNNWkznqzWv74mVpL//ecQSUA5JEdJY
 tPeobq0VYcS/0e+WQRCogJ5yenSqkPxPWVGnyiJG2xGMq92GjwTaubpDr2kmFwipYGcW
 1KOQ==
X-Gm-Message-State: AJIora8iPVZDF0u9s2y0UyOhbUo4YwAraQB5qMvaIP8+oOYfMpiWgehR
 AJ5ln2qwhaqvLAeGILNlVZsbDePKumyhW5fjbsIWNg==
X-Google-Smtp-Source: AGRyM1sSFzbDG6wXpU/67AfEClivGyaH5P8IgpX+w1PcaJlOJV9j6wMetaRNMj91WsKbsF/hHkURbvyGKoFc8VFf6DA=
X-Received: by 2002:aa7:d484:0:b0:435:65b0:e2d8 with SMTP id
 b4-20020aa7d484000000b0043565b0e2d8mr21690618edr.373.1656402620466; Tue, 28
 Jun 2022 00:50:20 -0700 (PDT)
MIME-Version: 1.0
References: <mailman.2285.1655818273.17960.buildroot@buildroot.org>
 <2093f3aaa52cabf675b461f1cf93c5f5@umbiko.net>
In-Reply-To: <2093f3aaa52cabf675b461f1cf93c5f5@umbiko.net>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Tue, 28 Jun 2022 09:49:43 +0200
Message-ID: <CA+_SqVbM=PanW-8hDLOP_nrW-1DUOK3kr-E9FVovhWr1s5iOSA@mail.gmail.com>
To: Andreas Ziegler <br015@umbiko.net>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=XGG7oVVFeSR1T2E9wrkaEckDTpbpf5GMEzrCyjpsP2k=;
 b=KkXoRJ7a7lHjGb7xB+zBGqYp26TH23vpMUikQ9Yw96LoKOTBiFkaVbDU+YtLkyfVGV
 QJvHH7QW4RI95IWPRhVIOLxgAhC0h5KOXuk9HjM/iSm+em4kJEKMLUFwCWbsYX7vbbv8
 fPTseqjCAqXAQmapjQThbbeWmPVlxTSvSDIWY=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=KkXoRJ7a
Subject: Re: [Buildroot] [PATCH 1/4] system: adding options for configuring
 wifi
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
Cc: Buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============3571347449872360140=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3571347449872360140==
Content-Type: multipart/alternative; boundary="000000000000cc5e0405e27d493c"

--000000000000cc5e0405e27d493c
Content-Type: text/plain; charset="UTF-8"

On Sat, Jun 25, 2022 at 7:32 AM Andreas Ziegler <br015@umbiko.net> wrote:

> Hi Angelo,
>
> On 2022-06-21 13:31, Angelo Compagnucci <angelo@amarulasolutions.com>
> wrote:
> >
> > These options can be used by packages to configure a wifi card
> > to connect at boot.
> >
> > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> > ---
> >  system/Config.in | 15 +++++++++++++++
> >  1 file changed, 15 insertions(+)
> >
> > diff --git a/system/Config.in b/system/Config.in
> > index 888c24ce81..9a5bdb2932 100644
> > --- a/system/Config.in
> > +++ b/system/Config.in
> > @@ -418,6 +418,21 @@ comment "automatic network configuration via DHCP
> > needs ifupdown or busybox or n
> >       depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_IFUPDOWN || \
> >               BR2_PACKAGE_SYSTEMD_NETWORKD || BR2_PACKAGE_NETIFRC)
> >
> > +config BR2_SYSTEM_CONNECT_WIFI
> > +     bool "Connect to a default wifi access point"
> > +     default n
> > +     depends on BR2_PACKAGE_WPA_SUPPLICANT
> > +
> > +config BR2_SYSTEM_CONNECT_WIFI_SSID
> > +     string "Access point SSID"
> > +     default ""
> > +     depends on BR2_SYSTEM_CONNECT_WIFI
> > +
> > +config BR2_SYSTEM_CONNECT_WIFI_PASSWORD
> > +     string "Access point password"
> > +     default ""
> > +     depends on BR2_SYSTEM_CONNECT_WIFI
> > +
>
> Just nagging, but this is how security breaches get born. If I want to
> do something like this, I use a private overlay outside the region under
> backup or version control ...
>

I wouldn't be so worried about security since a user can have
BR2_TARGET_GENERIC_ROOT_PASSWD in his .config

Anyway, you end up having the wifi password stored somewhere in the overlay
anyway, so I can't see a problem here.

Or you can use an empty password to store in the .config on the version
control, and have a simple sed to replace with the correct credentials just
before the developer makes a build. In any case, having those options makes
way easier to configure a wifi than guessing the correct overlay to setup.


> Kind regards,
> Andreas
>
> >  endif # BR2_ROOTFS_SKELETON_DEFAULT
> >
> >  config BR2_SYSTEM_DEFAULT_PATH
> > --
> > 2.25.1
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

--000000000000cc5e0405e27d493c
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Jun 25, 2022 at 7:32 AM Andre=
as Ziegler &lt;<a href=3D"mailto:br015@umbiko.net">br015@umbiko.net</a>&gt;=
 wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px =
0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Angel=
o,<br>
<br>
On 2022-06-21 13:31, Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarul=
asolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt; <br>
wrote:<br>
&gt; <br>
&gt; These options can be used by packages to configure a wifi card<br>
&gt; to connect at boot.<br>
&gt; <br>
&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarula=
solutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 system/Config.in | 15 +++++++++++++++<br>
&gt;=C2=A0 1 file changed, 15 insertions(+)<br>
&gt; <br>
&gt; diff --git a/system/Config.in b/system/Config.in<br>
&gt; index 888c24ce81..9a5bdb2932 100644<br>
&gt; --- a/system/Config.in<br>
&gt; +++ b/system/Config.in<br>
&gt; @@ -418,6 +418,21 @@ comment &quot;automatic network configuration via=
 DHCP<br>
&gt; needs ifupdown or busybox or n<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on !(BR2_PACKAGE_BUSYBOX || BR2_PACK=
AGE_IFUPDOWN || \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0BR2_PACKAGE_SYST=
EMD_NETWORKD || BR2_PACKAGE_NETIFRC)<br>
&gt; <br>
&gt; +config BR2_SYSTEM_CONNECT_WIFI<br>
&gt; +=C2=A0 =C2=A0 =C2=A0bool &quot;Connect to a default wifi access point=
&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default n<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_WPA_SUPPLICANT<br>
&gt; +<br>
&gt; +config BR2_SYSTEM_CONNECT_WIFI_SSID<br>
&gt; +=C2=A0 =C2=A0 =C2=A0string &quot;Access point SSID&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default &quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_SYSTEM_CONNECT_WIFI<br>
&gt; +<br>
&gt; +config BR2_SYSTEM_CONNECT_WIFI_PASSWORD<br>
&gt; +=C2=A0 =C2=A0 =C2=A0string &quot;Access point password&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0default &quot;&quot;<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_SYSTEM_CONNECT_WIFI<br>
&gt; +<br>
<br>
Just nagging, but this is how security breaches get born. If I want to <br>
do something like this, I use a private overlay outside the region under <b=
r>
backup or version control ...<br></blockquote><div><br></div><div>I wouldn&=
#39;t be so worried about security since a user can have BR2_TARGET_GENERIC=
_ROOT_PASSWD in his .config</div><div><br></div><div>Anyway, you end up hav=
ing the wifi password stored somewhere in the overlay anyway, so I can&#39;=
t see a problem here.</div><div><br></div><div>Or you can use an empty pass=
word to store in the .config on the version control, and have a simple sed =
to replace with the correct credentials just before the developer makes a b=
uild. In any case, having those options makes way easier to configure a wif=
i than guessing the correct overlay to setup.<br></div><div><br></div><bloc=
kquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:=
1px solid rgb(204,204,204);padding-left:1ex">
<br>
Kind regards,<br>
Andreas<br>
<br>
&gt;=C2=A0 endif # BR2_ROOTFS_SKELETON_DEFAULT<br>
&gt; <br>
&gt;=C2=A0 config BR2_SYSTEM_DEFAULT_PATH<br>
&gt; --<br>
&gt; 2.25.1<br>
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

--000000000000cc5e0405e27d493c--

--===============3571347449872360140==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3571347449872360140==--
