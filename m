Return-Path: <SRS0=vgbW=OF=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71DC3C433EF
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 12:48:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0C59E611C2
	for <buildroot@archiver.kernel.org>; Wed, 15 Sep 2021 12:48:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0C59E611C2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=ecosystems-group.co.uk
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADD0D40563;
	Wed, 15 Sep 2021 12:48:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bnaryw1v7Bg0; Wed, 15 Sep 2021 12:48:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0567040527;
	Wed, 15 Sep 2021 12:48:03 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F07951BF8A8
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 12:48:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E083980B1B
 for <buildroot@lists.busybox.net>; Wed, 15 Sep 2021 12:48:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fg0OTIWiE7T9 for <buildroot@lists.busybox.net>;
 Wed, 15 Sep 2021 12:48:00 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from mail.ecosystems-group.co.uk (mail.ecosystems-group.co.uk
 [194.73.217.18])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B0838808A4
 for <buildroot@buildroot.org>; Wed, 15 Sep 2021 12:47:59 +0000 (UTC)
Received: from ECO-SRV.ecosystems.local ([fe80::e556:f4a8:df18:453e]) by
 ECO-SRV.ecosystems.local ([fe80::e556:f4a8:df18:453e%11]) with mapi id
 14.03.0513.000; Wed, 15 Sep 2021 13:47:58 +0100
From: Rafal Gorczynski <rafal.gorczynski@ecosystems-group.co.uk>
To: "buildroot@buildroot.org" <buildroot@buildroot.org>
Thread-Topic: A problem with running Xorg 2021.08.x
Thread-Index: AdeqL9o/pAo8duwvSgSta/nZhHw8SA==
Date: Wed, 15 Sep 2021 12:47:56 +0000
Message-ID: <00597E818BDD634EB31FF8A2ECBC4934AB0ADE22@ECO-SRV.ecosystems.local>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [192.168.10.58]
MIME-Version: 1.0
Subject: [Buildroot] A problem with running Xorg 2021.08.x
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============9106983306217786975=="
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

--===============9106983306217786975==
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_00597E818BDD634EB31FF8A2ECBC4934AB0ADE22ECOSRVecosystem_"

--_000_00597E818BDD634EB31FF8A2ECBC4934AB0ADE22ECOSRVecosystem_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi,
I'm looking for help with running Xorg in my image, tried multiple branches=
 such as 2021.08, 2021.05, 2021.02 with no luck.

This is what I've received from Xorg

[   353.565] (II) LoadModule: "intel"
[   353.565] (II) Loading /usr/lib/xorg/modules/drivers/intel_drv.so
[   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/intel_drv.so=
: /usr/lib/xorg/modules/drivers/intel_drv.so: undefined symbol: vgaHWFreeHW=
Rec
[   353.565] (EE) Failed to load module "intel" (loader failed, 0)
[   353.565] (II) LoadModule: "modesetting"
[   353.565] (II) Loading /usr/lib/xorg/modules/drivers/modesetting_drv.so
[   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/modesetting_=
drv.so: /usr/lib/xorg/modules/drivers/modesetting_drv.so: undefined symbol:=
 shadowRemove
[   353.565] (EE) Failed to load module "modesetting" (loader failed, 0)
[   353.565] (II) LoadModule: "fbdev"
[   353.565] (II) Loading /usr/lib/xorg/modules/drivers/fbdev_drv.so
[   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/fbdev_drv.so=
: /usr/lib/xorg/modules/drivers/fbdev_drv.so: undefined symbol: fbdevHWSave
[   353.565] (EE) Failed to load module "fbdev" (loader failed, 0)
[   353.565] (II) LoadModule: "vesa"
[   353.565] (II) Loading /usr/lib/xorg/modules/drivers/vesa_drv.so
[   353.565] (EE) Failed to load /usr/lib/xorg/modules/drivers/vesa_drv.so:=
 /usr/lib/xorg/modules/drivers/vesa_drv.so: undefined symbol: VBESetModePar=
ameters

Full Xorg.log https://pastebin.com/nu5wpHex
Full defconfig https://pastebin.com/RLJRwMES


I don't have problems with branch 2020.08.x with the same defconfig.

Any idea?

Rafal


--_000_00597E818BDD634EB31FF8A2ECBC4934AB0ADE22ECOSRVecosystem_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 14 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	margin-bottom:.0001pt;
	font-size:11.0pt;
	font-family:"Calibri","sans-serif";
	mso-fareast-language:EN-US;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{mso-style-priority:99;
	color:purple;
	text-decoration:underline;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri","sans-serif";
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri","sans-serif";
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
<body lang=3D"EN-GB" link=3D"blue" vlink=3D"purple">
<div class=3D"WordSection1">
<p class=3D"MsoNormal">Hi, <o:p></o:p></p>
<p class=3D"MsoNormal">I&#8217;m looking for help with running Xorg in my i=
mage, tried multiple branches such as 2021.08, 2021.05, 2021.02 with no luc=
k.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">This is what I&#8217;ve received from Xorg<o:p></o:p=
></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (II) LoadModule: &quot;intel&=
quot;<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (II) Loading /usr/lib/xorg/mo=
dules/drivers/intel_drv.so<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (EE) Failed to load /usr/lib/=
xorg/modules/drivers/intel_drv.so: /usr/lib/xorg/modules/drivers/intel_drv.=
so: undefined symbol: vgaHWFreeHWRec<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (EE) Failed to load module &q=
uot;intel&quot; (loader failed, 0)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (II) LoadModule: &quot;modese=
tting&quot;<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (II) Loading /usr/lib/xorg/mo=
dules/drivers/modesetting_drv.so<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (EE) Failed to load /usr/lib/=
xorg/modules/drivers/modesetting_drv.so: /usr/lib/xorg/modules/drivers/mode=
setting_drv.so: undefined symbol: shadowRemove<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (EE) Failed to load module &q=
uot;modesetting&quot; (loader failed, 0)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (II) LoadModule: &quot;fbdev&=
quot;<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (II) Loading /usr/lib/xorg/mo=
dules/drivers/fbdev_drv.so<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (EE) Failed to load /usr/lib/=
xorg/modules/drivers/fbdev_drv.so: /usr/lib/xorg/modules/drivers/fbdev_drv.=
so: undefined symbol: fbdevHWSave<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (EE) Failed to load module &q=
uot;fbdev&quot; (loader failed, 0)<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (II) LoadModule: &quot;vesa&q=
uot;<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (II) Loading /usr/lib/xorg/mo=
dules/drivers/vesa_drv.so<o:p></o:p></p>
<p class=3D"MsoNormal">[&nbsp;&nbsp; 353.565] (EE) Failed to load /usr/lib/=
xorg/modules/drivers/vesa_drv.so: /usr/lib/xorg/modules/drivers/vesa_drv.so=
: undefined symbol: VBESetModeParameters<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Full Xorg.log <a href=3D"https://pastebin.com/nu5wpH=
ex">https://pastebin.com/nu5wpHex</a><o:p></o:p></p>
<p class=3D"MsoNormal">Full defconfig <a href=3D"https://pastebin.com/RLJRw=
MES">https://pastebin.com/RLJRwMES</a><o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">I don&#8217;t have problems with branch 2020.08.x wi=
th the same defconfig.
<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Any idea?<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal">Rafal<o:p></o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_00597E818BDD634EB31FF8A2ECBC4934AB0ADE22ECOSRVecosystem_--

--===============9106983306217786975==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============9106983306217786975==--
