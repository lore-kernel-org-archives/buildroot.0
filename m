Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DB68C433FE
	for <buildroot@archiver.kernel.org>; Sun, 20 Nov 2022 09:50:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D2D6660ABB;
	Sun, 20 Nov 2022 09:50:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D2D6660ABB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HH_0FxnW1RiS; Sun, 20 Nov 2022 09:50:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9633607F6;
	Sun, 20 Nov 2022 09:50:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9633607F6
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A9AE01BF40E
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:50:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8530B607F6
 for <buildroot@lists.busybox.net>; Sun, 20 Nov 2022 09:50:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8530B607F6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HfT_RIXxUJjs for <buildroot@lists.busybox.net>;
 Sun, 20 Nov 2022 09:50:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8F1306079E
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com
 [IPv6:2607:f8b0:4864:20::536])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8F1306079E
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 09:50:11 +0000 (UTC)
Received: by mail-pg1-x536.google.com with SMTP id h193so8684814pgc.10
 for <buildroot@buildroot.org>; Sun, 20 Nov 2022 01:50:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RXY7DHa0ZNyVHQe3UP3nqQOtwTBPZNja8TsvcaZd038=;
 b=IcnzTpWVlXEOSvAiDiMxJotUq8XfQyhPeDc5AB2Je4V5oHnGFMt7f1Z91KrrEok97c
 gGi3OTqrBFGg7HiCARgfWkt8BgadnzcJOEbR5vwi256KZL2jpnnGahGePxhVHXsE6tD/
 gcJRTuKd0K6OYdSHd38FHPvNCcFMhER4Ml4n/71td7zJiicwJkMDWa3zijVvHL7Um5Td
 dvPCfJDmgdN0ttTrbjvcR2OToDS+G8/c1m8uoTyM/rbskUcdZ12+75F8FA5OrPN2ew39
 psm7PIzkrzz7dVQ9O+1O6LoWdug3UE6Nsm+egs0LsXg0hUlUZxBUyYDv95viOg1dYhYz
 uvjQ==
X-Gm-Message-State: ANoB5plJufIa/tOjGtMFnjvMeIRFwbwIMlj4kWTSj6S9gSO0F+Xkv5Hc
 PbCKysdX9e/BH340rIefmBxh6rKPqEuO2cI6FCiHI4VQe2s=
X-Google-Smtp-Source: AA0mqf5RAO33quOOIp1d1opRfSLGD6BkBsldm+kIlJy3ue7YYF4dnBwtawfLrsRD0tq22dba3DX56S1LvqiERa9EyaM=
X-Received: by 2002:a63:117:0:b0:476:f43d:913e with SMTP id
 23-20020a630117000000b00476f43d913emr13367223pgb.386.1668937810707; Sun, 20
 Nov 2022 01:50:10 -0800 (PST)
MIME-Version: 1.0
References: <20221119233706.52949-1-fontaine.fabrice@gmail.com>
 <20221120090945.GQ2123054@scaer>
In-Reply-To: <20221120090945.GQ2123054@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 20 Nov 2022 10:49:59 +0100
Message-ID: <CAPi7W82K7qD7swXOjSo=wH7OEHYEU8GJwmX+=3OJGxx9G2jQzg@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RXY7DHa0ZNyVHQe3UP3nqQOtwTBPZNja8TsvcaZd038=;
 b=G68mM9Vm1dxKop2NsSm8X+5vN4yHtAajqiAeulZQakK+eGlH81izkHG8/iQ7BPpqLm
 Z5wjTxykz32C+iS/O0u23lyEG0GtyiIW98SlspaN+CDAGuud57Oe9qwFTnK5KcGv3ozA
 aj+cwvyhETtW5w9MuLFCiSLBc4DDikFyVo93Qlkj9pIYCTQXMnnPZCNLbfGaxitAlXBm
 eyBOyQHbAIHKqDKgzc3L7VE5YK0qDZzFeEd7cY3sVES7g+LmgYQUJiW8crGcVwxJhLtj
 m+Mw77SZdnYJ1c4zFHYnxCYjvGsMpuwzdoF5mCQvb6YjpBGKtoXMxO+jeZ/PQvqf5ReX
 +iKw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=G68mM9Vm
