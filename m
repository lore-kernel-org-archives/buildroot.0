Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C66C43334
	for <buildroot@archiver.kernel.org>; Sun, 24 Jul 2022 05:05:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9DC46104C;
	Sun, 24 Jul 2022 05:05:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B9DC46104C
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3CkNgfcky8wE; Sun, 24 Jul 2022 05:05:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD16160F2B;
	Sun, 24 Jul 2022 05:05:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD16160F2B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B30E1BF59B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:05:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5486960F2B
 for <buildroot@lists.busybox.net>; Sun, 24 Jul 2022 05:05:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5486960F2B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bumtMQZ-HrIG for <buildroot@lists.busybox.net>;
 Sun, 24 Jul 2022 05:05:51 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6235560B53
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6235560B53
 for <buildroot@buildroot.org>; Sun, 24 Jul 2022 05:05:51 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id ku18so7589241pjb.2
 for <buildroot@buildroot.org>; Sat, 23 Jul 2022 22:05:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=y6bZ/78cd7wVip78l8AS937ZFNYzAUyAEEEqdybq9cs=;
 b=PRpk+Dj8CTN6UHQGWv4FfPSPGuR4J49ql4aRBnsVJjwCA4ZSpfa1kOvZgebNO/V28z
 YyLoDoKp82grItMUQIIBDrpMrKS7/8awyGMENRt3qpQHfuHI8478lbJQJjK6ZzasVh4s
 CR0uiY7an7cgcL97ObMTiCiWRTUIK2wZRRDZzuRqq8g5oxOFfK+4LDfJ1fV0VYKxIkxI
 +mi7LHJYsVc+Ik4NUBy4NacPkecGowc1y+VfS/wuD0WL2yG7WW9GGFyneI8OsDasuXHw
 CiEoDLV3RuePSnSlNSo6SpFQnW6hxU+Pw+TlsjcJzoXB2FfuCzttOVKMc3Kc0eafDx5K
 kzLw==
X-Gm-Message-State: AJIora9xzMJoc2Tci1dLb6iFeVLYTUsoLt5/dX5ku264OjMtxWMNF3ns
 hApk7M5mLye99L+0Oh994GDQ1II4cCHxXrz++ivXcf952LsVzA==
X-Google-Smtp-Source: AGRyM1uOS7dDeY2W/BCFmTJAnOXJkudaNksBzQS53C2Rs4GAH78qrySJnQwmuFDvmNsUMuynl6EkcvFnpIdQ1e6b4AI=
X-Received: by 2002:a17:903:22d0:b0:16d:20f6:b859 with SMTP id
 y16-20020a17090322d000b0016d20f6b859mr7227440plg.2.1658639150615; Sat, 23 Jul
 2022 22:05:50 -0700 (PDT)
MIME-Version: 1.0
References: <20211011220025.7998-1-petr.vorel@gmail.com>
 <20211011220025.7998-2-petr.vorel@gmail.com>
 <20211111080014.GR2084998@scaer> <YY7iy2xQUcMBPqsx@pevik>
 <8581ea46-4f5f-b56a-c60b-d1f0b6ad95e1@mind.be>
In-Reply-To: <8581ea46-4f5f-b56a-c60b-d1f0b6ad95e1@mind.be>
From: Petr Vorel <petr.vorel@gmail.com>
Date: Sun, 24 Jul 2022 07:05:39 +0200
Message-ID: <CAB1t1CxVm1+aj0F_uaFAoSewzC540Amd0RxRr4geY8bP+v9f_g@mail.gmail.com>
To: Arnout Vandecappelle <arnout@mind.be>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=y6bZ/78cd7wVip78l8AS937ZFNYzAUyAEEEqdybq9cs=;
 b=XkwRjMvT9nQTWuKeIpX3TpkmijkwhQZbSf4DWNM+mwJTv5yEHrd7To+fBo5+5Rki8N
 ixEePn7Zyj2j2VXqt5sKVH6cqm4/vOWbFsw0WgDhxtw7kYVSmC1qS00xjWDTMtlDHqww
 1j7wCIReCNA3CBIpv46RIdENPGm1qr9xQ8Hzs6hTw+QOnttzb/Y3kykqu9FNbVpbRahx
 A3fokOtHhtmvpXgV+GBb5s/TpWrwCW74EGAJCNXrDpLrBtX+FHU4OG+4sclJwlrYK2x+
 hQeDISU13sCnuIhrgw6I0KRHeJxew/9UvCv1g7VumvRi8/LSsOTk0q+LrCUw3oHVZbn3
 Zskw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=XkwRjMvT
Subject: Re: [Buildroot] [RFC PATCH 1/3] make: support: use `command -v'
 instead of `which'
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
 Markus Mayer <mmayer@broadcom.com>, buildroot <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4438547537513872207=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4438547537513872207==
Content-Type: multipart/alternative; boundary="000000000000620f0605e4860537"

--000000000000620f0605e4860537
Content-Type: text/plain; charset="UTF-8"

Hi all,


> > Well, some people use Debian testing :). But sure, it was never urgent,
> > the issue does not break build. This time I'm quite confident it works,
> > but one revert was enough => it can wait till more people find time to
> test it.
>
>   In the end, it got reverted in debian testing as well, so we can drop
> this
> series (for now). I've marked them as Rejected in patchwork.
>
> Thanks, I haven't noticed myself. The revert [1] was released
in debianutils 5.6 [1].

Kind regards,
Petr

[1]
https://salsa.debian.org/debian/debianutils/-/commit/3694cf60572a6c231f2e931f4d075950113599d4


>   Regards,
>   Arnout
>

--000000000000620f0605e4860537
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_quote"><div>Hi all,</div><div>=C2=A0</=
div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;bor=
der-left:1px solid rgb(204,204,204);padding-left:1ex">
&gt; Well, some people use Debian testing :). But sure, it was never urgent=
,<br>
&gt; the issue does not break build. This time I&#39;m quite confident it w=
orks,<br>
&gt; but one revert was enough =3D&gt; it can wait till more people find ti=
me to test it.<br>
<br>
=C2=A0 In the end, it got reverted in debian testing as well, so we can dro=
p this <br>
series (for now). I&#39;ve marked them as Rejected in patchwork.<br>
<br></blockquote><div>Thanks, I haven&#39;t noticed myself. The revert [1] =
was released in=C2=A0debianutils 5.6 [1].</div><div><br></div><div>Kind reg=
ards,<br></div><div>Petr</div><div><br></div><div>[1]=C2=A0<a href=3D"https=
://salsa.debian.org/debian/debianutils/-/commit/3694cf60572a6c231f2e931f4d0=
75950113599d4">https://salsa.debian.org/debian/debianutils/-/commit/3694cf6=
0572a6c231f2e931f4d075950113599d4</a></div><div>=C2=A0</div><blockquote cla=
ss=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid =
rgb(204,204,204);padding-left:1ex">
=C2=A0 Regards,<br>
=C2=A0 Arnout<br>
</blockquote></div></div>

--000000000000620f0605e4860537--

--===============4438547537513872207==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4438547537513872207==--
