Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94B18C7618A
	for <buildroot@archiver.kernel.org>; Sun, 19 Mar 2023 10:07:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 12A5C81AAD;
	Sun, 19 Mar 2023 10:07:49 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 12A5C81AAD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8Q4Xz0lX2QYk; Sun, 19 Mar 2023 10:07:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A02D81AF4;
	Sun, 19 Mar 2023 10:07:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A02D81AF4
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9ADC21BF3C1
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:07:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7B802405C5
 for <buildroot@lists.busybox.net>; Sun, 19 Mar 2023 10:07:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7B802405C5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zvNV9BNiW7SZ for <buildroot@lists.busybox.net>;
 Sun, 19 Mar 2023 10:07:44 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 032EF400D7
Received: from mail-ed1-x52b.google.com (mail-ed1-x52b.google.com
 [IPv6:2a00:1450:4864:20::52b])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 032EF400D7
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 10:07:43 +0000 (UTC)
Received: by mail-ed1-x52b.google.com with SMTP id cy23so36087087edb.12
 for <buildroot@buildroot.org>; Sun, 19 Mar 2023 03:07:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679220462;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3U0hDflqr1RXDslAsbXZzc0ArGIu6XUAd/fN2Mn+hIE=;
 b=EAX4eADUm2FyVLt9YLiCXRnqGCkhcZrkQeciyKKZhV3uNGKhDY/e6nPe4bUV/V0pYE
 gXQ2w/slEZb9itqnjBQwsJdiSty3MYWncGvabX/JNdU9KmIElmXOQyUaRzK510Ws+oRZ
 z48tLFmAIyG20xBJpVZKOkkyv2msyhGwzk8fBzvdU03Vn/IRdh+WLlj/V79pNcmfawzz
 D3h5WQr08Me5jMlj7b55ZI2QMdQXmsCh3eGgKug9t8ZLQ1qZ0VWEtyaaTWDUDsWUYfDp
 Dnk71O+bjR6DYLOGTPIjwoMySAK4QIrISJASwmabm+xNImlHreA76IAFXffKM9E89jT4
 R61w==
X-Gm-Message-State: AO0yUKUJCdRz9cfF9/K4dUUV6f378Aec+sXOG62A8L1wpFIQvn9IgjyX
 AeCmFgF5/e3yFGMtN5JC+ZHdmiaU4Krzge7pmpmmbp1E
X-Google-Smtp-Source: AK7set/vuHEpckW8xtJYFmuSI7vn05xQ1VX1f1XeRe+gjPwhk/mWSmmmRW3dMR3Hoqt9igxEtmhMyM/VLqIAVp+/36A=
X-Received: by 2002:a17:906:cd0a:b0:933:1967:a984 with SMTP id
 oz10-20020a170906cd0a00b009331967a984mr1955970ejb.15.1679220461802; Sun, 19
 Mar 2023 03:07:41 -0700 (PDT)
MIME-Version: 1.0
References: <CA+fTLhhanWy3Q3mj96yTD+4Hjxaeu=Eh5en_mhpwEbZ+deBPWA@mail.gmail.com>
 <4B628CF1-65C6-4661-BAFB-B969A770A66E@benettiengineering.com>
 <CA+fTLhgBT=oKNk6+RPqwck9iSG9gVs5_VgeLVa3Mbe7FW_mPjw@mail.gmail.com>
In-Reply-To: <CA+fTLhgBT=oKNk6+RPqwck9iSG9gVs5_VgeLVa3Mbe7FW_mPjw@mail.gmail.com>
From: Indrek Kruusa <indrek.kruusa@gmail.com>
Date: Sun, 19 Mar 2023 12:07:31 +0200
Message-ID: <CA+fTLhgNJOodcZcADuKroNvD_-UQZdu2+=PcEvBSVKfyZwaFZg@mail.gmail.com>
To: Giulio Benetti <giulio.benetti@benettiengineering.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679220462;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=3U0hDflqr1RXDslAsbXZzc0ArGIu6XUAd/fN2Mn+hIE=;
 b=IIEzGgAnxnaQYtywjI9ReJ7MPeJCk7SbMdN82igk6Ntx03sVwcFF3hkOaNUHKs6xU6
 9oKEyBSzX9qSr42/IPpz7WwjHNGjwJawnk9QBXs/oUIwoAFBZKT1AmzqJgPXx0X8Rimv
 WrFlnhsXF95gW3DUEgIWXP/r5jCegPrzYvJAsufe9S+AevDFZaV2ka2KfCysGRI59XWk
 VBSEJqW2H78LLkM47Zoodi1y2nh2vnMYLK1vbhKckerhPmeJer9QPwfkkj6C5nRMw6+T
 c6PZ0wuMJtuyVPBZKy/xuE9Y2SfjOcF7KM+Xnwkr5Ui5kcT9xyDzHcFnzjKpwP47mA6p
 F8AA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=IIEzGgAn