Subject: Re: [Buildroot] [PATCH 1/1] package/sysstat: security bump to
 version 12.6.1
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
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4205067857712578211=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4205067857712578211==
Content-Type: multipart/alternative; boundary="0000000000005c0bcc05ede3dd21"

--0000000000005c0bcc05ede3dd21
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Yann,

Le dim. 20 nov. 2022 =C3=A0 10:09, Yann E. MORIN <yann.morin.1998@free.fr> =
a
=C3=A9crit :

> Fabrice, All,
>
> On 2022-11-20 00:37 +0100, Fabrice Fontaine spake thusly:
> > Fix CVE-2022-39377: sysstat is a set of system performance tools for th=
e
> > Linux operating system. On 32 bit systems, in versions 9.1.16 and newer
> > but prior to 12.7.1, allocate_structures contains a size_t overflow in
>
> As you quote the NVD description, it states that versions lower than
> 12.7.1 are impacted, yet you only bump to 12.6.1.
>

12.7.1 is a development version:
http://sebastien.godard.pagesperso-orange.fr/


>
> Also, the pointer you provided to the changelog does not mention
> CVE-2022-39377. Besides, github warns that it is not part of the
>

Changelog is mentioning GHSL-2022-074 (a.k.a. CVE-2022-39377):

2022/11/06: Version 12.6.1 - Sebastien Godard (sysstat <at> orange.fr)
* Fix possible overflow in sa_common.c (GHSL-2022-074).


> sysstat repository (/!\ This commit does not belong to any branch on
> this repository, and may belong to a fork outside of the repository).
>
> Can you double-check, please: if 12.6.1 indeed fixes the issue, then
> extend the commit log with the appropriate references; if not then we
> should bump to 12.7.1.
>

And finally, here is the commit that fixes the issue on 12.6.1:
https://github.com/sysstat/sysstat/commit/c1e631eddc50c04e4dcea169ba396bee2=
bd6b0ab


>
> Regards,
> Yann E. MORIN.
>
> > sa_common.c. The allocate_structures function insufficiently checks
> > bounds before arithmetic multiplication, allowing for an overflow in th=
e
> > size allocated for the buffer representing system activities. This issu=
e
> > may lead to Remote Code Execution (RCE).
> >
> >
> https://github.com/sysstat/sysstat/security/advisories/GHSA-q8r6-g56f-9w7=
x
> > https://github.com/sysstat/sysstat/blob/v12.6.1/CHANGES
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  package/sysstat/sysstat.hash | 4 ++--
> >  package/sysstat/sysstat.mk   | 2 +-
> >  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.has=
h
> > index b573f312c6..b47f000e57 100644
> > --- a/package/sysstat/sysstat.hash
> > +++ b/package/sysstat/sysstat.hash
> > @@ -1,5 +1,5 @@
> >  # From: http://sebastien.godard.pagesperso-orange.fr/download.html
> > -sha1  1e38bc029979def730ae1fb1e39f631bd1a3bc73  sysstat-12.4.2.tar.xz
> > +sha1  a730982e0c2d4964a0022c1509f3ea0a345402bc  sysstat-12.6.1.tar.xz
> >  # Locally calculated
> > -sha256
> 3701b2c1883d50eb384d7b95ce5b6df0a71fdcb3c23f96cb58098d1bcffa018f
> sysstat-12.4.2.tar.xz
> > +sha256
> 18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9464a0342
> sysstat-12.6.1.tar.xz
> >  sha256
> db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3dff411b1c2fc73  COPYING
> > diff --git a/package/sysstat/sysstat.mk b/package/sysstat/sysstat.mk
> > index 6948f6b390..377396d986 100644
> > --- a/package/sysstat/sysstat.mk
> > +++ b/package/sysstat/sysstat.mk
> > @@ -4,7 +4,7 @@
> >  #
> >
> #########################################################################=
#######
> >
> > -SYSSTAT_VERSION =3D 12.4.2
> > +SYSSTAT_VERSION =3D 12.6.1
> >  SYSSTAT_SOURCE =3D sysstat-$(SYSSTAT_VERSION).tar.xz
> >  SYSSTAT_SITE =3D http://pagesperso-orange.fr/sebastien.godard
> >  SYSSTAT_CONF_OPTS =3D --disable-file-attr
> > --
> > 2.35.1
> >
> > _______________________________________________
> > buildroot mailing list
> > buildroot@buildroot.org
> > https://lists.buildroot.org/mailman/listinfo/buildroot
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

