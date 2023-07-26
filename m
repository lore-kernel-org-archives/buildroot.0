Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A67D3C001DE
	for <buildroot@archiver.kernel.org>; Wed, 26 Jul 2023 07:19:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F1D1A403D6;
	Wed, 26 Jul 2023 07:19:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F1D1A403D6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GoYMNVKFDdEL; Wed, 26 Jul 2023 07:19:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3954040120;
	Wed, 26 Jul 2023 07:19:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3954040120
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D8C871BF592
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 07:19:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B1F6080E44
 for <buildroot@lists.busybox.net>; Wed, 26 Jul 2023 07:19:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1F6080E44
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Ae31cACcGuW0 for <buildroot@lists.busybox.net>;
 Wed, 26 Jul 2023 07:19:23 +0000 (UTC)
X-Greylist: delayed 425 seconds by postgrey-1.37 at util1.osuosl.org;
 Wed, 26 Jul 2023 07:19:22 UTC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CB25880E36
Received: from smtpcmd14161.aruba.it (smtpcmd14161.aruba.it [62.149.156.161])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CB25880E36
 for <buildroot@buildroot.org>; Wed, 26 Jul 2023 07:19:22 +0000 (UTC)
Received: from smtpclient.apple ([146.241.123.84])
 by Aruba Outgoing Smtp  with ESMTPA
 id OYguqzzxUa8IoOYgvqoimH; Wed, 26 Jul 2023 09:12:13 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 26 Jul 2023 09:12:12 +0200
Message-Id: <E2EF003D-F740-4237-8C76-F249176F0B6B@benettiengineering.com>
References: <CABRndgydwGOk5W1QFQQ3CeM3724aU5-AKeh0yRBw9dJD0yr7Lw@mail.gmail.com>
In-Reply-To: <CABRndgydwGOk5W1QFQQ3CeM3724aU5-AKeh0yRBw9dJD0yr7Lw@mail.gmail.com>
To: Zvi Vered <veredz72@gmail.com>
X-Mailer: iPhone Mail (20G75)
X-CMAE-Envelope: MS4xfGuMuagBzrg8CGd8VGufuDULVIbYOrDoryiVEfh+BRE5jDhHPDw/cwpkeFlGdE3I5uferND5IjSHTZziQbp8yUlhqbEGyd75jMdNMZgh9bVr8FFSsZqO
 VZ07gLwVPzLirbM7kj3/jgvArygf+8cEVFmCzoD4CAXT8v6VjK0DSoLOBddA7p2pTwDicczPrQmT2fQsDXWATVMAlThs04jg9p7S4mtXNXnU2nZwUANchgDt
 zsnfJdfFSxQ3H3Frgu7kWg==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1690355533; bh=NKiddMQIdPQn6kL41EuL8KMwLQ80qXdx5Izb9kzvk1o=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=nAepgj+Zqkx1K6Uz6aGGrb0b1JKbwENCyEwxC9dQm5hYV/z5SLrSPnYVJ63QKBUdd
 Sb6A0PawJSMaN1yGPw83Z7Tx7M9q3Y2SE6IiO6s9May5QismUx+2TQEiY3qaTHGH9J
 evxhJCs6Mwv8M4PtWoqfeRCN3VYk5bIZ4KOSg+1/nXQUTb5swCGuGLK3TMTY0LFwhS
 JmuCgaadwthp06yl3Ud/KYJ90Hjtnf6HOwOz4LlmW+84+0E2DFCpsyOBsC39ZOl8mc
 rL5kldDedJBC/SPQelp2j+BT1z9A4BNX+aMVawIm/xOC9qQ7GEv3d1k8cQCqZtFtdc
 HAzwq4AP8tGiQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=nAepgj+Z
Subject: Re: [Buildroot] buildroot 2023.02.3 : containers
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
Content-Type: multipart/mixed; boundary="===============7428193843871730196=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============7428193843871730196==
Content-Type: multipart/alternative; boundary=Apple-Mail-80E312D5-9988-4803-B44E-1AA1A686D290
Content-Transfer-Encoding: 7bit


--Apple-Mail-80E312D5-9988-4803-B44E-1AA1A686D290
Content-Type: multipart/related;
	type="text/html";
	boundary=Apple-Mail-5A0BA2A4-9B7C-473D-B9A8-D49B0CB67428
Content-Transfer-Encoding: 7bit


