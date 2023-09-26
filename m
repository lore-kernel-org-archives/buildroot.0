Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF65DE8181B
	for <buildroot@archiver.kernel.org>; Tue, 26 Sep 2023 04:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 19459400E4;
	Tue, 26 Sep 2023 04:52:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 19459400E4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PBMMefyFHfsr; Tue, 26 Sep 2023 04:52:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C1DC84177A;
	Tue, 26 Sep 2023 04:52:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C1DC84177A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5591E1BF2FA
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 04:52:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36EB44177A
 for <buildroot@lists.busybox.net>; Tue, 26 Sep 2023 04:52:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 36EB44177A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CghgzVkLwnX4 for <buildroot@lists.busybox.net>;
 Tue, 26 Sep 2023 04:52:17 +0000 (UTC)
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com
 [IPv6:2607:f8b0:4864:20::c2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2E80F400E4
 for <buildroot@buildroot.org>; Tue, 26 Sep 2023 04:52:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2E80F400E4
Received: by mail-oo1-xc2e.google.com with SMTP id
 006d021491bc7-57bb0f5d00aso2684074eaf.1
 for <buildroot@buildroot.org>; Mon, 25 Sep 2023 21:52:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695703936; x=1696308736;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Dy4wQotmsTncrQvYszqZHgODSTMf0/cB8JyO80nqrgU=;
 b=JlXCUYvGgfrOeLk+iR1RfBe1xPgI3TODt+xCLeGPKcu1ClqnIN4yLaX3DfN3Kpy3GK
 bwAkYoAiZ63X6+pMod9/+fMMblvawqlsam2deVBP269shGkAYY8sh9Rk6NGUoymhMFdq
 x5TI1hx1nIKYSMkCWqd0LDjXOlSjgNpkHVMfa2HetoTSVq6QAC6nxR6dhc6L8pHehVXO
 76c9/541f9hr/K1xRhGZ7iwNsQ4CDbU5TMvQUl6e1LLxO+Eo3oeBwkQmLRTevWKuKKoD
 r2oveMUYA2y6AAqCunX5T0S7gm0FaRKtLp/Uru3XC4z7oxyYdTuXFyLVIg24bl4gpYAW
 VxbQ==
X-Gm-Message-State: AOJu0YzIWaL/bXnLypMEgCv0Q+mewGH6R5tm4CaxwSTOCMK9pNbPSNsT
 ewqZqKM+aEfuwmKjdVbsQHM1thqVlUHCMzw3veM=
X-Google-Smtp-Source: AGHT+IGKLWFutIq1LofsM9DuOzmVZ4EImo7k0nmp4x3luBehO9GT773AH2RhywJajfkxetgfJC7BGiJ6HZu3TT2CELk=
X-Received: by 2002:a05:6870:470c:b0:1be:deef:748a with SMTP id
 b12-20020a056870470c00b001bedeef748amr11122942oaq.50.1695703935872; Mon, 25
 Sep 2023 21:52:15 -0700 (PDT)
MIME-Version: 1.0
References: <CADYjeSs6=UDJZ_6NHNFnKwagW01pcXAKSO8k-G1EUwsBjD2bpw@mail.gmail.com>
 <20230922160448.GR512384@scaer>
 <CADYjeSv4H7rqSaq5D7a9zHyZxSMp1vJv5sNs6Lj7RJLgmXEd3w@mail.gmail.com>
 <20230922170614.GS512384@scaer>
 <CADYjeSvbksx2c3dFSUAKycThZVgi-JD2z68+uiQvGAj_4-ckqA@mail.gmail.com>
In-Reply-To: <CADYjeSvbksx2c3dFSUAKycThZVgi-JD2z68+uiQvGAj_4-ckqA@mail.gmail.com>
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Tue, 26 Sep 2023 06:52:04 +0200
Message-ID: <CADYjeSvHZua9iz_u3YUwjh4j3pcoJaTjLu4UD0NSzC873j6exw@mail.gmail.com>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695703936; x=1696308736; darn=buildroot.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Dy4wQotmsTncrQvYszqZHgODSTMf0/cB8JyO80nqrgU=;
 b=lRUfagbwkSwOto3G7G5YYpMO0lT8LvxSGp9W7oX0Zw0ed4IBPG+ZknNWybOjgGvpik
 c0dTHFG00dCkHUaGoaE7Da1x05hAWcwp0KsHakeSfgjx99MqW1kumgQYME34WDml3df4
 moCtvHwn5mwyPlF7xUUYqexM5ZAtENjyb2qX9Zjhgslv2SF8Tm81+l2hTaeCq11Ygfvn
 GVsyBQ3znJt6yJSGkie+vFnIK0N5SvmLIOffULXiB1IzocCVFESK5TDXIE71DcE8o28g
 rVgcteaAxhFo8QFsSUprdpmj4U5SbTAEw+YO5wkO4bRXkpGZTzpwMz/pej7HlUv7Q2dy
 gsBQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lRUfagbw
Subject: Re: [Buildroot] How to pass EXTRA_OECMAKE_BUILD in Buildroot
 package definition?
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
Content-Type: multipart/mixed; boundary="===============8230562457715951714=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============8230562457715951714==
Content-Type: multipart/alternative; boundary="000000000000bdf42f06063bd600"

--000000000000bdf42f06063bd600
Content-Type: text/plain; charset="UTF-8"

Hello Yann,

Could you please give me an update on above request?

Thanks in advance

On Sun, Sep 24, 2023, 22:31 Sourabh Hegde <hrsourabh011@gmail.com> wrote:

> Hello Yann,
>
> Thanks for the update.
>
> But by the name, and the value it is assigned, it looks like it
>> is the list of cmake rules to build.
>>
>> We do have that in Buildroot: LIBFOO_MAKE_OPTS
>>
>
> Yes, I managed to build it.
>
>  Now, if you are trying to use tensorflow-lite, there is a pending series
>
> by James
>
> Yes, I have tried this and reported one issue. But this version of
> tensorflow is from NXP and they have added some additional configurations.
> I wanted to test it.
>
> Also, I have one more question: How can I pass the directory of a host
> package in another package makefile? For example, in LIBFOO.mk file:
> LIBFOO_CONF_OPTS = -DFOO_HOST_TOOLS_DIR = $(HOST_LIBX_HOST_DIR)/usr/
>
> HOST_LIBX_HOST_DIR is the directory of host-libx.
> But $(HOST_LIBX_HOST_DIR) is not being parsed.
>
> Best Regards,
> Sourabh
>
> On Fri, 22 Sept 2023 at 19:06, Yann E. MORIN <yann.morin.1998@free.fr>
> wrote:
>
>> Sourabh, all,
>>
>> Please do not top-post, this is considered bad etiquette. Reply in-line
>> as I do:
>>
>> On 2023-09-22 18:22 +0200, Sourabh Hegde spake thusly:
>> > Yes, I checked in "Infrastructure for Cmake based packages" but
>> couldn't find anything relevant.
>> > There seems to be no direct way to do this in Buildroot. Please correct
>> me if I'm wrong.
>>
>> So, you have to know what that OE variable does (I have no idea, I don't
>> do OE). But by the name, and the value it is assigned, it looks like it
>> is the list of cmake rules to build.
>>
>> We do have that in Buildroot: LIBFOO_MAKE_OPTS
>>
>> You could look at existign packages to see how it is used, e.g.:
>>
>>     $ grep _MAKE_OPTS $(git grep -l -E 'eval \$\(cmake-')
>>
>> Now, if you are trying to use tensorflow-lite, there is a pending series
>> by James, and it would be nice if you could have a look at it, test it,
>> and report, rather than try yet something else:
>>     https://patchwork.ozlabs.org/project/buildroot/list/?series=346546
>>
>> Regards,
>> Yann E. MORIN.
>>
>> Regards,
>> Yann E. MORIN.
>>
>> > On Fri, Sep 22, 2023, 18:04 Yann E. MORIN < [1]yann.morin.1998@free.fr>
>> wrote:
>> >
>> >   Sourabh, All,
>> >
>> >   On 2023-09-22 17:33 +0200, Sourabh Hegde spake thusly:
>> >   > Hi,
>> >   > I am trying to add a Buildroot package where I need to
>> specify EXTRA_OECMAKE_BUILD. But I couldn't find any relevant
>> >   > variable in Buildroot for this.
>> >
>> >   This variable is specific to the OpenEmbedded world.
>> >
>> >   Look at the Buildroot manual to find the corresponding variable:
>> >
>> >       [2]https://buildroot.org/downloads/manual/manual.html
>> >
>> >   Hint: "Infrastructure for CMake-based packages"
>> >
>> >   Regards,
>> >   Yann E. MORIN.
>> >
>> >   > Example will be from
>> >   > [1]
>> >   [3]
>> https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41
>> >   > Can anyone please let me know how to achieve this?
>> >   > Thanks in advance.
>> >   >
>> >   > Links:
>> >   > 1.
>> >   [4]
>> https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41
>> >
>> >   > _______________________________________________
>> >   > buildroot mailing list
>> >   > [5]buildroot@buildroot.org
>> >   > [6]https://lists.buildroot.org/mailman/listinfo/buildroot
>> >
>> >   --
>> >
>>  .-----------------.--------------------.------------------.--------------------.
>> >   |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
>> conspiracy: |
>> >   | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>>
>> >      |
>> >   | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/
>> There is no  |
>> >   | [7]http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>>  conspiracy.  |
>> >
>>  '------------------------------^-------^------------------^--------------------'
>> >
>> > Links:
>> > 1. mailto:yann.morin.1998@free.fr
>> > 2. https://buildroot.org/downloads/manual/manual.html
>> > 3.
>> https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41
>> > 4.
>> https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41
>> > 5. mailto:buildroot@buildroot.org
>> > 6. https://lists.buildroot.org/mailman/listinfo/buildroot
>> > 7. http://ymorin.is-a-geek.org/
>>
>> > _______________________________________________
>> > buildroot mailing list
>> > buildroot@buildroot.org
>> > https://lists.buildroot.org/mailman/listinfo/buildroot
>>
>>
>> --
>>
>> .-----------------.--------------------.------------------.--------------------.
>> |  Yann E. MORIN  | Real-Time Embedded | /"\ ASCII RIBBON | Erics'
>> conspiracy: |
>> | +33 662 376 056 | Software  Designer | \ / CAMPAIGN     |  ___
>>      |
>> | +33 561 099 427 `------------.-------:  X  AGAINST      |  \e/  There
>> is no  |
>> | http://ymorin.is-a-geek.org/ | _/*\_ | / \ HTML MAIL    |   v
>>  conspiracy.  |
>>
>> '------------------------------^-------^------------------^--------------------'
>>
>

--000000000000bdf42f06063bd600
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto">Hello=C2=A0Yann,<div dir=3D"auto"><br></div><div dir=3D"a=
uto">Could you please give me an update on above request?</div><div dir=3D"=
auto"><br></div><div dir=3D"auto">Thanks in advance</div></div><br><div cla=
ss=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Sun, Sep 24, 20=
23, 22:31 Sourabh Hegde &lt;<a href=3D"mailto:hrsourabh011@gmail.com">hrsou=
rabh011@gmail.com</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote"=
 style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-left:1ex"><d=
iv dir=3D"ltr">Hello Yann,<div><br></div><div>Thanks for the update.</div><=
div><br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px=
 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">But by the =
name, and the value it is assigned, it looks like it<br>is the list of cmak=
e rules to build.<br><br>We do have that in Buildroot: LIBFOO_MAKE_OPTS<br>=
</blockquote><div><br></div><div>Yes, I managed to build it.</div><div><br>=
</div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;b=
order-left:1px solid rgb(204,204,204);padding-left:1ex">=C2=A0Now, if you a=
re trying to use tensorflow-lite, there is a pending series</blockquote>by =
James<div><br></div><div>Yes, I have tried this and reported one issue. But=
 this version of tensorflow is from NXP and they have added some additional=
 configurations. I wanted to test it.</div><div><br></div><div>Also, I have=
 one more question: How can I pass the directory of a host package in anoth=
er package makefile? For example, in LIBFOO.mk file:<br>LIBFOO_CONF_OPTS =
=3D -DFOO_HOST_TOOLS_DIR =3D $(HOST_LIBX_HOST_DIR)/usr/</div><div><br></div=
><div>HOST_LIBX_HOST_DIR is the directory of host-libx.<br></div><div>But $=
(HOST_LIBX_HOST_DIR) is not being parsed.</div><div><br></div><div>Best Reg=
ards,</div><div>Sourabh</div></div><br><div class=3D"gmail_quote"><div dir=
=3D"ltr" class=3D"gmail_attr">On Fri, 22 Sept 2023 at 19:06, Yann E. MORIN =
&lt;<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_blank" rel=3D"nor=
eferrer">yann.morin.1998@free.fr</a>&gt; wrote:<br></div><blockquote class=
=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rg=
b(204,204,204);padding-left:1ex">Sourabh, all,<br>
<br>
Please do not top-post, this is considered bad etiquette. Reply in-line<br>
as I do:<br>
<br>
On 2023-09-22 18:22 +0200, Sourabh Hegde spake thusly:<br>
&gt; Yes, I checked in &quot;Infrastructure for Cmake based packages&quot; =
but couldn&#39;t find anything relevant.<br>
&gt; There seems to be no direct way to do this in Buildroot. Please correc=
t me if I&#39;m wrong.<br>
<br>
So, you have to know what that OE variable does (I have no idea, I don&#39;=
t<br>
do OE). But by the name, and the value it is assigned, it looks like it<br>
is the list of cmake rules to build.<br>
<br>
We do have that in Buildroot: LIBFOO_MAKE_OPTS<br>
<br>
You could look at existign packages to see how it is used, e.g.:<br>
<br>
=C2=A0 =C2=A0 $ grep _MAKE_OPTS $(git grep -l -E &#39;eval \$\(cmake-&#39;)=
<br>
<br>
Now, if you are trying to use tensorflow-lite, there is a pending series<br=
>
by James, and it would be nice if you could have a look at it, test it,<br>
and report, rather than try yet something else:<br>
=C2=A0 =C2=A0 <a href=3D"https://patchwork.ozlabs.org/project/buildroot/lis=
t/?series=3D346546" rel=3D"noreferrer noreferrer" target=3D"_blank">https:/=
/patchwork.ozlabs.org/project/buildroot/list/?series=3D346546</a><br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
Regards,<br>
Yann E. MORIN.<br>
<br>
&gt; On Fri, Sep 22, 2023, 18:04 Yann E. MORIN &lt; [1]<a href=3D"mailto:ya=
nn.morin.1998@free.fr" target=3D"_blank" rel=3D"noreferrer">yann.morin.1998=
@free.fr</a>&gt; wrote:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Sourabh, All,<br>
&gt; <br>
&gt;=C2=A0 =C2=A0On 2023-09-22 17:33 +0200, Sourabh Hegde spake thusly:<br>
&gt;=C2=A0 =C2=A0&gt; Hi,<br>
&gt;=C2=A0 =C2=A0&gt; I am trying to add a Buildroot package where I need t=
o specify=C2=A0EXTRA_OECMAKE_BUILD. But I couldn&#39;t=C2=A0find any releva=
nt<br>
&gt;=C2=A0 =C2=A0&gt; variable in Buildroot for this.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0This variable is specific to the OpenEmbedded world.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0Look at the Buildroot manual to find the corresponding var=
iable:<br>
&gt; <br>
&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0 [2]<a href=3D"https://buildroot.org/download=
s/manual/manual.html" rel=3D"noreferrer noreferrer" target=3D"_blank">https=
://buildroot.org/downloads/manual/manual.html</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0Hint: &quot;Infrastructure for CMake-based packages&quot;<=
br>
&gt; <br>
&gt;=C2=A0 =C2=A0Regards,<br>
&gt;=C2=A0 =C2=A0Yann E. MORIN.<br>
&gt; <br>
&gt;=C2=A0 =C2=A0&gt; Example will be from=C2=A0<br>
&gt;=C2=A0 =C2=A0&gt; [1]<br>
&gt;=C2=A0 =C2=A0[3]<a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a=
864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-=
lite/tensorflow-lite_2.10.0.bb#L41" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e=
6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2=
.10.0.bb#L41</a><br>
&gt;=C2=A0 =C2=A0&gt; Can anyone please let me know how to achieve this?<br=
>
&gt;=C2=A0 =C2=A0&gt; Thanks in advance.<br>
&gt;=C2=A0 =C2=A0&gt;<br>
&gt;=C2=A0 =C2=A0&gt; Links:<br>
&gt;=C2=A0 =C2=A0&gt; 1.<br>
&gt;=C2=A0 =C2=A0[4]<a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a=
864ab77de06a557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-=
lite/tensorflow-lite_2.10.0.bb#L41" rel=3D"noreferrer noreferrer" target=3D=
"_blank">https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e=
6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2=
.10.0.bb#L41</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0&gt; _______________________________________________<br>
&gt;=C2=A0 =C2=A0&gt; buildroot mailing list<br>
&gt;=C2=A0 =C2=A0&gt; [5]<a href=3D"mailto:buildroot@buildroot.org" target=
=3D"_blank" rel=3D"noreferrer">buildroot@buildroot.org</a><br>
&gt;=C2=A0 =C2=A0&gt; [6]<a href=3D"https://lists.buildroot.org/mailman/lis=
tinfo/buildroot" rel=3D"noreferrer noreferrer" target=3D"_blank">https://li=
sts.buildroot.org/mailman/listinfo/buildroot</a><br>
&gt; <br>
&gt;=C2=A0 =C2=A0--<br>
&gt;=C2=A0 =C2=A0.-----------------.--------------------.------------------=
.--------------------.<br>
&gt;=C2=A0 =C2=A0|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;=
\ ASCII RIBBON | Erics&#39; conspiracy: |<br>
&gt;=C2=A0 =C2=A0| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=
=C2=A0 =C2=A0 =C2=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0<br=
>
&gt;=C2=A0 =C2=A0=C2=A0 =C2=A0|<br>
&gt;=C2=A0 =C2=A0| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGA=
INST=C2=A0 =C2=A0 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
&gt;=C2=A0 =C2=A0| [7]<a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noref=
errer noreferrer" target=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\=
_ | / \ HTML MAIL=C2=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=
=A0 |<br>
&gt;=C2=A0 =C2=A0&#39;------------------------------^-------^--------------=
----^--------------------&#39;<br>
&gt; <br>
&gt; Links:<br>
&gt; 1. mailto:<a href=3D"mailto:yann.morin.1998@free.fr" target=3D"_blank"=
 rel=3D"noreferrer">yann.morin.1998@free.fr</a><br>
&gt; 2. <a href=3D"https://buildroot.org/downloads/manual/manual.html" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://buildroot.org/download=
s/manual/manual.html</a><br>
&gt; 3. <a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a=
557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorf=
low-lite_2.10.0.bb#L41" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6=
948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41=
</a><br>
&gt; 4. <a href=3D"https://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a=
557afcb01e6dd4d21606e6948/meta-ml/recipes-libraries/tensorflow-lite/tensorf=
low-lite_2.10.0.bb#L41" rel=3D"noreferrer noreferrer" target=3D"_blank">htt=
ps://github.com/nxp-imx/meta-imx/blob/64a864ab77de06a557afcb01e6dd4d21606e6=
948/meta-ml/recipes-libraries/tensorflow-lite/tensorflow-lite_2.10.0.bb#L41=
</a><br>
&gt; 5. mailto:<a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank"=
 rel=3D"noreferrer">buildroot@buildroot.org</a><br>
&gt; 6. <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" =
rel=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org=
/mailman/listinfo/buildroot</a><br>
&gt; 7. <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer noreferr=
er" target=3D"_blank">http://ymorin.is-a-geek.org/</a><br>
<br>
&gt; _______________________________________________<br>
&gt; buildroot mailing list<br>
&gt; <a href=3D"mailto:buildroot@buildroot.org" target=3D"_blank" rel=3D"no=
referrer">buildroot@buildroot.org</a><br>
&gt; <a href=3D"https://lists.buildroot.org/mailman/listinfo/buildroot" rel=
=3D"noreferrer noreferrer" target=3D"_blank">https://lists.buildroot.org/ma=
ilman/listinfo/buildroot</a><br>
<br>
<br>
-- <br>
.-----------------.--------------------.------------------.----------------=
----.<br>
|=C2=A0 Yann E. MORIN=C2=A0 | Real-Time Embedded | /&quot;\ ASCII RIBBON | =
Erics&#39; conspiracy: |<br>
| +33 662 376 056 | Software=C2=A0 Designer | \ / CAMPAIGN=C2=A0 =C2=A0 =C2=
=A0|=C2=A0 ___=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0|<br>
| +33 561 099 427 `------------.-------:=C2=A0 X=C2=A0 AGAINST=C2=A0 =C2=A0=
 =C2=A0 |=C2=A0 \e/=C2=A0 There is no=C2=A0 |<br>
| <a href=3D"http://ymorin.is-a-geek.org/" rel=3D"noreferrer noreferrer" ta=
rget=3D"_blank">http://ymorin.is-a-geek.org/</a> | _/*\_ | / \ HTML MAIL=C2=
=A0 =C2=A0 |=C2=A0 =C2=A0v=C2=A0 =C2=A0conspiracy.=C2=A0 |<br>
&#39;------------------------------^-------^------------------^------------=
--------&#39;<br>
</blockquote></div>
</blockquote></div>

--000000000000bdf42f06063bd600--

--===============8230562457715951714==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============8230562457715951714==--
