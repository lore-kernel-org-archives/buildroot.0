Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD23FC433F5
	for <buildroot@archiver.kernel.org>; Mon, 21 Feb 2022 05:17:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 35B1F40875;
	Mon, 21 Feb 2022 05:17:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id M5zHzJqGbF2Z; Mon, 21 Feb 2022 05:17:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5703B4086D;
	Mon, 21 Feb 2022 05:17:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 87B401BF95F
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 05:17:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8453981437
 for <buildroot@lists.busybox.net>; Mon, 21 Feb 2022 05:17:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Iajjdnz4A9Wu for <buildroot@lists.busybox.net>;
 Mon, 21 Feb 2022 05:16:56 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5B49981434
 for <buildroot@buildroot.org>; Mon, 21 Feb 2022 05:16:56 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 bg21-20020a05600c3c9500b0035283e7a012so10437120wmb.0
 for <buildroot@buildroot.org>; Sun, 20 Feb 2022 21:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fXI1Lzx9EqIUeKPKT1jhaYBU1m4ijzOFvQv670Bi+wQ=;
 b=DYETNkogGn2VUkiF5hfUTRwa7wZt+rL5AkaG0XsFOHyiqzsq3A3+IBGpqGGeiOQQdS
 T2QgnghZfNznMSZm78i6F2qYSu6geXGr48gSy9glXzoSJkKzI7YAWUoABzf5NuIGv8VM
 QwwaO+95zyjECM3XxUq0bKHR34J0e4zSzzCK9dWO9ffrflBsYEH1GUpKtH9fZJWQirMn
 af1O8Ah2V/NwN0yeYfCB9bhRgtF1vYLiDv2ZBbHqdERJs9fKdszpMa821JFnPC4ru4NZ
 rE1OyDGzbuOt+yUVKCi1gLOxybARozKY7iBdFXLR4tAfzHww4RlQzZfPqoltT8bHtMj8
 22CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fXI1Lzx9EqIUeKPKT1jhaYBU1m4ijzOFvQv670Bi+wQ=;
 b=BPziWMC7bXx7xh5DQDBwgaLpiARcGLfg7qlcFb2achm0jgNNlm1hK9bl/8vpegkZ8E
 3ksTS6c01meXKLbrxs5HGo168QILkxkrqAl81tpk6bD3ONcc1CqZf73mQbaSsgcHUmtT
 YfUv9fAyr3axn2KboQ70b5vTN5138ycGL29bSbKSJnbk4ZhcU0zQzVkLv+FbPE8BVq/r
 Y6sHh/eQk9ws3Q2b9XLlg0SHdKAsGikwgGPuDIlAyzXNxQkvIXMmAKyABFZXHwkYPV5f
 kerhZI/WUIHlllmBzx5QWvVSPtaRm+ZOahIbzRVA3NHhU+/dOoUI21Skfqoq9ammFtXy
 MqJw==
X-Gm-Message-State: AOAM5306AaqqODj0OJ/AMIikw0H+mhLmym+Qg+D8oPjxUbT4mljDtjs9
 kBie8lcddTOfAacnBfjniKeCGkBs63CieNg6vjU=
X-Google-Smtp-Source: ABdhPJxX5/5jKCW47u9KY43w1faq0Hpegba3+j2Y8kb4hgfZG/2YqFIFJY1reyTtjph9jAuJzYCKUsTRH+PU8Elr0AM=
X-Received: by 2002:a7b:cb44:0:b0:37b:c569:5924 with SMTP id
 v4-20020a7bcb44000000b0037bc5695924mr19561064wmj.83.1645420614416; Sun, 20
 Feb 2022 21:16:54 -0800 (PST)
MIME-Version: 1.0
References: <CAHnHX5jAJw2ON8-e6UBmvDLR6j3p1iUYY1GvRpbULHBjF80SrQ@mail.gmail.com>
 <186B6238-5452-4211-BD9D-29A3C921DE42@benettiengineering.com>
 <CAHnHX5grmd94PGaBJn=XkJttwCEFdc=tWaE6v7PpZCN5UL8tSg@mail.gmail.com>
 <469c0dbc-6101-be6c-7272-400ac4512b86@grenoble.cnrs.fr>
 <4d8f6289-f16f-9602-a458-2b5836a817e6@benettiengineering.com>
 <CAHnHX5gJ2_=u09ntg_WxJeM1XwHrgOsgvjDYrUsHJk7AdUVyLQ@mail.gmail.com>
In-Reply-To: <CAHnHX5gJ2_=u09ntg_WxJeM1XwHrgOsgvjDYrUsHJk7AdUVyLQ@mail.gmail.com>
From: Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
Date: Mon, 21 Feb 2022 13:16:45 +0800
Message-ID: <CAHnHX5i3M890wBfkx_C4QEAKHv3S-Np2mEqZX=nEySXrQ8Bg=g@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="===============0656056660291468268=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0656056660291468268==
Content-Type: multipart/alternative; boundary="0000000000003a7ca205d8805789"

--0000000000003a7ca205d8805789
Content-Type: text/plain; charset="UTF-8"

Hi guys,

Thank you for your help.I have overlooked the required setting as normally
I will leave the setting to the default, as I assume Buildroot has
selected the required settings. Anyway I have managed to login
successfully now.

I have turned on BR2_PACKAGE_SYSTEMD_LOGIND and
BR2_PACKAGE_UTIL_LINUX_LOGIN settings, while the rest does not change.