Best Regards,

Fabrice

--0000000000005c0bcc05ede3dd21
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Yann,<br></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 20 nov. 2022 =C3=A0=
=C2=A010:09, Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free.fr">y=
ann.morin.1998@free.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">Fabrice, All,<br>
<br>
On 2022-11-20 00:37 +0100, Fabrice Fontaine spake thusly:<br>
&gt; Fix CVE-2022-39377: sysstat is a set of system performance tools for t=
he<br>
&gt; Linux operating system. On 32 bit systems, in versions 9.1.16 and newe=
r<br>
&gt; but prior to 12.7.1, allocate_structures contains a size_t overflow in=
<br>
<br>
As you quote the NVD description, it states that versions lower than<br>
12.7.1 are impacted, yet you only bump to 12.6.1.<br></blockquote><div><br>=
</div><div>12.7.1 is a development version: <a href=3D"http://sebastien.god=
ard.pagesperso-orange.fr/">http://sebastien.godard.pagesperso-orange.fr/</a=
></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0=
px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Also, the pointer you provided to the changelog does not mention<br>
CVE-2022-39377. Besides, github warns that it is not part of the<br></block=
quote><div><br></div><div>Changelog is mentioning GHSL-2022-074 (a.k.a. CVE=
-2022-39377):<br></div><div><br></div><div><table class=3D"gmail-highlight =
gmail-tab-size gmail-js-file-line-container gmail-js-code-nav-container gma=
il-js-tagsearch-file"><tbody><tr><td id=3D"gmail-LC3" class=3D"gmail-blob-c=
ode gmail-blob-code-inner gmail-js-file-line">2022/11/06: Version 12.6.1 - =
Sebastien Godard (sysstat &lt;at&gt; <a href=3D"http://orange.fr">orange.fr=
</a>)</td>
        </tr>
        <tr>
          </tr></tbody></table>	* Fix possible overflow in sa_common.c (GHS=
L-2022-074).</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
sysstat repository (/!\ This commit does not belong to any branch on<br>
this repository, and may belong to a fork outside of the repository).<br>
<br>
Can you double-check, please: if 12.6.1 indeed fixes the issue, then<br>
extend the commit log with the appropriate references; if not then we<br>
should bump to 12.7.1.<br></blockquote><div><br></div><div>And finally, her=
e is the commit that fixes the issue on 12.6.1:</div><div><a href=3D"https:=
//github.com/sysstat/sysstat/commit/c1e631eddc50c04e4dcea169ba396bee2bd6b0a=
b">https://github.com/sysstat/sysstat/commit/c1e631eddc50c04e4dcea169ba396b=
ee2bd6b0ab</a></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; sa_common.c. The allocate_structures function insufficiently checks<br=
>
&gt; bounds before arithmetic multiplication, allowing for an overflow in t=
he<br>
&gt; size allocated for the buffer representing system activities. This iss=
ue<br>
&gt; may lead to Remote Code Execution (RCE).<br>
&gt; <br>
&gt; <a href=3D"https://github.com/sysstat/sysstat/security/advisories/GHSA=
-q8r6-g56f-9w7x" rel=3D"noreferrer" target=3D"_blank">https://github.com/sy=
sstat/sysstat/security/advisories/GHSA-q8r6-g56f-9w7x</a><br>
&gt; <a href=3D"https://github.com/sysstat/sysstat/blob/v12.6.1/CHANGES" re=
l=3D"noreferrer" target=3D"_blank">https://github.com/sysstat/sysstat/blob/=
v12.6.1/CHANGES</a><br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/sysstat/sysstat.hash | 4 ++--<br>
&gt;=C2=A0 package/sysstat/<a href=3D"http://sysstat.mk" rel=3D"noreferrer"=
 target=3D"_blank">sysstat.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/sysstat/sysstat.hash b/package/sysstat/sysstat.ha=
