Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D36DC38A02
	for <buildroot@archiver.kernel.org>; Sun, 30 Oct 2022 21:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0CD41402C5;
	Sun, 30 Oct 2022 21:18:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0CD41402C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9eo4YaC__Inu; Sun, 30 Oct 2022 21:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id B2036402B5;
	Sun, 30 Oct 2022 21:18:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B2036402B5
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1FADD1BF315
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:18:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E969B400CE
 for <buildroot@lists.busybox.net>; Sun, 30 Oct 2022 21:18:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E969B400CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YsvTMup_3xE6 for <buildroot@lists.busybox.net>;
 Sun, 30 Oct 2022 21:18:09 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 79C9B400FD
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 79C9B400FD
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 21:18:09 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id g12so16576967lfh.3
 for <buildroot@buildroot.org>; Sun, 30 Oct 2022 14:18:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=RrtgK48GTaQ/QERuBkx8Do3uUIgYn+gILDZ3D7/37MU=;
 b=t1CT6J+wYGFWTsVXdfp0yx88YJfoZpl6Rm5VCK4tyW2Z4QmEFNpw9Q+aeaG0KQRZVm
 nh96vQ1DIBj6AwXkMg0MrEqRiO1FIKubfwm1pDl9u7Yg2xvDHN/3B18G8mO56NN7pRoC
 BpnaEn382fMC26/Ta0l2UKJm17MCeTRtJedL0Qowx2MMd/H+6N7i7rsrKOrYqyI2veUl
 2U5Qjs9jraBRcCw4SKPIha+6sAaekB3GKAdmtFMSs7zvdDva3KXVdVOiWVIuWENpfNaB
 Dyg5T+0xpZjyJ1EzxW+8Kac883JuOsa/MUkxstq3I+HTZpyo4A0gJot3UPFz8gDvXJZr
 jo9A==
X-Gm-Message-State: ACrzQf2WQPzywoIdh8Cp8haNseGnt+B3ku3ARXDQX1lm1V6qAJMlloRQ
 qo9vIh++dezH/X/1qkdPtYbdhrILtqclP3hxVMd9gsIAtUI=
X-Google-Smtp-Source: AMsMyM5hJ3Hb6SITEJIqHoyeF0n+zzM/Ne567hEK6vKn3eZHn1ynHBWfvmfki8lhj3dNEhfluoPxcksH450Io8c+bwU=
X-Received: by 2002:a19:dc48:0:b0:4a8:d24b:d78 with SMTP id
 f8-20020a19dc48000000b004a8d24b0d78mr4273127lfj.351.1667164687093; Sun, 30
 Oct 2022 14:18:07 -0700 (PDT)
MIME-Version: 1.0
References: <20221029082510.61178-1-fontaine.fabrice@gmail.com>
 <20221030215759.0d848e58@windsurf>
In-Reply-To: <20221030215759.0d848e58@windsurf>
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 30 Oct 2022 22:17:55 +0100
Message-ID: <CAPi7W821BMm3-zrAUGV=xV4qf2OQYLRNp-t-9mhAaBX+7JwrhA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=RrtgK48GTaQ/QERuBkx8Do3uUIgYn+gILDZ3D7/37MU=;
 b=gvpqyWGDszToyvdkGn9emgV1X8CZhqCloqH2xY8s+1fV9Zmlbvi4VltFMJN6iviQtj
 I0pEkH9yur9GcV8pRTvneNMHsCH+IyA4zCHgahhJGi62p4lcMOozD70zle+BuPREavSA
 0v58Ubfasi34KKTMhKDqONrAPUEaKBBFIE/s/iNUO9lOdircmXkgBydyR/x9SraygXyg
 CJz8SVxwZTz8/zTuc1++kxP4csmnlD+fg1v5ggJ8/3FPtMvXyBS20k4ZWbzjSd2X3VvT
 WsyKJli8OfjmoCYuVJaDEEMAo6M9DSsRs2+wA1Q8lbrwakQ9WhHSdcB5M2Nm/f0LWXXi
 +f3A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=gvpqyWGD
Subject: Re: [Buildroot] [PATCH 1/1] package/pahole: bump to version 1.24
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
Cc: Francis Laniel <flaniel@linux.microsoft.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1253481069331531980=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1253481069331531980==
Content-Type: multipart/alternative; boundary="000000000000f4d54a05ec4706f8"

