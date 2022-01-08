Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35F21C433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 19:16:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F04B4403A8;
	Sat,  8 Jan 2022 19:16:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9klKTtphW4jc; Sat,  8 Jan 2022 19:16:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3499A4034D;
	Sat,  8 Jan 2022 19:16:24 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 099EF1BF3C9
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:16:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F3A0F40357
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 19:16:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cXiGyk_S6_Hc for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 19:16:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0D34F4034A
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 19:16:21 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id s6so11837150ioj.0
 for <buildroot@buildroot.org>; Sat, 08 Jan 2022 11:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=H/52ONUnDjm+O93LmLQd91QuC5pcHkMQ2vW9cxxXGps=;
 b=flvyyYVAtzmKPwxsFgFTilqZIiWj0nk6wt+BNLI/X5BzMDR9WdH4JJesZV2OmZu4+M
 KWbrUL+ICgxs55YHxq5gJU4abtPi9XOMKC371y0Rwhsv5n+uiYZZzsE6rQyBdh80eXsF
 w9MrFKglwHScNgz3xHi2IVKEDlH3+MBcY0rN7Je0VtNiR69BM0wEpOFx1ExTbFNfTr+T
 g0XcKyUcbYCEx0KavtdFv277sGbsATtNtG038DnlgAhbtU8feccB1t30Lg8OzMBnbdKa
 RVHfjFctReJMjvYpcJHHP155/gOdn+ASShKhwIWhd6J7/wMbVoRb1O5TjF5pu5D1Uz1+
 gRbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=H/52ONUnDjm+O93LmLQd91QuC5pcHkMQ2vW9cxxXGps=;
 b=keK5H7RQZ8tMvQumDLod7hy3DGk/3gmSwnUdA8jfRkgql7DmZE/uv3WEK51NBlYR/+
 XtMj3fZkZc3Yxk3nS1Jlv6II64n4kOZlsKRv3xY4U11qdwhNmxOUVM5m3KfivLZycMJP
 V0B7Xg1YATM62lzx2mTDdzbtsRhDZltSjPKoOTYyaLb4jOTgiZYljPY2PGdHfVBN4rIJ
 8RCJzieMtRSRWaW3LYy5iEdqLX3MWB8G3f/2qSaMPJTzOECWzRE+iIcGJnZI+BNZArVo
 J9sY3CiWjPSjDR32B7fSGC39r8uITNlJb+xd1+2ZRzYwSuRPRCcXWkO+I5scya3ZX3RP
 0Aow==
X-Gm-Message-State: AOAM531ImqQbzOJsEp9FK8Wrgd4DCPs8NhDAFVg+IOQiNleU+Dt5YrZb
 WEJIR+ua9KgmXoFDLGpLxZjLGtvUdQ/P0HzvFAUFOLqA
X-Google-Smtp-Source: ABdhPJyoK+J3Sn10V9E6sQuahFdaTZH0TqGurZGIDlkDm7jrPLMLgKflYwTT3xY84e7gWEu2ACnRK/BX2nVYG7BfwWc=
X-Received: by 2002:a5d:85d5:: with SMTP id e21mr32133467ios.51.1641669381129; 
 Sat, 08 Jan 2022 11:16:21 -0800 (PST)
MIME-Version: 1.0
References: <20210623145231.19243-1-cyrilbur@gmail.com>
 <382b2896-92a6-4a75-0093-bea2b6f91bf9@smile.fr>
 <CAN-ccAQ9p1GKWmLThvGxi2+r698j9LB47RK0R6piC5zR2OgRvQ@mail.gmail.com>
 <bf38076f-5b44-0fbf-47f5-c7cffb0498b8@smile.fr>
