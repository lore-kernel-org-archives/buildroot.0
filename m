Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E433C54EE9
	for <buildroot@archiver.kernel.org>; Thu, 29 Sep 2022 02:48:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 978AC83E6A;
	Thu, 29 Sep 2022 02:48:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 978AC83E6A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rrMRKjkVfKCM; Thu, 29 Sep 2022 02:48:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B033883E65;
	Thu, 29 Sep 2022 02:48:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B033883E65
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CA1891BF591
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 02:48:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9AFCE83E65
 for <buildroot@lists.busybox.net>; Thu, 29 Sep 2022 02:48:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9AFCE83E65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CYgS2YyBmboy for <buildroot@lists.busybox.net>;
 Thu, 29 Sep 2022 02:48:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DAA6383E64
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id DAA6383E64
 for <buildroot@buildroot.org>; Thu, 29 Sep 2022 02:48:04 +0000 (UTC)
Received: from smtpclient.apple ([146.241.15.171])
 by Aruba Outgoing Smtp  with ESMTPA
 id djajo5U8e5z8NdjakoAQMl; Thu, 29 Sep 2022 04:48:02 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Thu, 29 Sep 2022 04:48:01 +0200
Message-Id: <8FF758D8-90C7-4B78-A84D-3FB48A8B15E1@benettiengineering.com>
References: <022201d8d3a2$d0b8e310$722aa930$@tekvox.com>
In-Reply-To: <022201d8d3a2$d0b8e310$722aa930$@tekvox.com>
To: jautry@tekvox.com
X-Mailer: iPhone Mail (19G82)
X-CMAE-Envelope: MS4xfCEg5ww4MBK9GQjpxf+6vT1i0S5bJcKHKjr/nY5Ta/hxlY85PT+ocnX2mnn6GiriCHUnLbukcUXe3Err0ql9TbU8rXzCiwGzcN40SHW7y4ovWSMbYp4Q
 9HGfG/TmH/zhFp0GfUB+s7nalXlp6R4HZ/c/iomUpJr2Td5kMonXgtexnvqc5C500Ret4MoVDKc10foQdjDyVriWuAU+ErAEhu7M61071QlfXGPsMuMPpPSo
 x5JYE8VN7a/a2mCMbgXFIqqbHRjCJbOOWoCKobPIDaIsITiuFS5ck3B+4S8zJ/+V
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1664419682; bh=90sECzUkR0LX/bt2aUkAFPcLaVG2iQn409e8bY4UH70=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=LaQHTXzXl44EoOH5pQ4NaFhWcMTpxVK+OOebyESysI8dVUlphev7dub8intCRHoAb
 R1oz97g8DZwUPj0nGxX7cnCl8mPqMDWl3smq1W2HacGZ11hCMGZ1hpbcSVSG9rQlV1
 NcG5UCxvlyToHujtypvIRuODvsmFl7TF+vF0fRdqQaKahMpnpzVebuUM932TFJltT2
 ZmOoX4hLlu3WAIfX6dvwDvVK+xBDEnXxxf/D0Sv+6r8F1dA4/oqcz2bYVkzoU+nN3y
 KF2tkYQoWAxmdNJ9SaBaaCibT68YqyESVPsR1Z3GY+gVOew0lH80XCB3Kd/YABReZN
 WS5necJw0cE1A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=LaQHTXzX
Subject: Re: [Buildroot] i.MXRT10xx support
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
Cc: Jesse Taube <mr.bossman075@gmail.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============1445241467040150486=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============1445241467040150486==
Content-Type: multipart/alternative; boundary=Apple-Mail-46CAFFE4-7E4B-4E96-B081-3A9843D4691D
Content-Transfer-Encoding: 7bit


--Apple-Mail-46CAFFE4-7E4B-4E96-B081-3A9843D4691D
Content-Type: text/plain;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hello Jautry(hope the name is correct),

> Il giorno 29 set 2022, alle ore 03:29, jautry@tekvox.com ha scritto:
>=20
> =EF=BB=BF
> I noted on a site utilizing buildroot that there was i.MXRT10xx support.  I=
n downloading buildroot, I did not notice the MXRT1060 EVK board included in=
 any of the defconfigs.  I was just curious if this does exist?