Fyi, I have tried the newer versions of Linux Kernel (5.15) and Uboot
(v2022.01)
with the Linaro 7.5 toolchain, but got an error during the booting process
where the RFS cannot be mounted. It may be my fault through the settings
though, that is why I am trying the old version and it worked.

I am planning to use Buildroot for my future development and keen to
contribute wherever I can. Still lots to learn though.

Thank you again guys.

Regards.
Faiz




On Mon, Feb 21, 2022 at 2:33 AM Mohd Faiz Rohani <mohd.faiz.rohani@gmail.com>
wrote:

> Thanks, I'll check them out. Will update the outcome once the installation
> is done.
>
> Thank you.
>
> On Mon, Feb 21, 2022, 1:56 AM Giulio Benetti <
> giulio.benetti@benettiengineering.com> wrote:
>
>> Hi Edgar,
>>
>> please reply to all in Mailing List, I add Mohd in Cc,
>>
>> On 20/02/22 17:18, Edgar Bonet wrote:
>> > Hi!
>> >
>> > In his config file, Mohd wrote:
>> >> BR2_TOOLCHAIN_EXTERNAL_HEADERS_4_10=y
>> >> BR2_LINUX_KERNEL_VERSION="4.4.155"
>> >
>> > This may cause problems. C.f. docs/manual/configure.txt:
>> >
>> >      If you use kernel headers that are more recent than the Linux
>> >      kernel you run on your embedded system, then the C library might
>> >      be using interfaces that are not provided by your Linux kernel.
>>
>> Good catch Edgar!
>> So Mohd, what you need here is a toolchain with older libc.
>>
>> https://buildroot.org/downloads/manual/manual.html#_cross_compilation_toolchain
>>
>> But again, do you really need to use so such old versions instead of try
>> to use buildroot's beaglebone_defconfig?
>>
>> > In the same config file, there is:
>> >> # BR2_PACKAGE_BUSYBOX is not set
>> >
>> > When disabling busybox, you should have seen the message:
>> >
>> >      You may need to enable other packages to get a working system
>> >      You better know what you're doing!
>>
>> Despite of what I've written on my previous e-mail(my test was wrong),
>> he has BR2_INIT_SYSTEMD=y that works as Init System, so that's ok.
>>
>> > And then:
>> >> # BR2_PACKAGE_SYSTEMD_LOGIND is not set
>>
>> Good catch again Edgar! This ^^^ should be the point. Because it's
>> exactly the systemd login dameon.
>>
>> >> # BR2_PACKAGE_UTIL_LINUX_LOGIN is not set
>>
>> This ^^^ is not selected by systemd, so I expect
>> BR2_PACKAGE_SYSTEMD_LOGIND to do the job(even if I'm not a systemd
>> expoert at all).
>>
>> But as Edgar pointed linux headers don't match so you have 3 choices:
>> 1) find a toolchain with linux-headers <= 4.4.*
>> 2) update linux version
>> 3) start from scratch using buildroot beaglebone_defconfig
>>
>> Best regards
>> --
>> Giulio Benetti
>> Benetti Engineering sas
>>
>

--0000000000003a7ca205d8805789
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>Hi guys,</div><div><br></div><div>Thank you for your=
=C2=A0help.I have overlooked the required setting as normally I will leave =
the setting=C2=A0to the default, as I assume Buildroot has selected=C2=A0th=
e required settings. Anyway I have managed to login successfully=C2=A0now.<=
/div><div><br></div><div>I have turned on BR2_PACKAGE_SYSTEMD_LOGIND and BR=
2_PACKAGE_UTIL_LINUX_LOGIN settings, while the rest does not change.=C2=A0<=
/div><div><br></div><div>Fyi, I have tried the newer versions of Linux Kern=
el (5.15) and Uboot (<span style=3D"background-color:rgb(248,249,250);color=
:rgb(0,0,0);font-family:sans-serif;font-size:12.32px">v2022.01) with the Li=
naro 7.5 toolchain</span>, but got an error during the booting process wher=
e the RFS cannot be mounted. It may be my fault through the settings though=
, that is why I am trying the old version and it worked.</div><div><br></di=
v><div>I am planning to use Buildroot for my future development and keen to=
 contribute wherever=C2=A0I can. Still lots to learn though.</div><div><br>=
</div><div>Thank you again guys.</div><div><br></div><div>Regards.</div><di=
v>Faiz</div><div><br></div><div><br></div><div><br></div><br><div class=3D"=
gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 21, 2022 at =
2:33 AM Mohd Faiz Rohani &lt;<a href=3D"mailto:mohd.faiz.rohani@gmail.com">=
mohd.faiz.rohani@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gma=
il_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,2=
04,204);padding-left:1ex"><div dir=3D"auto">Thanks, I&#39;ll check them out=
. Will update the outcome once the installation is done.=C2=A0<div dir=3D"a=
uto"><br></div><div dir=3D"auto">Thank=C2=A0you.</div></div><br><div class=
=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Feb 21, 2022=
, 1:56 AM Giulio Benetti &lt;<a href=3D"mailto:giulio.benetti@benettiengine=
ering.com" target=3D"_blank">giulio.benetti@benettiengineering.com</a>&gt; =
wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi Edgar,=
<br>
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
</blockquote></div></div>

--0000000000003a7ca205d8805789--

--===============0656056660291468268==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0656056660291468268==--
