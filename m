Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E3EAC433F5
	for <buildroot@archiver.kernel.org>; Mon,  3 Oct 2022 15:54:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 954B8408D1;
	Mon,  3 Oct 2022 15:54:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 954B8408D1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLagf_TPPDWn; Mon,  3 Oct 2022 15:54:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 899EE408C8;
	Mon,  3 Oct 2022 15:54:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 899EE408C8
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BFA271BF9AF
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:53:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9B26B813EE
 for <buildroot@lists.busybox.net>; Mon,  3 Oct 2022 15:53:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9B26B813EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lwhEN05zS2VF for <buildroot@lists.busybox.net>;
 Mon,  3 Oct 2022 15:53:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5A8158136C
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5A8158136C
 for <buildroot@buildroot.org>; Mon,  3 Oct 2022 15:53:57 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id a12so2272256ljr.7
 for <buildroot@buildroot.org>; Mon, 03 Oct 2022 08:53:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=lFdAodM2NxJt8F3x7WAYHPxLjl9BM4TaAL/FfiwToj0=;
 b=XZHNe5CNCGnknLATbtJMGT+u4Qu+Jxf9bKYTE8mzQWmkGUy+wSgb5Psxjx6UwCSbbw
 gXbrGnaHx7aGqfkr4aWdCRf2gofhwyGxjoyvNzYyh5G4un3ZsbkvxXBRtise+hBUd7gb
 1/EWIY906tWwOFQP00V9GKzCA/XG6PUe1uRoc9qwaiR+VoCvDwpxJPjg7/AQ3ShDcsQq
 tfe2SYyY22HaXrr1nGZ7o8DXXOqoWBHyEZyzIrh0puh2svjWXuUFUZBx90te6ogOQPXZ
 7kmwhlx2VHXBGZmU/xMsJA1HIi1tHwUeBBwoXPIYpJKJB17BtdoJkgCXnsxcxqW/MQka
 EI3g==
X-Gm-Message-State: ACrzQf2Zsp25TvHEy7WW/cIFVzY1kK741zUkSLqG6a0mFWJ7hV1HGJEL
 w/LALD6xajczS478/AmtSy70+zHAhgD55paTsM1EZGn4h+/yqQ==
X-Google-Smtp-Source: AMsMyM5rB+zEx8eHo/W574SSfe3hyxK31H9w1Ac8FiJGReOGtUfQLXN2b+Z5xEnq1rrFD88msh2I+1LBflzJKh5v4RU=
X-Received: by 2002:a2e:988c:0:b0:26d:e542:5e49 with SMTP id
 b12-20020a2e988c000000b0026de5425e49mr761403ljj.138.1664812435328; Mon, 03
 Oct 2022 08:53:55 -0700 (PDT)
MIME-Version: 1.0
References: <20220705073206.1442280-1-angelo@amarulasolutions.com>
 <20220705073206.1442280-6-angelo@amarulasolutions.com>
 <87illlgfh6.fsf@dell.be.48ers.dk>
In-Reply-To: <87illlgfh6.fsf@dell.be.48ers.dk>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Mon, 3 Oct 2022 17:53:18 +0200
Message-ID: <CA+_SqVYX1s0n7SSCtS23gTuRb0vyh63fG-TtVjx+iEJuKT9-4g@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=lFdAodM2NxJt8F3x7WAYHPxLjl9BM4TaAL/FfiwToj0=;
 b=lIaRDkEu7L7HbSUQckP7V6YEOw9t6D9gmHx0ufgoIF6HIWQJfAgmVjvqVoDpWn6Zij
 jjnMU5npTD3byIdlo+vI50bzeHhZnso3m1tnv7gchNAoVC1Q9FKJ+iam9n6n43erQoMN
 WK0nuz/7PtHGplHzLGhpBztlQ8jvk3AZmzOaI=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=lIaRDkEu
