Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6C28C4332F
	for <buildroot@archiver.kernel.org>; Sun, 12 Nov 2023 22:17:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2FB3860B89;
	Sun, 12 Nov 2023 22:17:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2FB3860B89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K52rMowuQ56u; Sun, 12 Nov 2023 22:17:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 70ABD60B30;
	Sun, 12 Nov 2023 22:17:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 70ABD60B30
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9E4271BF2B3
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 22:17:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6E7B040385
 for <buildroot@lists.busybox.net>; Sun, 12 Nov 2023 22:17:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6E7B040385
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QCPMx3ZwUPVl for <buildroot@lists.busybox.net>;
 Sun, 12 Nov 2023 22:17:13 +0000 (UTC)
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 41CB8401D8
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 22:17:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 41CB8401D8
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-d9b9adaf291so3560512276.1
 for <buildroot@buildroot.org>; Sun, 12 Nov 2023 14:17:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699827432; x=1700432232;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xnE/gVJEN/oJ353/W1dx1Iwyr5fh1faf7hliJdIGUNE=;
 b=e8O79OB9gnyGVPc6JVskio9+Z2Evu/vCde9XZU01TKH1fqpXqRf1TOqngz0uLwWS2G
 Ov4qkNn44K09AgKQSH/APxPeiJ9d3xNjiRIE+B5HIpCZ5meuljmTmdDG4PeMeDXW1cDa
 QnLQctKLS9gjWpfQZdUnevAOyTyMtO8KdVEIDNEaSwbMZ9VB4olO9cFV/+O+GLDdBn7c
 OSFF9/dpQIsSeT4D2Vrp4ArRb/rsrNRkeSazii9b8LesDQnFOvSCKTW3rMhGH7auXyNu
 EsPYs9AYB7m6vy2o+Y9St5ikYXGLww0Kltz9PlWNR/DEC2eqttJQHK2RmczAwyEgIci9
 OT3g==
X-Gm-Message-State: AOJu0YxmSN96CwRd21jc7kEZACG4dtKKGSlzzlrmNQfzzYv8T18zVMsE
 Br6w1CuPq2X4Se48F7wcT+Kh3bNVpn2RjhQwr1c=
X-Google-Smtp-Source: AGHT+IGSU5AJ642EOapwT5DPz17Uwi+IvGvBMy5tvSE2s51D4zek3ibY7vbYAvFY6k3EWCRyIap1F5FSxCHgZihXWsQ=
X-Received: by 2002:a25:b18e:0:b0:d9c:a3b8:f39d with SMTP id
 h14-20020a25b18e000000b00d9ca3b8f39dmr2764506ybj.65.1699827431888; Sun, 12
 Nov 2023 14:17:11 -0800 (PST)
MIME-Version: 1.0
References: <20230608175538.1347170-1-salvador.joseluis@gmail.com>
 <20230726233012.50b0ac6c@windsurf>
In-Reply-To: <20230726233012.50b0ac6c@windsurf>
From: =?UTF-8?Q?Jos=C3=A9_Luis_Salvador_Rufo?= <salvador.joseluis@gmail.com>
Date: Sun, 12 Nov 2023 23:17:18 +0100
Message-ID: <CAH+XeQZT9LpE2pE7ENKK9Tx-6aaW7EP+aHZP-XYEP+q6mGj8aQ@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699827432; x=1700432232; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xnE/gVJEN/oJ353/W1dx1Iwyr5fh1faf7hliJdIGUNE=;
 b=hgr6xjEEEoFJMFCvv1D0Wzprm+p6UbzhmWy87jJkhSSM6E2uU6KpqAeo9byCB3BIQJ
 8qQ7tAhSC8SO4FKELfQrQeDn1dmqnQGyQCr515FRd8ByqTkaRlU8cPgXAinovo4H7XRB
 nf230ylcgj0QQoWl2q3e1s016fU1O3HqvE6yuA37VhVDA5VU2Y/23rpBQb+ju0hk43Eq
 x1C9mrYGV4pdy8Pm/R3LKPOAKhlhAoSqg7cfoo6IwBLdT5t3uA3VsJKK5oTi6FB1hzVA
 yAxfcNZsvR17So3V/okFRMbmCfvSIg92yiKyDY30sawqsmEHsj3ke1eVEyBHyg6hMzGl
 OU5A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hgr6xjEE
