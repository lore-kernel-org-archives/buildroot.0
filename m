Return-Path: <SRS0=HCTk=M6=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E649AC4338F
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:56:18 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 8D768600D4
	for <buildroot@archiver.kernel.org>; Sat,  7 Aug 2021 08:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 8D768600D4
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gadz.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5639582BC4;
	Sat,  7 Aug 2021 08:56:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BrjjvGZm-Eyb; Sat,  7 Aug 2021 08:56:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 72AFC82FE4;
	Sat,  7 Aug 2021 08:56:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id AB4251BF2FA
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:56:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A3B982A0B
 for <buildroot@lists.busybox.net>; Sat,  7 Aug 2021 08:56:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v6imn8T3In3p for <buildroot@lists.busybox.net>;
 Sat,  7 Aug 2021 08:56:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com
 [209.85.208.169])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 77F99829DC
 for <buildroot@busybox.net>; Sat,  7 Aug 2021 08:56:13 +0000 (UTC)
Received: by mail-lj1-f169.google.com with SMTP id x7so3993492ljn.10
 for <buildroot@busybox.net>; Sat, 07 Aug 2021 01:56:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5OnM8GgkgBHSW+0YAO40jbhg3uCEHY7yxhM9yI6woo=;
 b=VrvcWVz/EF7QhDVT12dYQlmyDuss112yTUTm08aLG5O4EayJ9K08C9vniizdGLJC9H
 XA5BaSRBxAmSlaXmHYh/sh8fDWEewjxoqJ6JCiDMg9LOnamt9NkE1TwsGU/A4ZnD6L4D
 trnX14bW0W05PowRNEgNfI5ya3WXGN98JcTNkEmLNOBxXf4ZAnyAmjiRI4BZUWjDDmMg
 cGvOOQnN8LkK09MZ0B9fSd8hfTvh9mhfa6WIpS5pIx16wcEpopxXfQcbmdKv5EDRMYRq
 Ff7V24FrVlVQseM9AQBMPKtFvR7EzUp0u2GYr4NLBOVjBr8kIUWqEpSLj+SEGj4vqzEo
 6WHg==
X-Gm-Message-State: AOAM5323IEX2m6Tx1jaPWWFDG/UtaDENHDEva/d9b9vOkf3KoZ8sNZOk
 juA1rIGj+a5sfuKHFi01zQrVjX+z8G7auUE57tLkGg==
X-Google-Smtp-Source: ABdhPJwWFjJPRgOfMmaBfL1q7gpVDqfSyG3KHiKMHQwzl+4nY98tOtGLs88UQ5aD0oFsJn1Um0TRvmkRH6gwZKQ7FJ0=
X-Received: by 2002:a2e:8250:: with SMTP id j16mr9380772ljh.164.1628326571123; 
 Sat, 07 Aug 2021 01:56:11 -0700 (PDT)
MIME-Version: 1.0
References: <20210804134635.262095-1-francois.perrad@gadz.org>
 <379b58ad-76ee-8601-d5b6-8a6cdf294818@mind.be>
In-Reply-To: <379b58ad-76ee-8601-d5b6-8a6cdf294818@mind.be>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 7 Aug 2021 10:55:59 +0200
Message-ID: <CAB0FRstwhGpbUDDKzDR2AgR9DCbC+QwRd2oEAJ+kTSubcdr9vQ@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
Subject: Re: [Buildroot] [PATCH v3 1/2] package/lua-lunix: fix build with
 recent gcc
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: buildroot <buildroot@busybox.net>, Francois Perrad <fperrad@gmail.com>
Content-Type: multipart/mixed; boundary="===============2360325210242797734=="
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

--===============2360325210242797734==
Content-Type: multipart/alternative; boundary="000000000000d9bbef05c8f45223"

--000000000000d9bbef05c8f45223
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeu. 5 ao=C3=BBt 2021 =C3=A0 19:05, Arnout Vandecappelle <arnout@mind.be=
> a =C3=A9crit :