Subject: Re: [Buildroot] [PATCH v3 5/5] package/initscripts: add service to
 load kernel modules at boot
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
Cc: br015@umbiko.net, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1256102706006275722=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1256102706006275722==
Content-Type: multipart/alternative; boundary="000000000000d36ec905ea235963"

--000000000000d36ec905ea235963
Content-Type: text/plain; charset="UTF-8"

On Sun, Sep 18, 2022 at 12:10 PM Peter Korsgaard <peter@korsgaard.com>
wrote:

> >>>>> "Angelo" == Angelo Compagnucci <angelo@amarulasolutions.com> writes:
>
>  > In cases where no hotplug is available (by choice or by the lack of a
>  > proper hotplug method for a device), this service can be used to load
>  > kernel module drivers by reading the /etc/modules file.
>  > The modules files matches the one used by systemd, which in turn has
>  > a builtin mechanism to load a module at boot, therefore making systemv
>  > init on par with systemd features.
>
>  > Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
>  > ---
>  > Changes
>
>  > v2:
>  > * Moved script to initscripts (Arnout)
>  > * Moved script to S11modules, after S10[mu]dev (Andreas)
>  > * Use /etc/modules-load.d/ to share the same setup with systemd (me)
>
>  >  package/initscripts/init.d/S11modules | 59 +++++++++++++++++++++++++++
>  >  1 file changed, 59 insertions(+)
>  >  create mode 100644 package/initscripts/init.d/S11modules
>
>  > diff --git a/package/initscripts/init.d/S11modules
> b/package/initscripts/init.d/S11modules
>  > new file mode 100644
>  > index 0000000000..3937945596
>  > --- /dev/null
>  > +++ b/package/initscripts/init.d/S11modules
>  > @@ -0,0 +1,59 @@
>  > +#!/bin/sh
>  > +
>  > +MODULES="*.conf"
>  > +MODULES_DIR="/etc/modules-load.d"
>  > +
>  > +[ -z "$(ls -A ${MODULES_DIR}/${MODULES} 2> /dev/null)" ] && exit 0
>
> The commit message talks about /etc/modules, but you are reading from
> /etc/modules-load.d/*.conf?
>

Yes, right, commit message must be fixed.


> How about supporting both /etc/modules and this directory instead?
>

It is doable, but if we are on par with systemd I cannot see why adding
/etc/modules. The same goal can be obtained easily dropping a file in
/etc/modules-load.d/ .


>
>
>  > +
>  > +load_unload() {
>  > +    for module_file in $(ls -1 ${MODULES_DIR}); do
>
> And here you take all files in /etc/modules-load.d, even if they don't
> have a .conf extension?
>

Nice catch.


>
> > +                     esac
>  > +
>  > +                    if [ "$1" = "load" ]; then
>  > +                            modprobe -q ${module} ${args} >/dev/null
> && \
>  > +                                    printf ' %s success,' "$module" ||
>  > +                                    printf ' %s failed,' "$module"
>
> success/failed are quite long strings, how about only printing the
> module name on success and a big scary FAIL like we do elsewhere on
> failures?
>

Nice suggestion.


>
> --
> Bye, Peter Korsgaard
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

--000000000000d36ec905ea235963
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 18, 2022 at 12:10 PM Pete=
r Korsgaard &lt;<a href=3D"mailto:peter@korsgaard.com">peter@korsgaard.com<=
/a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">&=
gt;&gt;&gt;&gt;&gt; &quot;Angelo&quot; =3D=3D Angelo Compagnucci &lt;<a hre=
f=3D"mailto:angelo@amarulasolutions.com" target=3D"_blank">angelo@amarulaso=
lutions.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; In cases where no hotplug is available (by choice or by the lack=
 of a<br>
=C2=A0&gt; proper hotplug method for a device), this service can be used to=
 load<br>
=C2=A0&gt; kernel module drivers by reading the /etc/modules file.<br>
=C2=A0&gt; The modules files matches the one used by systemd, which in turn=
 has<br>
=C2=A0&gt; a builtin mechanism to load a module at boot, therefore making s=
ystemv<br>
=C2=A0&gt; init on par with systemd features.<br>
<br>
=C2=A0&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@a=
marulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<=
br>
=C2=A0&gt; ---<br>
=C2=A0&gt; Changes<br>
<br>
=C2=A0&gt; v2:<br>
=C2=A0&gt; * Moved script to initscripts (Arnout)<br>
=C2=A0&gt; * Moved script to S11modules, after S10[mu]dev (Andreas)<br>
=C2=A0&gt; * Use /etc/modules-load.d/ to share the same setup with systemd =
(me)<br>
<br>
=C2=A0&gt;=C2=A0 package/initscripts/init.d/S11modules | 59 +++++++++++++++=
++++++++++++<br>
=C2=A0&gt;=C2=A0 1 file changed, 59 insertions(+)<br>
=C2=A0&gt;=C2=A0 create mode 100644 package/initscripts/init.d/S11modules<b=
r>
<br>
=C2=A0&gt; diff --git a/package/initscripts/init.d/S11modules b/package/ini=
tscripts/init.d/S11modules<br>
=C2=A0&gt; new file mode 100644<br>
=C2=A0&gt; index 0000000000..3937945596<br>
=C2=A0&gt; --- /dev/null<br>
=C2=A0&gt; +++ b/package/initscripts/init.d/S11modules<br>
=C2=A0&gt; @@ -0,0 +1,59 @@<br>
=C2=A0&gt; +#!/bin/sh<br>
=C2=A0&gt; +<br>
=C2=A0&gt; +MODULES=3D&quot;*.conf&quot;<br>
=C2=A0&gt; +MODULES_DIR=3D&quot;/etc/modules-load.d&quot;<br>
=C2=A0&gt; +<br>
=C2=A0&gt; +[ -z &quot;$(ls -A ${MODULES_DIR}/${MODULES} 2&gt; /dev/null)&q=
uot; ] &amp;&amp; exit 0<br>
<br>
The commit message talks about /etc/modules, but you are reading from<br>
/etc/modules-load.d/*.conf?<br></blockquote><div><br></div><div>Yes, right,=
 commit message must be fixed. <br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
How about supporting both /etc/modules and this directory instead?<br></blo=
ckquote><div><br></div><div>It is doable, but if we are on par with systemd=
 I cannot see why adding /etc/modules. The same goal can be obtained easily=
 dropping a file in /etc/modules-load.d/ .<br></div><div>=C2=A0</div><block=
quote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1=
px solid rgb(204,204,204);padding-left:1ex">
<br>
<br>
=C2=A0&gt; +<br>
=C2=A0&gt; +load_unload() {<br>
=C2=A0&gt; +=C2=A0 =C2=A0 for module_file in $(ls -1 ${MODULES_DIR}); do<br=
>
<br>
And here you take all files in /etc/modules-load.d, even if they don&#39;t<=
br>
have a .conf extension?<br></blockquote><div><br></div><div>Nice catch.</di=
v><div>=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0p=
x 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0esac<br>
=C2=A0&gt; +<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 if [ &quot;$1&quot; =3D &quot;load&quot; ]; then<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 modprobe -q ${module} ${args} &gt;/dev/n=
ull &amp;&amp; \<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf &#39;=
 %s success,&#39; &quot;$module&quot; ||<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 printf &#39;=
 %s failed,&#39; &quot;$module&quot;<br>
<br>
success/failed are quite long strings, how about only printing the<br>
module name on success and a big scary FAIL like we do elsewhere on<br>
failures?<br></blockquote><div><br></div><div>Nice suggestion.</div><div>=
=C2=A0<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br>
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

--000000000000d36ec905ea235963--

--===============1256102706006275722==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1256102706006275722==--
