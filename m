Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C174EC8747
	for <buildroot@archiver.kernel.org>; Fri,  8 Sep 2023 02:04:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64D9C60BCC;
	Fri,  8 Sep 2023 02:04:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64D9C60BCC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2NX5CMg7rCpj; Fri,  8 Sep 2023 02:04:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 99A1260BA0;
	Fri,  8 Sep 2023 02:04:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 99A1260BA0
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EF66B1BF995
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 02:04:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C82E181290
 for <buildroot@lists.busybox.net>; Fri,  8 Sep 2023 02:04:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C82E181290
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id O68Ljm2OaZYz for <buildroot@lists.busybox.net>;
 Fri,  8 Sep 2023 02:04:03 +0000 (UTC)
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com
 [IPv6:2a00:1450:4864:20::62b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D486F80FB1
 for <buildroot@buildroot.org>; Fri,  8 Sep 2023 02:04:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D486F80FB1
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-99c93638322so326538466b.1
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 19:04:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694138641; x=1694743441;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X3QIWw3Bqwsp6EoqLkocII1eQwfVC9EW0iDbBJmVRYI=;
 b=kooWynr8LQ7VwZLaOY0/SvRo+g17uyZSUA9SiTQXD+NXU2zQlbHsEivwjmVAzuCjqQ
 RO9fFxEIOScgG13ZSz7x1ZZfw9XiO73hL4Ii1vhBH0VVZ+G4NL8FoOGGi6wa3VkOPNl6
 8bu0xQmSJDD3pCMkuuStXFyKFLbSvXN0S/Yyf5ddnn4qRWrfg515m7gtRISo8AKKqZCq
 ar+oU8cgQIsMyTVHaXw9On8D2iQZ9uKA9IeFtS8WOsHJ8zo4+b2Pdlz1cuRT1C0Kgjb2
 NAslCF455rthInaF1+o3q0t1t2xkPc1CmcSfPLtUmseq2axj0I0YMfmOJ0IwGp32J6gv
 FrCQ==
X-Gm-Message-State: AOJu0Yx/BtjEVejeLlSSaJ1w/pn19hCVXSvyVl9UA3gn5N4OQWPa39BN
 /sNQPNoSyg+wEjNwgKl3Sa48CuAx3hO3ve8VebuZhJMv
X-Google-Smtp-Source: AGHT+IEX7qxdw++YQX3UhF8IeioVVAABH1AAH+cFNKHxeBEJMvqzygPwEmdPGrPFSkszP/VWT8xsww==
X-Received: by 2002:a17:907:2d92:b0:9a1:fed1:9b42 with SMTP id
 gt18-20020a1709072d9200b009a1fed19b42mr5061775ejc.23.1694138640639; 
 Thu, 07 Sep 2023 19:04:00 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com.
 [209.85.208.44]) by smtp.gmail.com with ESMTPSA id
 ke25-20020a17090798f900b0098e422d6758sm341328ejc.219.2023.09.07.19.03.59
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 07 Sep 2023 19:03:59 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-5298e43bb67so3271947a12.1
 for <buildroot@buildroot.org>; Thu, 07 Sep 2023 19:03:59 -0700 (PDT)
X-Received: by 2002:aa7:c90c:0:b0:52a:38c3:1b4b with SMTP id
 b12-20020aa7c90c000000b0052a38c31b4bmr1168353edt.15.1694138639351; Thu, 07
 Sep 2023 19:03:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230727232235.449788-1-christian@aperture.us>
 <b73fb293249bcf48f42ebaed0f78f1c1@agner.ch>
 <CA+h8R2r3sxFvPN5QFt9szw638M_9o=WRC3a8pUQ1O2KrGMvrkw@mail.gmail.com>
 <08DC739C-F115-4DB2-9F9A-0CD6E9BFEA42@agner.ch>
In-Reply-To: <08DC739C-F115-4DB2-9F9A-0CD6E9BFEA42@agner.ch>
Date: Thu, 7 Sep 2023 19:03:48 -0700
X-Gmail-Original-Message-ID: <CA+h8R2rbhvCt60Fhwi1qGv0PocZsS0rA3fVQoukDP2KhPrkjdQ@mail.gmail.com>
Message-ID: <CA+h8R2rbhvCt60Fhwi1qGv0PocZsS0rA3fVQoukDP2KhPrkjdQ@mail.gmail.com>
To: Stefan Agner <stefan@agner.ch>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=aperture.us; s=google; t=1694138641; x=1694743441; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X3QIWw3Bqwsp6EoqLkocII1eQwfVC9EW0iDbBJmVRYI=;
 b=XJWpVhQLmksQolaBinWnGM0bk7Bjj8gS8aypRZmflN77eE9WtajPlhPewRm151vPGy
 AKNCnqakjnukl7GgEqvPUYO65CEn8LBwSuXP/D06E0LRxj7FP/IlHGI5VJhALhdWIlTG
 NRR/fdfBvGKLbE1+QisuUAg8ESJ78sPsmDpd5tNfrLPp0t08fWkDC6SAXDyaoyDfB8pZ
 sn/iPDckRGRwb/iR0tGE1wYtl5/eMCfT153CTWc6qjPUXvuMAFf3h3ztp9k4LRXkWZeO
 bnqXvJi++ikI5apZ8yzXrjs+SuV0Ngq7VgW7j1DHYp4QhbfPq2MvMfdxG8/uC7t16wlX
 P5Kg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aperture.us header.i=@aperture.us
 header.a=rsa-sha256 header.s=google header.b=XJWpVhQL
