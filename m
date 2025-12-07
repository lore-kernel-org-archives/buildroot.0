Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36DECD2CE17
	for <buildroot@archiver.kernel.org>; Sun,  7 Dec 2025 17:20:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E43982254;
	Sun,  7 Dec 2025 17:20:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fZ-qJQqrNLjj; Sun,  7 Dec 2025 17:20:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1DC5A8224A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765128054;
	bh=saTpOcJOR5vFucyJmVH8M4lGP8TLyX15cCYJ4ZzTPRo=;
	h=References:In-Reply-To:Date:To:Cc:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From:Reply-To:From;
	b=CNSMQUI/ll4PwUsN9xQDD2wzw+DjqpCKW2qfEsPkarH9DT+/f5G8pxu/VvDZ3FcLL
	 kHh06NIsblTIYFMnWFTNZUP8V02KuRk8cBCRvGJGtF0GuLJR6fUEQK86r6jvbEow6y
	 LudRpOWtZQO7RBOuXljH8tjHN3IZXaFhj9r+Lv4XIIg8+zW6Q2kfLrn2ktaUZ0pXt3
	 Med9G/qAKNbY0NbRI8KEHBQjarG1R3NQM2KgEgw6iRjuHimn41qmDG0IXXVCkhZ/+a
	 aWVcArs3AzLC8ruLKxCZLvMtY0bGQuj/cOTK1Y1+vkg2LtLv2n/6anDe60AubSXVhy
	 44cRKj0XDcVlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1DC5A8224A;
	Sun,  7 Dec 2025 17:20:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D980FE7
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA93760750
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PLkdnZknpsZd for <buildroot@buildroot.org>;
 Sun,  7 Dec 2025 17:20:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F58D605BD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F58D605BD
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F58D605BD
 for <buildroot@buildroot.org>; Sun,  7 Dec 2025 17:20:51 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-37ce27af365so30281071fa.0
 for <buildroot@buildroot.org>; Sun, 07 Dec 2025 09:20:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765128049; x=1765732849;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qzhykwKfYwRWsT4pki5sBbKnpSyhGkbeN3yhWqZyFak=;
 b=XXg4ph0pcdSMXUf2W7AFBEmoCp52EcMB/2ZYH+uD41FTjjFrVptHoP5PAxsUqKomt4
 dsLkhAaZ7DUn8CSfClOY/aqUUoD1FJxmaQDNCHB1B7UfRr1PkXfz1VjB7LqEFyIp9Alq
 fp18iZD3SWA+Z+6JpzHEVNQms4vST94ExdOhugGTVztEnQegK/6Xt+/5s/PM/ThWFQfY
 2m1j9+Zq10wry807N8QMZjcxWG0Qp2RBd8cxvtuPpgFMyZUSZb5YlqoKQn0OneLgUZfr
 gh6/hDU64QcbTeYkcicKrGw6kHS46mjdvu1uoUF2LE8I/OhT1ZxsIMn5h4xpj7UEAG31
 Q52g==
X-Forwarded-Encrypted: i=1;
 AJvYcCViBQEmLEonM2qL81j6IRb+Zizd8Wrz42P54wWtza9CjGsN1tlQYZElYb/LPWYpn4CPc4Fz+tvd0LQ=@buildroot.org
X-Gm-Message-State: AOJu0Yy9bk6O2PBe+DFS1oFYjzWv6ibPfUxcd346ojF3RgxPAZpasAzh
 cxdMRhBKl0fSAlPSVIcc7s17q1cU/JLbp5gos8zFxWIcxUEbqW25mHzoSX/g7AwzYmIxL9HnJaf
 eDcb7MTcOhbl7JWr9EVAzolldWwf4hx3TzBdCFWuk2QyORzVIXuTn/Q==
X-Gm-Gg: ASbGncsIdBCrQ1QzothDWw/uOXUZdJlilHAqQ+0kKnkm8K7j0fi+A8obW8F+VqJy+aA
 ZcGLc9s15idOa2i7QSb44OxjD24RUuziJ1VM1boEu57o/9YqLI84CLfv7i9A1hWN2MMSLd/y0D5
 Z8PH0tqX+hIdqVryomxo4ARPLQJhk7ioNULp+Qs73FqHhzjIcakdkHddVnW13djcTW20zUDbrY1
 rxA0xMj1IOoAipM6dmBizGWpBXR0PjrKuH+MWdqUUYLREvmoE+4LH0y6sfyYTZGJ/MR5w==
X-Google-Smtp-Source: AGHT+IFAooWUo+yONqa6IOmJge6/THZuDQew5KH298S71Y6tX6G1Qk3yc1+bPqvopkxCcfU9iZ60g2fuKFTF/vpcU9k=
X-Received: by 2002:a05:651c:221:b0:37b:966a:493e with SMTP id
 38308e7fff4ca-37ed845c7a6mr10634241fa.39.1765128048672; Sun, 07 Dec 2025
 09:20:48 -0800 (PST)
MIME-Version: 1.0
References: <20251206213818.2301716-1-bernd@kuhls.net>
 <87jyyy9qfo.fsf@dell.be.48ers.dk>
