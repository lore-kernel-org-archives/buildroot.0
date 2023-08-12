Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6621BC001B0
	for <buildroot@archiver.kernel.org>; Sat, 12 Aug 2023 01:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1719F8406C;
	Sat, 12 Aug 2023 01:01:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1719F8406C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qt3RUeHpy9DJ; Sat, 12 Aug 2023 01:01:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 61DA984057;
	Sat, 12 Aug 2023 01:01:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 61DA984057
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B3CB21BF48D
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 01:01:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8B66C41E82
 for <buildroot@lists.busybox.net>; Sat, 12 Aug 2023 01:01:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8B66C41E82
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NSk6aNRf2XMc for <buildroot@lists.busybox.net>;
 Sat, 12 Aug 2023 01:01:52 +0000 (UTC)
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4464B41E7A
 for <buildroot@buildroot.org>; Sat, 12 Aug 2023 01:01:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4464B41E7A
Received: by mail-wm1-x336.google.com with SMTP id
 5b1f17b1804b1-3fe426b86a8so22817555e9.3
 for <buildroot@buildroot.org>; Fri, 11 Aug 2023 18:01:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691802110; x=1692406910;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=hMTQjEUyr2p1IA1cy1mkhmrYdBZkNNkldysdAGeaPOU=;
 b=jXfAnle3dMnmM3mj4xOU7OjKiY9ZaFVzWDa35sE5hOvxWlWPHoDUVKg9UsPTu5kFcU
 SJse7rr8jjGRDmhYcpYnZ3SbpFZqh3gA/1W/lVYE2r0/PVikIPY0He9NF52NPLFo4wFx
 iC6FtskiUS+5LlbiHxjPdrV/4YtxxkevtWmNW7N+rYDTfq2zIlArqifQ0TD10eSr6ZiR
 WA6X5rynPI+WGWBIzsq/nSrYJ9S+TWSjtva87OFfUhGMjnflX8yKFeO3pPw8EJmQrb0v
 SbNm0a5PwiaLlu3h+12RRz+PVHZHveZcdlkPm8dgvdj3ZsT8MAa/06n8XZNbjp7UwE7D
 kpDw==
X-Gm-Message-State: AOJu0YzJfqHOh/Mh32FZhmuSSIgDAi44KDbVt9ngp+wFtvzejVNOAijR
 kwAj/3z7dmSls7FLn+NQTejh6cf3iD8Kdzz59zqzwtxDdGg+Fu2ButM=
X-Google-Smtp-Source: AGHT+IHReIMTAHgpsUsaA18ftRmy1+Bgcx2egvibgpmhXHJLxZJ4ZZC1wb5AOKXQ/p+cdqu3wOJNvIwMy504eULiY9w=
X-Received: by 2002:a7b:cc8c:0:b0:3fe:5802:676a with SMTP id
 p12-20020a7bcc8c000000b003fe5802676amr2868423wma.4.1691802110294; Fri, 11 Aug
 2023 18:01:50 -0700 (PDT)
MIME-Version: 1.0
References: <20230806121729.3552502-1-drinkcat@google.com>
 <20230806153308.4c0cf791@windsurf>
 <CAHRZCZXdNk2w2965JOubzue=_+i+8DU1YvVvwUKv5PrsKeVMOA@mail.gmail.com>
 <03e35eba-6a35-f185-2d32-b7eab93beb05@mind.be>
 <20230812002709.20986967@windsurf>
In-Reply-To: <20230812002709.20986967@windsurf>
Date: Sat, 12 Aug 2023 09:01:37 +0800
Message-ID: <CAHRZCZUqA1UvJEmF2w+g9ydKKaucpdx2Sw+nCdMH6ntBRkxSsA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20221208; t=1691802110; x=1692406910;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=hMTQjEUyr2p1IA1cy1mkhmrYdBZkNNkldysdAGeaPOU=;
 b=guwf7avm6jdlzOW2ltbIug5opuZi3KPhLAZ35LGygnnYXOLYyxo4qrHsr+H7jFk7XO
 o5IqgcwrFh6bt5GECJ45TDMdAWL71e/268K3gGrFYHrYMnEEkYqd9qhF5zOlyv2f6iNx
 epVOQ+zyHOhyJbYdLYCaJfrdTgQdlOH42R1xc0A7jqZ5Vchy3tTyFfWsNr7NDqKrUcvi
 PgNwJY2xD5jXnfzmLYP31+ExiAM8MyeFq19pM/SBHfiv3jr4oIaSaJ/kL3HNTIzQp2WE
 c9CbhSC0DQTMvThagShQ0OaNH4NhdPcY2zTI2OWsdiOE1HlVCQuX5XVtOrCITWt2hZo0
 Bmaw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=google.com header.i=@google.com
 header.a=rsa-sha256 header.s=20221208 header.b=guwf7avm
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
Content-Type: multipart/mixed; boundary="===============0131063807990124585=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0131063807990124585==
Content-Type: multipart/alternative; boundary="000000000000d134c50602af5f79"

--000000000000d134c50602af5f79
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 12, 2023 at 6:27=E2=80=AFAM Thomas Petazzoni <
thomas.petazzoni@bootlin.com> wrote:

> On Fri, 11 Aug 2023 22:18:15 +0200
> Arnout Vandecappelle <arnout@mind.be> wrote:
>
> > > I had a quick try, and yes, I think busybox's awk is good enough.
> >
> >   We assume that "normal tools" are available in the rootfs and don't
> add
> > explicit selects for them. Normal tools include sed, sort, grep, and
> IMHO also
> > awk. So I don't think there's a need for this at all.
> >
> >   And anyway, the presence of busybox doesn't guarantee at all that awk
> is
> > present, because you can configure it out.
> >
> >   So I'd keep the patch, but not the rest of this commit.
>
> That's a good point indeed.
>

Sounds good, sent a v3 to the list.


>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

--000000000000d134c50602af5f79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">On Sat, Aug 12, 2023 at 6:27=E2=80=AF=
AM Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzoni@bootlin.com">tho=
mas.petazzoni@bootlin.com</a>&gt; wrote:<br></div><blockquote class=3D"gmai=
l_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,20=
4,204);padding-left:1ex">On Fri, 11 Aug 2023 22:18:15 +0200<br>
Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank=
">arnout@mind.be</a>&gt; wrote:<br>
<br>
&gt; &gt; I had a quick try, and yes, I think busybox&#39;s awk is good eno=
ugh.=C2=A0 <br>
&gt; <br>
&gt;=C2=A0 =C2=A0We assume that &quot;normal tools&quot; are available in t=
he rootfs and don&#39;t add <br>
&gt; explicit selects for them. Normal tools include sed, sort, grep, and I=
MHO also <br>
&gt; awk. So I don&#39;t think there&#39;s a need for this at all.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0And anyway, the presence of busybox doesn&#39;t guarantee =
at all that awk is <br>
&gt; present, because you can configure it out.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0So I&#39;d keep the patch, but not the rest of this commit=
.<br>
<br>
That&#39;s a good point indeed.<br></blockquote><div><br></div><div>Sounds =
good, sent a v3 to the list.</div><div>=C2=A0</div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex">
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div></div>

--000000000000d134c50602af5f79--

--===============0131063807990124585==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0131063807990124585==--