In-Reply-To: <bf38076f-5b44-0fbf-47f5-c7cffb0498b8@smile.fr>
From: Cyril Bur <cyrilbur@gmail.com>
Date: Sat, 8 Jan 2022 19:16:10 +0000
Message-ID: <CAN-ccARcyT1TDJrgMvNsz4rBhbBxrnr2ueBE0iV8PvynCXVZ4g@mail.gmail.com>
To: Romain Naour <romain.naour@smile.fr>
Subject: Re: [Buildroot] [PATCH] package/python-greenlet: enable as host
 package
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
Content-Type: multipart/mixed; boundary="===============3531829124761942299=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============3531829124761942299==
Content-Type: multipart/alternative; boundary="0000000000004d0ae505d516f028"

--0000000000004d0ae505d516f028
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 8 Jan 2022, 19:13 Romain Naour, <romain.naour@smile.fr> wrote:

> Hello Cyril,
>
> Le 08/01/2022 =C3=A0 20:03, Cyril Bur a =C3=A9crit :
> > Hi Romain,
> >
> > Thanks for your interest.
> >
> > My employer has some custom packages which do depend on host python
> > greenlet.
> >
> > I'm keen to avoid any forks (however small) of buildroot internally, it
> > just makes life easier.
>
> I understand.
>
> It seems there is an exception in the tree (host-python-lxml), but you
> have to
> add at least a Config.in.host:
>

Ah sorry! Yep will do.

>
>
> https://git.buildroot.net/buildroot/commit/?id=3D4f147ae0a0f940dfc7ec93af=
8e70b6625821d91d
>
> Also add a comment to explain why we don't have any package using it in
> the tree.
>

Perfect will do.

Thanks,

Cyril

>
> I have marked this patch as "Changes Requested".
>
> Best regards,
> Romain
>
>
> >
> > Cyril
> >
> >
> > On Sat, 8 Jan 2022, 18:43 Romain Naour, <romain.naour@smile.fr> wrote:
> >
> >> Hello,
> >>
> >> Le 23/06/2021 =C3=A0 16:52, Cyril Bur a =C3=A9crit :
> >>
> >> Why?
> >>
> >> There is not package using host-python-greenlet in the tree.
> >>
> >> Best regards,
> >> Romain
> >>
> >>> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> >>> ---
> >>>  package/python-greenlet/python-greenlet.mk | 1 +
> >>>  1 file changed, 1 insertion(+)
> >>>
> >>> diff --git a/package/python-greenlet/python-greenlet.mk
> >> b/package/python-greenlet/python-greenlet.mk
> >>> index 01d578a183..e90d1c0f56 100644
> >>> --- a/package/python-greenlet/python-greenlet.mk
> >>> +++ b/package/python-greenlet/python-greenlet.mk
> >>> @@ -12,3 +12,4 @@ PYTHON_GREENLET_LICENSE =3D MIT, PSF-2.0
> >>>  PYTHON_GREENLET_LICENSE_FILES =3D LICENSE LICENSE.PSF
> >>>
> >>>  $(eval $(python-package))
> >>> +$(eval $(host-python-package))
> >>>
> >>
> >>
> >
>
>

--0000000000004d0ae505d516f028
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">On Sat, 8 Jan 2022, 19:13 Romain Naour, &lt;<a href=3D=
"mailto:romain.naour@smile.fr">romain.naour@smile.fr</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex">Hello Cyril,<br>
<br>
Le 08/01/2022 =C3=A0 20:03, Cyril Bur a =C3=A9crit=C2=A0:<br>
&gt; Hi Romain,<br>
&gt; <br>
&gt; Thanks for your interest.<br>
&gt; <br>
&gt; My employer has some custom packages which do depend on host python<br=
>
&gt; greenlet.<br>
&gt; <br>
&gt; I&#39;m keen to avoid any forks (however small) of buildroot internall=
y, it<br>
&gt; just makes life easier.<br>
<br>
I understand.<br>
<br>
It seems there is an exception in the tree (host-python-lxml), but you have=
 to<br>