Subject: Re: [Buildroot] [PATCH v1 1/1] package/containerd: bump version to
 v1.6.22
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
From: Christian Stewart via buildroot <buildroot@buildroot.org>
Reply-To: Christian Stewart <christian@aperture.us>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============6548753474703242093=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6548753474703242093==
Content-Type: multipart/alternative; boundary="000000000000cc86e20604cf6352"

--000000000000cc86e20604cf6352
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stefan,

On Thu, Sep 7, 2023, 4:51 PM Stefan Agner <stefan@agner.ch> wrote:

>
>
> On 8 September 2023 01:28:36 CEST, Christian Stewart <
> christian@aperture.us> wrote:
> >Hi Stefan,
> >
> >On Thu, Sep 7, 2023 at 4:23=E2=80=AFPM Stefan Agner <stefan@agner.ch> wr=
ote:
> >>
> >> Hi Christian,
> >>
> >> It seems that this version hangs at startup, at least when built with
> >> Buildroot 2023.02.4.
> >
> >I am running 1.7.x on my systems so I can't confirm this currently.
>
> I've just tested 1.7.3 as well, it shows the same behavior here. I'll nee=
d
> to do more testing. Ideally I like to see a stack trace (via signal or
> debugger), but not sure how to archive this with Buildroot and golang.
>
> This is on aarch64 platforms.
>

I hate to say "works on my machine," but with both versions on aarch64 it
works for me.

Maybe the filesystem you are using is different? I'm using ext4. Or is the
kernel config not set up quite right? Maybe old kernel?

Best,
Christian

--000000000000cc86e20604cf6352
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div>Hi Stefan,<br><br><div class=3D"gmail_quote"><div di=
r=3D"ltr" class=3D"gmail_attr">On Thu, Sep 7, 2023, 4:51 PM Stefan Agner &l=
t;<a href=3D"mailto:stefan@agner.ch">stefan@agner.ch</a>&gt; wrote:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-left:=
1px #ccc solid;padding-left:1ex"><br>
<br>
On 8 September 2023 01:28:36 CEST, Christian Stewart &lt;<a href=3D"mailto:=
christian@aperture.us" target=3D"_blank" rel=3D"noreferrer">christian@apert=
ure.us</a>&gt; wrote:<br>
&gt;Hi Stefan,<br>
&gt;<br>
&gt;On Thu, Sep 7, 2023 at 4:23=E2=80=AFPM Stefan Agner &lt;<a href=3D"mail=
to:stefan@agner.ch" target=3D"_blank" rel=3D"noreferrer">stefan@agner.ch</a=
>&gt; wrote:<br>
&gt;&gt;<br>
&gt;&gt; Hi Christian,<br>
&gt;&gt;<br>
&gt;&gt; It seems that this version hangs at startup, at least when built w=
ith<br>
&gt;&gt; Buildroot 2023.02.4.<br>
&gt;<br>
&gt;I am running 1.7.x on my systems so I can&#39;t confirm this currently.=
<br>
<br>
I&#39;ve just tested 1.7.3 as well, it shows the same behavior here. I&#39;=
ll need to do more testing. Ideally I like to see a stack trace (via signal=
 or debugger), but not sure how to archive this with Buildroot and golang.<=
br>
<br>
This is on aarch64 platforms.<br></blockquote></div></div><div dir=3D"auto"=
><br></div><div dir=3D"auto">I hate to say &quot;works on my machine,&quot;=
 but with both versions on aarch64 it works for me.=C2=A0</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Maybe the filesystem you are using is dif=
ferent? I&#39;m using ext4. Or is the kernel config not set up quite right?=
 Maybe old kernel?=C2=A0</div><div dir=3D"auto"><br></div><div dir=3D"auto"=
>Best,</div><div dir=3D"auto">Christian</div></div>

--000000000000cc86e20604cf6352--

--===============6548753474703242093==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6548753474703242093==--
