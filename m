Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D211C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 17:43:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2C9640517;
	Sat,  6 Aug 2022 17:43:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2C9640517
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U6TfIhjfDMQS; Sat,  6 Aug 2022 17:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 757ED404FC;
	Sat,  6 Aug 2022 17:43:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 757ED404FC
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 148631BF957
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 17:43:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0D5860784
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 17:43:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F0D5860784
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nMXcPejblYpt for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 17:43:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 206136077D
Received: from smtpweb155.aruba.it (smtpweb155.aruba.it [62.149.158.155])
 by smtp3.osuosl.org (Postfix) with ESMTP id 206136077D
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 17:43:36 +0000 (UTC)
Received: from smtpclient.apple ([86.32.63.136])
 by Aruba Outgoing Smtp  with ESMTPA
 id KNpmoDp5S34GkKNpnoUSlF; Sat, 06 Aug 2022 19:43:35 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Sat, 6 Aug 2022 19:43:34 +0200
Message-Id: <575D4695-1A46-4431-90F2-63212188CDD1@benettiengineering.com>
References: <CAPn86JAvLDjLZYGTvCeJDD45o7Erro2aM8wYzRO73OWW3ehfVw@mail.gmail.com>
In-Reply-To: <CAPn86JAvLDjLZYGTvCeJDD45o7Erro2aM8wYzRO73OWW3ehfVw@mail.gmail.com>
To: Stefano Cottafavi <stefano.cottafavi@gmail.com>
X-Mailer: iPhone Mail (19G71)
X-CMAE-Envelope: MS4xfLggPGx45VmwUq91Rdzl0FvI5KPxVJMLCqAYVwBKds/RH1/QNOHeu2JhHpOXqJdSeDb+1ThLcNGYYNAjJwNZufbojC8XX8EColXXd/lD7ArqORYA/tfO
 xhesq3iR3dxpYKgirIfgrNIIB/NccfvFKg2q2OptM4Ek8za+CtVvYQD6eSiHdHYBFpzBiNzh5KzJMNLy6A4usij+AoRHL/o+JYlw2ioHruy+qeRSCdFYzQHY
 4hvC6Yp4Rs6S81SagPlYyvKW0Be7CxnJClYRdyLLH94=
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1659807815; bh=i2venEt1PYlgc91av5KmN2CLPJA0DZSd6Saa6/z2sG0=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=gnNhTWQZli9dGKJ153EEngWQ2nl8ouBjdOLh1I9fr5ABQP5+iSB6HCW8MidnSe0kf
 fYr3hNcOJhP8tVAz9AojRr33v1/RTi+zQ5q48U9wstt/4D6cn2zqhqT7VloLx01rcq
 VZjKq+uhBuw16WbWP8GI8qAtaW87vX4I9q/FY+hbgCzhST6U5aCWeoS5WxVP1H9hh9
 KVDZlIeiHQ4esFhNVHuLrKXdOEPKUgp0XdfNHyOFsOBPg9Kg280sdmoWoTdeMyzTKm
 rztIPDVkhOYNA5UhibGoMM7q7rBOrBitdC1bEcx/tOcd1Iz+f6Cj5V+32TgJw38zkp
 H9HAfd3cnX3bQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=gnNhTWQZ
Subject: Re: [Buildroot] OpenCV modules headers not in the SDK
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
Content-Type: multipart/mixed; boundary="===============6835363449188770337=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============6835363449188770337==
Content-Type: multipart/alternative; boundary=Apple-Mail-78408561-5367-4D23-960B-8BF8CF65F75B
Content-Transfer-Encoding: 7bit


--Apple-Mail-78408561-5367-4D23-960B-8BF8CF65F75B
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Stefano,

> Il giorno 6 ago 2022, alle ore 19:29, Stefano Cottafavi <stefano.cottafavi=
@gmail.com> ha scritto:
>=20
> =EF=BB=BF
> Hi all,
> I've successfully built Buildroot 2022.05 for the Raspberry Pi4 adding sup=
port for Qt5 and OpenCV (including objdetect module amongst few other).
> I've also managed to generate the SDK for such a build however I can't fin=
d the header files of those OpenCV modules anywhere in the SDK.
>=20
> Is this expected or a bug?

It looks like a bug. Can you please pastebin your specific defconfig?

You can obtain it moving to your output folder and  issuing:
$ make savedeconfig
then you obtain a file called defconfig so copy and paste it on pastebin and=
 provide here
the link to the pastebin and also the SHA1 commit of your Buildroot git or t=
he specific version.

This way we can help you.

Best regards
=E2=80=94
Giulio Benetti
CEO/CTO@Benetti Engineering sas

>=20
> Cheers,
> Stefano
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-78408561-5367-4D23-960B-8BF8CF65F75B
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Stefano,<br><div dir=3D"ltr"><br><blockq=
uote type=3D"cite">Il giorno 6 ago 2022, alle ore 19:29, Stefano Cottafavi &=
lt;stefano.cottafavi@gmail.com&gt; ha scritto:<br><br></blockquote></div><bl=
ockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<div dir=3D"ltr"><div class=
=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:small"=
>Hi all,</div><div class=3D"gmail_default" style=3D"font-family:monospace,mo=
nospace;font-size:small">I've successfully built Buildroot 2022.05 for the R=
aspberry Pi4 adding support for Qt5 and OpenCV (including objdetect module a=
mongst few other).</div><div class=3D"gmail_default" style=3D"font-family:mo=
nospace,monospace;font-size:small">I've also managed to generate&nbsp;the SD=
K for such a build however I can't find the header files of those OpenCV mod=
ules anywhere in the SDK.</div><div class=3D"gmail_default" style=3D"font-fa=
mily:monospace,monospace;font-size:small"><br></div><div class=3D"gmail_defa=
ult" style=3D"font-family:monospace,monospace;font-size:small">Is this expec=
ted or a bug?</div></div></div></blockquote><div><br></div><div>It looks lik=
e a bug. Can you please pastebin your specific defconfig?</div><div><br></di=
v><div>You can obtain it moving to your output folder and &nbsp;issuing:</di=
v><div>$ make savedeconfig</div><div>then you obtain a file called defconfig=
 so copy and paste it on pastebin and provide here</div><div>the link to the=
 pastebin and also the SHA1 commit of your Buildroot git or the specific ver=
sion.</div><div><br></div><div>This way we can help you.</div><div><br></div=
><div>Best regards</div><div>=E2=80=94</div><div>Giulio Benetti</div><div>CE=
O/CTO@Benetti Engineering sas</div><br><blockquote type=3D"cite"><div dir=3D=
"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:mon=
ospace,monospace;font-size:small"><br></div><div class=3D"gmail_default" sty=
le=3D"font-family:monospace,monospace;font-size:small">Cheers,</div><div cla=
ss=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:smal=
l">Stefano</div></div>
<span>_______________________________________________</span><br><span>buildr=
oot mailing list</span><br><span>buildroot@buildroot.org</span><br><span>htt=
ps://lists.buildroot.org/mailman/listinfo/buildroot</span><br></div></blockq=
uote></body></html>=

--Apple-Mail-78408561-5367-4D23-960B-8BF8CF65F75B--

--===============6835363449188770337==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6835363449188770337==--
