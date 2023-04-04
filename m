Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74A1BC7618D
	for <buildroot@archiver.kernel.org>; Tue,  4 Apr 2023 07:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CCC8C409D0;
	Tue,  4 Apr 2023 07:15:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCC8C409D0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id PS4jdsTQtvgz; Tue,  4 Apr 2023 07:15:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C24CD409EA;
	Tue,  4 Apr 2023 07:15:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C24CD409EA
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 56CB01BF2F9
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 07:15:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2FAA5819ED
 for <buildroot@lists.busybox.net>; Tue,  4 Apr 2023 07:15:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2FAA5819ED
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z4Zuvh13OadC for <buildroot@lists.busybox.net>;
 Tue,  4 Apr 2023 07:15:38 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 79607819B8
Received: from mout.kundenserver.de (mout.kundenserver.de [212.227.126.131])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 79607819B8
 for <buildroot@buildroot.org>; Tue,  4 Apr 2023 07:15:37 +0000 (UTC)
Received: from Exchange2013.PRIMES.local ([80.154.17.250]) by
 mrelayeu.kundenserver.de (mreue012 [213.165.67.97]) with ESMTPSA (Nemesis) id
 1N3Gok-1qQror0u02-010LRT for <buildroot@buildroot.org>; Tue, 04 Apr 2023
 09:15:35 +0200
Received: from EXCHANGE2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca]) by
 Exchange2013.PRIMES.local ([fe80::55a6:8c84:95c:30ca%16]) with mapi id
 14.03.0513.000; Tue, 4 Apr 2023 09:15:34 +0200
From: Gerd Kautzmann <G.Kautzmann@PRIMES.de>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: Tools(?) packages for drivers a kernels 6..x
Thread-Index: AdlmxEgKDrp9+KaFSSC6sVhuG4kuKQ==
Date: Tue, 4 Apr 2023 07:15:34 +0000
Message-ID: <1619D009AA8C9E469331A8EE22395AEC8C24E6B7@Exchange2013.PRIMES.local>
Accept-Language: de-DE, en-US
Content-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.117.177]
MIME-Version: 1.0
X-Provags-ID: V03:K1:PYardX7TxpCJ83s8NG0nCOYfvwnx87dGJx1VTmkRxKtItoEQa5x
 229t/RjO+voXJ2ngOqAlr/uLsPXHA1ug293IZ6v+xPpt2uOK0oOFZBsCWYjn6vSGU8HcLZ4
 8NoeN2sEHKIbx8V7MjC5kFnoucyRzGdzQumeKw8RXah0Zq5HHo5hywH3Qz/wJiCk+lKjVQT
 iZoWZFWOzbkpgp5MCiCCQ==
UI-OutboundReport: notjunk:1;M01:P0:NhRsQYkJzWE=;mjoy7W3YM8Jdx2uDdim/GcFtzl/
 q/PWgupUH6VvSogyyb/iaMnAJHnLvxlFMTyFrbdTpY4TB7cSpn9JfxeOWIGHXN/bnEyQr5+cU
 VAJCyN/EKz2vYrhAFEYRy1ocIJUXlDj+2JEjljPkIcixAer3L8d6i4SEvVuxylzh0dzIdCWem
 LSFOtk6JtiG35eXFh2IkEhh7qkqvnsnX4lf3Bx+PgPpX3+DKhMjk5Gbc5G+w/J6S60b1RSB1D
 BmRZfYRCCGjiVLtdUEhIUkQMKeA/NIQTlAZLWvwNFMhEY2F7WRUPbQuGp+eRLdupjJMOBp/iF
 sxfVpoSYxJxwHpkFT79m0a/ymT2AdDZBy7GueDcbeEEwuOc9V6ytZ1tbGPcTL2ZFwaFUH5W0Z
 B8RUymvGVK2wwDAMw+zFyfYnoB+vtDaJ6dSnanLi+CTWtziUtSGqCnUY/KzFneBHZCtGM9Frp
 JzEfh90mCYYEq23leRWGlKLxaDoc8FdNdm8Ai3s+8Uedt8341agsqhXbZqtg4+VXB3xqILzR0
 h7cDUJoF6IGUgkjhWdGhlHJcCtKxGAW7xIvAdo3wOQc0SoX1ZU2PuAwLxJU21NL2EHToGhuj9
 AB7ViAFvbJkWYHKXs9p+WYKGWS8maj6pc2CLID2RkJe/UT2koiQc1ayKal+VWzbeWw8OCK+yp
 T0teHV7gAoC7+a/w1NI6X4iYpFp7lVaYuoGov/USgg==
Subject: [Buildroot] Tools(?) packages for drivers a kernels 6..x
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
Content-Type: multipart/mixed; boundary="===============7253539498309303875=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7253539498309303875==
Content-Language: de-DE
Content-Type: multipart/alternative;
	boundary="_000_1619D009AA8C9E469331A8EE22395AEC8C24E6B7Exchange2013PRI_"

--_000_1619D009AA8C9E469331A8EE22395AEC8C24E6B7Exchange2013PRI_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

