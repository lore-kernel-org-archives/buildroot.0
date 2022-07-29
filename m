Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966FFC00144
	for <buildroot@archiver.kernel.org>; Fri, 29 Jul 2022 22:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 08C3B4160B;
	Fri, 29 Jul 2022 22:05:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 08C3B4160B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8JQysni3KXHk; Fri, 29 Jul 2022 22:05:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 733694167B;
	Fri, 29 Jul 2022 22:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 733694167B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3B7191BF45A
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:05:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 166DB60AB2
 for <buildroot@lists.busybox.net>; Fri, 29 Jul 2022 22:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 166DB60AB2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yOQ5X_4BLcEy for <buildroot@lists.busybox.net>;
 Fri, 29 Jul 2022 22:05:16 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C84F060A6F
Received: from mail-vs1-xe2c.google.com (mail-vs1-xe2c.google.com
 [IPv6:2607:f8b0:4864:20::e2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C84F060A6F
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 22:05:15 +0000 (UTC)
Received: by mail-vs1-xe2c.google.com with SMTP id k129so5900549vsk.2
 for <buildroot@buildroot.org>; Fri, 29 Jul 2022 15:05:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=efaHnq4yaXxRvFyLFuBbE+P2OiYC5uyV29qxMKqHFhY=;
 b=BXA21Kv701tBDrOqETmsEmQd5X7C5GhPKGicxK5vcwoDAqy5YyXNMbfRrpuELcNAFp
 L24obfzQiAMUHjOsAugR59qMpEWUjgWuOBn/S00lfnMKdJ4nSQdo1gphCQfFURf9ccLd
 x6ARhwCHAXfJI+nZosR6YMQivO6bpqTpm9Lqh8ce7DMwmJg3APp6fUdEJawwKhFuPaL9
 0cLqIpwBkQAGFHi/aXQYpzv3ygxCXyw/BsApDMsBQKvMyAascxHkgsaa930uz95THkyn
 rBqa1HBqDLmTnU7VuZU+S3wThCNtBC79FiMLuwu2mU5S43Kawhodglk1/mACqBqOSytr
 D6Dg==
X-Gm-Message-State: AJIora+SdDi66kjgP8ZZ6AcEUI1H16g+cv+O6L4HLzY+MgDx2rZGZxSW
 Ezee5A04UzCg3/fp7Ftgn+fBCEz/wCHfK52oHwOi4EYjPGg=
X-Google-Smtp-Source: AGRyM1vb6T8fD1iO5DvEaaXlRjs20bZ8orUgU+ZQ4LK0vEG+52KlB0XuUIrJ6ujRTYgHslLpYpZUxwG8K3gDjOflOBE=
X-Received: by 2002:a05:6102:a4f:b0:358:461a:af4d with SMTP id
 i15-20020a0561020a4f00b00358461aaf4dmr2308077vss.39.1659132314587; Fri, 29
 Jul 2022 15:05:14 -0700 (PDT)
MIME-Version: 1.0
References: <20220728211259.121416-1-angelo@amarulasolutions.com>
 <20220729104754.2beb327c@windsurf>
 <130b7fd7-20bd-656b-ed20-b0710fc5594f@mind.be>
In-Reply-To: <130b7fd7-20bd-656b-ed20-b0710fc5594f@mind.be>
From: Angelo Compagnucci <angelo@amarulasolutions.com>
Date: Sat, 30 Jul 2022 00:04:37 +0200
Message-ID: <CA+_SqVYFMxFyf5VwSQaJzzPugmyxo_Zpa2veY8GcrkLuD+TdqA@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=efaHnq4yaXxRvFyLFuBbE+P2OiYC5uyV29qxMKqHFhY=;
 b=UWfhbhJ+j6ajk08cbB2O5IHKFVQxh6e2pcMebihUEf9oI65tSyYI3rfnoBYnQvL5Ip
 rhdoxEoTuAT4c1mQYL8kD+yEb0IwvnQX7hzgTvMaIXQh2+AkLCPiLKo8zHbcU3fy3el6
 NRpr89+1WI4cDRbqAhO8Mvr1B1vNq7f9pvLlI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=UWfhbhJ+
Subject: Re: [Buildroot] [PATCH v2] package/libdill: new package
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============6821863092149490808=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6821863092149490808==
Content-Type: multipart/alternative; boundary="0000000000003f274005e4f8d806"

--0000000000003f274005e4f8d806
Content-Type: text/plain; charset="UTF-8"

On Fri, Jul 29, 2022 at 9:00 PM Arnout Vandecappelle <arnout@mind.be> wrote:

>
>
> On 29/07/2022 10:47, Thomas Petazzoni via buildroot wrote:
> > Hello Angelo,
> >
> > On Thu, 28 Jul 2022 23:12:59 +0200
> > Angelo Compagnucci <angelo@amarulasolutions.com> wrote:
> >
> >> Libdill is a C library that makes writing structured concurrent programs
> >> easy.
> >>
> >> Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
> [snip]
> >> diff --git a/package/libdill/libdill.mk b/package/libdill/libdill.mk
> >> new file mode 100644
> >> index 0000000000..822f07b939
> >> --- /dev/null
> >> +++ b/package/libdill/libdill.mk
> >> @@ -0,0 +1,26 @@
> >>
> +################################################################################
> >> +#
> >> +# libdill
> >> +#
> >>
> +################################################################################
> >> +
> >> +LIBDILL_VERSION = fa01648cf2a8d06e53c965b45eeacfb3ac57bd04
> >> +LIBDILL_SITE = $(call github,sustrik,libdill,$(LIBDILL_VERSION))
> >> +LIBDILL_LICENSE = MIT
> >> +LIBDILL_LICENSE_FILES = COPYING
> >> +LIBDILL_CPE_ID_VENDOR = libdill
> >> +LIBDILL_CPE_ID_PRODUCT = libdill
> >
> > Could you add a link in the commit log that shows you have verified
> these?
>
>   See for example how Fabrice does it:
>
> cpe:2.3:a:osgeo:gdal is a valid CPE identifier for this package:
>
>
>
> https://nvd.nist.gov/products/cpe/search/results?namingFormat=2.3&keyword=cpe%3A2.3%3Aa%3Aosgeo%3Agdal
>
>
>   (We should add this to the manual as well.)
>

Indeed. I did a research and I was unable to find a proper CPE id so I
removed the CPE info from the package.


>
> >> +LIBDILL_INSTALL_STAGING = YES
> >> +# Fetched from Github, with no configure script
> >> +LIBDILL_AUTORECONF = YES
> >> +
> >> +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
> >
> > ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)
> >
> >> +LIBDILL_CONF_OPTS += --disable-threads
>
>   What kind of concurrent programming can you do without threads?
>

Async coroutines with cooperative scheduling. Extremely fast indeed!


>
>   Regards,
>   Arnout
>
> >> +endif
> >> +
> >> +ifeq ($(BR2_PACKAGE_OPENSSL),y)
> >> +LIBDILL_DEPENDENCIES = openssl
> >> +LIBDILL_CONF_OPTS += --enable-tls
> >
> > No "else" clause to explicitly disable?
> >
> >> +endif
> >
> > Thanks!
> >
> > Thomas
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

--0000000000003f274005e4f8d806
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jul 29, 2022 at 9:00 PM Arnou=
t Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arnout@mind.be</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br>
<br>
On 29/07/2022 10:47, Thomas Petazzoni via buildroot wrote:<br>
&gt; Hello Angelo,<br>
&gt; <br>
&gt; On Thu, 28 Jul 2022 23:12:59 +0200<br>
&gt; Angelo Compagnucci &lt;<a href=3D"mailto:angelo@amarulasolutions.com" =
target=3D"_blank">angelo@amarulasolutions.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; Libdill is a C library that makes writing structured concurrent pr=
ograms<br>
&gt;&gt; easy.<br>
&gt;&gt;<br>
&gt;&gt; Signed-off-by: Angelo Compagnucci &lt;<a href=3D"mailto:angelo@ama=
rulasolutions.com" target=3D"_blank">angelo@amarulasolutions.com</a>&gt;<br=
>
[snip]<br>
&gt;&gt; diff --git a/package/libdill/<a href=3D"http://libdill.mk" rel=3D"=
noreferrer" target=3D"_blank">libdill.mk</a> b/package/libdill/<a href=3D"h=
ttp://libdill.mk" rel=3D"noreferrer" target=3D"_blank">libdill.mk</a><br>
&gt;&gt; new file mode 100644<br>
&gt;&gt; index 0000000000..822f07b939<br>
&gt;&gt; --- /dev/null<br>
&gt;&gt; +++ b/package/libdill/<a href=3D"http://libdill.mk" rel=3D"norefer=
rer" target=3D"_blank">libdill.mk</a><br>
&gt;&gt; @@ -0,0 +1,26 @@<br>
&gt;&gt; +#################################################################=
###############<br>
&gt;&gt; +#<br>
&gt;&gt; +# libdill<br>
&gt;&gt; +#<br>
&gt;&gt; +#################################################################=
###############<br>
&gt;&gt; +<br>
&gt;&gt; +LIBDILL_VERSION =3D fa01648cf2a8d06e53c965b45eeacfb3ac57bd04<br>
&gt;&gt; +LIBDILL_SITE =3D $(call github,sustrik,libdill,$(LIBDILL_VERSION)=
)<br>
&gt;&gt; +LIBDILL_LICENSE =3D MIT<br>
&gt;&gt; +LIBDILL_LICENSE_FILES =3D COPYING<br>
&gt;&gt; +LIBDILL_CPE_ID_VENDOR =3D libdill<br>
&gt;&gt; +LIBDILL_CPE_ID_PRODUCT =3D libdill<br>
&gt; <br>
&gt; Could you add a link in the commit log that shows you have verified th=
ese?<br>
<br>
=C2=A0 See for example how Fabrice does it:<br>
<br>
cpe:2.3:a:osgeo:gdal is a valid CPE identifier for this package:<br>
<br>
<br>
<a href=3D"https://nvd.nist.gov/products/cpe/search/results?namingFormat=3D=
2.3&amp;keyword=3Dcpe%3A2.3%3Aa%3Aosgeo%3Agdal" rel=3D"noreferrer" target=
=3D"_blank">https://nvd.nist.gov/products/cpe/search/results?namingFormat=
=3D2.3&amp;keyword=3Dcpe%3A2.3%3Aa%3Aosgeo%3Agdal</a><br>
<br>
<br>
=C2=A0 (We should add this to the manual as well.)<br></blockquote><div><br=
></div><div>Indeed. I did a research and I was unable to find a proper CPE =
id so I removed the CPE info from the package. <br></div><div>=C2=A0</div><=
blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-l=
eft:1px solid rgb(204,204,204);padding-left:1ex">
<br>
&gt;&gt; +LIBDILL_INSTALL_STAGING =3D YES<br>
&gt;&gt; +# Fetched from Github, with no configure script<br>
&gt;&gt; +LIBDILL_AUTORECONF =3D YES<br>
&gt;&gt; +<br>
&gt;&gt; +ifneq ($(BR2_TOOLCHAIN_HAS_THREADS),y)<br>
&gt; <br>
&gt; ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),)<br>
&gt; <br>
&gt;&gt; +LIBDILL_CONF_OPTS +=3D --disable-threads<br>
<br>
=C2=A0 What kind of concurrent programming can you do without threads?<br><=
/blockquote><div><br></div><div>Async coroutines with cooperative schedulin=
g. Extremely fast indeed!<br></div><div>=C2=A0</div><blockquote class=3D"gm=
ail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,=
204,204);padding-left:1ex">
<br>
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
<br>
&gt;&gt; +endif<br>
&gt;&gt; +<br>
&gt;&gt; +ifeq ($(BR2_PACKAGE_OPENSSL),y)<br>
&gt;&gt; +LIBDILL_DEPENDENCIES =3D openssl<br>
&gt;&gt; +LIBDILL_CONF_OPTS +=3D --enable-tls<br>
&gt; <br>
&gt; No &quot;else&quot; clause to explicitly disable?<br>
&gt; <br>
&gt;&gt; +endif<br>
&gt; <br>
&gt; Thanks!<br>
&gt; <br>
&gt; Thomas<br>
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

--0000000000003f274005e4f8d806--

--===============6821863092149490808==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6821863092149490808==--