--Apple-Mail-5A0BA2A4-9B7C-473D-B9A8-D49B0CB67428
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Zvika,<div><div dir=3D"ltr"><br><blockqu=
ote type=3D"cite">Il giorno 26 lug 2023, alle ore 04:43, Zvi Vered &lt;vered=
z72@gmail.com&gt; ha scritto:<br><br></blockquote></div><blockquote type=3D"=
cite"><div dir=3D"ltr">=EF=BB=BF<span>Hello,</span><br><span></span><br><spa=
n>I built root file system with buildroot 2023.02.3</span><br><span>The kern=
el is vanilla 5.4.249</span><br><span>Architecture: x86_64. It works.</span>=
<br><span></span><br><span>Can you please tell if I can use containers in th=
is setup ? How ?</span><br></div></blockquote><div><br></div><div>You can us=
e official buildroot docker by issuing:</div><div>$ utils/docker-run</div><d=
iv>inside buildroot folder.</div><div>You can check out buildroot manual:</d=
iv><div><div style=3D"display: block;" class=3D""><div style=3D"-webkit-user=
-select: all; -webkit-user-drag: element; display: inline-block;" class=3D"a=
pple-rich-link" draggable=3D"true" role=3D"link" data-url=3D"https://buildro=
ot.org/downloads/manual/manual.html#submitting-patches"><a style=3D"border-r=
adius:10px;font-family:-apple-system, Helvetica, Arial, sans-serif;display:b=
lock;-webkit-user-select:none;width:300px;user-select:none;-webkit-user-modi=
fy:read-only;user-modify:read-only;overflow:hidden;text-decoration:none;" cl=
ass=3D"lp-rich-link" rel=3D"nofollow" href=3D"https://buildroot.org/download=
s/manual/manual.html#submitting-patches" dir=3D"ltr" role=3D"button" draggab=
le=3D"false" width=3D"300"><table style=3D"table-layout:fixed;border-collaps=
e:collapse;width:300px;background-color:#E9E9EB;font-family:-apple-system, H=
elvetica, Arial, sans-serif;" class=3D"lp-rich-link-emailBaseTable" cellpadd=
ing=3D"0" cellspacing=3D"0" border=3D"0" width=3D"300"><tbody><tr><td vertic=
al-align=3D"center"><table bgcolor=3D"#E9E9EB" cellpadding=3D"0" cellspacing=
=3D"0" width=3D"300" style=3D"font-family:-apple-system, Helvetica, Arial, s=
ans-serif;table-layout:fixed;background-color:rgba(233, 233, 235, 1);" class=
=3D"lp-rich-link-captionBar"><tbody><tr><td style=3D"padding:8px 0px 8px 0px=
;" class=3D"lp-rich-link-captionBar-textStackItem"><div style=3D"max-width:1=
00%;margin:0px 16px 0px 16px;overflow:hidden;" class=3D"lp-rich-link-caption=
Bar-textStack"><div style=3D"word-wrap:break-word;font-weight:500;font-size:=
12px;overflow:hidden;text-overflow:ellipsis;text-align:left;" class=3D"lp-ri=
ch-link-captionBar-textStack-topCaption-leading"><a rel=3D"nofollow" href=3D=
"https://buildroot.org/downloads/manual/manual.html#submitting-patches" styl=
e=3D"text-decoration: none" draggable=3D"false"><font color=3D"#000000" styl=
e=3D"color: rgba(0, 0, 0, 1);">The Buildroot user manual</font></a></div><di=
v style=3D"word-wrap:break-word;font-weight:400;font-size:11px;overflow:hidd=
en;text-overflow:ellipsis;text-align:left;" class=3D"lp-rich-link-captionBar=
-textStack-bottomCaption-leading"><a rel=3D"nofollow" href=3D"https://buildr=
oot.org/downloads/manual/manual.html#submitting-patches" style=3D"text-decor=
ation: none" draggable=3D"false"><font color=3D"#A2A2A9" style=3D"color: rgb=
a(60, 60, 67, 0.6);">buildroot.org</font></a></div></div></td><td style=3D"p=
adding:6px 12px 6px 0px;" class=3D"lp-rich-link-captionBar-rightIconItem" wi=
dth=3D"36"><a rel=3D"nofollow" href=3D"https://buildroot.org/downloads/manua=
l/manual.html#submitting-patches" draggable=3D"false"><img style=3D"pointer-=
events:none !important;display:inline-block;width:36px;height:36px;border-ra=
dius:3px;" width=3D"36" height=3D"36" draggable=3D"false" class=3D"lp-rich-l=
ink-captionBar-rightIcon" alt=3D"favicon.ico" src=3D"cid:5B54561A-9548-4E48-=
A91E-B8BFA516F383"></a></td></tr></tbody></table></td></tr></tbody></table><=
/a></div></div><br></div><div>In general patches are checked using docker-ru=
n script.</div><div><br></div><div>Best regards</div><div>Giulio</div><br><b=
lockquote type=3D"cite"><div dir=3D"ltr"><span></span><br><span>Thank you,</=
span><br><span>Zvika</span><br><span>_______________________________________=
________</span><br><span>buildroot mailing list</span><br><span>buildroot@bu=
ildroot.org</span><br><span>https://lists.buildroot.org/mailman/listinfo/bui=
ldroot</span><br></div></blockquote></div></body></html>=

--Apple-Mail-5A0BA2A4-9B7C-473D-B9A8-D49B0CB67428
Content-Type: image/x-icon;
	name=favicon.ico;
	x-apple-part-url=5B54561A-9548-4E48-A91E-B8BFA516F383
Content-Disposition: inline;
	filename=favicon.ico
