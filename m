Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E634C4332F
	for <buildroot@archiver.kernel.org>; Sun, 29 Oct 2023 18:44:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0495270861;
	Sun, 29 Oct 2023 18:44:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0495270861
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D4EE3CMGNNx2; Sun, 29 Oct 2023 18:44:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 127D47083F;
	Sun, 29 Oct 2023 18:44:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 127D47083F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28DDB1BF33E
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 18:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 017AE4F025
 for <buildroot@lists.busybox.net>; Sun, 29 Oct 2023 18:44:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 017AE4F025
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6JMR4pCddyio for <buildroot@lists.busybox.net>;
 Sun, 29 Oct 2023 18:44:37 +0000 (UTC)
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 857E14EFD3
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 18:44:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 857E14EFD3
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-32f760cbff3so1287437f8f.0
 for <buildroot@buildroot.org>; Sun, 29 Oct 2023 11:44:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698605075; x=1699209875;
 h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
 :date:cc:subject:to:from:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=a9QV8oY92ikPTSFm2gfg3Pm8sRfWmoC4+Sjpnj+xkR8=;
 b=Ruzno/QNi9z19e8kIXpgesRugovh1HWrpRTMaZ+pnU5n8lfEsWw05q5zzQMDm+gzx1
 DVr493rpCX/KXddgePtfmkVPPaiy/VlsSM5aRdnW3AR65efRMogSCo9o5eAze/M7GR2O
 DsuLad8lUHZ/BjUOBBCqmiSNJ4TZoM441IgaUK1kDrB1dYXvoe3Gczsm/G4irQ7lAWX+
 PnKGU6fKhVhgcSdzjXTxPjVVbTZeeF18O5QmPFXMK+jB8cSHUJPnNNDswY+BZqbciMDM
 D1IbBT/fZQVnEa9MA4ZDiY7FjNehYhoL9aXruTubPpFaZdNkSDq7Ygg8G+M8KAzyqSxr
 2Bpg==
X-Gm-Message-State: AOJu0YwBlv4bU6dgk2MiXm+r9UHnyIDRAAHLoIEx5+m+TzDHBdLW1slC
 2r0DPz32FcKgHOwykp+613+GyCaC1mE=
X-Google-Smtp-Source: AGHT+IE/kQLkd1nju48IjUczqJy5vGRtNdcXzHv6r4gNxHCZWEqBpXVtNtWLrq5Z3eoUJQV8KraFDQ==
X-Received: by 2002:a05:6000:1a85:b0:32f:8a1e:6eaf with SMTP id
 f5-20020a0560001a8500b0032f8a1e6eafmr170684wry.60.1698605075044; 
 Sun, 29 Oct 2023 11:44:35 -0700 (PDT)
Received: from [192.168.7.144] (epd88.neoplus.adsl.tpnet.pl. [83.20.45.88])
 by smtp.gmail.com with ESMTPSA id
 e18-20020a5d5012000000b0032dbf26e7aesm6457904wrt.65.2023.10.29.11.44.34
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Sun, 29 Oct 2023 11:44:34 -0700 (PDT)
From: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
To: "Edgar Bonet" <bonet@grenoble.cnrs.fr>
Date: Sun, 29 Oct 2023 18:44:33 +0000
Message-Id: <em29cb4aaa-8ce7-4449-986c-81c594d64587@9e2fe6c2.com>
In-Reply-To: <61e80819-c901-486c-afdd-1e69441821e2@grenoble.cnrs.fr>
References: <em9eec97a0-87a4-4352-9e89-03948b436830@9e2fe6c2.com>
 <61e80819-c901-486c-afdd-1e69441821e2@grenoble.cnrs.fr>
User-Agent: eM_Client/9.2.2093.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698605075; x=1699209875; darn=buildroot.org;
 h=mime-version:user-agent:reply-to:references:in-reply-to:message-id
 :date:cc:subject:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a9QV8oY92ikPTSFm2gfg3Pm8sRfWmoC4+Sjpnj+xkR8=;
 b=IF5OYxCFGqVyHbJ94gCukwJywr7xQV17tyTxbCDBmEdtzh/O3dYMKIsytmaziO1fj1
 h/MWCIvSOtGWBu22pGXRyk9z5rUZQsNnEnQn69snE2/RpEBZ9zK+z/3iL9byrvKHxhu3
 yG3+8XLMnk10g1ccFCxLzIo52p8HhawBi1Orpz0SMGNE+6MN8jAOGwPpq2BMNvQsSDjK
 WkyLlNePiSjgoaV5Qm8s113XZTdKsS2HOHOGj0BhW2Yc5o9Ab/sSGnPpt/DR3phWqS7y
 OayhgG752hQuIIOze/LhyJl9BOuGI/Nf8x9kKs6Jv1ci+VxtNIZtVOIJl4dMFdK8m9yy
 DOzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=IF5OYxCF