Subject: Re: [Buildroot] package/rtl8189fs: bug in conf, and a question
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
Cc: Buildroot Mailing List <buildroot@buildroot.org>
Content-Type: multipart/mixed; boundary="===============4949022218748392075=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4949022218748392075==
Content-Type: multipart/alternative; boundary="0000000000002016c405f73dfb35"

--0000000000002016c405f73dfb35
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Kontakt Indrek Kruusa (<indrek.kruusa@gmail.com>) kirjutas kuup=C3=A4eval P=
, 19.
m=C3=A4rts 2023 kell 09:43:

> Kontakt Giulio Benetti (<giulio.benetti@benettiengineering.com>) kirjutas
> kuup=C3=A4eval P, 19. m=C3=A4rts 2023 kell 01:01:
>
>> Hi Indkrek,
>>
>> Il giorno 18 mar 2023, alle ore 22:46, Indrek Kruusa <
>> indrek.kruusa@gmail.com> ha scritto:
>>
>> =EF=BB=BF
>> Hi!
>> I'm trying to prepare a patch for MangoPi MQ (Allwinner D1s RISC-V). I'm
>> almost there - Samuel Holland managed to mainline initial support for th=
is
>> board, so vanilla linux kernel 6.3-rc2 boots fine (with proper/modified
>> u-boot version).
>> The WiFi module is based on rtl8189ftv chip (SDIO connection) and its
>> driver seems to be problematic.
>> First, buildroot's package/rtl8189fs is currently broken; it points to
>> the wrong commit (seems to be copy paste error, inherited from
>> package/rtl8189es). The result is unusable.
>>
>>
>> as Thomas already pointed the commit works ok for me too.
>>
>> I updated it to the correct commit (on the correct branch) and the drive=
r
>> builds fine and loads fine.
>>
>>
>> Which branch and commit have you used? Take care that the commit actuall=
y
>> used has not the support for Linux 6.3 that has been added later.
>>
>> There are couple of issues though:
>> - for some reason the debug mode in driver is set
>>
>> -  driver seems to constantly restart the module, and it emits endless
>> debug messages
>>
>>
>> This could be bound to the branch/commit of the driver, if it includes
>> Linux 6.3 support or not.
>> But it should, otherwise it should not build.
>> Anyway I don=E2=80=99t know that much about other branches.
>> Maybe you mean that master branch is for rtl8189es and rtl8189fs branch
>> is for rtl8189fs?
>>
>> Also, how do you determine that rtl8189ftv is compatible with rtl8189fs?
>>
>>
>> So, is there anybody for whom the rtl8189fs linux driver works fine with
>> kernel 6.3-rcX?
>>
>>
>> PS. I can prepare a patch to fix the package/rtl8189fs but I expect Giul=
io
>> to bump the version again for both package/rtl8189es and
>> package/rtl8189fs soon.
>>
>>
>> Sure I can do that, there is already a pending patch for rtl8189es but
>> it=E2=80=99s already superseded at this point.
>> By Monday I=E2=80=99ll send the 2 patches or feel free to do it instead.
>>
>>
>
> Hi!
>
> Yes, for the rtl8189fs kernel module the code must be checked out from th=
e
> rtl8189fs branch. Currently the commit hash for the package/rtl8189es and
> package/rtl8189fs is the same and it's from rtl8189ES_linux/master. It
> builds but it produces the wrong thing in the case of the rtl8189fs. I'm
> fine if it gets fixed next week ;)
> About rtl8189ftv and compatibility. The difference between rtl8188ftv and
> rtl8189ftv chip seems to be the connection interface type (usb and sdio
> accordingly). It looks to me that the rtl8189fs driver still relies on th=
e
> 8188f specific code but it adds sdio capability (roughly speaking). Also,
> https://linux-sunxi.org/Wifi#RTL8189FTV says that the rtl8189fs branch is
> the only working solution currently (or has been at least).
> There can be several reasons why it doesn't work for me. That's why I was
> asking first about the others' experience on actual hardware, maybe with
> the different (mature) SOC/platform.
>
>
Oh, apparently the MangoPi MQ requires the external wifi antenna (which is
bundled with the board) to be connected ;) Wifi works now for me too (with
the fixed rtl8189fs commit). It seems that previously it got no signal and
was rapidly jumping in and out from power saving.

Indrek

--0000000000002016c405f73dfb35
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><br></div><br><div class=3D"gmail_quote">=
<div dir=3D"ltr" class=3D"gmail_attr">Kontakt Indrek Kruusa (&lt;<a href=3D=
"mailto:indrek.kruusa@gmail.com" target=3D"_blank">indrek.kruusa@gmail.com<=
/a>&gt;) kirjutas kuup=C3=A4eval P, 19. m=C3=A4rts 2023 kell 09:43:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div d=
ir=3D"ltr"><div>Kontakt Giulio Benetti (&lt;<a href=3D"mailto:giulio.benett=
i@benettiengineering.com" target=3D"_blank">giulio.benetti@benettiengineeri=
ng.com</a>&gt;) kirjutas kuup=C3=A4eval P, 19. m=C3=A4rts 2023 kell 01:01:<=
br></div></div><div class=3D"gmail_quote"><blockquote class=3D"gmail_quote"=
 style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);p=