add at least a Config.in.host:<br></blockquote></div></div><div dir=3D"auto=
"><br></div><div dir=3D"auto">Ah sorry! Yep will do.</div><div dir=3D"auto"=
><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote" style=3D"marg=
in:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
<a href=3D"https://git.buildroot.net/buildroot/commit/?id=3D4f147ae0a0f940d=
fc7ec93af8e70b6625821d91d" rel=3D"noreferrer noreferrer" target=3D"_blank">=
https://git.buildroot.net/buildroot/commit/?id=3D4f147ae0a0f940dfc7ec93af8e=
70b6625821d91d</a><br>
<br>
Also add a comment to explain why we don&#39;t have any package using it in=
 the tree.<br></blockquote></div></div><div dir=3D"auto"><br></div><div dir=
=3D"auto">Perfect will do.</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thanks,</div><div dir=3D"auto"><br></div><div dir=3D"auto">Cyril</div><d=
iv dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote=
" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">
<br>
I have marked this patch as &quot;Changes Requested&quot;.<br>
<br>
Best regards,<br>
Romain<br>
<br>
<br>
&gt; <br>
&gt; Cyril<br>
&gt; <br>
&gt; <br>
&gt; On Sat, 8 Jan 2022, 18:43 Romain Naour, &lt;<a href=3D"mailto:romain.n=
aour@smile.fr" target=3D"_blank" rel=3D"noreferrer">romain.naour@smile.fr</=
a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; Hello,<br>
&gt;&gt;<br>
&gt;&gt; Le 23/06/2021 =C3=A0 16:52, Cyril Bur a =C3=A9crit :<br>
&gt;&gt;<br>
&gt;&gt; Why?<br>
&gt;&gt;<br>
&gt;&gt; There is not package using host-python-greenlet in the tree.<br>
&gt;&gt;<br>
&gt;&gt; Best regards,<br>
&gt;&gt; Romain<br>
&gt;&gt;<br>
&gt;&gt;&gt; Signed-off-by: Cyril Bur &lt;<a href=3D"mailto:cyrilbur@gmail.=
com" target=3D"_blank" rel=3D"noreferrer">cyrilbur@gmail.com</a>&gt;<br>
&gt;&gt;&gt; ---<br>
&gt;&gt;&gt;=C2=A0 package/python-greenlet/<a href=3D"http://python-greenle=
t.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">python-greenlet.mk</a=
> | 1 +<br>
&gt;&gt;&gt;=C2=A0 1 file changed, 1 insertion(+)<br>
&gt;&gt;&gt;<br>
&gt;&gt;&gt; diff --git a/package/python-greenlet/<a href=3D"http://python-=
greenlet.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">python-greenle=
t.mk</a><br>
&gt;&gt; b/package/python-greenlet/<a href=3D"http://python-greenlet.mk" re=
l=3D"noreferrer noreferrer" target=3D"_blank">python-greenlet.mk</a><br>
&gt;&gt;&gt; index 01d578a183..e90d1c0f56 100644<br>
&gt;&gt;&gt; --- a/package/python-greenlet/<a href=3D"http://python-greenle=
t.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">python-greenlet.mk</a=
><br>
&gt;&gt;&gt; +++ b/package/python-greenlet/<a href=3D"http://python-greenle=
t.mk" rel=3D"noreferrer noreferrer" target=3D"_blank">python-greenlet.mk</a=
><br>
&gt;&gt;&gt; @@ -12,3 +12,4 @@ PYTHON_GREENLET_LICENSE =3D MIT, PSF-2.0<br>
&gt;&gt;&gt;=C2=A0 PYTHON_GREENLET_LICENSE_FILES =3D LICENSE LICENSE.PSF<br=
>
&gt;&gt;&gt;<br>
&gt;&gt;&gt;=C2=A0 $(eval $(python-package))<br>
&gt;&gt;&gt; +$(eval $(host-python-package))<br>
&gt;&gt;&gt;<br>
&gt;&gt;<br>
&gt;&gt;<br>
&gt; <br>
<br>
</blockquote></div></div></div>

--0000000000004d0ae505d516f028--

--===============3531829124761942299==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3531829124761942299==--
