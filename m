Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46FBFEB64DD
	for <buildroot@archiver.kernel.org>; Mon,  7 Aug 2023 08:23:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D99CD81395;
	Mon,  7 Aug 2023 08:23:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D99CD81395
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XB391jyXYqmZ; Mon,  7 Aug 2023 08:23:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id F391181377;
	Mon,  7 Aug 2023 08:23:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org F391181377
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 17C821BF852
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:23:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2115F40022
 for <buildroot@lists.busybox.net>; Mon,  7 Aug 2023 08:23:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2115F40022
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7X0QPR7QQYgZ for <buildroot@lists.busybox.net>;
 Mon,  7 Aug 2023 08:23:11 +0000 (UTC)
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 81975408C4
 for <buildroot@buildroot.org>; Mon,  7 Aug 2023 08:23:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 81975408C4
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-3fe1d9a8ec6so30273895e9.1
 for <buildroot@buildroot.org>; Mon, 07 Aug 2023 01:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691396589; x=1692001389;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=K+x0HzMxiTGzVTynCxgmfb2aCWZ5SkGJOiaz2+d9lNM=;
 b=fDfLwdrHFjtkerX4SNLVWwMz+NKxJ9WEoZ8/PpDqf2OPrwhN8CEdpfBdmxptg5mWiy
 f/yE5T5YrKius3aEzzWY2RZd8eu98KUZU82V+6uyQBA3zLS7ksIZblNvhaxkn4i8Rni2
 nK/YrxX8GxTCbNd3BGEomdge9GQyQ3qYqAS9FvPO+lQysr6yuWpln5XQM+JBW11fJAA6
 AxArhGq9FeE/p611GjMZxwnAHmDG/WzcrP5RAi/rtOyIj20YqrWpOt7gd2lr5DT0xtLf
 DS31HqHcURfv3t5+zbor9s5NiWqpFa015/oX+gnGoOpmNaZ/FHIF1cM3Nj/vnCLTJBh5
 QV2w==
X-Gm-Message-State: AOJu0YxISS2EHwInWzaighn3yzgOHvs2XJQ4PfY2FYrQCRBNPI7i53Q6
 oyS2yxJtJXW4DVehiRO+eoXkRJoKwNbQxqyw26rw20RmjitXzgkgZRBcBFBD
X-Google-Smtp-Source: AGHT+IHBb9elSOZW8CFJivE73eKtN02rt1yUkDaN9LtKQX9qX3+9ybajBmBXY7C+vR3NnFKom1iR3EOOSxaWp/NpjdQ=
X-Received: by 2002:adf:fac1:0:b0:317:6734:c2ae with SMTP id
 a1-20020adffac1000000b003176734c2aemr4524553wrs.11.1691396589282; Mon, 07 Aug
 2023 01:23:09 -0700 (PDT)
MIME-Version: 1.0
References: <20230806121729.3552502-1-drinkcat@google.com>
 <20230806153308.4c0cf791@windsurf>
In-Reply-To: <20230806153308.4c0cf791@windsurf>
Date: Mon, 7 Aug 2023 16:22:57 +0800
Message-ID: <CAHRZCZXdNk2w2965JOubzue=_+i+8DU1YvVvwUKv5PrsKeVMOA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691396589; x=1692001389;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=K+x0HzMxiTGzVTynCxgmfb2aCWZ5SkGJOiaz2+d9lNM=;
 b=Q18OrtMaZF2WTzGt77mW6VMTbem9v1ksw/1rAdJw5Lp7gAhWb/LOH4Sb8GBYq3NQ1d
 ADCY6/2lzJ3cgQVHOG7SO28N9qEFm1P0NnJ6sc92Fswa9ubmzCjRcXEXJuDm5B1dSQfI
 UkUObMAbt4mUdEabd6wuBgvD/0UtnriAqrwTj/k7dSOgyHumcLLgo5cwYi3K/tYU5sEY
 j2saJNTXm/QbbEGoeMI3O37+2fefb+A+iEbiKsOMOXCsOmJ3uhepMKwyMfdG/COxwYzG
 RPXRJG+rqKdIUwZudFIAaU4qvv1kZV+BsRxOjaTF58yqENu/3sHumahK4c72bP8pI2eu
 A7OA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=Q18OrtMa