Subject: Re: [Buildroot] [PATCH] package/zfs: fix autotools crosscompilations
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
Cc: Alexander Mukhin <alexander.i.mukhin@gmail.com>,
 Michael Zimmermann <sigmaepsilon92@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============4099089581418697398=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4099089581418697398==
Content-Type: multipart/alternative; boundary="00000000000041dc8c0609fbea1f"

--00000000000041dc8c0609fbea1f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Here is the same patch but with some explanation:
https://patchwork.ozlabs.org/project/buildroot/patch/20231112221115.2289525=
-3-salvador.joseluis@gmail.com/

Greetings.

El mi=C3=A9, 26 jul 2023 a las 23:30, Thomas Petazzoni (<
thomas.petazzoni@bootlin.com>) escribi=C3=B3:

> Hello Jos=C3=A9,
>
> On Thu,  8 Jun 2023 19:55:38 +0200
> Jos=C3=A9 Luis Salvador Rufo <salvador.joseluis@gmail.com> wrote:
>
> > Signed-off-by: Jos=C3=A9 Luis Salvador Rufo <salvador.joseluis@gmail.co=
m>
>
> Thanks for the contribution, but unfortunately we cannot apply this
> patch: it does not explain anything about which "autotools
> crosscompilations" issues it is fixing. Are these failures visible in
> the autobuilders? If so, what link? If not, what configuration/setup
> exhibits the problem, what is the error message, how does the patch fix
> the issue?
>
> Could you send an updated patch with a non-empty commit log that
> contains a sufficient amount of detail for us to properly
> review/understand the change?
>
> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--00000000000041dc8c0609fbea1f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello Thomas,<div><br></div><div>Here is the same patch bu=
t with some explanation:</div><div><a href=3D"https://patchwork.ozlabs.org/=
project/buildroot/patch/20231112221115.2289525-3-salvador.joseluis@gmail.co=
m/">https://patchwork.ozlabs.org/project/buildroot/patch/20231112221115.228=
9525-3-salvador.joseluis@gmail.com/</a><br></div><div><br></div><div>Greeti=
ngs.</div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gm=
ail_attr">El mi=C3=A9, 26 jul 2023 a las 23:30, Thomas Petazzoni (&lt;<a hr=
ef=3D"mailto:thomas.petazzoni@bootlin.com">thomas.petazzoni@bootlin.com</a>=
&gt;) escribi=C3=B3:<br></div><blockquote class=3D"gmail_quote" style=3D"ma=
rgin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:=
1ex">Hello Jos=C3=A9,<br>
<br>
On Thu,=C2=A0 8 Jun 2023 19:55:38 +0200<br>
Jos=C3=A9 Luis Salvador Rufo &lt;<a href=3D"mailto:salvador.joseluis@gmail.=
com" target=3D"_blank">salvador.joseluis@gmail.com</a>&gt; wrote:<br>
<br>
&gt; Signed-off-by: Jos=C3=A9 Luis Salvador Rufo &lt;<a href=3D"mailto:salv=
ador.joseluis@gmail.com" target=3D"_blank">salvador.joseluis@gmail.com</a>&=
gt;<br>
<br>
Thanks for the contribution, but unfortunately we cannot apply this<br>
patch: it does not explain anything about which &quot;autotools<br>
crosscompilations&quot; issues it is fixing. Are these failures visible in<=
br>
the autobuilders? If so, what link? If not, what configuration/setup<br>
exhibits the problem, what is the error message, how does the patch fix<br>
the issue?<br>
<br>
Could you send an updated patch with a non-empty commit log that<br>
contains a sufficient amount of detail for us to properly<br>
review/understand the change?<br>
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>

--00000000000041dc8c0609fbea1f--

--===============4099089581418697398==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4099089581418697398==--
