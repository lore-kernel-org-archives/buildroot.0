Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B246CC47258
	for <buildroot@archiver.kernel.org>; Wed, 31 Jan 2024 14:37:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4B48B61070;
	Wed, 31 Jan 2024 14:37:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4B48B61070
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bUGHdcizpMVz; Wed, 31 Jan 2024 14:37:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64A0860F65;
	Wed, 31 Jan 2024 14:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64A0860F65
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D16C61BF578
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 14:37:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6EEB60F65
 for <buildroot@lists.busybox.net>; Wed, 31 Jan 2024 14:37:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6EEB60F65
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id z-GmLbGBpFuy for <buildroot@lists.busybox.net>;
 Wed, 31 Jan 2024 14:37:25 +0000 (UTC)
Received: from smtpdh20-1.aruba.it (smtpdh20-1.aruba.it [62.149.155.164])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F28B2605A6
 for <buildroot@buildroot.org>; Wed, 31 Jan 2024 14:37:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F28B2605A6
Received: from smtpclient.apple ([151.34.228.121])
 by Aruba Outgoing Smtp  with ESMTPA
 id VBiJrMFecHVuLVBiJr2FN2; Wed, 31 Jan 2024 15:37:21 +0100
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 31 Jan 2024 15:37:18 +0100
Message-Id: <45FD9108-28DC-4142-8303-B04D55F0FF76@benettiengineering.com>
References: <20240131140930.159882-1-adeep@lexina.in>
In-Reply-To: <20240131140930.159882-1-adeep@lexina.in>
To: Vyacheslav Bocharov <adeep@lexina.in>
X-Mailer: iPhone Mail (21D50)
X-CMAE-Envelope: MS4xfKU/1rwXMMoJnpNIp8ElcYpUZmMoRrMctQUulQpq4I7Qm432eDCjMSeDmzL5H0fuDPEnoOX7H9R5bU+ARsf9yKmU+NIgJJHxeO5ZjQrUwyBCwNoWtqJG
 GcwINqNPCv08k08ZTwSIVpMzVoIM/L50wXZIKZsiiOlOqenIf3IPJdqm79F2T48O1VZ83BL1+CSFCLFNAPOxUxsG61zvN1fkJ9PIzhy6thLwEUNSnLFvzYvn
 ZRaEj4UZJaxpb5sOPwp9d9MFiVjREHZwy1AgbdqzEG9GczmTf04i4ljpllsS1tbQ
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1706711841; bh=G2flsIW/GqkC0KwSWpZ4L2M5dF7iaZsVUYkvfu+u+c8=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=h3qsTqkdnNoVi2/1jYj5YuMmE075+eAiDlN9XjeVxSeTyxSapui0GkNWv+/NGTNkZ
 uqm29j2DBZisgCdPGuyCd+gEGBvC5mdZOy1OdeSx26e6rpBceXjl4XIeeHB2HMYi7K
 tF96DmF86j7bfBzxrWTdeNfEwbW39JXVTSZVg5MtCpYZA5+FFqc0OZI9shLg69RKlS
 DeEtloXsvugFwSDG378T5KG+zTWxS8CHdkJ14gQofF4b5++/aNx0x6bzAIw58nuZrj
 CXswazLK+DWrjpr7QLD3YE/mG/mdSpIECw8CJlpkdY7bJcyfOBaiG1UpWq4D3LdITJ
 5tskMdJT/nXPA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=aruba.it header.i=@aruba.it
 header.a=rsa-sha256 header.s=a1 header.b=h3qsTqkd
Subject: Re: [Buildroot] [PATCH] package/rtl8822cs bump driver version to
 latest
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============2134985302079517131=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2134985302079517131==
Content-Type: multipart/alternative; boundary=Apple-Mail-36000A22-2BEE-4190-A19F-77C5296845D6
Content-Transfer-Encoding: 7bit


--Apple-Mail-36000A22-2BEE-4190-A19F-77C5296845D6
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Viacheslav,<div><br></div><div>this had t=
o be V2 patch you can generate with:</div><div>$ git format-patch -s -M -o .=
 -1 -v2</div><div><br></div><div>And=E2=80=A6<br><div><div dir=3D"ltr"><br><=
blockquote type=3D"cite">Il giorno 31 gen 2024, alle ore 15:10, Vyacheslav B=
ocharov &lt;adeep@lexina.in&gt; ha scritto:<br><br></blockquote></div><block=
quote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<span>From: Viacheslav Bocharo=
v &lt;adeep@lexina.in&gt;</span><br><span></span><br><span>- Update driver f=
or kernel 6.7+</span><br><span>- Fix warning/errors on build</span><br><span=
></span><br><span>Fixes: http://autobuild.buildroot.org/results/51000a9d4656=
afe9e0ea6f07b9f8ed374c2e4069</span><br><span></span><br><span>Signed-off-by:=
 Viacheslav Bocharov &lt;adeep@lexina.in&gt;</span><br><span>---</span><br><=
