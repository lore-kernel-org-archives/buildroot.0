Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0944FC433EF
	for <buildroot@archiver.kernel.org>; Sun, 20 Feb 2022 18:34:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F3AB404D5;
	Sun, 20 Feb 2022 18:34:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PYRToUco692r; Sun, 20 Feb 2022 18:34:00 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3CB10404BB;
	Sun, 20 Feb 2022 18:33:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EE55E1BF3B9
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 18:33:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E9EBD404B7
 for <buildroot@lists.busybox.net>; Sun, 20 Feb 2022 18:33:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id bUsk5t-6qMNP for <buildroot@lists.busybox.net>;
 Sun, 20 Feb 2022 18:33:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4D920404C8
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 18:33:56 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 k3-20020a1ca103000000b0037bdea84f9cso9866827wme.1
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 10:33:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=05gmfVvR2mlwFPyLogV28I2hfUhBfEC+VPJTaiLhtUY=;
 b=OpJ8Fi0omJn1yL6WRiJJB1h62Q9KKs0UMyy2p3gVP4aRTkiKSoBiYnE1IX3eHlE+XT
 CwDeQZ/50yFFMBQMa9jYhgUg0sg/ZmZxu0QLRZQ+plyzlbZIK39yaVjye4IqIhrB/A9Y
 v4+5E+VDuvFHe73mGNI0VXFG+wZPVbNCY844a5/SpQWGEA3GWCMl9DTmTC/cNE6pyI5n
 qZmR1Wb+FHCHgUkpMEJQUOQC7eBMrBNBj33mPJHVoy5WrlrdW4pS77bGX0fOVH/EZ2sb
 U3bG9bsYhNnR5/tQHcXZmpEC5Q+m9ar0mwGSOAp7k3zBvvesC5hBi149BHlkXsQ6XFgF
 0snw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=05gmfVvR2mlwFPyLogV28I2hfUhBfEC+VPJTaiLhtUY=;
 b=x/X3FLzXWj47jH3d3aME29r4SKMUS0Pz28I/3+1fZtFroS8nXjZ9LpBWnTTrKaeu2B
 mRNLifdoZW4U468MIURsokNetF6T7d5gps190wRlJlnZh3kDeg21SPBtSGUAah0MlK6E
 MQb3SNBErCFrJoE2S/RqrG0TXpKd39tVqEulM7uwpSlCsQNg2kyN+6lk06i4KdTFXrfC
 aDp6c4djq5bDRCzEgH0AAnXdFHlMLjrLbNw5PSxn9wE8Wh2764YB9CR99jmlIJ7Ypp0Y
 yFlwzHfjwwdIm1wz45OoiKeF/RMZk6EfDJpNsy/g8Ktb0Dq/jbL4LWgTHtLr/4MqyqWr
 mAyg==
X-Gm-Message-State: AOAM530SBhuc/cLKzPhXJ8Qdmczo4Thp7Q6lF6ZCfGJk1P9LJo/dPHj0
 Kt1VsPAF+94RktMb0/xddrD2dA6nl8TXpyjleZM=
X-Google-Smtp-Source: ABdhPJx/G2yCju1Y36w5gY/yXxSVDvqawoZwOZmiL0n/iSuyvuLVgdw1X+YnFrOSLCWmxJsny9p67VJUhs+bZvTsVJc=
X-Received: by 2002:a1c:4b05:0:b0:37c:6ec7:5b4a with SMTP id
 y5-20020a1c4b05000000b0037c6ec75b4amr14801906wma.149.1645382034152; Sun, 20
 Feb 2022 10:33:54 -0800 (PST)
MIME-Version: 1.0
References: <CAHnHX5jAJw2ON8-e6UBmvDLR6j3p1iUYY1GvRpbULHBjF80SrQ@mail.gmail.com>
 <186B6238-5452-4211-BD9D-29A3C921DE42@benettiengineering.com>
 <CAHnHX5grmd94PGaBJn=XkJttwCEFdc=tWaE6v7PpZCN5UL8tSg@mail.gmail.com>
 <469c0dbc-6101-be6c-7272-400ac4512b86@grenoble.cnrs.fr>
 <4d8f6289-f16f-9602-a458-2b5836a817e6@benettiengineering.com>
In-Reply-To: <4d8f6289-f16f-9602-a458-2b5836a817e6@benettiengineering.com>
From: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
Date: Mon, 21 Feb 2022 02:33:45 +0800
Message-ID: <CAHnHX5gJ2_=u09ntg_WxJeM1XwHrgOsgvjDYrUsHJk7AdUVyLQ@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
Subject: Re: [Buildroot] Issue with login
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
Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============5324701410921244526=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5324701410921244526==
Content-Type: multipart/alternative; boundary="000000000000aa61a905d8775b3d"

--000000000000aa61a905d8775b3d
Content-Type: text/plain; charset="UTF-8"

Thanks, I'll check them out. Will update the outcome once the installation
is done.

Thank you.

On Mon, Feb 21, 2022, 1:56 AM Giulio Benetti <
giulio.benetti@benettiengineering.com> wrote:

> Hi Edgar,
>
> please reply to all in Mailing List, I add Mohd in Cc,
>
> On 20/02/22 17:18, Edgar Bonet wrote:
> > Hi!
> >
> > In his config file, Mohd wrote:
> >> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
> >> BR2_LINUX_KERNEL_VERSION="4.4.155"
> >
> > This may cause problems. C.f. docs/manual/configure.txt:
> >
> >      If you use kernel headers that are more recent than the Linux
> >      kernel you run on your embedded system, then the C library might
> >      be using interfaces that are not provided by your Linux kernel.
>
> Good catch Edgar!
> So Mohd, what you need here is a toolchain with older libc.
>
> https://buildroot.org/downloads/manual/manual.html#_cross_compilation_toolchain
>
> But again, do you really need to use so such old versions instead of try
> to use buildroot's beaglebone_defconfig?
>
> > In the same config file, there is:
> >> # BR2_PACKAGE_BUSYBOX is not set
> >
> > When disabling busybox, you should have seen the message:
> >
> >      You may need to enable other packages to get a working system
> >      You better know what you're doing!
>
> Despite of what I've written on my previous e-mail(my test was wrong),
> he has BR2_INIT_SYSTEMD=y that works as Init System, so that's ok.
>
> > And then:
> >> # BR2_PACKAGE_SYSTEMD_LOGIND is not set
>
> Good catch again Edgar! This ^^^ should be the point. Because it's
> exactly the systemd login dameon.
>
> >> # BR2_PACKAGE_UTIL_LINUX_LOGIN is not set
>
> This ^^^ is not selected by systemd, so I expect
> BR2_PACKAGE_SYSTEMD_LOGIND to do the job(even if I'm not a systemd
> expoert at all).
>
> But as Edgar pointed linux headers don't match so you have 3 choices:
> 1) find a toolchain with linux-headers <= 4.4.*
> 2) update linux version
> 3) start from scratch using buildroot beaglebone_defconfig
>
> Best regards
> --
> Giulio Benetti
> Benetti Engineering sas
>

--000000000000aa61a905d8775b3d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Thanks, I&#39;ll check them out. Will update the outcome =
once the installation is done.=C2=A0<div dir=3D"auto"><br></div><div dir=3D=
"auto">Thank=C2=A0you.</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Mon, Feb 21, 2022, 1:56 AM Giulio Benetti =
&lt;<a href=3D"mailto:giulio.benetti@benettiengineering.com">giulio.benetti=
@benettiengineering.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_=
quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1=
ex">Hi Edgar,<br>
<br>
please reply to all in Mailing List, I add Mohd in Cc,<br>
<br>
On 20/02/22 17:18, Edgar Bonet wrote:<br>
&gt; Hi!<br>
&gt; <br>
&gt; In his config file, Mohd wrote:<br>
&gt;&gt; BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=3Dy<br>
&gt;&gt; BR2_LINUX_KERNEL_VERSION=3D&quot;4.4.155&quot;<br>
&gt; <br>
&gt; This may cause problems. C.f. docs/manual/configure.txt:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 If you use kernel headers that are more recent tha=
n the Linux<br>
&gt;=C2=A0 =C2=A0 =C2=A0 kernel you run on your embedded system, then the C=
 library might<br>
&gt;=C2=A0 =C2=A0 =C2=A0 be using interfaces that are not provided by your =
Linux kernel.<br>
<br>
Good catch Edgar!<br>
So Mohd, what you need here is a toolchain with older libc.<br>
<a href=3D"https://buildroot.org/downloads/manual/manual.html#_cross_compil=
ation_toolchain" rel=3D"noreferrer noreferrer" target=3D"_blank">https://bu=
ildroot.org/downloads/manual/manual.html#_cross_compilation_toolchain</a><b=
r>
<br>
But again, do you really need to use so such old versions instead of try <b=
r>
to use buildroot&#39;s beaglebone_defconfig?<br>
<br>
&gt; In the same config file, there is:<br>
&gt;&gt; # BR2_PACKAGE_BUSYBOX is not set<br>
&gt; <br>
&gt; When disabling busybox, you should have seen the message:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0 =C2=A0 You may need to enable other packages to get a wor=
king system<br>
&gt;=C2=A0 =C2=A0 =C2=A0 You better know what you&#39;re doing!<br>
<br>
Despite of what I&#39;ve written on my previous e-mail(my test was wrong), =
<br>
he has BR2_INIT_SYSTEMD=3Dy that works as Init System, so that&#39;s ok.<br=
>
<br>
&gt; And then:<br>
&gt;&gt; # BR2_PACKAGE_SYSTEMD_LOGIND is not set<br>
<br>
Good catch again Edgar! This ^^^ should be the point. Because it&#39;s <br>
exactly the systemd login dameon.<br>
<br>
&gt;&gt; # BR2_PACKAGE_UTIL_LINUX_LOGIN is not set<br>
<br>
This ^^^ is not selected by systemd, so I expect <br>
BR2_PACKAGE_SYSTEMD_LOGIND to do the job(even if I&#39;m not a systemd <br>
expoert at all).<br>
<br>
But as Edgar pointed linux headers don&#39;t match so you have 3 choices:<b=
r>
1) find a toolchain with linux-headers &lt;=3D 4.4.*<br>
2) update linux version<br>
3) start from scratch using buildroot beaglebone_defconfig<br>
<br>
Best regards<br>
-- <br>
Giulio Benetti<br>
Benetti Engineering sas<br>
</blockquote></div>

--000000000000aa61a905d8775b3d--

--===============5324701410921244526==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5324701410921244526==--