adding-left:1ex"><div dir=3D"auto">Hi Indkrek,<br><div dir=3D"ltr"><br><blo=
ckquote type=3D"cite">Il giorno 18 mar 2023, alle ore 22:46, Indrek Kruusa =
&lt;<a href=3D"mailto:indrek.kruusa@gmail.com" target=3D"_blank">indrek.kru=
usa@gmail.com</a>&gt; ha scritto:<br><br></blockquote></div><blockquote typ=
e=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Hi!<div>I&#39;m tryin=
g to prepare a patch for MangoPi MQ (Allwinner D1s RISC-V). I&#39;m almost =
there - Samuel Holland=C2=A0managed to mainline initial support for this bo=
ard, so vanilla linux kernel=C2=A06.3-rc2 boots fine (with proper/modified =
u-boot version).</div><div>The WiFi module is based on rtl8189ftv chip (SDI=
O connection) and its driver seems to be problematic.</div><div>First, buil=
droot&#39;s package/rtl8189fs is currently broken; it points to the wrong c=
ommit (seems to be copy paste error, inherited from package/rtl8189es). The=
 result is unusable.</div></div></div></blockquote><div><br></div><div><spa=
n style=3D"color:rgb(0,0,0)">as Thomas already pointed the commit works ok =
for me too.</span></div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div=
 dir=3D"ltr"><div> I updated it to the correct commit (on the correct branc=
h) and the driver builds fine and loads fine.</div></div></div></blockquote=
><div><br></div>Which branch and commit have you used? Take care that the c=
ommit actually used has not the support for Linux 6.3 that has been added l=
ater.<br><div><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=
=3D"ltr"><div>There are couple of issues though:</div><div>- for some reaso=
n the debug mode in driver is set</div></div></div></blockquote><blockquote=
 type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div>-=C2=A0 driver seems =
to constantly=C2=A0restart the module, and it emits endless debug messages<=
/div></div></div></blockquote><div><br></div><div>This could be bound to th=
e branch/commit of the driver, if it includes Linux 6.3 support or not.</di=
v><div>But it should, otherwise it should not build.</div><div>Anyway I don=
=E2=80=99t know that much about other branches.</div><div>Maybe you mean th=
at master branch is for rtl8189es and rtl8189fs branch is for rtl8189fs?</d=
iv><div><br></div><div>Also, how do you determine that rtl8189ftv is compat=
ible with rtl8189fs?</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><d=
iv dir=3D"ltr"><div><br></div><div>So, is there anybody for whom the rtl818=
9fs linux driver works fine with kernel 6.3-rcX?</div></div></div></blockqu=
ote><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div><br></=
div><div>PS. I can=C2=A0prepare a patch=C2=A0to fix the package/rtl8189fs b=
ut I expect=C2=A0<span style=3D"color:rgb(51,51,51);font-family:sans-serif;=
font-size:13.3333px">Giulio to bump the version again for both=C2=A0</span>=
package/rtl8189es and package/rtl8189fs soon.</div></div></div></blockquote=
><div><br></div><div>Sure I can do that, there is already a pending patch f=
or rtl8189es but it=E2=80=99s already superseded at this point.=C2=A0</div>=
<div>By Monday I=E2=80=99ll send the 2 patches or feel free to do it instea=
d.</div><div><br></div></div></blockquote><div><br></div><div><br></div><di=
v>Hi!<div><br></div><div>Yes, for the rtl8189fs kernel module the code must=
 be checked out from the rtl8189fs branch. Currently the commit hash for th=
e package/rtl8189es and package/rtl8189fs is the same and it&#39;s from rtl=
8189ES_linux/master. It builds but it produces the wrong thing in the case =
of the rtl8189fs. I&#39;m fine if it gets fixed next week ;)<br>About rtl81=
89ftv and compatibility. The difference between rtl8188ftv and rtl8189ftv c=
hip seems to be the connection interface type (usb and sdio accordingly). I=
t looks to me that the rtl8189fs driver still relies on the 8188f specific =
code but it adds sdio capability (roughly speaking). Also, <a href=3D"https=
://linux-sunxi.org/Wifi#RTL8189FTV" target=3D"_blank">https://linux-sunxi.o=
rg/Wifi#RTL8189FTV</a> says that the rtl8189fs branch is the only working s=
olution currently (or has been at least).<br>There can be several reasons w=
hy it doesn&#39;t work for me. That&#39;s why I was asking first about the =
others&#39; experience on actual hardware, maybe with the different (mature=
) SOC/platform.<br><br></div></div></div></div></blockquote><div><br></div>=
<div>Oh, apparently the MangoPi MQ requires the external wifi antenna (whic=
h is bundled with the board) to be connected ;) Wifi works now for me too (=
with the fixed rtl8189fs commit). It seems that previously it got no signal=
 and was rapidly jumping in and out from power saving.</div><div><br></div>=
<div>Indrek</div><div>=C2=A0<br></div></div></div>

--0000000000002016c405f73dfb35--

--===============4949022218748392075==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4949022218748392075==--