Content-Transfer-Encoding: base64
Content-Id: <5B54561A-9548-4E48-A91E-B8BFA516F383>

AAABAAEAICAAAAEACACoCAAAFgAAACgAAAAgAAAAQAAAAAEACAAAAAAAAAQAABILAAASCwAAAAEA
AAABAAADTW4ATVNTAD5ZZwAPYX8ABV6OAABenAAcZIIAD2l9ADhofQAecHEAbmtnABZ0ewA3dHgA
AG6pAFl4ewAUeZAAC3SkACB9gwAXfY4AV3uAAAd9nAAkfJkADoOJAHp9ewCIfnQANH6ZAByEjQA/
hIsACoaaAAZ9uwADgrEAN4mNAByNlAArhLUAXIuPAC6LpQAwkZgAP5GUAACJygAEkLQATJOUAA2V
rwAilbAAAJDNAE+VpABZmZkAeJeWAFqVpwAAlscAl5iVAEKesQAPn8cANaKxAACgygCVnp8AMJ/A
ACOhxwAgpbsAeKOmAI6hpwBeorQAYaC8ADKntwBXpLwASamwAGmlswB0p6wAhqimAKOmpAAAqt0A
raqkAACr5gAprs4AIq7WADyt0QAAq+8ACbHaAKGwqwBQssUAK7TLAKa2sgAAtPIAsbW0ACa63QCg
ur0AwLqzAAC5+AAAu/MAdL/QAB7C6wC+wsAAmcbJAADH/gDJx8IAQMrnAF3L3QCZx9gAxcjGANbM
wgAr0+gADtL9AADU/gAj1PsAr9HWAMXR0wDP0tAAANv+ADjX/ABJ1/cA29bSAADg/QBo3PcAWuDw
ACTj/gBA4v0AAOr+AFHl/gDe4d8A5eLdAOzj2gBL6v4A3ObmADzx+gDk6OUA7OnkAGD4/QBu9/8A
fPv8AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD/
//8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP//
/wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////
AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A
////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD/
//8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP//
/wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////
AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A
////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD///8A////AP///wD/
//8AdXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV7e3t7e3V1
dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dVUxRlppdXt7dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXxS
GRUIAgEKGEZde3t1dXV1dXV1dXV1dXV1dXV1dXV7VThcZWVrbEojCAEYWnV1dXV1dXV1dXV1dXV7
dXV1e2I/XFxcZGxrZmplVxQBRnt1dXV7dXt7e3t7dWF1e3tiPFxlZWRmZmVqZWVlbkc7fHt7e2lp
YURSUlpSMXVVRi4qTz40QE5OcT5IT0g+MmhhRERhREREMQppRBdSbTYOLBssLCJCE1hvX2M+GzIi
fFJEMVoXRDFhUmlaYV07IzcZBiE3Iyo4KlFJU1NTXlJ7UlpSYWh1bXZ7bV13aBAEHR0rR0srJktR
UVZHXEU8dnZVbXt8d0MaEU1CEQxDGhEHDRwRHhELJ0cnRTAURTNiP0dBd0EwQiQoKCgfJVAfEQQE
ERQUGhopUUU1RTUnMD84OEliSUpBQk0fKDooaC8HBRASJhQnJylXNTUwRTw8SThQWVBIW0IkHyIt
OihoQgcFEBIrFCkpKVdFVidFQUEzOFBZUkhbOiAaQyhCKGgoBwUQEisnGho5XDUzNUU4NTw4Mzg6
RTdBOjooIi4iVAkGBR4aR0cLET5sMzlXMzA4YjwwOjxRNUIWFjp8e3V8TQANDyBHXGs0QHBHVjVM
Nnd7dm18bTNgUCIuaXV1dXxbDxAJEUdmdCQkcD45WUxSe3V1dXV1Q2h7dnx1dXV1e1ADJktWXGts
cn5/f3puSFV7dXV1dXV2dXV1dXV1dXV1diEmUVZca3J0f39/cWVOYnl1dXV1dXV1dXV1dXV1dXV3
PSZWXGVycnh/f31zZlR2dXV1dXV1dXV1dXV1dXV1dXZUK1ZcZXFyeH9/enNeXXt1dXV1dXV1dXV1
dXV1dXV1dXZKS1xlbnF9fXpzblt3dXV1dXV1dXV1dXV1dXV1dXV1dmhHXGVqanNzc3NfbXV1dXV1
dXV1dXV1dXV1dXV1dXV1d2BXZWVuc3NzY2h2dXV1dXV1dXV1dXV1dXV1dXV1dXV1d2BWXG5ubmNn
d3V1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dlhZbGRrZ3d1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1
dnZ2dXZ2dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1
dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1dXV1
dQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
AAAAAAAAAAAAAAAAAAAA
--Apple-Mail-5A0BA2A4-9B7C-473D-B9A8-D49B0CB67428--

--Apple-Mail-80E312D5-9988-4803-B44E-1AA1A686D290--

--===============7428193843871730196==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7428193843871730196==--