--000000000000f4d54a05ec4706f8
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Thomas,

Le dim. 30 oct. 2022 =C3=A0 21:58, Thomas Petazzoni <thomas.petazzoni@bootl=
in.com>
a =C3=A9crit :

> Hello Fabrice,
>
> On Sat, 29 Oct 2022 10:25:10 +0200
> Fabrice Fontaine <fontaine.fabrice@gmail.com> wrote:
>
> > https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=3Dv1=
.24
> >
> > Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
>
> We have zillions of build failures for host-pahole:
>
>   http://autobuild.buildroot.net/?reason=3Dhost-pahole%
>
> Is this version bump fixing them? If not, do we have an idea on how to
> fix this build issue (I didn't investigated myself)?
>

Nope, this version bump will not fix these build failures. I tried to
investigate but I wasn't able to reproduce it locally on my machine.
These build failures are mostly raised by your autobuilder.

My assumption is that your kernel is probably too old, bpf_link_type is
only available since version 5.8 and
https://github.com/torvalds/linux/commit/f2e10bff16a0fdd41ba278c84da9813700=
e356af

However, I don't know how to add this dependency to host-pahole (and
host-libbpf).


> Thanks!
>
> Thomas
> --
> Thomas Petazzoni, co-owner and CEO, Bootlin
> Embedded Linux and Kernel engineering and training
> https://bootlin.com
>

Best Regards,

Fabrice

--000000000000f4d54a05ec4706f8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hello Thomas,<br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0dim. 30 oct. 202=
2 =C3=A0=C2=A021:58, Thomas Petazzoni &lt;<a href=3D"mailto:thomas.petazzon=
i@bootlin.com">thomas.petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">Hello Fabrice,<br>
<br>
On Sat, 29 Oct 2022 10:25:10 +0200<br>
Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice@gmail.com" target=
=3D"_blank">fontaine.fabrice@gmail.com</a>&gt; wrote:<br>
<br>
&gt; <a href=3D"https://git.kernel.org/pub/scm/devel/pahole/pahole.git/tree=
/NEWS?h=3Dv1.24" rel=3D"noreferrer" target=3D"_blank">https://git.kernel.or=
g/pub/scm/devel/pahole/pahole.git/tree/NEWS?h=3Dv1.24</a><br>
&gt; <br>
&gt; Signed-off-by: Fabrice Fontaine &lt;<a href=3D"mailto:fontaine.fabrice=
@gmail.com" target=3D"_blank">fontaine.fabrice@gmail.com</a>&gt;<br>
<br>
We have zillions of build failures for host-pahole:<br>
<br>
=C2=A0 <a href=3D"http://autobuild.buildroot.net/?reason=3Dhost-pahole%" re=
l=3D"noreferrer" target=3D"_blank">http://autobuild.buildroot.net/?reason=
=3Dhost-pahole%</a><br>
<br>
Is this version bump fixing them? If not, do we have an idea on how to<br>
fix this build issue (I didn&#39;t investigated myself)?<br></blockquote><d=
iv><br></div><div>Nope, this version bump will not fix these build failures=
. I tried to investigate but I wasn&#39;t able to reproduce it locally on m=
y machine.</div><div>These build failures are mostly raised by your autobui=
lder.</div><div><br></div><div>My assumption is that your kernel is probabl=
y too old, <span class=3D"gmail-blob-code-inner gmail-blob-code-marker gmai=
l-js-code-nav-pass">bpf_link_type is only available since version 5.8 and<b=
r></span></div><div><a href=3D"https://github.com/torvalds/linux/commit/f2e=
10bff16a0fdd41ba278c84da9813700e356af">https://github.com/torvalds/linux/co=
mmit/f2e10bff16a0fdd41ba278c84da9813700e356af</a></div><div><br></div><div>=
However, I don&#39;t know how to add this dependency to host-pahole (and ho=
st-libbpf). <br></div><div><br></div><blockquote class=3D"gmail_quote" styl=
e=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);paddin=
g-left:1ex">
<br>
Thanks!<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br></blockquote><div><br></div><div>Best Regards,</div><d=
iv><br></div><div>Fabrice <br></div></div></div>

--000000000000f4d54a05ec4706f8--

--===============1253481069331531980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1253481069331531980==--
