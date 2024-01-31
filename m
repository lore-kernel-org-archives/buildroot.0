Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B97D6C47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 07:31:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5521B405F5;
	Wed, 31 Jan 2024 07:31:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5521B405F5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bIc-fr4VrvLb; Wed, 31 Jan 2024 07:31:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 375F04354B;
	Wed, 31 Jan 2024 07:31:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 375F04354B
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 28F191BF5A8
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 07:31:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0E94B41E11
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 07:31:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0E94B41E11
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id t0Fy7tOFL8fF for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 07:31:16 +0000 (UTC)
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 1D47441DFD
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 07:31:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D47441DFD
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-510e0d700c6so3543011e87.2
 for <buildroot@buildroot.org>; Tue, 30 Jan 2024 23:31:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706686274; x=1707291074;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PxJV6xkR6j3EbJ1wi0fdFyxXUBh/uwRXlDiiTfbsVyo=;
 b=KmURJgEYT+CR2ytW/7nwaaEeLkV1d8rvdqtvCL0pV61SN2KleyjKK1RC4Vf+QNNge7
 mT42EhzdtJw4Q8vjEWG0+fyz7xxEi0jwIKMdPbMxIdIeBanEss5KBKAyt4sQSf7wTEfr
 DUnsQBL9D6jUFcyASUglrzAYgNC6ms1hDP2L1AOT1FOn0DKRZhE5Ven84nQRI14x+TdC
 LrVJnaMRbILArl97LiKd+zOj5x256NCQiaz+TzxnlBd5krzlZ9PWDoPrG0lIVrhcW6mP
 Q9ySMk37z2w/VCSCZji/myjrwTYh1g0S5YOEX1LyQ0SQ2SoCoEs27jVVhP4H4/kjbB4v
 ZoRA==
X-Gm-Message-State: AOJu0Yy45+9uL6UnjGMMAeSVUDuOCQNeJVG6jm0S8IGlvmKcHyNyavDN
 38e586k6HNKidOlqHWrjuBvoPbr9F1qTU3TU/C8+hpVGdDVDFmRU61Llwzp7WL6w6CRxKDfIl2I
 b1RjMsrbNzIDxF2r8DzaRLC1F65QV+6Ud
X-Google-Smtp-Source: AGHT+IEPpS3U9ytUPHK+AgocKWJ65jlCv9pAoVWKDff4RTHHeUAtVS55AsC5qQ8BFgCmXPUG2t1NXDlui6HsonmMUoo=
X-Received: by 2002:a19:6405:0:b0:510:15d8:6d8f with SMTP id
 y5-20020a196405000000b0051015d86d8fmr554971lfb.15.1706686273604; Tue, 30 Jan
 2024 23:31:13 -0800 (PST)
MIME-Version: 1.0
References: <CABRndgy7KsqtSyzJJaw9r6a7c9atEpPQpbbJgGn2qY=yi=nLFg@mail.gmail.com>
 <87il3azdfc.fsf@48ers.dk>
In-Reply-To: <87il3azdfc.fsf@48ers.dk>
From: Zvi Vered <veredz72@gmail.com>
Date: Wed, 31 Jan 2024 09:31:02 +0200
Message-ID: <CABRndgxX2z+z6Rj4-BchYhd2BETmai8xd=Ht6JnJK1h=Q+=KPg@mail.gmail.com>
To: Peter Korsgaard <peter@korsgaard.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706686274; x=1707291074; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PxJV6xkR6j3EbJ1wi0fdFyxXUBh/uwRXlDiiTfbsVyo=;
 b=HxIiI9u4cgmEAu4wEyJxQ17jgMq95asrWUehTbhqLi1oj52sdAMY66IBaC0d3uHLcI
 LMmejHTTxT9gmbDGSMvMVDodx4TT/h3clXMT5tlR2/dIPWMIRp8zNfyp8aPNk7BFe+Zg
 2KxkJqxXcricjOb4fc5ZgVk1vgug7JKIpjVfyObuIFR4ENvXYjSjCSvj4OWTcMTAPxpG
 jHgYwI/zUjfkaJv/xyrlBmh6YpHAnv6MRbQ94bcPzhme6noOEDv9SvVFGQGYAsdz0va4
 BsoUYZE/ecZCEtiVx8MjGeglOYVWBPbJZija7o0dgMyNpGXSgvVx1MyfcorF0bASPo/s
 +bRQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=HxIiI9u4