that is still not upstreamed and we=E2=80=99re waiting for third iteration o=
f patch that adds support for imxrt1050 from Jesse. The repository should be=
 Jesse=E2=80=99s one or mine.

This is the old version that should work for imxrt1050 but also for imxrt106=
0(AFAIK registers are the same for most stuff):
http://patchwork.ozlabs.org/project/buildroot/patch/20220730061219.3061864-1=
-Mr.Bossman075@gmail.com/

So you can download and apply that patch and test the resulting image on the=
 board.
It would be good having someone to test it apart Jesse and me.

Best regards
Giulio Benetti

> =20
> thx
> _______________________________________________
> buildroot mailing list
> buildroot@buildroot.org
> https://lists.buildroot.org/mailman/listinfo/buildroot

--Apple-Mail-46CAFFE4-7E4B-4E96-B081-3A9843D4691D
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hello Jautry(hope the name is correct),<div=
><div dir=3D"ltr"><br><blockquote type=3D"cite">Il giorno 29 set 2022, alle o=
re 03:29, jautry@tekvox.com ha scritto:<br><br></blockquote></div><blockquot=
e type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<meta http-equiv=3D"Content-Type" c=
ontent=3D"text/html; charset=3Dus-ascii"><meta name=3D"Generator" content=3D=
"Microsoft Word 15 (filtered medium)"><style>@font-face { font-family: "Camb=
ria Math"; }
@font-face { font-family: Calibri; }
p.MsoNormal, li.MsoNormal, div.MsoNormal { margin: 0in; font-size: 11pt; fon=
t-family: Calibri, sans-serif; }
span.EmailStyle17 { font-family: Calibri, sans-serif; color: windowtext; }
.MsoChpDefault { font-family: Calibri, sans-serif; }
@page WordSection1 { size: 8.5in 11in; margin: 1in; }
div.WordSection1 { page: WordSection1; }</style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]--><div class=3D"WordSection1"><p class=3D"Ms=
oNormal">I noted on a site utilizing buildroot that there was i.MXRT10xx sup=
port.&nbsp; In downloading buildroot, I did not notice the MXRT1060 EVK boar=
d included in any of the defconfigs.&nbsp; I was just curious if this does e=
xist?</p></div></div></blockquote><div><br></div><div><div style=3D"caret-co=
lor: rgb(0, 0, 0); color: rgb(0, 0, 0);">that is still not upstreamed and we=
=E2=80=99re waiting for third iteration of patch that adds support for imxrt=
1050 from Jesse. The repository should be Jesse=E2=80=99s one or mine.</div>=
<div style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);"><br></div><di=
v style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, 0);">This is the old v=
ersion that should work for imxrt1050 but also for imxrt1060(AFAIK registers=
 are the same for most stuff):</div><div style=3D"caret-color: rgb(0, 0, 0);=
 color: rgb(0, 0, 0);"><a href=3D"http://patchwork.ozlabs.org/project/buildr=
oot/patch/20220730061219.3061864-1-Mr.Bossman075@gmail.com/">http://patchwor=
k.ozlabs.org/project/buildroot/patch/20220730061219.3061864-1-Mr.Bossman075@=
gmail.com/</a></div></div><div><br></div><div>So you can download and apply t=
hat patch and test the resulting image on the board.</div><div>It would be g=
ood having someone to test it apart Jesse and me.</div><div><br></div><div>B=
est regards</div><div>Giulio Benetti</div><br><blockquote type=3D"cite"><div=
 dir=3D"ltr"><div class=3D"WordSection1"><p class=3D"MsoNormal"><o:p></o:p><=
/p><p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p><p class=3D"MsoNormal">thx<o:=
p></o:p></p></div><span>_______________________________________________</spa=
n><br><span>buildroot mailing list</span><br><span>buildroot@buildroot.org</=
span><br><span>https://lists.buildroot.org/mailman/listinfo/buildroot</span>=
<br></div></blockquote></div></body></html>=

--Apple-Mail-46CAFFE4-7E4B-4E96-B081-3A9843D4691D--

--===============1445241467040150486==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1445241467040150486==--