/div></blockquote><div><br></div><div>=E2=80=A6here after the 3 dashes you h=
ad to describe what=E2=80=99s changed between V1 and V2.</div><div><br></div=
><div>Here it would have been something like:</div><div>V1-&gt;V2:</div><div=
>* improve commit log as suggested by Giulio</div><div><br></div><div>Keep i=
t mind for the next patches. This looks good to me so no need to send a V3.<=
/div><div>And:</div><div>Reviewed-by: Giulio Benetti &lt;giulio.benetti@bene=
ttiengineering.com&gt;</div><div><br></div><div>Also, please mark previous p=
atch as superseded in patchwork:</div><div><div style=3D"display: block;" cl=
ass=3D""><div style=3D"-webkit-user-select: all; -webkit-user-drag: element;=
 display: inline-block;" class=3D"apple-rich-link" draggable=3D"true" role=3D=
"link" data-url=3D"https://patchwork.ozlabs.org/project/buildroot/list/"><a s=
tyle=3D"border-radius:10px;font-family:-apple-system, Helvetica, Arial, sans=
-serif;display:block;-webkit-user-select:none;width:300px;user-select:none;-=
webkit-user-modify:read-only;user-modify:read-only;overflow:hidden;text-deco=
ration:none;" class=3D"lp-rich-link" rel=3D"nofollow" href=3D"https://patchw=
ork.ozlabs.org/project/buildroot/list/" dir=3D"ltr" role=3D"button" draggabl=
e=3D"false" width=3D"300"><table style=3D"table-layout:fixed;border-collapse=
:collapse;width:300px;background-color:#E9E9EB;font-family:-apple-system, He=
lvetica, Arial, sans-serif;" class=3D"lp-rich-link-emailBaseTable" cellpaddi=
ng=3D"0" cellspacing=3D"0" border=3D"0" width=3D"300"><tbody><tr><td vertica=
l-align=3D"center"><table bgcolor=3D"#E9E9EB" cellpadding=3D"0" cellspacing=3D=
"0" width=3D"300" style=3D"font-family:-apple-system, Helvetica, Arial, sans=
-serif;table-layout:fixed;background-color:rgba(233, 233, 235, 1);" class=3D=
"lp-rich-link-captionBar"><tbody><tr><td style=3D"padding:8px 0px 8px 0px;" c=
lass=3D"lp-rich-link-captionBar-textStackItem"><div style=3D"max-width:100%;=
margin:0px 16px 0px 16px;overflow:hidden;" class=3D"lp-rich-link-captionBar-=
textStack"><div style=3D"word-wrap:break-word;font-weight:500;font-size:12px=
;overflow:hidden;text-overflow:ellipsis;text-align:left;" class=3D"lp-rich-l=
ink-captionBar-textStack-topCaption-leading"><a rel=3D"nofollow" href=3D"htt=
ps://patchwork.ozlabs.org/project/buildroot/list/" style=3D"text-decoration:=
 none" draggable=3D"false"><font color=3D"#000000" style=3D"color: rgba(0, 0=
