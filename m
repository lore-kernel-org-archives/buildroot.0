Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A960C4332F
	for <buildroot@archiver.kernel.org>; Sat,  4 Nov 2023 14:06:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2138A82328;
	Sat,  4 Nov 2023 14:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2138A82328
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LLn2Hqup5qoa; Sat,  4 Nov 2023 14:06:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 493A782344;
	Sat,  4 Nov 2023 14:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 493A782344
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CB7CE1BF2AB
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:06:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B086340A46
 for <buildroot@lists.busybox.net>; Sat,  4 Nov 2023 14:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B086340A46
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id jzuaN5afvdrU for <buildroot@lists.busybox.net>;
 Sat,  4 Nov 2023 14:06:16 +0000 (UTC)
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 19BC240127
 for <buildroot@buildroot.org>; Sat,  4 Nov 2023 14:06:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19BC240127
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50939d39d0fso3960476e87.1
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 07:06:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699106774; x=1699711574;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Cwa8uE80LxOkwERjZ8t3xkWfrLzNFxNKElw2AlpbZ1I=;
 b=h99m+ctM6X06RgjO8746yO5blgyeoS5sg4+ZKU77Ee2LlMgFTbONNi4Z02G/Qw0KWx
 Ec2IwabrYqYG3GjnJQoRJIEtxlTi9mB7kFsCKTpJsXYN6NLPDM0Q9q3/xXPRUzOs/f9M
 XK8e2n7jclm4MaSnBJLY8XXL/ahKwADNtuJDO7W3j2jX0XMFkpECta4JTcEaUj+LLZ31
 O36vAYskExw9vGkzxu8KqQUh8WQG3hHUsOBwfkSH6YRWxtFg/+vpnNhJOFa3lqVVYtvj
 6dfsNQqojr3/cOPNAjnKn2zXQ+QE+oumWoJZNsbOi+plx4ktqJ4F2fn1VIO3gqD16o77
 gfrQ==
X-Gm-Message-State: AOJu0Yx2wqPrP2k09fDkT4SY0zP19e+Qrh27oJYijPiVmj/i/GofDySy
 C2yqEvq4ADlFfwIO+2ZXH53I2B6mV0wcwizlZCjbHK9b
X-Google-Smtp-Source: AGHT+IF7iuNycGwPCkYDNrW3QfocGZj6XDUYISG+CvC334l8i1Grg3oSurkcylsnn0mfpZPktiVdkRrcZtgc3DzqGy8=
X-Received: by 2002:ac2:5de1:0:b0:503:19d9:4b6f with SMTP id
 z1-20020ac25de1000000b0050319d94b6fmr18431695lfq.0.1699106773486; Sat, 04 Nov
 2023 07:06:13 -0700 (PDT)
MIME-Version: 1.0
References: <20231104095448.641992-1-fontaine.fabrice@gmail.com>
 <20231104145527.1ff6fc02@windsurf>
In-Reply-To: <20231104145527.1ff6fc02@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sat, 4 Nov 2023 15:06:02 +0100
Message-ID: <CAPi7W82qBh2bVEaZ1sr69Rfnc+a4+EY=zLtAHnZFUAcbxGu55w@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699106774; x=1699711574; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Cwa8uE80LxOkwERjZ8t3xkWfrLzNFxNKElw2AlpbZ1I=;
 b=hTCQg7WDEMeb9C+uX+BV2gxK0cjno5va8V7gCGYrZCDiXlsBIYF6LJGO6RcI4m3nLA
 gGPB3rLbaBolQ1HlXGqO2a7ZoAR94uKeJD57ROq6tp7IYURYm3ozoBelIqqEFfatDAWf
 OqDAjbPdkXERObbSt1hZXd6AItkl38479Q0FYGGC3hgLwjlRvx4ZQPCZTHs/S5tMLoKP
 7dWfIeBOemHsSld5+2XtGBOyic/FjAKmr0TlMyLNrST6YhHHUWUQ27zyMz8apIUidQPS
 7g5sve5kxvecplj94VyWai3q1/vFjn3gb5tH5ZxCjxneF6/zOwhXtoEjLTtfN8KCO78P
 VD4Q==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hTCQg7WD
Subject: Re: [Buildroot] [PATCH 1/1] package/freeradius-server: fix redis
 handling
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
Cc: David GOUARIN <dgouarin@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2605287932700324801=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2605287932700324801==
Content-Type: multipart/alternative; boundary="000000000000ab511d0609541f45"

--000000000000ab511d0609541f45
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Le sam. 4 nov. 2023 =C3=A0 14:55, Thomas Petazzoni <thomas.petazzoni@bootli=
n.com>
a =C3=A9crit :

