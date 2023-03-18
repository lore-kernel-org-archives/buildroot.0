Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88159C74A5B
	for <buildroot@archiver.kernel.org>; Sat, 18 Mar 2023 23:01:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0EC4E40469;
	Sat, 18 Mar 2023 23:01:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0EC4E40469
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6bZNaLIDs49Y; Sat, 18 Mar 2023 23:01:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1CF74402D0;
	Sat, 18 Mar 2023 23:01:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1CF74402D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 7B2AC1BF3A3
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 23:01:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5502860E4E
 for <buildroot@lists.busybox.net>; Sat, 18 Mar 2023 23:01:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5502860E4E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rq1HAss3geiO for <buildroot@lists.busybox.net>;
 Sat, 18 Mar 2023 23:01:06 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BB12760E19
Received: from smtpcmd0642.aruba.it (smtpcmd0642.aruba.it [62.149.156.42])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB12760E19
 for <buildroot@buildroot.org>; Sat, 18 Mar 2023 23:01:04 +0000 (UTC)
Received: from smtpclient.apple ([151.34.66.109])
 by Aruba Outgoing Smtp  with ESMTPA
 id dfXppyhYnXi9adfXppFt57; Sun, 19 Mar 2023 00:01:02 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sun, 19 Mar 2023 00:01:00 +0100
Message-Id: <4B628CF1-65C6-4661-BAFB-B969A770A66E@benettiengineering.com>
References: <CA+fTLhhanWy3Q3mj96yTD+4Hjxaeu=Eh5en_mhpwEbZ+deBPWA@mail.gmail.com>
In-Reply-To: <CA+fTLhhanWy3Q3mj96yTD+4Hjxaeu=Eh5en_mhpwEbZ+deBPWA@mail.gmail.com>
To: Indrek Kruusa <indrek.kruusa@gmail.com>
X-Mailer: iPhone Mail (20D67)
X-CMAE-Envelope: MS4xfJd3zb9RhMvFoAAxpDpisnrofU27npRWbYs7mUJ/miFJ9BRQ76s0wWnU0Qxu6qa0EYBVTTHXzmaOYebHSgmOXGWgNf8pDEwhs5L82Ze6KMIxNQx+zLcT
 1ZivyoAPA+qJFvl61CDFXGBJD2hPQliWN6DOKHPEGtREumlZBX0bYLGSK2a0xLAylsPFcycwAxGSlAPjLG1FwcWrFQI7q+s6RgprrvqaSLaCS3N/TXOGceuG
 A0ysQmF6sh0tZThr1maHgw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1679180462; bh=KAAPeV9f0FtouZ8bAbxpRguPjzB4MLSpedEPylX0/hE=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=ZiimsiwqMTSm07ZYX10Ygile+vgUJlm6d1il3ZIJo+v4YhcfeH91keIxLi58tbboG
 w5xBImDL6rsxZg3CqrMnBAHA1F6tJy5H2VSTA/0xVOaWg0g5zY9SdElF7bevmWGsBt
 agl4BIOmARYXrraclNFZJBAK320v9lAvPiPcU28+lxSnKUczlUnwISWE0mtEZfNuzn
 KT4/iY6DXmWwqwjoWY1HRJQOxU0ruiHQwkRhgNOtF4uYn+jGdK6VI8vDlsk8XFDqwB
 VjkoBKGmSSX9F5vQqvOvmoVFE8ODFsuetlWQorgaKqKm+8TPC3UDvNKUUEXT1NO1Pz
 xO7aRGV8C3SWw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=Ziimsiwq
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
Content-Type: multipart/mixed; boundary="===============0806486448991703079=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0806486448991703079==
Content-Type: multipart/alternative; boundary=Apple-Mail-26902FB9-0FB2-4D28-A748-67A2C8D56DF4
Content-Transfer-Encoding: 7bit


--Apple-Mail-26902FB9-0FB2-4D28-A748-67A2C8D56DF4
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Indkrek,

> Il giorno 18 mar 2023, alle ore 22:46, Indrek Kruusa <indrek.kruusa@gmail.=
com> ha scritto:
>=20
> =EF=BB=BF
> Hi!
> I'm trying to prepare a patch for MangoPi MQ (Allwinner D1s RISC-V). I'm a=
lmost there - Samuel Holland managed to mainline initial support for this bo=
ard, so vanilla linux kernel 6.3-rc2 boots fine (with proper/modified u-boot=
 version).
> The WiFi module is based on rtl8189ftv chip (SDIO connection) and its driv=
er seems to be problematic.
> First, buildroot's package/rtl8189fs is currently broken; it points to the=
 wrong commit (seems to be copy paste error, inherited from package/rtl8189e=
s). The result is unusable.

as Thomas already pointed the commit works ok for me too.

> I updated it to the correct commit (on the correct branch) and the driver b=
uilds fine and loads fine.

Which branch and commit have you used? Take care that the commit actually us=
ed has not the support for Linux 6.3 that has been added later.

> There are couple of issues though:
> - for some reason the debug mode in driver is set
> -  driver seems to constantly restart the module, and it emits endless deb=
ug messages

