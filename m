Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 080D3C0502C
	for <buildroot@archiver.kernel.org>; Sat, 27 Aug 2022 09:11:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7C3A8404D7;
	Sat, 27 Aug 2022 09:11:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7C3A8404D7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qYPzZgM-uLSR; Sat, 27 Aug 2022 09:11:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 936054017A;
	Sat, 27 Aug 2022 09:11:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 936054017A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 883E31BF32D
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 09:11:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5F7C9818AC
 for <buildroot@lists.busybox.net>; Sat, 27 Aug 2022 09:11:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5F7C9818AC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Q1EO9oA-uwvR for <buildroot@lists.busybox.net>;
 Sat, 27 Aug 2022 09:11:35 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2457F8143C
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com
 [IPv6:2a00:1450:4864:20::634])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2457F8143C
 for <buildroot@busybox.net>; Sat, 27 Aug 2022 09:11:35 +0000 (UTC)
Received: by mail-ej1-x634.google.com with SMTP id p16so3897238ejb.9
 for <buildroot@busybox.net>; Sat, 27 Aug 2022 02:11:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=ASvWiB2XdrosrPNF6LoMH7LuZEyrWmhnrq4qiFcRxmg=;
 b=fgdYdG5suRn9e+dza3L9GSg3dN1NnEwYLQ+ThBInP80HjigJ+9Xnq90Q01xqD1gLYX
 gm+NFrsXXjE49caOHe22jOERi99ZNDkF87+0+4+HtR47LZpAKCSNk8ROQbGnHoTvIjRH
 p2nS3sQn9Uof7qYhcNr6HMBeTWYzd/gOLo4wy4JOe1PlP0+DUD8ZKYkoewdygFpjDri6
 PtlLtyJwQfqs3uDy0tDRkJtelK9Tj0LiCp4dpM8uqtAFTq/I4GbLYB9/g9VIK03sBXvE
 CP3BXgj4oiB3IRf/xYQyOXDuN4gC43rJvidgmJ9+Z4kp87WeBeVHVdZx52OwDbEBXcO+
 TUKA==
X-Gm-Message-State: ACgBeo3vtFV2QYWSfqJBVUFstWlYmGZin2SPByUnGXqYasjHDfRHsgOs
 9XpZujInx8yg1ChmSb2FgWndBBe18q0BM0TilqRVzGCa
X-Google-Smtp-Source: AA6agR4nBqYPnNiUWLP/HP0A5bSQ3VasDPBksPY26Rlldv1HEeS1xFgWkLvGEEHz8kZ+bfw2Ez8kGvcXyfKu/QAUvv8=
X-Received: by 2002:a17:907:8a0c:b0:73d:becd:b35c with SMTP id
 sc12-20020a1709078a0c00b0073dbecdb35cmr7751787ejc.204.1661591493254; Sat, 27
 Aug 2022 02:11:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220805143625.16542-1-guillaume.bressaix@gmail.com>
 <20220805143625.16542-2-guillaume.bressaix@gmail.com>
 <CAJe0E3cL8MK4ipwq3tLDy_D6dqrEJ2gfi20J1rXEewW4fUSkcw@mail.gmail.com>
 <28767d03-5c5f-d40e-12d1-ebdc6b3a5900@mind.be>
 <20220808231302.08adad89@windsurf>
 <CAJe0E3fy_HBXg9nwBaWSOADuMLtPhJLr3weAx2n1R13h_+OMTQ@mail.gmail.com>
