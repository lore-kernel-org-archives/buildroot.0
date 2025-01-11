Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411E9E7719C
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 01:25:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A694F410D1;
	Sat, 11 Jan 2025 01:25:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8gYgff9WkiXi; Sat, 11 Jan 2025 01:25:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 35F9C410D4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35F9C410D4;
	Sat, 11 Jan 2025 01:25:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 766E3942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 01:25:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5753D839D8
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 01:25:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PY-3pWPFWT5J for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 01:25:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::b2d; helo=mail-yb1-xb2d.google.com;
 envelope-from=nemaakhilesh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 47D44839CD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 47D44839CD
Received: from mail-yb1-xb2d.google.com (mail-yb1-xb2d.google.com
 [IPv6:2607:f8b0:4864:20::b2d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 47D44839CD
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 01:25:50 +0000 (UTC)
Received: by mail-yb1-xb2d.google.com with SMTP id
 3f1490d57ef6-e3978c00a5aso4008573276.1
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 17:25:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736558749; x=1737163549;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w+fjO3KzOuG7VxBkoB1EaZu9EfPTUIy+GLITfn4OgeA=;
 b=CaxEcSq9UcbVbjqxizCyBHLhBu+hge24iR/Ds1/C/MBJCyHwSWN4mwe/nDmhSnEta+
 hsULPMaCYMgCWj70ZHq6hoLePTOyDeHOWEUruGT2DG4GSDzzgnQ2ypvDfEIgyje1hq5S
 S1m4j8sSn5fkDWyirMEPHl5aptbQyCLdGNdp3MpvyP0btmqQum51g8MBH/Hx5sji4zj3
 vs2Yb3/wG7842VBfAB1bezRmQzubbJ0RI80fDV9VYQmZhfuY+iwtQ2Ka/RAp3aBxigdX
 qVl5mxn0yRlcfULJPRCW+Yv5YfB6iSWX3uZhKBvHPx584mb+Lu/FHBbPwv/Q2ZAE5d5M
 F0Yg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVXw6E9B3ULIF8SdIzJvyXvYcpHz1iTQLxoZafPrQW4MloEB77Vn6DZPI4fBI200T8dYZB2KbG9Aoo=@buildroot.org
X-Gm-Message-State: AOJu0YzXcJDiO789W0Z+TSp0JSv7Cws+wQ8qwBd4RUDmtC9+NR9xv8Be
 zvgUIBFN/ttSDoGP3THCrMR9ChJh8CLpeZdDPa9NvikvRIfhvChHn9wuL3VVq5GCPlRy78RWd1T
 CEdsk9cpIDGopaZ9o7J3JwrZorL0=
X-Gm-Gg: ASbGnctaJgH8Qww6632V4F/+P/iE9Re4gkM9QjLTxS6wGxZVVcIZqI71QPxaLU9Ko8+
 dxALZ8e9mB7gkOY6vQLDB1aQp9huFaUWREEf6r/8=
X-Google-Smtp-Source: AGHT+IFurPTxR2wEEtkdwULfUjG7o/Wuyb3huyJ/rwRv7fYMK1TEOYEjeOPyw4rFdzMGZM3C494qnqDWfFaQf/V9ULU=
X-Received: by 2002:a05:690c:b83:b0:6ef:c688:1b61 with SMTP id
 00721157ae682-6f5311e6517mr113273147b3.6.1736558748812; Fri, 10 Jan 2025
 17:25:48 -0800 (PST)
MIME-Version: 1.0
References: <20250106043927.154476-1-nemaakhilesh@gmail.com>
 <20250110104134.7638d728@windsurf> <81d60dbc93cc938d49a3828ddafdbd7b@free.fr>
In-Reply-To: <81d60dbc93cc938d49a3828ddafdbd7b@free.fr>
From: Akhilesh Nema <nemaakhilesh@gmail.com>
Date: Fri, 10 Jan 2025 17:25:22 -0800
X-Gm-Features: AbW1kvbYqNLetlNVpWIyO-U-8E2FD1lsn6TV9Ee5zUHt1iH3nrZDxYGgWVmnZqM
Message-ID: <CAMV0Ro9A98ARjOyWNpaUbGEgHPU84o+Pm+HZmX2bh+0WQYscBQ@mail.gmail.com>
To: Julien Olivain <ju.o@free.fr>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736558749; x=1737163549; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w+fjO3KzOuG7VxBkoB1EaZu9EfPTUIy+GLITfn4OgeA=;
 b=Hq2LwX7B4IsyxVNourXawScPKxO2h3z3I/x5Ox1gynk/0Kn0ahdfl2pUzcNrgnPN32
 ZgPCnsI7PjYnFHQCI+b1Wpzo9q+F+M1iZbGp0gb2dhYuNcHwJDXGjGeYxqoFbczP8cPg
 GNjgnPWwPXYMLkQx652r8k81UaDaZUwgdAOnGvWEg8b22mgCKEf9ux+qacz6nH6S4Tv7
 331OxWEpC8VaPEQsAyiosRnNLajCgPh10BzYAJLpz4IcMvHhEyqD8gh77ILqPT2tbS8+
 /JqhrGVAcnthjvNaBbrvlGY8BLx+nW6lLalXtQr/xAvQ/y8iH/rgKJj6Q/BY20RTZ3sY
 xeYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Hq2LwX7B
Subject: Re: [Buildroot] [PATCH 1/1] package/msmtp: bump version to 1.8.27
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
Content-Type: multipart/mixed; boundary="===============5636421998890095003=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5636421998890095003==
Content-Type: multipart/alternative; boundary="0000000000005ad3ff062b641797"

--0000000000005ad3ff062b641797
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Julien, Thomas,

On Fri, Jan 10, 2025 at 12:28=E2=80=AFPM Julien Olivain <ju.o@free.fr> wrot=
e:

> Hi Thomas, Akhilesh,
>
> On 10/01/2025 10:41, Thomas Petazzoni via buildroot wrote:
> > On Sun,  5 Jan 2025 20:39:27 -0800
> > Akhilesh Nema <nemaakhilesh@gmail.com> wrote:
> >
> >> Release notes - https://marlam.de/msmtp/news/msmtp-1-8-27/
> >>
> >> Signed-off-by: Akhilesh Nema <nemaakhilesh@gmail.com>
> >> ---
> >>  package/msmtp/msmtp.hash | 4 ++--
> >>  package/msmtp/msmtp.mk   | 2 +-
> >>  2 files changed, 3 insertions(+), 3 deletions(-)
> >
> > Thanks for your version bump!
> >
> > However, it seems like it is causing quite a few build failures in our
> > autobuilders:
> >
> >   http://autobuild.buildroot.net/?reason=3Dmsmtp-1.8.27
> >
> > Could you have a look and send a fix?
>
> Regarding those build failures, msmtp seems to require
> libgsasl >=3D 2.1. This requirement was added in msmtp after
> version 1.8.27. See:
>
> https://github.com/marlam/msmtp/commit/64e06bfc2d61efdbcd79833f73ee3d0f22=
fb6c38
>
> I see that Akhilesh already proposed a patch to update libgsasl
> to 2.2.1. It will probably fix those issues.
>
> https://patchwork.ozlabs.org/project/buildroot/patch/20250109011520.27360=
-1-nemaakhilesh@gmail.com/


Yes, the libgsasl update will resolve the msmtp-1.8.27 build failures. It
wasn't included in the comments of the libgsasl patch mail.

Thanks
Akhilesh

--0000000000005ad3ff062b641797
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi Julien, Thomas,</div><br><div class=3D"gmail_quote=
 gmail_quote_container"><div dir=3D"ltr" class=3D"gmail_attr">On Fri, Jan 1=
0, 2025 at 12:28=E2=80=AFPM Julien Olivain &lt;<a href=3D"mailto:ju.o@free.=
fr">ju.o@free.fr</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" =
style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);pa=
dding-left:1ex">Hi Thomas, Akhilesh,<br>
<br>
On 10/01/2025 10:41, Thomas Petazzoni via buildroot wrote:<br>
&gt; On Sun,=C2=A0 5 Jan 2025 20:39:27 -0800<br>
&gt; Akhilesh Nema &lt;<a href=3D"mailto:nemaakhilesh@gmail.com" target=3D"=
_blank">nemaakhilesh@gmail.com</a>&gt; wrote:<br>
&gt; <br>
&gt;&gt; Release notes - <a href=3D"https://marlam.de/msmtp/news/msmtp-1-8-=
27/" rel=3D"noreferrer" target=3D"_blank">https://marlam.de/msmtp/news/msmt=
p-1-8-27/</a><br>
&gt;&gt; <br>
&gt;&gt; Signed-off-by: Akhilesh Nema &lt;<a href=3D"mailto:nemaakhilesh@gm=
ail.com" target=3D"_blank">nemaakhilesh@gmail.com</a>&gt;<br>
&gt;&gt; ---<br>
&gt;&gt;=C2=A0 package/msmtp/msmtp.hash | 4 ++--<br>
&gt;&gt;=C2=A0 package/msmtp/<a href=3D"http://msmtp.mk" rel=3D"noreferrer"=
 target=3D"_blank">msmtp.mk</a>=C2=A0 =C2=A0| 2 +-<br>
&gt;&gt;=C2=A0 2 files changed, 3 insertions(+), 3 deletions(-)<br>
&gt; <br>
&gt; Thanks for your version bump!<br>
&gt; <br>
&gt; However, it seems like it is causing quite a few build failures in our=
<br>
&gt; autobuilders:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0<a href=3D"http://autobuild.buildroot.net/?reason=3Dmsmtp-=
1.8.27" rel=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net=
/?reason=3Dmsmtp-1.8.27</a><br>
&gt; <br>
&gt; Could you have a look and send a fix?<br>
<br>
Regarding those build failures, msmtp seems to require<br>
libgsasl &gt;=3D 2.1. This requirement was added in msmtp after<br>
version 1.8.27. See:<br>
<a href=3D"https://github.com/marlam/msmtp/commit/64e06bfc2d61efdbcd79833f7=
3ee3d0f22fb6c38" rel=3D"noreferrer" target=3D"_blank">https://github.com/ma=
rlam/msmtp/commit/64e06bfc2d61efdbcd79833f73ee3d0f22fb6c38</a><br>
<br>
I see that Akhilesh already proposed a patch to update libgsasl<br>
to 2.2.1. It will probably fix those issues.<br>
<a href=3D"https://patchwork.ozlabs.org/project/buildroot/patch/20250109011=
520.27360-1-nemaakhilesh@gmail.com/" rel=3D"noreferrer" target=3D"_blank">h=
ttps://patchwork.ozlabs.org/project/buildroot/patch/20250109011520.27360-1-=
nemaakhilesh@gmail.com/</a></blockquote><div><br></div><div>Yes, the libgsa=
sl update will resolve the msmtp-1.8.27 build failures. It wasn&#39;t inclu=
ded in the comments of the libgsasl patch mail.</div><div><br></div><div>Th=
anks</div><div>Akhilesh</div><div>=C2=A0</div></div></div>

--0000000000005ad3ff062b641797--

--===============5636421998890095003==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5636421998890095003==--