Subject: Re: [Buildroot] [PATCH 1/1] package/screenfetch: Add mawk/gawk
 dependency, and upstream detection patch.
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
From: Nicolas Boichat via buildroot <buildroot@buildroot.org>
Reply-To: Nicolas Boichat <drinkcat@google.com>
Cc: Nicolas Boichat via buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4467457776851145799=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4467457776851145799==
Content-Type: multipart/alternative; boundary="000000000000e17e9b060250f457"

--000000000000e17e9b060250f457
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Sun, Aug 6, 2023 at 9:33=E2=80=AFPM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> Hello Nicolas,
>
> On Sun,  6 Aug 2023 12:17:29 +0000
> Nicolas Boichat via buildroot <buildroot@buildroot.org> wrote:
>
> > screenfetch requires an "awk" implementation: add that to dependencies.
> >
> > Also, upstream would only use an executable called "awk": pick up
> > upstream patch that can autodetect awk implementation, so that
> > "mawk" can be used.
> >
> > Signed-off-by: Nicolas Boichat <drinkcat@google.com>
>
> Thanks for the patch. One question below.
>
> > diff --git a/package/screenfetch/Config.in
> b/package/screenfetch/Config.in
> > index c0e7100f38..00248bafcf 100644
> > --- a/package/screenfetch/Config.in
> > +++ b/package/screenfetch/Config.in
> > @@ -2,8 +2,12 @@ config BR2_PACKAGE_SCREENFETCH
> >       bool "screenfetch"
> >       depends on BR2_USE_MMU # bash
> >       depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # bash
> > +     depends on BR2_PACKAGE_GAWK || BR2_PACKAGE_MAWK # runtime
> dependency
>
> Would the "awk" implementation from Busybox also work? It's the awk
> implementation that we use by default.
>

I had a quick try, and yes, I think busybox's awk is good enough.


>
> Also, just like bash is enabled via "select", we should if possible try
> to do the same for the awk implementation. I don't know if something like=
:
>
>         select BR2_PACKAGE_BUSYBOX if !BR2_PACKAGE_GAWK ||
> !BR2_PACKAGE_MAWK
>
> would work (of course, assuming the "awk" from Busybox is good enough).
>

I tried the line above, and I get some recursive dependency error though:
```
package/busybox/Config.in:1:error: recursive dependency detected!
package/busybox/Config.in:1:    symbol BR2_PACKAGE_BUSYBOX is selected by
BR2_PACKAGE_SCREENFETCH
package/screenfetch/Config.in:1:        symbol BR2_PACKAGE_SCREENFETCH
depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
package/busybox/Config.in:33:   symbol BR2_PACKAGE_BUSYBOX_SHOW_OTHERS is
selected by BR2_PACKAGE_BUSYBOX
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"
```
This appears to be a false dependency... I tried to play a bit with the
busybox config rules... but... failed. Not sure if you have any creative
idea ,-)

This one is simpler, and appears to work (I'd need to keep the "comment"
logic below)
 depends on BR2_PACKAGE_BUSYBOX || BR2_PACKAGE_GAWK || BR2_PACKAGE_MAWK #
awk

Thanks,


> Thanks for your feedback,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000e17e9b060250f457
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Thomas,</div><br><div class=3D"gmail_quote"><div d=
ir=3D"ltr" class=3D"gmail_attr">On Sun, Aug 6, 2023 at 9:33=E2=80=AFPM Thom=
as Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"=
_blank">thomas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote cl=
ass=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid=
 rgb(204,204,204);padding-left:1ex">Hello Nicolas,<br>
