Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A23A4C76188
	for <buildroot@archiver.kernel.org>; Wed,  5 Apr 2023 06:46:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1C5414163E;
	Wed,  5 Apr 2023 06:46:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C5414163E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id x7RI44F6x_qw; Wed,  5 Apr 2023 06:46:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 15D1B406E0;
	Wed,  5 Apr 2023 06:46:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 15D1B406E0
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id AD0201BF2FF
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 06:46:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 85EEB404DB
 for <buildroot@lists.busybox.net>; Wed,  5 Apr 2023 06:46:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 85EEB404DB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RU3cAqaU8U5d for <buildroot@lists.busybox.net>;
 Wed,  5 Apr 2023 06:46:15 +0000 (UTC)
X-Greylist: delayed 00:05:04 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 377524015F
Received: from mout.kundenserver.de (mout.kundenserver.de [217.72.192.73])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 377524015F
 for <buildroot@buildroot.org>; Wed,  5 Apr 2023 06:46:14 +0000 (UTC)
Received: from Exchange2013.PRIMES.local ([80.154.17.250]) by
 mrelayeu.kundenserver.de (mreue109 [213.165.67.113]) with ESMTPSA (Nemesis)
 id 1MKbc2-1pyJNx0ucu-00Kyqs for <buildroot@buildroot.org>; Wed, 05 Apr 2023
 08:41:09 +0200
Received: from EXCHANGE2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca]) by
 Exchange2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca%16]) with mapi id
 14.03.0513.000; Wed, 5 Apr 2023 08:41:08 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: depmod / drivers
Thread-Index: AdlniHHjN6BouwQbTDyYauhlOLwEYg==
Date: Wed, 5 Apr 2023 06:41:07 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AEC8C24E81A@Exchange2013.PRIMES.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.177]
MIME-Version: 1.0
X-Provags-ID: V03:K1:DDKo7Zhcblom63FpFZLGFbLMWQpUwc3q+xn4AxPIOPoiEz4yy7O
 fSkeWD15BYiOVB36WnNTOPus/1/IFFz0IaLBYKhZzX+pTEykJ+Q8vokIxgAeFva4HVJF12K
 Z6p0mVpLBWK89cyuiM1ZIyPWpI8boj2gCfM7ZCeKDjHL0MwD/2pF+ht025LPFgJGmXrUkC6
 /e6SeXpOv4m3o1MGpCAiA==
UI-OutboundReport: notjunk:1;M01:P0:M3wy53L4jZI=;PlSbh6Y7VJiX28l0gt9w3v9oYT2
 CS6PwyowMRv6Gyh1ncLbuGElTR4UQ2PByShyRDkbNRMMVK1oNm+EQaf/6cid81QWuCukbJdSD
 TR+cTWT89P+D0XQyqnM6Sg61vxirYXeKxv/Ahx0h1i+lGlkFshAszRnaLiwhPso2zEfTuderY
 LHWBuu1JgzDQVD8ss7Aa34Lu5xDGzhm1YeaYzvS7k/y4ZMoItU7DVEoVlUtDuKDoDSZ5+lPy/
 qf8DK0dpfrcrpEUpg+EVLw9LLcM5e9as8mQBWDnfredYW1DYCAcXq/97TX12D3x+2169QCIMP
 Brk9pwWKfKMy1cXpxCECA622YLi3RJuDtJxmF/21DSa5y63ZU387SrqKx0M9ipB6PJ9Ndl5yh
 y58WPMezqlQs3MoB0c7v6XS4tqSBgSMdvWmn6/8xQXFvKZa5+usJEZ01068dkTQEoaPRIzy1z
 yK/LyaGXUvKGlvYs+vLHRBXcZZL8VTXOFocJnNreGwM6o9Ca87IgrFBjRUyOjYfY9Rfa/h3hC
 RYnT5CNpF+8KrCQ8FaZIb+5ePlKhrqNiZyQsGAHyelhCus7YhplJsTwY/sVLvM9ak5ZERg0bL
 2hYnI7BhtBCR3w/2gUJzYFSReI+qOZxMOHpbbu9R9K5q7CwHPUIm2HGqJTTZHQosUt7wZ42Yr
 PzGyD5/VHxGv/kI/CzKMLDSLjq6TUle93mtaxDqTvg==
Subject: [Buildroot] depmod / drivers
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
Content-Type: multipart/mixed; boundary="===============1733370694860214138=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1733370694860214138==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_1619D009AA8C9E469331A8EE22395AEC8C24E81AExchange2013PRI_"

--_000_1619D009AA8C9E469331A8EE22395AEC8C24E81AExchange2013PRI_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello ML,

for post installation of device drivers I need a tool called 'depmod' on my=
 Raspberry,.

What packages do I need to include in buildroot?

Thanks

--_000_1619D009AA8C9E469331A8EE22395AEC8C24E81AExchange2013PRI_
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
<p class=3D"MsoNormal">Hello ML,<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">for post installation of device drivers I need a too=
l called &#8218;depmod&#8216; on my Raspberry,.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">What packages do I need to include in buildroot?<o:p=
></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Thanks<o:p></o:p></p>
</div>
</body>
</html>

--_000_1619D009AA8C9E469331A8EE22395AEC8C24E81AExchange2013PRI_--

--===============1733370694860214138==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1733370694860214138==--
