Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7B48CC74A5B
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 15:22:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA5E884152;
	Wed, 29 Mar 2023 15:22:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA5E884152
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rJBbbvEgfHNf; Wed, 29 Mar 2023 15:22:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 429BB84113;
	Wed, 29 Mar 2023 15:22:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 429BB84113
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE8631BF3C3
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 15:22:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B7E7B614F9
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 15:22:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B7E7B614F9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AABFMGElZETH for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 15:22:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BFE9614F8
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.135])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BFE9614F8
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 15:22:27 +0000 (UTC)
Received: from Exchange2013.PRIMES.local ([80.154.17.250]) by
 mrelayeu.kundenserver.de (mreue010 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1MBDSg-1paQcJ1RNu-00Cfdh for <buildroot@buildroot.org>; Wed, 29 Mar 2023
 17:22:25 +0200
Received: from EXCHANGE2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca]) by
 Exchange2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca%16]) with mapi id
 14.03.0513.000; Wed, 29 Mar 2023 17:22:24 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: generating a kernel with camera support (video 4 linux)
Thread-Index: AdliTv3uoYZvkG6QSc+Ok+fs8fAjsQ==
Date: Wed, 29 Mar 2023 15:22:23 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AEC8C24E05A@Exchange2013.PRIMES.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.177]
MIME-Version: 1.0
X-Provags-ID: V03:K1:QlEVpkTeslq99fZdzapGu32gd7ke9efgQHKCEWzAzqBRZmIO7Yu
 XK/fFhYXFIk4WXUaSZHGAkzoT/6Z/zGTfa5rJ8TAbnDcu4U2XTfYvFbE89B3vC7t94q98ia
 v7zKpl8ig1FECUSgdLX+X4cd5dnb4bMzyvhnpfl9rw9OTlRZqktCuUEmORj58vreDdGx7Nb
 7tRUgROB70NUS94ei7IGw==
UI-OutboundReport: notjunk:1;M01:P0:t5m2Q5HVo+4=;5nqoijtTgUk4FYdKLj3mBDPX9W8
 i/bN+KUmxfuUsZ25KuakoL2v8B1Z+LDSWl5witM243vLbpX4/LrlEaHaPqJU9aqArgT+Pm1PR
 8NUr+fnqMG/xOdbBJ7d6ndPmVOpF7GMvQJCB4mku77NVbNfkAVCdEHzW/2Su26cd/1ijkzb6V
 6i5UH/9l9e2e3u5L728PNpJPVvw+nUr6qalYMzADdUNaxUIz4TMNb4ZUhQhsMa/6TORCQIyUd
 P5yLiyBWvFc+akS1qAtF4tmLdTrluqx8LIglIM0O/ZaYZA/+v0JhAGTOG6U4FidwTAIH4Zvss
 PkqoiMr6F69kqO5eWMnGlV8CxIIFF7M6wMAHax/eIEhTVGqo0LrHHsXGkiWg0/EQHlT2he8BT
 GuH6aBRlZi9X5PnkQpjCEo/aOPbiO72rK4G7dp93r5dzI0HEEVyBdRIKockunhnk6elJhIEZT
 ofm7fBrMVdiguJZ6DfUliYJd+JhBdPE9K2PUEtG+lRhOE/FErVtw3i3FmFn5ydO0oZ6jUQiJw
 /1QHU/PqH97v2h9p0pNXRWXyDsMBc20lfJPHPlPQwk2rj5Jw8HvoFELk8CPdbwe9LAEoejFWb
 yTxHreA42zC7215MpqD9u2dynOexsYFJ4noDZupHrIV7DCW7zmMhx3Ghh/thDjVKBpHiwTJXp
 dvCt1axlVI6MIq7pkB24Pz1xcPMzar6hgQPcfqZ5KQ==
Subject: [Buildroot] generating a kernel with camera support (video 4 linux)
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
Content-Type: multipart/mixed; boundary="===============4625444436995411873=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4625444436995411873==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_1619D009AA8C9E469331A8EE22395AEC8C24E05AExchange2013PRI_"

--_000_1619D009AA8C9E469331A8EE22395AEC8C24E05AExchange2013PRI_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Dear audience,

I need you help generating a complete image for a Raspberry4 with camera su=
pport.

I'm new to buildroot, currently I'm trying to generate an image with the su=
pport for a camera using video4linux.

The sytem I generated is booting but doesn't use the connected imx219 camer=
a, it has the drivers(?) needed in

/lib/modules/5.10.92-v7l/kernel/drivers/media/i2c/imx219.ko
/boot/overlays/imx219.dtbo

But it will not generate the /dev/video0 device needed.

Do you have any ideas or doe you know where I can get further help?

Thanks for you help.

--_000_1619D009AA8C9E469331A8EE22395AEC8C24E05AExchange2013PRI_
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
<body lang=3D"DE" link=3D"#0563C1" vlink=3D"#954F72">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Dear audience,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I need you help generating a complete image for a Ra=
spberry4 with camera support.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I&#8217;m new to buildroot, currently I&#8217;m tryi=
ng to generate an image with the support for a camera using video4linux.<o:=
p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">The sytem I generated is booting but doesn&#8217;t u=
se the connected imx219 camera, it has the drivers(?) needed in<o:p></o:p><=
/p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">/lib/modules/5.10.92-v7l/kernel/drivers/media/i2c/im=
x219.ko<o:p></o:p></p>
<p class=3D"MsoNormal">/boot/overlays/imx219.dtbo<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But it will not generate the /dev/video0 device need=
ed.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Do you have any ideas or doe you know where I can ge=
t further help?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks for you help.<o:p></o:p></p>
</div>
</body>
</html>

--_000_1619D009AA8C9E469331A8EE22395AEC8C24E05AExchange2013PRI_--

--===============4625444436995411873==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4625444436995411873==--