sh<br>
&gt; index b573f312c6..b47f000e57 100644<br>
&gt; --- a/package/sysstat/sysstat.hash<br>
&gt; +++ b/package/sysstat/sysstat.hash<br>
&gt; @@ -1,5 +1,5 @@<br>
&gt;=C2=A0 # From: <a href=3D"http://sebastien.godard.pagesperso-orange.fr/=
download.html" rel=3D"noreferrer" target=3D"_blank">http://sebastien.godard=
.pagesperso-orange.fr/download.html</a><br>
&gt; -sha1=C2=A0 1e38bc029979def730ae1fb1e39f631bd1a3bc73=C2=A0 sysstat-12.=
4.2.tar.xz<br>
&gt; +sha1=C2=A0 a730982e0c2d4964a0022c1509f3ea0a345402bc=C2=A0 sysstat-12.=
6.1.tar.xz<br>
&gt;=C2=A0 # Locally calculated<br>
&gt; -sha256=C2=A0 3701b2c1883d50eb384d7b95ce5b6df0a71fdcb3c23f96cb58098d1b=
cffa018f=C2=A0 sysstat-12.4.2.tar.xz<br>
&gt; +sha256=C2=A0 18ff5a4e149e2568e43385637f72437fe6bafcc1322a93d13d1981e9=
464a0342=C2=A0 sysstat-12.6.1.tar.xz<br>
&gt;=C2=A0 sha256=C2=A0 db296f2f7f35bca3a174efb0eb392b3b17bd94b341851429a3d=
ff411b1c2fc73=C2=A0 COPYING<br>
&gt; diff --git a/package/sysstat/<a href=3D"http://sysstat.mk" rel=3D"nore=
ferrer" target=3D"_blank">sysstat.mk</a> b/package/sysstat/<a href=3D"http:=
//sysstat.mk" rel=3D"noreferrer" target=3D"_blank">sysstat.mk</a><br>
&gt; index 6948f6b390..377396d986 100644<br>
&gt; --- a/package/sysstat/<a href=3D"http://sysstat.mk" rel=3D"noreferrer"=
 target=3D"_blank">sysstat.mk</a><br>
&gt; +++ b/package/sysstat/<a href=3D"http://sysstat.mk" rel=3D"noreferrer"=
 target=3D"_blank">sysstat.mk</a><br>
&gt; @@ -4,7 +4,7 @@<br>
&gt;=C2=A0 #<br>
&gt;=C2=A0 ################################################################=
################<br>
&gt;=C2=A0 <br>
&gt; -SYSSTAT_VERSION =3D 12.4.2<br>
&gt; +SYSSTAT_VERSION =3D 12.6.1<br>
&gt;=C2=A0 SYSSTAT_SOURCE =3D sysstat-$(SYSSTAT_VERSION).tar.xz<br>
&gt;=C2=A0 SYSSTAT_SITE =3D <a href=3D"http://pagesperso-orange.fr/sebastie=
n.godard" rel=3D"noreferrer" target=3D"_blank">http://pagesperso-orange.fr/=
sebastien.godard</a><br>
&gt;=C2=A0 SYSSTAT_CONF_OPTS =3D --disable-file-attr<br>
&gt; -- <br>
&gt; 2.35.1<br>
&gt; <br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot=
@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listi=
nfo/buildroot</a><br>
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
--------&#39;<br></blockquote><div><br></div><div>Best Regards,</div><div><=
br></div><div>Fabrice <br></div></div></div>

--0000000000005c0bcc05ede3dd21--

--===============4205067857712578211==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4205067857712578211==--