This could be bound to the branch/commit of the driver, if it includes Linux=
 6.3 support or not.
But it should, otherwise it should not build.
Anyway I don=E2=80=99t know that much about other branches.
Maybe you mean that master branch is for rtl8189es and rtl8189fs branch is f=
or rtl8189fs?

Also, how do you determine that rtl8189ftv is compatible with rtl8189fs?

>=20
> So, is there anybody for whom the rtl8189fs linux driver works fine with k=
ernel 6.3-rcX?
>=20
> PS. I can prepare a patch to fix the package/rtl8189fs but I expect Giulio=
 to bump the version again for both package/rtl8189es and package/rtl8189fs s=
oon.

Sure I can do that, there is already a pending patch for rtl8189es but it=E2=
=80=99s already superseded at this point.=20
By Monday I=E2=80=99ll send the 2 patches or feel free to do it instead.

Best regards
Giulio

>=20
> Best regards,
> Indrek
>=20
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-26902FB9-0FB2-4D28-A748-67A2C8D56DF4
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Indkrek,<br><div dir=3D"ltr"><br><blockq=
uote type=3D"cite">Il giorno 18 mar 2023, alle ore 22:46, Indrek Kruusa &lt;=
indrek.kruusa@gmail.com&gt; ha scritto:<br><br></blockquote></div><blockquot=
e type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr">Hi!<div>I'm tryin=
g to prepare a patch for MangoPi MQ (Allwinner D1s RISC-V). I'm almost there=
 - Samuel Holland&nbsp;managed to mainline initial support for this board, s=
o vanilla linux kernel&nbsp;6.3-rc2 boots fine (with proper/modified u-boot v=
ersion).</div><div>The WiFi module is based on rtl8189ftv chip (SDIO connect=
ion) and its driver seems to be problematic.</div><div>First, buildroot's pa=
ckage/rtl8189fs is currently broken; it points to the wrong commit (seems to=
 be copy paste error, inherited from package/rtl8189es). The result is unusa=
ble.</div></div></div></blockquote><div><br></div><div><span style=3D"caret-=
color: rgb(0, 0, 0); color: rgb(0, 0, 0);">as Thomas already pointed the com=
mit works ok for me too.</span></div><br><blockquote type=3D"cite"><div dir=3D=
"ltr"><div dir=3D"ltr"><div> I updated it to the correct commit (on the corr=
ect branch) and the driver builds fine and loads fine.</div></div></div></bl=
ockquote><div><br></div>Which branch and commit have you used? Take care tha=
t the commit actually used has not the support for Linux 6.3 that has been a=
dded later.<br><div><br></div><blockquote type=3D"cite"><div dir=3D"ltr"><di=
v dir=3D"ltr"><div>There are couple of issues though:</div><div>- for some r=
eason the debug mode in driver is set</div></div></div></blockquote><blockqu=
ote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div>-&nbsp; driver seem=
s to constantly&nbsp;restart the module, and it emits endless debug messages=
</div></div></div></blockquote><div><br></div><div>This could be bound to th=
e branch/commit of the driver, if it includes Linux 6.3 support or not.</div=
><div>But it should, otherwise it should not build.</div><div>Anyway I don=E2=
=80=99t know that much about other branches.</div><div>Maybe you mean that m=
aster branch is for rtl8189es and rtl8189fs branch is for rtl8189fs?</div><d=
iv><br></div><div>Also, how do you determine that rtl8189ftv is compatible w=
ith rtl8189fs?</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D=
"ltr"><div><br></div><div>So, is there anybody for whom the rtl8189fs linux d=
river works fine with kernel 6.3-rcX?</div></div></div></blockquote><blockqu=
ote type=3D"cite"><div dir=3D"ltr"><div dir=3D"ltr"><div><br></div><div>PS. I=
 can&nbsp;prepare a patch&nbsp;to fix the package/rtl8189fs but I expect&nbs=
p;<span style=3D"color:rgb(51,51,51);font-family:sans-serif;font-size:13.333=
3px">Giulio to bump the version again for both&nbsp;</span>package/rtl8189es=
 and package/rtl8189fs soon.</div></div></div></blockquote><div><br></div><d=
iv>Sure I can do that, there is already a pending patch for rtl8189es but it=
=E2=80=99s already superseded at this point.&nbsp;</div><div>By Monday I=E2=80=
=99ll send the 2 patches or feel free to do it instead.</div><div><br></div>=
<div>Best regards</div><div>Giulio</div><br><blockquote type=3D"cite"><div d=
ir=3D"ltr"><div dir=3D"ltr"><div><span style=3D"color:rgb(51,51,51);font-fam=
ily:sans-serif;font-size:13.3333px"><br></span></div><div>Best regards,</div=
><div>Indrek</div><div><br></div></div>
<span>_______________________________________________</span><br><span>buildr=
oot mailing list</span><br><span>buildroot@buildroot.org</span><br><span>htt=
ps://lists.buildroot.org/mailman/listinfo/buildroot</span><br></div></blockq=
uote></body></html>=

--Apple-Mail-26902FB9-0FB2-4D28-A748-67A2C8D56DF4--

--===============0806486448991703079==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0806486448991703079==--