>
>
> On 04/08/2021 15:46, Francois Perrad wrote:
> > Fixes:
> http://autobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab7=
30d090/
> > Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > ---
> >  package/lua-lunix/0003-force-no-sysctl.patch | 32 ++++++++++++++++++++
> >  1 file changed, 32 insertions(+)
> >  create mode 100644 package/lua-lunix/0003-force-no-sysctl.patch
> >
> > diff --git a/package/lua-lunix/0003-force-no-sysctl.patch
> b/package/lua-lunix/0003-force-no-sysctl.patch
> > new file mode 100644
> > index 000000000..3467e2713
> > --- /dev/null
> > +++ b/package/lua-lunix/0003-force-no-sysctl.patch
> > @@ -0,0 +1,32 @@
> > +From d9b65e306478f5d2356ef90eab8191984534238a Mon Sep 17 00:00:00 2001
> > +From: Francois Perrad <francois.perrad@gadz.org>
> > +Date: Wed, 4 Aug 2021 15:27:05 +0200
> > +Subject: [PATCH] force no sysctl
> > +
> > +Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
> > +---
> > + lunix-rel-20170920/lunix-20170920-1.rockspec | 9 +++++++++
> > + 1 file changed, 9 insertions(+)
> > +
> > +diff --git a/lunix-rel-20170920/lunix-20170920-1.rockspec
> b/lunix-rel-20170920/lunix-20170920-1.rockspec
> > +index 76cafeb..e42fd34 100644
> > +--- a/lunix-rel-20170920/lunix-20170920-1.rockspec
> > ++++ b/lunix-rel-20170920/lunix-20170920-1.rockspec
> > +@@ -35,5 +35,14 @@ build =3D {
> > +                             };
> > +                     };
> > +             };
> > ++            linux =3D {
> > ++                    modules =3D {
> > ++                            ["unix"] =3D {
> > ++                                    defines =3D {nil, nil, nil;
> > ++                                            "HAVE_SYS_SYSCTL_H=3D0";
>
>  That's a really dirty way of setting a define...
>
>  Unless this patch is accepted upstream (unlikely, given that there was n=
o
> maintainer activity on [1] since more than a month), a much better way
> IMHO is
> to set it from the .mk file:
>
> LUA_LUNIX_BUILD_OPTS =3D CFLAGS=3D"$(TARGET_CFLAGS) -DHAVE_SYS_SYSCTL_H=
=3D0"
>
>
It looks elegant but it doesn't work, because CFLAGS is already set in
pkg-luarocks.mk

The file lunix-20170920-1.rockspec is not a part of the upstream project (
https://25thandclement.com/~william/projects/releases/lunix-20170920.tgz or
https://github.com/wahern/lunix).
It was created by the author of Luarocks package, it is only available on
https://luarocks.org/modules/daurnimator/lunix
So, my patch cannot be upstreamed, but it is currently the only way to do.

Fran=C3=A7ois


> (This may not work though, depending on the order of the flags added by
> luarocks.)
>
>
>  Regards,
>  Arnout
>
> > ++                                    };
> > ++                            };
> > ++                    };
> > ++            };
> > +     };
> > + }
> > +--
> > +2.30.2
> > +
> >
> _______________________________________________
> buildroot mailing list
> buildroot@busybox.net
> http://lists.busybox.net/mailman/listinfo/buildroot
>

--000000000000d9bbef05c8f45223
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0jeu. 5 ao=C3=BBt 2021 =C3=A0=
=C2=A019:05, Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be">arn=
out@mind.be</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote class=3D"gmail=
_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204=
,204);padding-left:1ex"><br>
<br>
On 04/08/2021 15:46, Francois Perrad wrote:<br>
&gt; Fixes: <a href=3D"http://autobuild.buildroot.net/results/749a11d5289c6=
fec3b2f236b9073fc1ab730d090/" rel=3D"noreferrer" target=3D"_blank">http://a=
utobuild.buildroot.net/results/749a11d5289c6fec3b2f236b9073fc1ab730d090/</a=
><br>
&gt; Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@g=
adz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 package/lua-lunix/0003-force-no-sysctl.patch | 32 ++++++++++++++=
++++++<br>
&gt;=C2=A0 1 file changed, 32 insertions(+)<br>
&gt;=C2=A0 create mode 100644 package/lua-lunix/0003-force-no-sysctl.patch<=
br>
&gt; <br>
&gt; diff --git a/package/lua-lunix/0003-force-no-sysctl.patch b/package/lu=
a-lunix/0003-force-no-sysctl.patch<br>
&gt; new file mode 100644<br>
&gt; index 000000000..3467e2713<br>
&gt; --- /dev/null<br>
&gt; +++ b/package/lua-lunix/0003-force-no-sysctl.patch<br>
&gt; @@ -0,0 +1,32 @@<br>
&gt; +From d9b65e306478f5d2356ef90eab8191984534238a Mon Sep 17 00:00:00 200=
1<br>
&gt; +From: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@gadz.org"=
 target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; +Date: Wed, 4 Aug 2021 15:27:05 +0200<br>
