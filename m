Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8500CC4332F
	for <buildroot@archiver.kernel.org>; Wed, 21 Dec 2022 18:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1B65C81F40;
	Wed, 21 Dec 2022 18:26:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1B65C81F40
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9Q-4mPePxzyN; Wed, 21 Dec 2022 18:26:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7797281F2E;
	Wed, 21 Dec 2022 18:26:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7797281F2E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6E4CC1BF3A6
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:26:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 43FC160BB1
 for <buildroot@lists.busybox.net>; Wed, 21 Dec 2022 18:26:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 43FC160BB1
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id b2ziC5-VSP1U for <buildroot@lists.busybox.net>;
 Wed, 21 Dec 2022 18:26:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 67F0560AC3
Received: from mail-io1-xd34.google.com (mail-io1-xd34.google.com
 [IPv6:2607:f8b0:4864:20::d34])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 67F0560AC3
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 18:26:23 +0000 (UTC)
Received: by mail-io1-xd34.google.com with SMTP id v2so8436552ioe.4
 for <buildroot@buildroot.org>; Wed, 21 Dec 2022 10:26:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YCahbReQw5uFtefojJwk5UCAeybqWXzleHfM+Z0c6wY=;
 b=avm5Lw4rujgo9pyfb638pUrzqk8/8/Mzm8wsvRZUTosh6+NNpnoDsgWH+xgGbiPtml
 /D7/kU/MaCz05dI5RDM785L0hEc4Ayff2U/qFb1DKOEqKO/RJKW0DQehHw3p4qnfLsvc
 44lv5H5b4TeYLG5wz1M0ItC3udx8EjYc799QpdcTEXqsLwpDumbOYySLm/58ttUKMs0O
 YIYjJdkD/+eeQmEgeibyZdYPUyNpvU5ndFQswyPoqIiPBn7EqfpR45DgSyV81NPlsR6M
 YiyOUwA5H41odp3Dhmi+2G1G8ZTgRYOrG4zTizJefoktc9V9GNUZOFvI8vCa7PzVa95c
 A9Dw==
X-Gm-Message-State: AFqh2koGXYkU1f3KeIU4jNieizNK4Q0wPLCuj+1Ivari5XMSB4K7kLYo
 Vd7sjljBskBMWR8LXNZWChVmuwLBDeU4RMIWMvA=
X-Google-Smtp-Source: AMrXdXs0+bnHGF10X4BDU+FQFRv6jQKAFp0IJJiBXtxsq5n8UhrPSAAGlNe5oVK5BwvA+zvRUuLK/1G2Zoo9ew58XnY=
X-Received: by 2002:a02:ce84:0:b0:38a:565b:39c2 with SMTP id
 y4-20020a02ce84000000b0038a565b39c2mr191721jaq.74.1671647182459; Wed, 21 Dec
 2022 10:26:22 -0800 (PST)
MIME-Version: 1.0
References: <20221218005546.1793522-1-christian@paral.in>
In-Reply-To: <20221218005546.1793522-1-christian@paral.in>
From: bryce.schober@gmail.com
Date: Wed, 21 Dec 2022 10:25:46 -0800
Message-ID: <CAJpxd04zbzD3+QP2Vh-3GDJuASjLs7m5g+6sj4WAz-1RdFf-VA@mail.gmail.com>
To: Christian Stewart <christian@paral.in>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=YCahbReQw5uFtefojJwk5UCAeybqWXzleHfM+Z0c6wY=;
 b=LfnyndhBGHkrK2ucRsuCoEZ0AxkYJiN/AnGy/2Liv+sVAxgpJoutNfMbDc71tSrJC6
 RTK9MhiOzLIF4uEBw81UqNcD17sgsC14zALn2iSeeCTDxhd3cxmgwiZItUKbF7Kl/hBd
 12nRPRYOb6Xxdeg8JUsi/K+HVoQ1WGOH5X2saSn+5BiMSRlx6GkSQGCKN4T9sxw6qoYT
 bFdVLlXTT/JHgEPAS25uGcQfBX3BKGFkTjlFd2HzBfIL3JMrrJuviru8fCWGQBI5O5x1
 R44oC49BD51GIkDfMeit0MdqPsWn7hlfp8j1UaEWD/mS60RsmzKN0q5eAfAp4zXuzR2Q
 4Jmw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LfnyndhB
Subject: Re: [Buildroot] [PATCH v4 1/1] package/rtl8821cu: new package
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0605817319266027384=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0605817319266027384==
Content-Type: multipart/alternative; boundary="000000000000801a7f05f05ab0c1"

--000000000000801a7f05f05ab0c1
Content-Type: text/plain; charset="UTF-8"

Hi Christian,

I apologize if I've missed something, but the package config description
(and your email intro) don't match the github source repo.

On Sat, Dec 17, 2022 at 4:56 PM Christian Stewart via buildroot <
buildroot@buildroot.org> wrote:

> +config BR2_PACKAGE_RTL8821CU
> +       bool "rtl8821cu"
> +       depends on BR2_LINUX_KERNEL
> +       help
> +         rtl8821cu wifi driver
> +
> +         https://github.com/brektrou/rtl8821CU
>
 ...

> +RTL8821CU_VERSION = 86cc5ceb7c28b9b997838e1c796847f6c395c382
> +RTL8821CU_SITE = $(call
> github,morrownr,8821cu-20210118,$(RTL8821CU_VERSION))
>

Maybe there's a reason for this that I'm missing?
Thanks,
<><  <><  <><
Bryce Schober

--000000000000801a7f05f05ab0c1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"></div>Hi Christian,<br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr"><br></div><div class=3D"gmai=
l_attr">I apologize if I&#39;ve missed something, but the package config de=
scription (and your email intro) don&#39;t match the github source repo.</d=
iv><div dir=3D"ltr" class=3D"gmail_attr"><br></div></div><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sat, Dec 17, 2022 at 4:56=
 PM Christian Stewart via buildroot &lt;<a href=3D"mailto:buildroot@buildro=
ot.org">buildroot@buildroot.org</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">+config BR2_PACKAGE_RTL8821CU<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0bool &quot;rtl8821cu&quot;<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0depends on BR2_LINUX_KERNEL<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0help<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0rtl8821cu wifi driver<br>
+<br>
+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<a href=3D"https://github.com/brektrou/r=
tl8821CU" rel=3D"noreferrer" target=3D"_blank">https://github.com/brektrou/=
rtl8821CU</a><br>
</blockquote><div>=C2=A0...</div><blockquote class=3D"gmail_quote" style=3D=
"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-le=
ft:1ex">
+RTL8821CU_VERSION =3D 86cc5ceb7c28b9b997838e1c796847f6c395c382<br>
+RTL8821CU_SITE =3D $(call github,morrownr,8821cu-20210118,$(RTL8821CU_VERS=
ION))<br></blockquote><div><br></div><div>Maybe there&#39;s a reason for th=
is that I&#39;m missing?</div><div><div>Thanks,<br class=3D"gmail-Apple-int=
erchange-newline">&lt;&gt;&lt; =C2=A0&lt;&gt;&lt; =C2=A0&lt;&gt;&lt;</div><=
div>Bryce Schober</div></div><div><br></div></div></div>

--000000000000801a7f05f05ab0c1--

--===============0605817319266027384==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0605817319266027384==--