Subject: Re: [Buildroot] Help with DTO
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
Reply-To: =?utf-8?q?=c5=81ukasz=20Przenios=c5=82o?= <bremenpl@gmail.com>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============8726480861246970363=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8726480861246970363==
Content-Type: multipart/alternative;
 boundary="------=_MBF84AD12C-2F47-4730-85E0-4A8A5EFE1F4B"

--------=_MBF84AD12C-2F47-4730-85E0-4A8A5EFE1F4B
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable

Hi Edgar and all,
With your suggestion:

If you want to play with the GPIOs, I suggest you install the tools that
come with libgpiod: in Target packages / Libraries / Hardware handling,
select =E2=80=9Clibgpiod=E2=80=9D, then =E2=80=9Cinstall tools=E2=80=9D. Th=
en, on the booted system,
type

     gpiodetect
     gpioinfo

You should see all the available GPIO chips, then all the GPIO lines.

I have installed libgpiod and I am able to see the mentioned tools:

gpiodetect  gpiofind    gpioget     gpioinfo    gpiomon     gpioset

The problem is that thse mentioned commands provide no output in my=20
shell (here run one by one with no output):
# gpiodetect
# gpioinfo
#

And I think none of these libgpiod tools do... At the same time, I am=20
able to use the old sysfs way to export a gpio and toggle it and so on.=20
I tried googling around, but I could find no reference to these tools=20
not providing any output.

Am I missing anything in the buildroot config? In the menuconfig I have=20
checked both libgpiod and its tools... I would appreciate all feedback!

--
=C5=81ukasz Przenios=C5=82o


------ Original Message ------
From "Edgar Bonet" <bonet@grenoble.cnrs.fr>
To "=C5=81ukasz Przenios=C5=82o" <bremenpl@gmail.com>; buildroot@buildroot.=
org
Date 2023-10-28 20:58:38
Subject Re: [Buildroot] Help with DTO

>Hello!
>
>=C5=81ukasz Przenios=C5=82o wrote, about the BeagleBone:
>>  So I have the HW and virgin working Buildroot image baked thanks to
>>  this tutorial.
>>  (https://blog.billvanleeuwen.ca/creating-a-minimal-linux-system-for-the=
-beaglebone-black-with-buildroot)
>
>This tutorial walks you through a manual configuration. Note that
>Buildroot ships a ready-made configuration you can use:
>
>     make beaglebone_defconfig  # load the ready-made defconfig
>     make menuconfig            # if you want to tweak it
>     make
>
>>  What I wanted to do next is to create a device tree overlay for all
>>  required GPIOs that would be compiled at kernel build time.
>
>I do not understand why you need a device tree overlay. The tutorial
>gets you a kernel together with the am335x-boneblack device tree. This
>device tree already defines four GPIO chips. Can't you see them? Try
>
>     ls /dev/gpiochip*
>
>If you want to play with the GPIOs, I suggest you install the tools that
>come with libgpiod: in Target packages / Libraries / Hardware handling,
>select =E2=80=9Clibgpiod=E2=80=9D, then =E2=80=9Cinstall tools=E2=80=9D. T=
hen, on the booted system,
>type
>
>     gpiodetect
>     gpioinfo
>
>You should see all the available GPIO chips, then all the GPIO lines.
>
>Regards,
>
>Edgar.
--------=_MBF84AD12C-2F47-4730-85E0-4A8A5EFE1F4B
Content-Type: text/html; charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head>

