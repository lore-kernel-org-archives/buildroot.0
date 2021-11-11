Return-Path: <SRS0=/juA=P6=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E054AC433F5
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 14:39:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0741F6115A
	for <buildroot@archiver.kernel.org>; Thu, 11 Nov 2021 14:39:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0741F6115A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=cato-gmbh.de
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 965134021A;
	Thu, 11 Nov 2021 14:39:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mvZkiC2mBRo2; Thu, 11 Nov 2021 14:39:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F39F640213;
	Thu, 11 Nov 2021 14:39:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 252141BF288
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 14:39:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 147BC40240
 for <buildroot@lists.busybox.net>; Thu, 11 Nov 2021 14:39:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id olRqTm3p8VKh for <buildroot@lists.busybox.net>;
 Thu, 11 Nov 2021 14:39:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.75])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 902D940172
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 14:39:35 +0000 (UTC)
Received: from winhexfeeu2.win.mail ([10.72.16.11]) by mrieue.server.lan
 (mrieue102 [172.19.220.27]) with ESMTPS (Nemesis) id 0LsjzR-1ma4Ka2ioj-012Hlc
 for <buildroot@buildroot.org>; Thu, 11 Nov 2021 15:39:33 +0100
Received: from WINHEXBEEU126.win.mail (10.72.16.52) by WINHEXBEEU132.win.mail
 (10.72.16.55) with Microsoft SMTP Server (TLS) id 15.0.1497.26;
 Thu, 11 Nov 2021 15:39:00 +0100
Received: from WINHEXBEEU126.win.mail ([fe80::1b9:abf1:114a:db9f]) by
 WINHEXBEEU126.win.mail ([fe80::1b9:abf1:114a:db9f%13]) with mapi id
 15.00.1497.026; Thu, 11 Nov 2021 15:39:00 +0100
From: Anton Kornilevsky <kornilevsky@cato-gmbh.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Adding support to a variant of an already supported MCU
Thread-Index: AdfXCdrmZcprO2aNScimvjUr0//JaA==
Date: Thu, 11 Nov 2021 14:39:00 +0000
Message-ID: <c73dab514fed4b4caa7ed80739fcc029@WINHEXBEEU126.win.mail>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-bromium-msgid: 51f3561a-db13-44f4-92db-ef680f81b581
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [37.24.110.28]
x-1and1-spam-score: 1/100
x-1and1-spam-level: None
x-1and1-expurgate-category: clean
x-purgate-id: 150684::1636641540-00000007-738A3C90/0/0
x-provags-id: V02::Ckv9jhirV7FMXHGUqtaaeOq7TbkfQxI/rFHIqyCmWnsS2
 zUKZIX1faDfWLWtTQnt40ciuM6TydbcvZn3MxJrJnTpl+KyBJ5
 +u7L9ive3M8cF36L6MRhKtS2frH8jVk7b+2GQMF7xN5/TRk2g5
 pzAiEim/RU1hd5K2dNudeWl+IywnRaNBB+iGVW+4po3txbS
x-routing-0be3562e-11e2-4fc7-b5a6-c7ea0e0bf210: 1.0.0.0
MIME-Version: 1.0
X-UI-Out-Filterresults: notjunk:1;V03:K0:5eFgb3i0Y1Q=:F1M89YO89UOM8/cYXDirdb
 ouPMxuT7UIufZOskni84NuMepBzlArQ436JLbiI+7fy/0g+wmvxFwxPBEOBef1UV1l20K7gWE
 mLvV6Ur7uHNf7fy+6aV2pZ9F1hDkW3O+UIlwlG7sOAQppoxPf/lW8MULXaiYQPeXhGTDITBWN
 aPZHj14A07L9oC9Q6s8JfWSQD5kSvbz35dEDTfcsFFftT33owcQu8ff8Y8ABYk/zwVE6ema6h
 jZGLIOOImJ/5PN2t/gea6Ih+S+PDVgl2i2vi/wwJlsV3LFKF3lIG48kirrb84b9g0Emq9c+jm
 XOpnb1oyjuYCNqxAutf30Tn1eKFmGdys6OJz13zWYjnENHhWNIczJWSXU43dhjfJBBl/e8ElD
 aeV1b/qx7NwN6mKzI0BhmT5jPFifl57oFPjv+bZQ=
Subject: [Buildroot] Adding support to a variant of an already supported MCU
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
Content-Type: multipart/mixed; boundary="===============4542181262710764025=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4542181262710764025==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_c73dab514fed4b4caa7ed80739fcc029WINHEXBEEU126winmail_"

--_000_c73dab514fed4b4caa7ed80739fcc029WINHEXBEEU126winmail_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

I have been tasked with rebuilding a linux kernal for a board that is using=
 the AT91SAM9261 MCU.

The buildroot support for this MCU has been dropped sometimes back in 2015,=
 and I was unable to rebuild the kernal using the last supported version of=
 buildroot, due to an error related to the integrity of the zipfile contain=
ing the sam-ba utility. I seems like the older sam-ba utility versions are =
no longer to be found on microchips servers.

How would one go about adding support to a variant of an MCU that is alread=
y supported by Buildroot? Is this even possible?

Any help will be greatly appriciated.

Best regards
Anton Kornilevsky


--_000_c73dab514fed4b4caa7ed80739fcc029WINHEXBEEU126winmail_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
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
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:#0563C1;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:#954F72;
	text-decoration:underline;}
span.E-MailFormatvorlage17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-GB" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hello,<br>
<br>
I have been tasked with rebuilding a linux kernal for a board that is using=
 the AT91SAM9261 MCU.
<br>
<br>
The buildroot support for this MCU has been dropped sometimes back in 2015,=
 and I was unable to rebuild the kernal using the last supported version of=
 buildroot, due to an error related to the integrity of the zipfile contain=
ing the sam-ba utility. I seems
 like the older sam-ba utility versions are no longer to be found on microc=
hips servers.
<br>
<br>
How would one go about adding support to a variant of an MCU that is alread=
y supported by Buildroot? Is this even possible? &nbsp;<br>
<br>
Any help will be greatly appriciated. <br>
<br>
Best regards<br>
Anton Kornilevsky<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_c73dab514fed4b4caa7ed80739fcc029WINHEXBEEU126winmail_--

--===============4542181262710764025==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4542181262710764025==--
