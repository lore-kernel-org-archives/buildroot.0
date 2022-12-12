Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8891C4332F
	for <buildroot@archiver.kernel.org>; Mon, 12 Dec 2022 16:25:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 330C240643;
	Mon, 12 Dec 2022 16:25:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 330C240643
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SwDSNOlzaUUd; Mon, 12 Dec 2022 16:25:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 57A9F408B0;
	Mon, 12 Dec 2022 16:25:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 57A9F408B0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id BCD641BF386
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:25:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A586681401
 for <buildroot@lists.busybox.net>; Mon, 12 Dec 2022 16:25:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A586681401
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rU3VY_5AwQPn for <buildroot@lists.busybox.net>;
 Mon, 12 Dec 2022 16:25:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD71381362
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id DD71381362
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 16:25:39 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id i9so753388edj.4
 for <buildroot@buildroot.org>; Mon, 12 Dec 2022 08:25:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vP75yEmUkGPNzSdcIYEhKlA6k7q3sJf0DrJmRyLQnqE=;
 b=iO2hem5PP8JyL99Iedxsde+28MnSThdStsr/jyqhG689o5j4ZKzslrn+FRW+K/LlAM
 yop48Rl4jsCVLPIFxwNZZySNRp/zohy4k2UUSErqnwQRJkHUZ35xuVqZYYK4n1Y09aoc
 9t4T5CIFOrNtGTi8P7+yRncqAJgo06VH+A/QAFMOEU9Xur7zuFResToHy62zH5anUHoU
 0kAaHVr/znmyytBSUNEi1V+ZhWdW5oCR0hrmG+y51eQ2Yl1JHTcD/DVutzsYIq5m/sD4
 oK2n08En3QRBtHd1+yiDBSE8RUhoOgpAGEJUteoJ+SO0+EbNK9ShVPGH/HSilmdwyreH
 2GCQ==
X-Gm-Message-State: ANoB5pk5IFZC52I9iYKEbxgnH4Wo7Ac4VplPgEz32bEPzOoY4svWqFSR
 udNMXU3/aOROys1yBtRY94zvuRv/MKBoIl3eQLxB8itZ
X-Google-Smtp-Source: AA0mqf7ffO0maJ5KpMibylelQ7dK1SlJJfSzkQhB91xT2MnoQkhBL3B37wPnbyx+KoP51TbjIQnuuxsI1LkhKW1rktE=
X-Received: by 2002:a05:6402:386:b0:46c:a1e7:5994 with SMTP id
 o6-20020a056402038600b0046ca1e75994mr16868596edv.288.1670862338031; Mon, 12
 Dec 2022 08:25:38 -0800 (PST)
MIME-Version: 1.0
References: <20221211201704.25858-1-indrek.kruusa@gmail.com>
 <20221211201704.25858-2-indrek.kruusa@gmail.com>
 <87y1rdxexx.fsf@dell.be.48ers.dk>
In-Reply-To: <87y1rdxexx.fsf@dell.be.48ers.dk>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Mon, 12 Dec 2022 18:25:28 +0200
Message-ID: <CA+fTLhjwZE7+-itc8Y2AARyyVZ83n=_1S-_csEnBuORDnR-E-Q@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vP75yEmUkGPNzSdcIYEhKlA6k7q3sJf0DrJmRyLQnqE=;
 b=kjLzIvAGzJztq3MYd8dlWsazPjtUZNQqR4UFYG8NexNJfb+16JhZ2Q9K9Ev7V5NFMP
 +uYbnlZ0aaItEZ11gS01y5qtjUQC/wlMwtl6l/9Bo02xsO0V6c7A/nF1anQdLu3Z8LhZ
 0jCQvnck7IC2FRtCi2qh1jV4P/E0PvcpDNI6BPh6KAKX8jL0uHvk8185Zy5jsrQmLQup
 yPeWYgfMcvZ1+LbkDdBpvDRLwbPDTR2ytfG4lAW8uboPMLTkRvlHrRulrg2JLC/fFzIU
 nlXzyxB76e+6NckLbuMMWmc3l2xEv1Lz5HoiFNkcZ+Q/2vGfrsW5nb1vobab1hbgWK4U
 benQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kjLzIvAG
Subject: Re: [Buildroot] [PATCH 2/5] board/nezha/genimage.cfg: remove boot0
 from genimage.cfg
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
Content-Type: multipart/mixed; boundary="===============8052962075484947939=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8052962075484947939==
Content-Type: multipart/alternative; boundary="00000000000020825c05efa3f4d1"

--00000000000020825c05efa3f4d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Peter Korsgaard (<peter@korsgaard.com>) kirjutas kuup=C3=A4eval E, =
12.
detsember 2022 kell 09:24:

> >>>>> "Indrek" =3D=3D Indrek Kruusa <indrek.kruusa@gmail.com> writes:
>
>  > Signed-off-by: Indrek Kruusa <indrek.kruusa@gmail.com>
>  > ---
>  >  board/nezha/genimage.cfg | 25 +++----------------------
>  >  1 file changed, 3 insertions(+), 22 deletions(-)
>
>  > -
>  >      partition rootfs {
>  >              partition-type =3D 0x83
>  >              image =3D "rootfs.ext4"
>  >              bootable =3D "true"
>  > -            offset =3D 18M
>  > +            offset =3D 2M
>
> Any specific reason to use 2MB? u-boot-sunxi-with-spl.bin is only 768KB.
>

I was shy enough when fine tuning that space. Yes, it fits into 1MB.


>
> --
> Bye, Peter Korsgaard
>

--00000000000020825c05efa3f4d1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Kontakt Peter Korsgaard (&lt;<a href=3D"m=
ailto:peter@korsgaard.com">peter@korsgaard.com</a>&gt;) kirjutas kuup=C3=A4=
eval E, 12. detsember 2022 kell 09:24:<br></div><div class=3D"gmail_quote">=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quo=
t;Indrek&quot; =3D=3D Indrek Kruusa &lt;<a href=3D"mailto:indrek.kruusa@gma=
il.com" target=3D"_blank">indrek.kruusa@gmail.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Signed-off-by: Indrek Kruusa &lt;<a href=3D"mailto:indrek.kruusa=
@gmail.com" target=3D"_blank">indrek.kruusa@gmail.com</a>&gt;<br>
=C2=A0&gt; ---<br>
=C2=A0&gt;=C2=A0 board/nezha/genimage.cfg | 25 +++----------------------<br=
>
=C2=A0&gt;=C2=A0 1 file changed, 3 insertions(+), 22 deletions(-)<br>
<br>
=C2=A0&gt; -<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 partition rootfs {<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 partition-type =
=3D 0x83<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 image =3D &quot;=
rootfs.ext4&quot;<br>
=C2=A0&gt;=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 bootable =3D &qu=
ot;true&quot;<br>
=C2=A0&gt; -=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D 18M<br>
=C2=A0&gt; +=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 offset =3D 2M<br>
<br>
Any specific reason to use 2MB? u-boot-sunxi-with-spl.bin is only 768KB.<br=
></blockquote><div><br></div><div>I was shy enough when=C2=A0fine tuning th=
at space. Yes, it fits into 1MB.</div><div>=C2=A0</div><blockquote class=3D=
"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(2=
04,204,204);padding-left:1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div>

--00000000000020825c05efa3f4d1--

--===============8052962075484947939==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8052962075484947939==--
