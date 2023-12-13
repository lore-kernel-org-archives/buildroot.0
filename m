Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F22DC4332F
	for <buildroot@archiver.kernel.org>; Wed, 13 Dec 2023 20:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7E7114004A;
	Wed, 13 Dec 2023 20:33:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7E7114004A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id J3diUF-BUl9z; Wed, 13 Dec 2023 20:33:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 34B4940399;
	Wed, 13 Dec 2023 20:33:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 34B4940399
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D02641BF475
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 20:33:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A7D4D615EF
 for <buildroot@lists.busybox.net>; Wed, 13 Dec 2023 20:33:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7D4D615EF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iQPJaXmDwjdJ for <buildroot@lists.busybox.net>;
 Wed, 13 Dec 2023 20:33:03 +0000 (UTC)
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 68BCF60A9C
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 20:33:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 68BCF60A9C
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50bf7bc38c0so8407168e87.2
 for <buildroot@buildroot.org>; Wed, 13 Dec 2023 12:33:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702499581; x=1703104381;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VJ2Gf1uZUHiwS3kxLTULS/qEdk/tPvg+MCi8+V4o9Dw=;
 b=wI8Nfodch/OdtwWlHcUFZlTnDkyhlSmdh0J1PfYcq7XUpjQhX6zMO5uaw+PRQna3vF
 32rOKgyZRQtXqdhJHWcww6QIkHDyFHqNQLhaRMVam8CGdDJIHFznzowb7q06mYB/t6SF
 IGxjLVyjFNUYrVYAaR9JSkNRnTT3dIVqhoSQuT3PfV2fPu6e8gnYWoM6h/jEitNWv8zd
 uwsUFtJmfd1Le425wrAmreDAb8HfeIF+sC3by4Zt5lNgIBaRWnJ2G59PvY1Rz1PehM8J
 DUPtFgq5ULe8KICZI+EeecusxAVcsTU66u79NzAVFa8MH0NkLPu3XNVTFGJn9DZxi3Tt
 M65w==
X-Gm-Message-State: AOJu0YxuszK26FT9MUht4wrPuwN63HrBOxZsDlxZFeNB5SUR1kp+ZV72
 kM3YV4jX4hE85qYklVGH/v/r289k/Nl+CddO0F8TbA==
X-Google-Smtp-Source: AGHT+IFI4fyX7GWVZqTDlUvuRISBCoAyGmKdD5d+OTHQwSE2keuLMtxuU1W/DjQbvleY8/SacisMHAsDN68z8EMx4BI=
X-Received: by 2002:a19:740d:0:b0:50c:55:c77e with SMTP id
 v13-20020a19740d000000b0050c0055c77emr4343203lfe.97.1702499581015; 
 Wed, 13 Dec 2023 12:33:01 -0800 (PST)
MIME-Version: 1.0
References: <20231209214918.2071047-1-michael@amarulasolutions.com>
 <20231213210804.39fe194f@windsurf>
 <CAOf5uw=zfi=zOPh=K-kaT5MmScBxqod3okjxtnK600qn4_sZpA@mail.gmail.com>
 <20231213212416.642d5dab@windsurf>
In-Reply-To: <20231213212416.642d5dab@windsurf>
From: Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date: Wed, 13 Dec 2023 21:32:48 +0100
Message-ID: <CAOf5uwkdWm8kWZT2y_ZHO9H26hUri9jZgYHj37ah1VjhNm4LmQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google; t=1702499581; x=1703104381;
 darn=buildroot.org; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=VJ2Gf1uZUHiwS3kxLTULS/qEdk/tPvg+MCi8+V4o9Dw=;
 b=jhMf3PSqLfoB54QLT9eu9TEUH2fr0jfrXlsnX1NeSTPpFd6C2KUMuThzv2SIQJcf0A
 nIk3VEP8VG2RnDjHZZzbP6EthN+v0dJ4gygBm3eIY3wamGZR8SSBzxjZCTV947TOog7/
 5PY4uzG4hQxbazkmb14wT+T35ZZUQkKCg69oI=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
 header.i=@amarulasolutions.com header.a=rsa-sha256 header.s=google
 header.b=jhMf3PSq
Subject: Re: [Buildroot] [PATCH V2] package: gdb: Add helping kernel gdb
 functions compilation
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============2109913909586730306=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2109913909586730306==
Content-Type: multipart/alternative; boundary="000000000000c1cec4060c6a123b"

--000000000000c1cec4060c6a123b
Content-Type: text/plain; charset="UTF-8"

Hi Tomas

Il mer 13 dic 2023, 21:24 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
ha scritto:

> On Wed, 13 Dec 2023 21:17:34 +0100
> Michael Nazzareno Trimarchi <michael@amarulasolutions.com> wrote:
>
> > My V1 was addressing your concern?
>
> No, your v1 was just adding a Buildroot option that allows to enable a
> kernel option. This is useless, as you can simply enable the kernel
> option in question, and it doesn't make any sense for Buildroot to
> replicate 1:1 each kernel option as a Buildroot option. It only makes
> sense to do so when enabling the kernel option requires that Buildroot
> builds additional host tools/libraries. But for something as simple as
> enabling CONFIG_GDB_SCRIPTS, just enable it in your kernel config.
>

I don't think that I enable any option and I just run an other kernel
target. Yes but definitely I understand your point. My idea was to keeps
some tools build as option as the serial proxy.

Michael




> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000c1cec4060c6a123b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Tomas<br><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">Il mer 13 dic 2023, 21:24 Thomas Petazzoni &l=
t;<a href=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.=
com</a>&gt; ha scritto:<br></div><blockquote class=3D"gmail_quote" style=3D=
"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex">On Wed, 13 =
Dec 2023 21:17:34 +0100<br>
Michael Nazzareno Trimarchi &lt;<a href=3D"mailto:michael@amarulasolutions.=
com" target=3D"_blank" rel=3D"noreferrer">michael@amarulasolutions.com</a>&=
gt; wrote:<br>
<br>
&gt; My V1 was addressing your concern?<br>
<br>
No, your v1 was just adding a Buildroot option that allows to enable a<br>
kernel option. This is useless, as you can simply enable the kernel<br>
option in question, and it doesn&#39;t make any sense for Buildroot to<br>
replicate 1:1 each kernel option as a Buildroot option. It only makes<br>
sense to do so when enabling the kernel option requires that Buildroot<br>
builds additional host tools/libraries. But for something as simple as<br>
enabling CONFIG_GDB_SCRIPTS, just enable it in your kernel config.<br></blo=
ckquote></div></div><div dir=3D"auto"><br></div><div dir=3D"auto">I don&#39=
;t think that I enable any option and I just run an other kernel target. Ye=
s but definitely I understand your point. My idea was to keeps some tools b=
uild as option as the serial proxy.=C2=A0</div><div dir=3D"auto"><br></div>=
<div dir=3D"auto">Michael</div><div dir=3D"auto"><br></div><div dir=3D"auto=
"><br></div><div dir=3D"auto"><br></div><div dir=3D"auto"><div class=3D"gma=
il_quote"><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;bord=
er-left:1px #ccc solid;padding-left:1ex"><br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer noreferrer" target=3D"_bl=
ank">https://bootlin.com</a><br>
</blockquote></div></div></div>

--000000000000c1cec4060c6a123b--

--===============2109913909586730306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2109913909586730306==--