In-Reply-To: <87jyyy9qfo.fsf@dell.be.48ers.dk>
Date: Sun, 7 Dec 2025 18:20:37 +0100
X-Gm-Features: AQt7F2rpfM29egjpA5cLc8QrVm3Tnr2QYwn_ll4K4qillQEAc504beMqVon3-cU
Message-ID: <CAAE6iEX3zv_-rE162h1wYQPX_77bh1+L_2bsEvELpYT-779PCw@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
Cc: Bernd Kuhls <bernd@kuhls.net>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1765128049; x=1765732849; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=qzhykwKfYwRWsT4pki5sBbKnpSyhGkbeN3yhWqZyFak=;
 b=X7fhN5xzmQ30ALuimaBtF7k6z0OTVW33f9+g6hUFwFp6i0Hkbw5RZLO2xDuJCCGkgi
 k4cN0O2IupKs4ImP2MH1DWeUGFr4lOl9uI9+h12Sz24oYVFOPHTH5Oin8nLsFG1q2CJ0
 Ugug15l7Z8SsA+TH6Y5bvWmC56vz9+BYyonvJ6carn/r68WgCPfbN+K1q29BK3pfsWlx
 PD4jqUcNfdMe55ntoQh++9s1VnV/KaDqiXXfz4gqAtCg3fuiauQtjFzFKFhp/WDVhLaE
 VBvCOCqV0NN9roOj0P6OckyC9Bc70bzrI385AIEOpKuwWvFkMWsj3rRjIEq/x3QDdUlk
 Jatg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=X7fhN5xz
Subject: Re: [Buildroot] [PATCH 1/1] package/ficl: update SITE
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: =?utf-8?q?Fran=C3=A7ois_Perrad_via_buildroot?= <buildroot@buildroot.org>
Reply-To: =?UTF-8?Q?Fran=C3=A7ois_Perrad?= <francois.perrad@gadz.org>
Content-Type: multipart/mixed; boundary="===============6093148479906112672=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6093148479906112672==
Content-Type: multipart/alternative; boundary="000000000000539f1106455fe66d"

--000000000000539f1106455fe66d
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le dim. 7 d=C3=A9c. 2025 =C3=A0 18:01, Peter Korsgaard <peter@korsgaard.com=
> a =C3=A9crit :

> >>>>> "Bernd" =3D=3D Bernd Kuhls <bernd@kuhls.net> writes:
>
>  > Upstream moved the tarball to another folder:
>  > https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-retiring/
>  > and also retired the package.
>
>  > This patch just fixes the download problem.
>  > CC'ing Francois to ask whether the package should be removed until a n=
ew
>  > version 3.x is released.
>
>  > Fixes:
>  >
> https://autobuild.buildroot.net/results/125/125fa1c0a3b37b4d09389a49640b9=
0121838c665/
>
>  > Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
>
> Committed, thanks.
>
> Francois, should we drop ficl?
>

I'll downgrade to 3.03 and wait for a upcoming 3.04.

Fran=C3=A7ois


>
> --
> Bye, Peter Korsgaard
>

--000000000000539f1106455fe66d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote g=
mail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 7 =
d=C3=A9c. 2025 =C3=A0=C2=A018:01, Peter Korsgaard &lt;<a href=3D"mailto:pet=
er@korsgaard.com">peter@korsgaard.com</a>&gt; a =C3=A9crit=C2=A0:<br></div>=
<blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-=
left:1px solid rgb(204,204,204);padding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quo=
t;Bernd&quot; =3D=3D Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net" tar=
get=3D"_blank">bernd@kuhls.net</a>&gt; writes:<br>
<br>
=C2=A0&gt; Upstream moved the tarball to another folder:<br>
=C2=A0&gt; <a href=3D"https://sourceforge.net/p/ficl/news/2025/07/ficl4-is-=
retiring/" rel=3D"noreferrer" target=3D"_blank">https://sourceforge.net/p/f=
icl/news/2025/07/ficl4-is-retiring/</a><br>
=C2=A0&gt; and also retired the package.<br>
<br>
=C2=A0&gt; This patch just fixes the download problem.<br>
=C2=A0&gt; CC&#39;ing Francois to ask whether the package should be removed=
 until a new<br>
=C2=A0&gt; version 3.x is released.<br>
<br>
=C2=A0&gt; Fixes:<br>
=C2=A0&gt; <a href=3D"https://autobuild.buildroot.net/results/125/125fa1c0a=
3b37b4d09389a49640b90121838c665/" rel=3D"noreferrer" target=3D"_blank">http=
s://autobuild.buildroot.net/results/125/125fa1c0a3b37b4d09389a49640b9012183=
8c665/</a><br>
<br>
=C2=A0&gt; Signed-off-by: Bernd Kuhls &lt;<a href=3D"mailto:bernd@kuhls.net=
" target=3D"_blank">bernd@kuhls.net</a>&gt;<br>
<br>
Committed, thanks.<br>
<br>
Francois, should we drop ficl?<br></blockquote><div><br></div><div>I&#39;ll=
 downgrade to 3.03 and wait for a upcoming 3.04.</div><div><br></div><div>F=
ran=C3=A7ois</div><div>=C2=A0</div><blockquote class=3D"gmail_quote" style=
=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding=
-left:1ex">
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div>

--000000000000539f1106455fe66d--

--===============6093148479906112672==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6093148479906112672==--
