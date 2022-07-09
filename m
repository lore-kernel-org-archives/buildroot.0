Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE224C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Jul 2022 16:00:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6F5F360BB3;
	Sat,  9 Jul 2022 16:00:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6F5F360BB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id YbracjGPygRr; Sat,  9 Jul 2022 16:00:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 570A560ACB;
	Sat,  9 Jul 2022 15:59:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 570A560ACB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9EF1E1BF21A
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 15:59:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 815A041B6B
 for <buildroot@lists.busybox.net>; Sat,  9 Jul 2022 15:59:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 815A041B6B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z9uZVtX4sl7c for <buildroot@lists.busybox.net>;
 Sat,  9 Jul 2022 15:59:57 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D1E38419D0
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D1E38419D0
 for <buildroot@buildroot.org>; Sat,  9 Jul 2022 15:59:56 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id bn33so1632174ljb.13
 for <buildroot@buildroot.org>; Sat, 09 Jul 2022 08:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=kWSmUwdWVkYhzmDpNDrlfqyuLs5pn/3E/g1x4IBO9Xk=;
 b=Dk3uMSnvOve96MA9XOfP3+ZZBszl/u4DHptr1bPt2qU5j4eVbEx1JuCLi19wvxOiK9
 7QBnMgVXvVheHQt/28IfmoIvJ2qRdQ4R/UKNR4OzrcL70LZVwqu/JopVawoyNAkUaCSx
 ezP1JBsXxWUIinj/TIIyDViC+8O2O1fz9IkI5XLzkF+2jQgssXlSHjvjfatWhgUPQ32P
 icyoiYKDOlKhcUbcpQUkf6uN0qXfMKxCxd0X9QRNm7oltKHm8malprjIN+dEmHMrCYTw
 DYyUY6OZXkwWnSuufdwzRWzzln/8G0cmO09TEq9Oh8AKPwZ/DVbAg8wKQr+2d7qcW8eG
 rOPA==
X-Gm-Message-State: AJIora/1rJQtTQdFTaNa2lDrJYlBGGXlUpfYdUMwNgySdnLy5TBYsCYR
 mc1k2MqJc7jcYkXEWF+w+Q2sx1Vfe3tQKRszG5NVd+GCDjZbvQ==
X-Google-Smtp-Source: AGRyM1vn+diWdXt7WiaC/eV4IHixh5AHCiNZ7uWBDIg5pJ4XmAAy5hi7G96KWQx5X5ePVbJszJI3r6U/0oDnTjWtTkA=
X-Received: by 2002:a05:651c:1503:b0:24c:81df:e1f2 with SMTP id
 e3-20020a05651c150300b0024c81dfe1f2mr4912283ljf.182.1657382394403; Sat, 09
 Jul 2022 08:59:54 -0700 (PDT)
MIME-Version: 1.0
References: <YsiEyscz0S5b9zj9@colin-ia-desktop>
In-Reply-To: <YsiEyscz0S5b9zj9@colin-ia-desktop>
From: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Date: Sat, 9 Jul 2022 17:59:43 +0200
Message-ID: <CAB0FRsv0ABHJtw=dZ4TsmGn6X3gD2KPD0jEhhENkQnn84Gh3OA@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: Re: [Buildroot] mstpd install location
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
Cc: Colin Foster <colin.foster@in-advantage.com>
Content-Type: multipart/mixed; boundary="===============5524868969871779062=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5524868969871779062==
Content-Type: multipart/alternative; boundary="000000000000e034c405e36168bc"

--000000000000e034c405e36168bc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le ven. 8 juil. 2022 =C3=A0 21:26, Colin Foster <colin.foster@in-advantage.=
com>
a =C3=A9crit :

> Hello,
>
> I'm finally getting mstpd to start working in buildroot. I noticed two
> blockers:
>
> mstpd was running "pidof -c" while busybox doesn't support the -c
> option. As a result, mstpd would fail entirely. I'm working with mstpd
> to either remove the -c option if it isn't necessary, or detect
> capabilities.
>
> Also, the bridge-stp script gets called by the kernel, and needs to be
> in /sbin. However, the install directory is /usr/sbin. I'm confused,
> since Makefile.in seems to use $(DESTDIR)/sbin.
>
> It seems there are two options:
> 1. Change the install directory of mstpd to /sbin, or
> 2. Add a post-install hook to soft link /sbin files to
> /usr/sbin/{mstpd,mstpctl,bridge-stp}
>
> I'm not familiar with autotools-package, so I'm not sure why option 1
> isn't already happening. If option 1 couldn't, or shouldn't happen, I
> can certainly look into implementing option 2.
>
>
For option 1, see
https://patchwork.ozlabs.org/project/buildroot/patch/20220709155557.2907518=
-1-francois.perrad@gadz.org/

Fran=C3=A7ois


> Any feedback is appreciated.
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot
>

--000000000000e034c405e36168bc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0ven. 8 juil. 2022 =C3=A0=C2=
=A021:26, Colin Foster &lt;<a href=3D"mailto:colin.foster@in-advantage.com"=
>colin.foster@in-advantage.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockq=
uote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1p=
x solid rgb(204,204,204);padding-left:1ex">Hello,<br>
<br>
I&#39;m finally getting mstpd to start working in buildroot. I noticed two<=
br>
blockers:<br>
<br>
mstpd was running &quot;pidof -c&quot; while busybox doesn&#39;t support th=
e -c<br>
option. As a result, mstpd would fail entirely. I&#39;m working with mstpd<=
br>
to either remove the -c option if it isn&#39;t necessary, or detect<br>
capabilities.<br>
<br>
Also, the bridge-stp script gets called by the kernel, and needs to be<br>
in /sbin. However, the install directory is /usr/sbin. I&#39;m confused,<br=
>
since Makefile.in seems to use $(DESTDIR)/sbin.<br>
<br>
It seems there are two options:<br>
1. Change the install directory of mstpd to /sbin, or<br>
2. Add a post-install hook to soft link /sbin files to<br>
/usr/sbin/{mstpd,mstpctl,bridge-stp}<br>
<br>
I&#39;m not familiar with autotools-package, so I&#39;m not sure why option=
 1<br>
isn&#39;t already happening. If option 1 couldn&#39;t, or shouldn&#39;t hap=
pen, I<br>
can certainly look into implementing option 2.<br>
<br></blockquote><div><br></div><div>For option 1, see <a href=3D"https://p=
atchwork.ozlabs.org/project/buildroot/patch/20220709155557.2907518-1-franco=
is.perrad@gadz.org/">https://patchwork.ozlabs.org/project/buildroot/patch/2=
0220709155557.2907518-1-francois.perrad@gadz.org/</a></div><div><br></div><=
div>Fran=C3=A7ois<br></div><div><br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex">
<br>
Any feedback is appreciated.<br>
_______________________________________________<br>
buildroot mailing list<br>
<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank">buildroot@buil=
droot.org</a><br>
<a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=3D"n=
oreferrer" target=3D"_blank">https://lists.buildroot.org/mailman/listinfo/b=
uildroot</a><br>
</blockquote></div></div>

--000000000000e034c405e36168bc--

--===============5524868969871779062==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5524868969871779062==--
