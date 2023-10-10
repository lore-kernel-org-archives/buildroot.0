Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9390DCD80C1
	for <buildroot@archiver.kernel.org>; Tue, 10 Oct 2023 13:04:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 093D340903;
	Tue, 10 Oct 2023 13:04:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 093D340903
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UkrGVvKAenX7; Tue, 10 Oct 2023 13:04:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id E743F41B49;
	Tue, 10 Oct 2023 13:04:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E743F41B49
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 63D821BF344
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 13:04:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CE67404F9
 for <buildroot@lists.busybox.net>; Tue, 10 Oct 2023 13:04:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3CE67404F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XAuIGUWqvQsu for <buildroot@lists.busybox.net>;
 Tue, 10 Oct 2023 13:04:15 +0000 (UTC)
X-Greylist: delayed 302 seconds by postgrey-1.37 at util1.osuosl.org;
 Tue, 10 Oct 2023 13:04:14 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 938FA404ED
Received: from owa.physiomed.de (owa.physiomed.de [62.156.237.147])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 938FA404ED
 for <buildroot@buildroot.org>; Tue, 10 Oct 2023 13:04:14 +0000 (UTC)
Received: from PHYMSX1.D1PHYSIOMED.LAN (10.0.0.9) by PHYMSX1.D1PHYSIOMED.LAN
 (10.0.0.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.37; Tue, 10 Oct
 2023 14:59:07 +0200
Received: from PHYMSX1.D1PHYSIOMED.LAN ([fe80::ac93:cf6:fbc:7013]) by
 PHYMSX1.D1PHYSIOMED.LAN ([fe80::ac93:cf6:fbc:7013%9]) with mapi id
 15.02.1118.037; Tue, 10 Oct 2023 14:59:07 +0200
From: =?iso-8859-1?Q?Sch=E4ffner=2C_Florian?= <florian.schaeffner@physiomed.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: [Buildroot] Future buildroot with QtQuick/QML Support
Thread-Index: Adn7bIuCphRZ7t0vQVGZ1ifvyJJYsg==
Date: Tue, 10 Oct 2023 12:59:07 +0000
Message-ID: <4fa235baaa88440e806f3c5f8f8bcb58@physiomed.de>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [95.114.96.97]
x-tm-as-product-ver: SMEX-14.0.0.3152-9.1.1006-27926.002
x-tm-as-result: No-10--23.707400-8.000000
x-tmase-matchedrid: IWY1H69iwzqmagT1k9kBpovzKqMxZsHuwZT3SPru0Oh0PA/ki2kI7N6x
 PDqO2Y+uSSTrJqBYoSygfHz5rL2UAtQGnHQKZS9z5p1ddw6V4Rtd5/m3qrxFzEqa6TyhyXvPOCj
 ykMcvhP4LwTxkKC1upQ1qNf7wRfPFoC4TFiQOsi1sCltwTmzMU5kShYcLpGH95qOldExPCaP6rA
 5sDO02DFTXEHlJoVbTKoWa7+H+3DvcE+s8YdinIxMxKDqgAFSzTFQnI+epPIYWn6/ikoy0wphch
 s7B6T9Bg1jj+Zp5wflwN7+iItfStt/K1ikJIsLO5DSMPEZQAkO6DFN58u/YC5c+mqwKPoCn4dOs
 NKuqfaxCrQBKAFQ4Y53Vwn6CGem4ubGYuJut4Wx85pjA/x1xfvyi8V/Esh8QRkICFa5gS+Ts5tC
 CGZKfO3IMCewepfrj2Oqz8656LhSjxYyRBa/qJR8AKgKWeNGh5MIx11wv+CNzFh5Wt+L9Qh9ujB
 KciKrJuP0j6RbKmqU9F9qdPAqLYc47eOsGVUn5ftwZ3X11IV0=
x-tm-as-user-approved-sender: No
x-tm-as-user-blocked-sender: No
x-tmase-result: 10--23.707400-8.000000
x-tmase-version: SMEX-14.0.0.3152-9.1.1006-27926.002
x-tm-snts-smtp: 1B540749E11AE4734193E778235D43E7565655D496B0749A6CFD8DB87217CA8B2000:8
MIME-Version: 1.0
Subject: [Buildroot] Future buildroot with QtQuick/QML Support
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
Content-Type: multipart/mixed; boundary="===============4844127390656519357=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4844127390656519357==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_4fa235baaa88440e806f3c5f8f8bcb58physiomedde_"

--_000_4fa235baaa88440e806f3c5f8f8bcb58physiomedde_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hello,

our application is built in the development environment with Qt 6 and QtQui=
ck/QML. Now i tried, but wasn't able to setup a working buildroot for our a=
pplication to run on a embedded device.
I found the conversation about qt6 and QML Support on the buildroot mailing=
 list and that it seems to be not possible to setup a buildroot for our nee=
ds with Qt6 and QML support.
https://lore.kernel.org/buildroot/f22ce06d-d9cf-c561-7455-19dce724c158@bene=
ttiengineering.com/

If I understood the answer from Giulio Benetti correctly, there is currentl=
y no chance to make this configuration work for our embedded board with bui=
ldroot?
Can you please tell me if there will be support for this in the next major =
buildroot version? Or is it not planned or foreseeable when a QML support i=
s possible with buildroot?

Thank you and kind regards
Florian

--_000_4fa235baaa88440e806f3c5f8f8bcb58physiomedde_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
.MsoChpDefault
	{mso-style-type:export-only;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:70.85pt 70.85pt 2.0cm 70.85pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:bre=
ak-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">our application is built in the development environm=
ent with Qt 6 and QtQuick/QML. Now i tried, but wasn&#8217;t able to setup =
a working buildroot for our application to run on a embedded device.
<o:p></o:p></p>
<p class=3D"MsoNormal">I found the conversation about qt6 and QML Support o=
n the buildroot mailing list and that it seems to be not possible to setup =
a buildroot for our needs with Qt6 and QML support.<o:p></o:p></p>
<p class=3D"MsoNormal">https://lore.kernel.org/buildroot/f22ce06d-d9cf-c561=
-7455-19dce724c158@benettiengineering.com/<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If I understood the answer from Giulio Benetti corre=
ctly, there is currently no chance to make this configuration work for our =
embedded board with buildroot?<o:p></o:p></p>
<p class=3D"MsoNormal">Can you please tell me if there will be support for =
this in the next major buildroot version? Or is it not planned or foreseeab=
le when a QML support is possible with buildroot?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thank you and kind regards<o:p></o:p></p>
<p class=3D"MsoNormal">Florian<o:p></o:p></p>
</div>
</body>
</html>

--_000_4fa235baaa88440e806f3c5f8f8bcb58physiomedde_--

--===============4844127390656519357==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4844127390656519357==--