<br>
On Sun,=C2=A0 6 Aug 2023 12:17:29 +0000<br>
Nicolas Boichat via buildroot &lt;<a href=3D"mailto:buildroot@buildroot.org=
" target=3D"_blank">buildroot@buildroot.org</a>&gt; wrote:<br>
<br>
&gt; screenfetch requires an &quot;awk&quot; implementation: add that to de=
pendencies.<br>
&gt; <br>
&gt; Also, upstream would only use an executable called &quot;awk&quot;: pi=
ck up<br>
&gt; upstream patch that can autodetect awk implementation, so that<br>
&gt; &quot;mawk&quot; can be used.<br>
&gt; <br>
&gt; Signed-off-by: Nicolas Boichat &lt;<a href=3D"mailto:drinkcat@google.c=
om" target=3D"_blank">drinkcat@google.com</a>&gt;<br>
<br>
Thanks for the patch. One question below.<br>
<br>
&gt; diff --git a/package/screenfetch/Config.in b/package/screenfetch/Confi=
g.in<br>
&gt; index c0e7100f38..00248bafcf 100644<br>
&gt; --- a/package/screenfetch/Config.in<br>
&gt; +++ b/package/screenfetch/Config.in<br>
&gt; @@ -2,8 +2,12 @@ config BR2_PACKAGE_SCREENFETCH<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;screenfetch&quot;<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_USE_MMU # bash<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_BUSYBOX_SHOW_OTHERS #=
 bash<br>
&gt; +=C2=A0 =C2=A0 =C2=A0depends on BR2_PACKAGE_GAWK || BR2_PACKAGE_MAWK #=
 runtime dependency<br>
<br>
Would the &quot;awk&quot; implementation from Busybox also work? It&#39;s t=
he awk<br>
implementation that we use by default.<br></blockquote><div><br></div><div>=
<div>I had a quick try, and yes, I think busybox&#39;s awk is good enough.<=
/div></div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=3D"marg=
in:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1e=
x">
<br>
Also, just like bash is enabled via &quot;select&quot;, we should if possib=
le try<br>
to do the same for the awk implementation. I don&#39;t know if something li=
ke:<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 select BR2_PACKAGE_BUSYBOX if !BR2_PACKAGE_GAWK=
 || !BR2_PACKAGE_MAWK<br>
<br>
would work (of course, assuming the &quot;awk&quot; from Busybox is good en=
ough).<br></blockquote><div><br></div><div>I tried the line above, and I ge=
t some recursive dependency error though:</div><div>```</div><div>package/b=
usybox/Config.in:1:error: recursive dependency detected!<br>package/busybox=
/Config.in:1: =C2=A0 =C2=A0symbol BR2_PACKAGE_BUSYBOX is selected by BR2_PA=
CKAGE_SCREENFETCH<br>package/screenfetch/Config.in:1: =C2=A0 =C2=A0 =C2=A0 =
=C2=A0symbol BR2_PACKAGE_SCREENFETCH depends on BR2_PACKAGE_BUSYBOX_SHOW_OT=
HERS<br>package/busybox/Config.in:33: =C2=A0 symbol BR2_PACKAGE_BUSYBOX_SHO=
W_OTHERS is selected by BR2_PACKAGE_BUSYBOX<br>For a resolution refer to Do=
cumentation/kbuild/kconfig-language.txt<br>subsection &quot;Kconfig recursi=
ve dependency limitations&quot;<br></div><div>```</div><div>This appears to=
 be a false dependency... I tried to play a bit with the busybox config rul=
es... but... failed. Not sure if you have any creative idea ,-)</div><div><=
br></div><div>This one is simpler, and appears to work (I&#39;d need to kee=
p the &quot;comment&quot; logic below)</div><div>=C2=A0depends on BR2_PACKA=
GE_BUSYBOX || BR2_PACKAGE_GAWK || BR2_PACKAGE_MAWK # awk<br></div><div><br>=
</div><div>Thanks,</div><div><br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">
<br>
Thanks for your feedback,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000e17e9b060250f457--

--===============4467457776851145799==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4467457776851145799==--