<style id=3D"css_styles" type=3D"text/css"><!--blockquote.cite { margin-lef=
t: 5px; margin-right: 0px; padding-left: 10px; padding-right:0px; border-le=
ft: 1px solid #cccccc }
blockquote.cite2 {margin-left: 5px; margin-right: 0px; padding-left: 10px;=
 padding-right:0px; border-left: 1px solid #cccccc; margin-top: 3px; padding=
-top: 0px; }
a img { border: 0px; }
li[style=3D'text-align: center;'], li[style=3D'text-align: center; '], li[s=
tyle=3D'text-align: right;'], li[style=3D'text-align: right; '] {  list-sty=
le-position: inside;}
body { font-family: Verdana; font-size: 12pt; }
.quote { margin-left: 1em; margin-right: 1em; border-left: 5px #ebebeb soli=
d; padding-left: 0.3em; }
--></style></head>
<body><div>Hi Edgar and all,</div><div>With your suggestion:</div><div><br=
 /><div class=3D"quote"><div id=3D"xff91c0985c244ed88f8cd8489f66bfd2"><div c=
lass=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3px 0px=
 16px 5px;">If you want to play with the GPIOs, I suggest you install the to=
ols that</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">come with libgpiod: in Target packages / Libraries / Hardw=
are handling,</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">select =E2=80=9Clibgpiod=E2=80=9D, then =E2=80=9Cinstall t=
ools=E2=80=9D. Then, on the booted system,</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">type</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">=C2=A0</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">    gpiodetect</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">    gpioinfo</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">=C2=A0</div>
<div class=3D"plain_line" style=3D"background-color:rgba(0,0,0,0);margin:3p=
x 0px 16px 5px;">You should see all the available GPIO chips, then all the=
 GPIO lines.</div></div></div></div><div><br /></div>
<div>I have installed libgpiod and I am able to see the mentioned tools:</d=
iv><div><br /></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-s=
ize: 10pt;">gpiodetect=C2=A0 gpiofind=C2=A0 =C2=A0 gpioget=C2=A0 =C2=A0=C2=
=A0 gpioinfo=C2=A0 =C2=A0 gpiomon=C2=A0 =C2=A0=C2=A0 gpioset
</font></div><div><br /></div><div>The problem is that thse mentioned comma=
nds provide no output in my shell (here run one by one with no output):</di=
v><div>
</div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10pt;">#=
 gpiodetect
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;"># gpioinfo
</font></div><div><font face=3D"Consolas" size=3D"2" style=3D"font-size: 10=
pt;">#
</font></div><div><br /></div><div>And I think none of these libgpiod tools =
do... At the same time, I am able to use the old sysfs way to export a gpi=
o and toggle it and so on. I tried googling around, but I could find no ref=
erence to these tools not providing any output.=C2=A0</div><div><br /></div=
><div>Am I missing anything in the buildroot config? In the menuconfig I ha=
ve checked both libgpiod and its tools... I would appreciate all feedback!<=
/div><div><br /></div><div id=3D"signature_old" style=3D"clear:both">--<div=
>=C5=81ukasz Przenios=C5=82o</div></div><div style=3D"clear:both"><br /></d=
iv>
<div><br /></div>
<div>
<div>------ Original Message ------</div>
<div>From "Edgar Bonet" &lt;<a href=3D"mailto:bonet@grenoble.cnrs.fr" style=
=3D"">bonet@grenoble.cnrs.fr</a>&gt;</div>
<div>To "=C5=81ukasz Przenios=C5=82o" &lt;<a href=3D"mailto:bremenpl@gmail.=
com">bremenpl@gmail.com</a>&gt;; <a href=3D"mailto:buildroot@buildroot.org"=
>buildroot@buildroot.org</a></div>
<div>Date 2023-10-28 20:58:38</div>
<div>Subject Re: [Buildroot] Help with DTO</div></div><div><br /></div>
<div id=3D"x0859f427cbff4a7" class=3D"plain"><blockquote cite=3D"61e80819-c=
901-486c-afdd-1e69441821e2@grenoble.cnrs.fr" type=3D"cite" class=3D"cite2">

<div class=3D"plain_line">Hello!</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">=C5=81ukasz Przenios=C5=82o wrote, about the Beag=
leBone:</div>
<blockquote type=3D"cite" class=3D"cite">
<div class=3D"plain_line"> So I have the HW and virgin working Buildroot im=
age baked thanks to</div>
<div class=3D"plain_line"> this tutorial.</div>
<div class=3D"plain_line"> (<a href=3D"https://blog.billvanleeuwen.ca/creat=
ing-a-minimal-linux-system-for-the-beaglebone-black-with-buildroot">https:/=
/blog.billvanleeuwen.ca/creating-a-minimal-linux-system-for-the-beaglebone-=
black-with-buildroot</a>)</div>
</blockquote>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">This tutorial walks you through a manual configur=
ation. Note that</div>
<div class=3D"plain_line">Buildroot ships a ready-made configuration you ca=
n use:</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">    make beaglebone_defconfig  # load the ready-m=
ade defconfig</div>
<div class=3D"plain_line">    make menuconfig            # if you want to t=
weak it</div>
<div class=3D"plain_line">    make</div>
<div class=3D"plain_line">=C2=A0</div>
<blockquote type=3D"cite" class=3D"cite2">
<div class=3D"plain_line"> What I wanted to do next is to create a device t=
ree overlay for all</div>
<div class=3D"plain_line"> required GPIOs that would be compiled at kernel=
 build time.</div>
</blockquote>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">I do not understand why you need a device tree ov=
erlay. The tutorial</div>
<div class=3D"plain_line">gets you a kernel together with the am335x-bonebl=
ack device tree. This</div>
<div class=3D"plain_line">device tree already defines four GPIO chips. Can'=
t you see them? Try</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">    ls /dev/gpiochip*</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">If you want to play with the GPIOs, I suggest you =
install the tools that</div>
<div class=3D"plain_line">come with libgpiod: in Target packages / Librarie=
s / Hardware handling,</div>
<div class=3D"plain_line">select =E2=80=9Clibgpiod=E2=80=9D, then =E2=80=9C=
install tools=E2=80=9D. Then, on the booted system,</div>
<div class=3D"plain_line">type</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">    gpiodetect</div>
<div class=3D"plain_line">    gpioinfo</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">You should see all the available GPIO chips, then =
all the GPIO lines.</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Regards,</div>
<div class=3D"plain_line">=C2=A0</div>
<div class=3D"plain_line">Edgar.</div>
</blockquote></div>


</body></html>
--------=_MBF84AD12C-2F47-4730-85E0-4A8A5EFE1F4B--


--===============8726480861246970363==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8726480861246970363==--