In-Reply-To: <CAJe0E3fy_HBXg9nwBaWSOADuMLtPhJLr3weAx2n1R13h_+OMTQ@mail.gmail.com>
From: Guillaume Bres <guillaume.bressaix@gmail.com>
Date: Sat, 27 Aug 2022 11:11:05 +0200
Message-ID: <CAJe0E3fFrw5ShPYbQohf9A_LRn309C_4tdrKF53eN2NKVarGYA@mail.gmail.com>
To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=ASvWiB2XdrosrPNF6LoMH7LuZEyrWmhnrq4qiFcRxmg=;
 b=PGWViOdsaZgZsAycEQiGyd/E1ZgwjhXokPueDmpw7KL3h2hXtdHXtZqZxi7SUMdN7d
 akGbClPE6tq+zr9CWVtbvpMHElfFJoAdIBRyY+RMVLP22EMJ73U2ZUK4WJYj4YWR2MvT
 pmywekMNG/AAgVS6X5vnj4rrhzNzvrCti/5lrxsjvqpRn+jxuSbXLAeRg8R7DlX2QrSy
 g/O8vlRVsV5RMwngj9lSDh4oufTqd+GdwicRXTKDA5U6iyOmjMmTbwe+AOGO2OgELM8z
 MBWiVE7LKVUM5ngVEEeEnCHKWNuJRvm0FS2KaNZxBP/toJ+kiny/B4tlEbLPIsNNpF30
 VSwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PGWViOds
Subject: Re: [Buildroot] [RFC v3 2/2] package/python-scipy: bump version to
 1.9.0
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
Cc: buildroot@busybox.net, ralf.gommers@gmail.com
Content-Type: multipart/mixed; boundary="===============5147424573638394361=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5147424573638394361==
Content-Type: multipart/alternative; boundary="000000000000b7a39505e7356aaf"

--000000000000b7a39505e7356aaf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello all,

I suggest we wait for new updates of scipy before converting the package to
meson.
In the meantime, I expect pybind and numpy to be sanitized too (probably
the impulse of scipy), so we should keep track of these.
For information, scipy-v1.9.1 has just been released but it does not come
with anything new regarding meson scripts.