After I got a camera module imx219 working in Linux on a RasPi4 I wanted to=
 switch to another camera.

According to the manual I copied the needed files to

/lib/modules/5.10.92-v7l/kernel/drivers/media/i2c/ imx296.ko
/boot/overlays/imx296.dtbo


and id some configurations in /boot/config .

But I can't set up the modules correctly with with 'depmod -a'

If 'depmod' is a part oft he tools generated by buildroot, what do I need t=
o get it into the image?

---

Newer Linux Kernels like 6.1.4 seems to have some support fort he camera im=
x296, building them with buildroot is leading to an error:
*** Can't find default configuration "arch/arm/configs/bcm2711_defconfig"!

The default Kernel for Raspberry4 with Buildroot 2023.02 seems to be a V5.1=
0.x without default support for imx296, any ideas?

Thanks for your help






--_000_1619D009AA8C9E469331A8EE22395AEC8C24E6B7Exchange2013PRI_
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
p.msonormal0, li.msonormal0, div.msonormal0
	{mso-style-name:msonormal;
	mso-margin-top-alt:auto;
	margin-right:0cm;
	mso-margin-bottom-alt:auto;
	margin-left:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;}
span.E-MailFormatvorlage18
	{mso-style-type:personal;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
span.E-MailFormatvorlage20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;}
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
<p class=3D"MsoNormal">After I got a camera module imx219 working in Linux =
on a RasPi4 I wanted to switch to another camera.<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">According to the manual I copied the needed files to=
<span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;ba=
ckground:white"><o:p></o:p></span></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-family:&quot;Calibri&quot;=
,sans-serif;background:white"><o:p>&nbsp;</o:p></span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-size:10.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black;background:white">/lib/modules/5.10.=
92-v7l/kernel/drivers/media/i2c/</span></cite> imx296.ko<cite><span style=
=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:black;b=
ackground:white"><o:p></o:p></span></cite></p>
<p class=3D"MsoNormal">/boot/overlays/imx296.dtbo <o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">and id some configurations in /boot/config .<o:p></o=
:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">But I can&#8217;t set up the modules correctly with =
with &#8218;<cite><span style=3D"font-size:10.0pt;font-family:&quot;Arial&q=
uot;,sans-serif;color:black;background:white">depmod -a</span></cite><span =
style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-serif;color:bl=
ack;background:white">&#8216;<o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">If &#8218;<cite><span style=3D"font-size:10.0pt;font=
-family:&quot;Arial&quot;,sans-serif;color:black;background:white">depmod&#=
8216; is a part oft he tools generated by buildroot, what do I need to get =
it into the
</span></cite><cite><span style=3D"font-size:10.0pt;font-family:&quot;Arial=
&quot;,sans-serif;background:white">image<span style=3D"color:black">?<o:p>=
</o:p></span></span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-family:&quot;Calibri&quot;=
,sans-serif;background:white"><o:p>&nbsp;</o:p></span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-family:&quot;Calibri&quot;=
,sans-serif;background:white">---<o:p></o:p></span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-size:10.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black;background:white"><o:p>&nbsp;</o:p><=
/span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-size:10.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black;background:white">Newer Linux Kernel=
s like 6.1.4 seems to have some support fort he camera imx296</span></cite>=
<cite><span style=3D"font-size:10.0pt;font-family:&quot;Arial&quot;,sans-se=
rif;background:white">,
 building<span style=3D"color:black"> them with buildroot </span>is <span s=
tyle=3D"color:black">
le</span>a<span style=3D"color:black">d</span>ing<span style=3D"color:black=
"> to an error:<o:p></o:p></span></span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-size:10.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black;background:white">*** Can't find def=
ault configuration &quot;arch/arm/configs/bcm2711_defconfig&quot;!<o:p></o:=
p></span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-size:10.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black;background:white"><o:p>&nbsp;</o:p><=
/span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-size:10.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black;background:white">The default Kernel=
 for Raspberry4 with Buildroot 2023.02 seems to be a V5.10.x without defaul=
t support for imx296</span></cite><cite><span style=3D"font-size:10.0pt;fon=
t-family:&quot;Arial&quot;,sans-serif;background:white">,<span style=3D"col=
or:black">
 any ideas?<o:p></o:p></span></span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-size:10.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black;background:white"><o:p>&nbsp;</o:p><=
/span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-size:10.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black;background:white">Thanks for your he=
lp<o:p></o:p></span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-size:10.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black;background:white"><o:p>&nbsp;</o:p><=
/span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-size:10.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black;background:white"><o:p>&nbsp;</o:p><=
/span></cite></p>
<p class=3D"MsoNormal"><cite><span style=3D"font-size:10.0pt;font-family:&q=
uot;Arial&quot;,sans-serif;color:black;background:white"><o:p>&nbsp;</o:p><=
/span></cite></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_1619D009AA8C9E469331A8EE22395AEC8C24E6B7Exchange2013PRI_--

--===============7253539498309303875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7253539498309303875==--