Subject: Re: [Buildroot] LKUS in buildroot 2023.02.9
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
Content-Type: multipart/mixed; boundary="===============4925415780743961262=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4925415780743961262==
Content-Type: multipart/alternative; boundary="00000000000014d2f9061038dd79"

--00000000000014d2f9061038dd79
Content-Type: text/plain; charset="UTF-8"

Hi Peter,

Thank you for very much for your reply.

The reason for using 4.9.20 is that this is 6 years old system.
I cannot upgrade the kernel due to customer decision.

What do you mean by "is to boot unattended" ?

Thank you,
Zvika


On Wed, 31 Jan 2024, 00:03 Peter Korsgaard, <peter@korsgaard.com> wrote:

> >>>>> "Zvi" == Zvi Vered <veredz72@gmail.com> writes:
>
>  > Hello,
>  > I'm booting an x86 Intel CPU using Linux 4.9.20 (32 bits) and buildroot
>  > 2023.02.9
>  > I consider using LKUS in order to encrypt the disk.
>  > Is it a wise decision ?
>
> LKUS? Do you mean LUKS (Linux Unified Key Setup)? LUKS is good (but is
> just a standard for describing the encryption meta data).
>
> Any specific reason for using such an old Linux kernel version?
>
>
>  > The motivation: If someone will steal the disk, it will be difficult to
>  > copy its contents.
>
>  > I can not use hardware encryption because I cannot replace the disk.
>
> Like always with encryption, the difficult part is handling the
> encryption key - Especially if the system is to boot unattended.
>
> --
> Bye, Peter Korsgaard
>

--00000000000014d2f9061038dd79
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Peter,<div dir=3D"auto"><br></div><div dir=3D"aut=
o">Thank=C2=A0you for very much for your reply.</div><div dir=3D"auto"><br>=
</div><div dir=3D"auto">The reason for using 4.9.20 is that this is 6 years=
 old system.=C2=A0</div><div dir=3D"auto">I cannot upgrade the kernel due t=
o customer decision.=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"aut=
o">What do you mean by &quot;is to boot unattended&quot; ?</div><div dir=3D=
"auto"><br></div><div dir=3D"auto">Thank you,</div><div dir=3D"auto">Zvika<=
/div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_att=
r">On Wed, 31 Jan 2024, 00:03 Peter Korsgaard, &lt;<a href=3D"mailto:peter@=
korsgaard.com">peter@korsgaard.com</a>&gt; wrote:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;pad=
ding-left:1ex">&gt;&gt;&gt;&gt;&gt; &quot;Zvi&quot; =3D=3D Zvi Vered &lt;<a=
 href=3D"mailto:veredz72@gmail.com" target=3D"_blank" rel=3D"noreferrer">ve=
redz72@gmail.com</a>&gt; writes:<br>
<br>
=C2=A0&gt; Hello,<br>
=C2=A0&gt; I&#39;m booting an x86 Intel CPU using Linux 4.9.20 (32 bits) an=
d buildroot<br>
=C2=A0&gt; 2023.02.9<br>
=C2=A0&gt; I consider using LKUS in order to encrypt the disk.<br>
=C2=A0&gt; Is it a wise decision ?<br>
<br>
LKUS? Do you mean LUKS (Linux Unified Key Setup)? LUKS is good (but is<br>
just a standard for describing the encryption meta data).<br>
<br>
Any specific reason for using such an old Linux kernel version?<br>
<br>
<br>
=C2=A0&gt; The motivation: If someone will steal the disk, it will be diffi=
cult to<br>
=C2=A0&gt; copy its contents.<br>
<br>
=C2=A0&gt; I can not use hardware encryption because I cannot replace the d=
isk.<br>
<br>
Like always with encryption, the difficult part is handling the<br>
encryption key - Especially if the system is to boot unattended.<br>
<br>
-- <br>
Bye, Peter Korsgaard<br>
</blockquote></div></div></div>

--00000000000014d2f9061038dd79--

--===============4925415780743961262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4925415780743961262==--