> Hello Fabrice,
>
> On Sat,  4 Nov 2023 10:54:48 +0100
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > redis handling is wrong since the addition of the package in commit
> > 736c4c1655d93652a9a7e79235bbe726b3d46176. Indeed, freeradius-server
> > needs hiredis, not redis
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
> > ---
> >  .../freeradius-server/freeradius-server.mk    | 20 ++++++++++++-------
> >  1 file changed, 13 insertions(+), 7 deletions(-)
> >
> > diff --git a/package/freeradius-server/freeradius-server.mk
> b/package/freeradius-server/freeradius-server.mk
> > index af3320eb44..1931c970e8 100644
> > --- a/package/freeradius-server/freeradius-server.mk
> > +++ b/package/freeradius-server/freeradius-server.mk
> > @@ -71,6 +71,19 @@ FREERADIUS_SERVER_CONF_OPTS +=3D \
> >       --without-rlm_ippool
> >  endif
> >
> > +ifeq ($(BR2_PACKAGE_HIREDIS),y)
> > +FREERADIUS_SERVER_CONF_OPTS +=3D \
> > +     --with-rlm_cache_redis \
>
> Are you sure about this option? I don't see it existing.
>
> > -ifeq ($(BR2_PACKAGE_REDIS),y)
> > -FREERADIUS_SERVER_CONF_OPTS +=3D --with-rlm_redis --with-rlm_rediswho
>
> And it wasn't used here.
>
> Could you clarify this?
>
> Is this a mixup with your other patch bumping freeradius-server?
>

Yes, good catch, I sent a v2.


>
> Thanks,
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com


Best Regards,

Fabrice

--000000000000ab511d0609541f45
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Thomas,<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0sam. 4 nov. 2023=
 =C3=A0=C2=A014:55, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni=
@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br><=
/div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bo=
rder-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Fabrice,<br>
<br>
On Sat,=C2=A0 4 Nov 2023 10:54:48 +0100<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; redis handling is wrong since the addition of the package in commit<br=
>
&gt; 736c4c1655d93652a9a7e79235bbe726b3d46176. Indeed, freeradius-server<br=
>
&gt; needs hiredis, not redis<br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 .../freeradius-server/<a href=3D"http://freeradius-server.mk" re=
l=3D"noreferrer" target=3D"_blank">freeradius-server.mk</a>=C2=A0 =C2=A0 | =
20 ++++++++++++-------<br>
&gt;=C2=A0 1 file changed, 13 insertions(+), 7 deletions(-)<br>
&gt; <br>
&gt; diff --git a/package/freeradius-server/<a href=3D"http://freeradius-se=
rver.mk" rel=3D"noreferrer" target=3D"_blank">freeradius-server.mk</a> b/pa=
ckage/freeradius-server/<a href=3D"http://freeradius-server.mk" rel=3D"nore=
ferrer" target=3D"_blank">freeradius-server.mk</a><br>
&gt; index af3320eb44..1931c970e8 100644<br>
&gt; --- a/package/freeradius-server/<a href=3D"http://freeradius-server.mk=
" rel=3D"noreferrer" target=3D"_blank">freeradius-server.mk</a><br>
&gt; +++ b/package/freeradius-server/<a href=3D"http://freeradius-server.mk=
" rel=3D"noreferrer" target=3D"_blank">freeradius-server.mk</a><br>
&gt; @@ -71,6 +71,19 @@ FREERADIUS_SERVER_CONF_OPTS +=3D \<br>
&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0--without-rlm_ippool<br>
&gt;=C2=A0 endif<br>
&gt;=C2=A0 <br>
&gt; +ifeq ($(BR2_PACKAGE_HIREDIS),y)<br>
&gt; +FREERADIUS_SERVER_CONF_OPTS +=3D \<br>
&gt; +=C2=A0 =C2=A0 =C2=A0--with-rlm_cache_redis \<br>
<br>
Are you sure about this option? I don&#39;t see it existing.<br>
<br>
&gt; -ifeq ($(BR2_PACKAGE_REDIS),y)<br>
&gt; -FREERADIUS_SERVER_CONF_OPTS +=3D --with-rlm_redis --with-rlm_rediswho=
<br>
<br>
And it wasn&#39;t used here.<br>
<br>
Could you clarify this?<br>
<br>
Is this a mixup with your other patch bumping freeradius-server?<br></block=
quote><div><br></div><div>Yes, good catch, I sent a v2.<br></div><div>=C2=
=A0</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8e=
x;border-left:1px solid rgb(204,204,204);padding-left:1ex">
<br>
Thanks,<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a></blockquote><div><br></div><div>Best Regards,</div><div><=
br></div><div>Fabrice <br></div></div></div>

--000000000000ab511d0609541f45--

--===============2605287932700324801==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2605287932700324801==--