&gt; +Subject: [PATCH] force no sysctl<br>
&gt; +<br>
&gt; +Signed-off-by: Francois Perrad &lt;<a href=3D"mailto:francois.perrad@=
gadz.org" target=3D"_blank">francois.perrad@gadz.org</a>&gt;<br>
&gt; +---<br>
&gt; + lunix-rel-20170920/lunix-20170920-1.rockspec | 9 +++++++++<br>
&gt; + 1 file changed, 9 insertions(+)<br>
&gt; +<br>
&gt; +diff --git a/lunix-rel-20170920/lunix-20170920-1.rockspec b/lunix-rel=
-20170920/lunix-20170920-1.rockspec<br>
&gt; +index 76cafeb..e42fd34 100644<br>
&gt; +--- a/lunix-rel-20170920/lunix-20170920-1.rockspec<br>
&gt; ++++ b/lunix-rel-20170920/lunix-20170920-1.rockspec<br>
&gt; +@@ -35,5 +35,14 @@ build =3D {<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0};<br>
&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0};<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 linux =3D {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 modules =3D {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 [&quot;unix&quot;] =3D {<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 defines =3D {ni=
l, nil, nil;<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 &quot;HAVE_SYS_SYSCTL_H=3D0&quot;;<br>
<br>
=C2=A0That&#39;s a really dirty way of setting a define...<br>
<br>
=C2=A0Unless this patch is accepted upstream (unlikely, given that there wa=
s no<br>
maintainer activity on [1] since more than a month), a much better way IMHO=
 is<br>
to set it from the .mk file:<br>
<br>
LUA_LUNIX_BUILD_OPTS =3D CFLAGS=3D&quot;$(TARGET_CFLAGS) -DHAVE_SYS_SYSCTL_=
H=3D0&quot;<br>
<br></blockquote><div><br></div><div>It looks elegant but it doesn&#39;t wo=
rk, because CFLAGS is already set in <a href=3D"http://pkg-luarocks.mk">pkg=
-luarocks.mk</a><br><br>The file lunix-20170920-1.rockspec is not a part of=
 the upstream project (<a href=3D"https://25thandclement.com/~william/proje=
cts/releases/lunix-20170920.tgz">https://25thandclement.com/~william/projec=
ts/releases/lunix-20170920.tgz</a> or <a href=3D"https://github.com/wahern/=
lunix">https://github.com/wahern/lunix</a>).<br>It was created by the autho=
r of Luarocks package, it is only available on <a href=3D"https://luarocks.=
org/modules/daurnimator/lunix">https://luarocks.org/modules/daurnimator/lun=
ix</a><br>So, my patch cannot be upstreamed, but it is currently the only w=
ay to do.<br><br>Fran=C3=A7ois<br></div><div>=C2=A0</div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">
(This may not work though, depending on the order of the flags added by lua=
rocks.)<br>
<br>
<br>
=C2=A0Regards,<br>
=C2=A0Arnout<br>
<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 };<br>
&gt; ++=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 };<br>
&gt; +=C2=A0 =C2=A0 =C2=A0};<br>
&gt; + }<br>
&gt; +-- <br>
&gt; +2.30.2<br>
&gt; +<br>
&gt; <br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@busybox.net" target=3D"_blank">buildroot@busybo=
x.net</a><br>
<a href=3D"http://lists.busybox.net/mailman/listinfo/buildroot" rel=3D"nore=
ferrer" target=3D"_blank">http://lists.busybox.net/mailman/listinfo/buildro=
ot</a><br>
</blockquote></div></div>

--000000000000d9bbef05c8f45223--

--===============2360325210242797734==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot

--===============2360325210242797734==--