, 0, 1);">Buildroot development - Patchwork</font></a></div><div style=3D"wo=
rd-wrap:break-word;font-weight:400;font-size:11px;overflow:hidden;text-overf=
low:ellipsis;text-align:left;" class=3D"lp-rich-link-captionBar-textStack-bo=
ttomCaption-leading"><a rel=3D"nofollow" href=3D"https://patchwork.ozlabs.or=
g/project/buildroot/list/" style=3D"text-decoration: none" draggable=3D"fals=
e"><font color=3D"#A2A2A9" style=3D"color: rgba(60, 60, 67, 0.6);">patchwork=
.ozlabs.org</font></a></div></div></td><td style=3D"padding:0px 12px 0px 0px=
;" class=3D"lp-rich-link-captionBar-rightIconItem" width=3D"36"><a rel=3D"no=
follow" href=3D"https://patchwork.ozlabs.org/project/buildroot/list/" dragga=
ble=3D"false"><img src=3D"data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAGwA=
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
RufzZ3dUmJdsqCkcw5rzta5yNwZc1vm2c4rm9c1P2L+rgWaC3IX/FjKKF1Z+sfCtIXNZRZl88sef=
hHxxZ5yWrm0/OYi/0VbvsS/FH55cfHYxesXv6vgVfxQyaisqny7hLvkh688vlr31fulWUsvLvNet=
nk5cbl4+Y0VQSt2rdRdWbzy4aqJqxpW01dXrP5jzfQ156vGVW1Zq7lWsbZjXcy6xvV265evf7tBs=
KG9ekL1vo3mGxdvfLmJt+nq5uDN9VsstlRuefO18OtbWyO2NtQ41FRtI24r2PbL9tTtrTuYO+pqz=
Wora//cKd7ZsStx15k6n7q63ea7l+1B9yj29OydsvfyN6HfNNa71W/dZ7Svcj/Yr9j/+EDmgRsHo=
w+2HGIeqv/W/tuNh/UPVzQgDUUNfUcERzoa0xuvNEU1tTT7Nx/+zv27nUetj1YfMzy27Ljm8bLj7=
08Un+g/KTnZeyr71MOW6S13T086ff1MwpmLZ6PPnvs+/PvTrazWE+cCzh0973e+6QfmD0cueF9oa=
PNqO/yj14+HL3pfbLjkc6nxsu/l5ivjrxy/GnT11LXQa99fZ1+/0B7bfuVGyo1bN6fc7LjFu9V9W=
3T72Z2COwN358OLfcV9nftVD8wf1Pxr9L/2dXh3HOsM7Wz7Kemnuw+5D5/8LPv5bVfZL9Rfqh5ZP=
arr9uw+2hPec/nx5MddTyRPBnrLf9X9deNTp6ff/hb8W1vfpL6uZ9Jn739f8tz0+c4/xv3R0h/f/=
+BF3ouBlxWvTF/tes183fom7c2jgVlvSW/X/Tn6z+Z30e/uvc97//7fCQ/4Yk7kYoUAAAB4ZVhJZ=
k1NACoAAAAIAAUBEgADAAAAAQABAAABGgAFAAAAAQAAAEoBGwAFAAAAAQAAAFIBKAADAAAAAQACA=
ACHaQAEAAAAAQAAAFoAAAAAAAAA2AAAAAEAAADYAAAAAQACoAIABAAAAAEAAABsoAMABAAAAAEAA=
ABsAAAAAOIX6z4AAAAJcEhZcwAAITgAACE4AUWWMWAAAAAcaURPVAAAAAIAAAAAAAAANgAAACgAA=
AA2AAAANgAABRSxLH/cAAAE4ElEQVR4AexZTWgVVxT+3suPbTXE1KSQ5vmz0o0krbTWgtpuEmk20=
kb8W1hNWim66FoaKWiNG6VFpVUpSLJo04okC0VdiAoGxIVoREgoBGqjEmhjjNG0Ic30zJk7983Mv=
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
RB4imoAAAAASUVORK5CYII=3D" draggable=3D"false" style=3D"pointer-events:none !=
important;display:inline-block;width:36px;height:36px;" class=3D"lp-rich-lin=
k-captionBar-rightIcon" width=3D"36" height=3D"36" data-unique-identifier=3D=
""></a></td></tr></tbody></table></td></tr></tbody></table></a></div></div><=
br></div><div><br></div><div>Thank you!</div><div>Best regards</div><div>Giu=
lio</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><span> package/rtl88=
22cs/rtl8822cs.hash | 2 +-</span><br><span> package/rtl8822cs/rtl8822cs.mk &=
nbsp;&nbsp;| 2 +-</span><br><span> 2 files changed, 2 insertions(+), 2 delet=
ions(-)</span><br><span></span><br><span>diff --git a/package/rtl8822cs/rtl8=
822cs.hash b/package/rtl8822cs/rtl8822cs.hash</span><br><span>index 4b445129=
13..34bcc412ce 100644</span><br><span>--- a/package/rtl8822cs/rtl8822cs.hash=
</span><br><span>+++ b/package/rtl8822cs/rtl8822cs.hash</span><br><span>@@ -=
1,2 +1,2 @@</span><br><span> # Locally calculated</span><br><span>-sha256 &n=
bsp;b3b8543ff6d6d602ffaf60342969830edc8205917b96d004f84ed79524894dc7 &nbsp;r=
tl8822cs-2e4e99ae1502b173a938357dc1087e49475b26ed.tar.gz</span><br><span>+sh=
a256 &nbsp;d61fff0ee8b4219a6441791ff26be1b8c49ef8b2ca78345bf12b7a0541f498e9 &=
nbsp;rtl8822cs-fda6cd263e89567272060e6182a39aee20b894c4.tar.gz</span><br><sp=
an>diff --git a/package/rtl8822cs/rtl8822cs.mk b/package/rtl8822cs/rtl8822cs=
.mk</span><br><span>index 6036acb864..dbdc7d84bf 100644</span><br><span>--- a=
/package/rtl8822cs/rtl8822cs.mk</span><br><span>+++ b/package/rtl8822cs/rtl8=
822cs.mk</span><br><span>@@ -4,7 +4,7 @@</span><br><span> #</span><br><span>=
 ###########################################################################=
#####</span><br><span></span><br><span>-RTL8822CS_VERSION =3D 2e4e99ae1502b1=
73a938357dc1087e49475b26ed</span><br><span>+RTL8822CS_VERSION =3D fda6cd263e=
89567272060e6182a39aee20b894c4</span><br><span> RTL8822CS_SITE =3D $(call gi=
thub,jethome-ru,rtl88x2cs,$(RTL8822CS_VERSION))</span><br><span> RTL8822CS_L=
ICENSE =3D GPL-2.0</span><br><span></span><br><span>-- </span><br><span>2.43=
.0</span><br><span></span><br><span>________________________________________=
_______</span><br><span>buildroot mailing list</span><br><span>buildroot@bui=
ldroot.org</span><br><span>https://lists.buildroot.org/mailman/listinfo/buil=
droot</span><br></div></blockquote></div></div></body></html>=

--Apple-Mail-36000A22-2BEE-4190-A19F-77C5296845D6--

--===============2134985302079517131==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2134985302079517131==--