I currently have a v3 patch that is able to upgrade scipy to v1.9.0 and
meson, but it involves patching the build script (it's fairly minor).
But this patch is not 100% ready and needs to be finalized.
What do you guys think is best? Should I conclude this, or we remain as is
(which works fine) and wait for new releases?
I am worried such tweaks appear fine at first, but might raise lots of
issues once injected into BR

Guillaume W. Bres
Software engineer
<guillaume.bressaix@gmail.com>


Le mar. 9 ao=C3=BBt 2022 =C3=A0 10:37, Guillaume Bres <guillaume.bressaix@g=
mail.com>
a =C3=A9crit :

> for information,
> pybind will soon become pkg-config knowledgeable, as this issue is about
> to get merged https://github.com/pybind/pybind11/pull/4077
>
> Guillaume W. Bres
> Software engineer
> <guillaume.bressaix@gmail.com>
>
>
> Le lun. 8 ao=C3=BBt 2022 =C3=A0 23:13, Thomas Petazzoni <
> thomas.petazzoni@bootlin.com> a =C3=A9crit :
>
>> On Mon, 8 Aug 2022 22:58:46 +0200
>> Arnout Vandecappelle <arnout@mind.be> wrote:
>>
>> >   pybind is consistently annoying, it uses ldd and stuff to discover
>> paths...
>>
>> Well, it's not just pybind. Python itself, in its ctype.find_library()
>> function, uses ldconfig, tries to use gcc on the target, and more funky
>> stuff that borks terribly in a Buildroot situation.
>>
>> Thomas
>> --
>> Thomas Petazzoni, co-owner and CEO, Bootlin
>> Embedded Linux and Kernel engineering and training
>> https://bootlin.com
>>
>

--000000000000b7a39505e7356aaf
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<br><br>I suggest we wait for new updates of sci=
py before converting the package to meson.=C2=A0<br>In the meantime, I expe=
ct pybind and numpy to be sanitized too=C2=A0(probably the impulse of scipy=
), so we should keep track of these.=C2=A0<br>For information, scipy-v1.9.1=
 has just been released but it does not come with anything new regarding=C2=
=A0meson scripts.<div><br>I currently have a v3 patch that is able to upgra=
de scipy to v1.9.0 and meson, but it involves patching the build script (it=
&#39;s fairly minor).<br>But this patch is not=C2=A0100% ready and needs to=
 be=C2=A0finalized. <br>What do you guys think is best? Should I conclude t=
his, or we remain as is (which works fine) and wait for new releases?=C2=A0=
<br>I am worried such tweaks appear fine at first, but might raise lots of =
issues once injected into BR=C2=A0<div><br clear=3D"all"><div><div dir=3D"l=
tr" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=
=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div>=
<font face=3D"arial,helvetica,sans-serif">Guillaume W. Bres<br></font></div=
><font face=3D"arial,helvetica,sans-serif">Software engineer</font><br></di=
v><font face=3D"arial,helvetica,sans-serif"></font></div><font face=3D"aria=
l,helvetica,sans-serif">&lt;<a href=3D"mailto:guillaume.bressaix@gmail.com"=
 target=3D"_blank">guillaume.bressaix@gmail.com</a>&gt;<br></font></div></d=
iv></div></div></div></div><br></div></div></div><br><div class=3D"gmail_qu=
ote"><div dir=3D"ltr" class=3D"gmail_attr">Le=C2=A0mar. 9 ao=C3=BBt 2022 =
=C3=A0=C2=A010:37, Guillaume Bres &lt;<a href=3D"mailto:guillaume.bressaix@=
gmail.com">guillaume.bressaix@gmail.com</a>&gt; a =C3=A9crit=C2=A0:<br></di=
v><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;borde=
r-left:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr">for in=
formation,<br>pybind will soon become pkg-config knowledgeable, as this iss=
ue is about to get merged <a href=3D"https://github.com/pybind/pybind11/pul=
l/4077" target=3D"_blank">https://github.com/pybind/pybind11/pull/4077</a><=
br><br clear=3D"all"><div><div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr=
"><div dir=3D"ltr"><div dir=3D"ltr"><div><div><div><font face=3D"arial,helv=
etica,sans-serif">Guillaume W. Bres<br></font></div><font face=3D"arial,hel=
vetica,sans-serif">Software engineer</font><br></div><font face=3D"arial,he=
lvetica,sans-serif"></font></div><font face=3D"arial,helvetica,sans-serif">=
&lt;<a href=3D"mailto:guillaume.bressaix@gmail.com" target=3D"_blank">guill=
aume.bressaix@gmail.com</a>&gt;<br></font></div></div></div></div></div></d=
iv><br></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=3D"gmail=
_attr">Le=C2=A0lun. 8 ao=C3=BBt 2022 =C3=A0=C2=A023:13, Thomas Petazzoni &l=
t;<a href=3D"mailto:thomas.petazzoni@bootlin.com" target=3D"_blank">thomas.=
petazzoni@bootlin.com</a>&gt; a =C3=A9crit=C2=A0:<br></div><blockquote clas=
s=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid r=
gb(204,204,204);padding-left:1ex">On Mon, 8 Aug 2022 22:58:46 +0200<br>
Arnout Vandecappelle &lt;<a href=3D"mailto:arnout@mind.be" target=3D"_blank=
">arnout@mind.be</a>&gt; wrote:<br>
<br>
&gt;=C2=A0 =C2=A0pybind is consistently annoying, it uses ldd and stuff to =
discover paths...<br>
<br>
Well, it&#39;s not just pybind. Python itself, in its ctype.find_library()<=
br>
function, uses ldconfig, tries to use gcc on the target, and more funky<br>
stuff that borks terribly in a Buildroot situation.<br>
<br>
Thomas<br>
-- <br>
Thomas Petazzoni, co-owner and CEO, Bootlin<br>
Embedded Linux and Kernel engineering and training<br>
<a href=3D"https://bootlin.com" rel=3D"noreferrer" target=3D"_blank">https:=
//bootlin.com</a><br>
</blockquote></div>
</blockquote></div>

--000000000000b7a39505e7356aaf--

--===============5147424573638394361==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5147424573638394361==--
