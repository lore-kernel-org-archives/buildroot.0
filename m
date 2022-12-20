Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FD86C4332F
	for <buildroot@archiver.kernel.org>; Tue, 20 Dec 2022 08:52:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 301A240A02;
	Tue, 20 Dec 2022 08:52:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 301A240A02
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NQohjJviS-8I; Tue, 20 Dec 2022 08:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E3ABC410A2;
	Tue, 20 Dec 2022 08:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E3ABC410A2
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B17751BF28C
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8CC97813D2
 for <buildroot@lists.busybox.net>; Tue, 20 Dec 2022 08:52:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CC97813D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DXfCi_cujYKP for <buildroot@lists.busybox.net>;
 Tue, 20 Dec 2022 08:52:18 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7139E813A7
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com
 [IPv6:2607:f8b0:4864:20::42e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7139E813A7
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 08:52:18 +0000 (UTC)
Received: by mail-pf1-x42e.google.com with SMTP id 65so8033984pfx.9
 for <buildroot@buildroot.org>; Tue, 20 Dec 2022 00:52:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lPmX8zXlcBkqSPRpbocYgHfe3wENn1gyWZlYCeZlhpI=;
 b=46zBicXgAIuJsLh07GIVH9UvNU30f7udNPqM5I+WSs8LqYgWO9Ateqq3bjZNmp3j9b
 ptlhzYfWbzNjZdfJk7niQblCKEzqdsjQKxM0wnQP8UwxY5jWbsTl6vLrUAMdhSPNgDqT
 uzSzM1cd+HzQwds13X6HZb5no7hz6G/98Z5v1IkvIhloC35wNnOdEQGVCYeT5RpZeHLa
 T0QyUuukUtf9Qi+1iN10mAG5MZTOONmRc+uQwM/yJ2PtLw4Nw3XPpTjrIJExODuznHj4
 W3YCOWHyUrIQn6VkgvXN6oB5AfW5IxVCkMkGPG1ChIsUtUJC1b0VrOaXf/MhqdOeOPo7
 Z3PQ==
X-Gm-Message-State: AFqh2ko2kySYwpW4s/gP89MGOOEgp1HrYvZh22ata/vGeHe+ahX/vSkD
 Xsf8ZgTLpxMQHuHQRB5WQnDNbwgFUZJZBseNNB07kaS5
X-Google-Smtp-Source: AMrXdXvZI+sDC6QTJOY2zunAJeZ2RYQUQbf8vbsq4aiICoDzgmg7T2VlE7iqr78Au7Qw8hFyt94XruHra47mAN70zjQ=
X-Received: by 2002:a62:607:0:b0:57f:a5e6:20fd with SMTP id
 7-20020a620607000000b0057fa5e620fdmr563611pfg.11.1671526337642; Tue, 20 Dec
 2022 00:52:17 -0800 (PST)
MIME-Version: 1.0
References: <20221219225820.429460-1-fontaine.fabrice@gmail.com>
 <20221220084752.GF2909@scaer>
In-Reply-To: <20221220084752.GF2909@scaer>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Tue, 20 Dec 2022 09:52:06 +0100
Message-ID: <CAPi7W83Fmd2ijRsCwpSfNf2YgRbE=yCDHTKgpKwxmg3Je3kkMQ@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lPmX8zXlcBkqSPRpbocYgHfe3wENn1gyWZlYCeZlhpI=;
 b=S2vf3yuWLpfy5sgAQNV/u527jI1wxdZFtLm5dbY+1W/c1MRE8232ZdUXexLwSeHT/9
 E94oxwCfBbyR0uVYpOLQMxMTCK7BeTWE51UYXBfUucNVl1VWWIjHP/xl2RVQ3jognjxm
 LG728Du8FvHzsSg+sfTo6QhVgV8Kn50eJbfz53m5fdsJsyWgaqXudsFTO0FmTdzHIHfH
 e1bWP8SE+TGdT/LLyR1j0Ax1BTvOjBmF06om9yy8zroZsJGFuI/ksZ/pbab4f4ZBC7Wu
 MxWUhLedOlNOjMXLaOud+vuGvm5xCK+u5tdH99pUpxdQZmPRZN0rBwEWoT+glOamXLaZ
 K1hg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=S2vf3yuW
Subject: Re: [Buildroot] [PATCH 1/1] package/lightning; fix build
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
Cc: Paul Cercueil <paul@crapouillou.net>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8476127067149558356=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8476127067149558356==
Content-Type: multipart/alternative; boundary="00000000000096853c05f03e8d28"

--00000000000096853c05f03e8d28
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello,

Le mar. 20 d=C3=A9c. 2022 =C3=A0 09:47, Yann E. MORIN <yann.morin.1998@free=
.fr> a
=C3=A9crit :

> Fabrice, All,
>
> On 2022-12-19 23:58 +0100, Fabrice Fontaine spake thusly:
> > Fix the following build failure raised since bump to version 2.2.0 in
> > commit af6f7aa76db5aed1eada0b27bd0375610a2fc728 and
> >
> http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=3D837c7a1e8d08f=
b9294578dc84694077f4d6106f9
> :
> >
> > jit_disasm.c: In function 'fprintf_styled':
> > jit_disasm.c:57:27: error: parameter name omitted
> >    57 | static int fprintf_styled(void *, enum disassembler_style, cons=
t
> char* fmt, ...)
> >       |                           ^~~~~~
> > jit_disasm.c:57:35: error: parameter name omitted
> >    57 | static int fprintf_styled(void *, enum disassembler_style, cons=
t
> char* fmt, ...)
> >       |                                   ^~~~~~~~~~~~~~~~~~~~~~~
> >
> > Fixes:
> >  -
> http://autobuild.buildroot.org/results/e15e01e98e0d8c873efd3f512b671d98e4=
daf6c0
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  .../0001-lib-jit_disasm.c-fix-build.patch     | 41 +++++++++++++++++++
> >  1 file changed, 41 insertions(+)
> >  create mode 100644
> package/lightning/0001-lib-jit_disasm.c-fix-build.patch
> >
> > diff --git a/package/lightning/0001-lib-jit_disasm.c-fix-build.patch
> b/package/lightning/0001-lib-jit_disasm.c-fix-build.patch
> > new file mode 100644
> > index 0000000000..f0bedc1817
> > --- /dev/null
> > +++ b/package/lightning/0001-lib-jit_disasm.c-fix-build.patch
> > @@ -0,0 +1,41 @@
> > +From 6d3ba4fb38ef3af61d8b7fc5c7781ed244ccf9fe Mon Sep 17 00:00:00 2001
> > +From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +Date: Mon, 19 Dec 2022 23:36:48 +0100
> > +Subject: [PATCH] lib/jit_disasm.c: fix build
> > +
> > +Fix the following build failure raised since
> > +
> http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=3D837c7a1e8d08f=
b9294578dc84694077f4d6106f9
> :
> > +
> > +jit_disasm.c: In function 'fprintf_styled':
> > +jit_disasm.c:57:27: error: parameter name omitted
> > +   57 | static int fprintf_styled(void *, enum disassembler_style,
> const char* fmt, ...)
> > +      |                           ^~~~~~
> > +jit_disasm.c:57:35: error: parameter name omitted
> > +   57 | static int fprintf_styled(void *, enum disassembler_style,
> const char* fmt, ...)
> > +      |                                   ^~~~~~~~~~~~~~~~~~~~~~~
> > +
> > +Fixes:
> > + -
> http://autobuild.buildroot.org/results/e15e01e98e0d8c873efd3f512b671d98e4=
daf6c0
> > +
> > +Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > +[Upstream status: sent to lightning@gnu.org]
> > +---
> > + lib/jit_disasm.c | 2 +-
> > + 1 file changed, 1 insertion(+), 1 deletion(-)
> > +
> > +diff --git a/lib/jit_disasm.c b/lib/jit_disasm.c
> > +index 58a269b..68c966d 100644
> > +--- a/lib/jit_disasm.c
> > ++++ b/lib/jit_disasm.c
> > +@@ -54,7 +54,7 @@ static FILE                         *disasm_stream;
> > + #endif
> > +
> > + #if BINUTILS_2_38
> > +-static int fprintf_styled(void *, enum disassembler_style, const char=
*
> fmt, ...)
> > ++static int fprintf_styled(void * stream, enum disassembler_style
> style, const char* fmt, ...)
>
> Should it be marked with  __attribute__((unused))  or some such?
>

Indeed, I'll send a v2.


>
> Regards,
> Yann E. MORIN.
>
> > + {
> > +   va_list args;
> > +   int r;
> > +--
> > +2.35.1
> > +
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

--00000000000096853c05f03e8d28
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello,<br></div><br><div class=3D"gmail_q=
uote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 20 d=C3=A9c. 2022 =
=C3=A0=C2=A009:47, Yann E. MORIN &lt;<a href=3D"mailto:yann.morin.1998@free=
.fr">yann.morin.1998@free.fr</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquo=
te class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px =
solid rgb(204,204,204);padding-left:1ex">Fabrice, All,<br>
<br>
On 2022-12-19 23:58 +0100, Fabrice Fontaine spake thusly:<br>
&gt; Fix the following build failure raised since bump to version 2.2.0 in<=
br>
&gt; commit af6f7aa76db5aed1eada0b27bd0375610a2fc728 and<br>
&gt; <a href=3D"http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=
=3D837c7a1e8d08fb9294578dc84694077f4d6106f9" rel=3D"noreferrer" target=3D"_=
blank">http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=3D837c7a1e=
8d08fb9294578dc84694077f4d6106f9</a>:<br>
&gt; <br>
&gt; jit_disasm.c: In function &#39;fprintf_styled&#39;:<br>
&gt; jit_disasm.c:57:27: error: parameter name omitted<br>
&gt;=C2=A0 =C2=A0 57 | static int fprintf_styled(void *, enum disassembler_=
style, const char* fmt, ...)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~<br>
&gt; jit_disasm.c:57:35: error: parameter name omitted<br>
&gt;=C2=A0 =C2=A0 57 | static int fprintf_styled(void *, enum disassembler_=
style, const char* fmt, ...)<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0|=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0^~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; <br>
&gt; Fixes:<br>
&gt;=C2=A0 - <a href=3D"http://autobuild.buildroot.org/results/e15e01e98e0d=
8c873efd3f512b671d98e4daf6c0" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.org/results/e15e01e98e0d8c873efd3f512b671d98e4daf6c0</a>=
<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../0001-lib-jit_disasm.c-fix-build.patch=C2=A0 =C2=A0 =C2=A0| 4=
1 +++++++++++++++++++<br>
&gt;=C2=A0 1 file changed, 41 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/lightning/0001-lib-jit_disasm.c-fix-b=
uild.patch<br>
&gt; <br>
&gt; diff --git a/package/lightning/0001-lib-jit_disasm.c-fix-build.patch b=
/package/lightning/0001-lib-jit_disasm.c-fix-build.patch<br>
&gt; new file mode 100644<br>
&gt; index 0000000000..f0bedc1817<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/lightning/0001-lib-jit_disasm.c-fix-build.patch<br>
&gt; @@ -0,0 +1,41 @@<br>
&gt; +From 6d3ba4fb38ef3af61d8b7fc5c7781ed244ccf9fe Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.c=
om" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; +Date: Mon, 19 Dec 2022 23:36:48 +0100<br>
&gt; +Subject: [PATCH] lib/jit_disasm.c: fix build<br>
&gt; +<br>
&gt; +Fix the following build failure raised since<br>
&gt; +<a href=3D"http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=
=3D837c7a1e8d08fb9294578dc84694077f4d6106f9" rel=3D"noreferrer" target=3D"_=
blank">http://git.savannah.gnu.org/cgit/lightning.git/commit/?id=3D837c7a1e=
8d08fb9294578dc84694077f4d6106f9</a>:<br>
&gt; +<br>
&gt; +jit_disasm.c: In function &#39;fprintf_styled&#39;:<br>
&gt; +jit_disasm.c:57:27: error: parameter name omitted<br>
&gt; +=C2=A0 =C2=A057 | static int fprintf_styled(void *, enum disassembler=
_style, const char* fmt, ...)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0^~~~~~<br>
&gt; +jit_disasm.c:57:35: error: parameter name omitted<br>
&gt; +=C2=A0 =C2=A057 | static int fprintf_styled(void *, enum disassembler=
_style, const char* fmt, ...)<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 |=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0^~~~~~~~~~~~~~~~~~~~~~~<br>
&gt; +<br>
&gt; +Fixes:<br>
&gt; + - <a href=3D"http://autobuild.buildroot.org/results/e15e01e98e0d8c87=
3efd3f512b671d98e4daf6c0" rel=3D"noreferrer" target=3D"_blank">http://autob=
uild.buildroot.org/results/e15e01e98e0d8c873efd3f512b671d98e4daf6c0</a><br>
&gt; +<br>
&gt; +Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabric=
e@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; +[Upstream status: sent to <a href=3D"mailto:lightning@gnu.org" target=
=3D"_blank">lightning@gnu.org</a>]<br>
&gt; +---<br>
&gt; + lib/jit_disasm.c | 2 +-<br>
&gt; + 1 file changed, 1 insertion(+), 1 deletion(-)<br>
&gt; +<br>
&gt; +diff --git a/lib/jit_disasm.c b/lib/jit_disasm.c<br>
&gt; +index 58a269b..68c966d 100644<br>
&gt; +--- a/lib/jit_disasm.c<br>
&gt; ++++ b/lib/jit_disasm.c<br>
&gt; +@@ -54,7 +54,7 @@ static FILE=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0*disasm_stream;<br>
&gt; + #endif<br>
&gt; + <br>
&gt; + #if BINUTILS_2_38<br>
&gt; +-static int fprintf_styled(void *, enum disassembler_style, const cha=
r* fmt, ...)<br>
&gt; ++static int fprintf_styled(void * stream, enum disassembler_style sty=
le, const char* fmt, ...)<br>
<br>
Should it be marked with=C2=A0 __attribute__((unused))=C2=A0 or some such?<=
br></blockquote><div><br></div><div>Indeed, I&#39;ll send a v2.<br></div><d=
iv>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0p=
x 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; + {<br>
&gt; +=C2=A0 =C2=A0va_list args;<br>
&gt; +=C2=A0 =C2=A0int r;<br>
&gt; +-- <br>
&gt; +2.35.1<br>
&gt; +<br>
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

--00000000000096853c05f03e8d28--

--===============8476127067149558356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8476127067149558356==--
