Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82E8EC2BD09
	for <buildroot@archiver.kernel.org>; Wed,  3 Jul 2024 09:07:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4606684676;
	Wed,  3 Jul 2024 09:07:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gi1NCuAC9_5O; Wed,  3 Jul 2024 09:07:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4D4A78466E
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4D4A78466E;
	Wed,  3 Jul 2024 09:07:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 359BD1BF33D
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 09:07:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 21C4D408A7
 for <buildroot@lists.busybox.net>; Wed,  3 Jul 2024 09:07:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AoalaUo3XOd3 for <buildroot@lists.busybox.net>;
 Wed,  3 Jul 2024 09:07:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=62.149.155.165;
 helo=smtpdh20-2.aruba.it; envelope-from=giulio.benetti@benettiengineering.com;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0AE840887
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0AE840887
Received: from smtpdh20-2.aruba.it (smtpdh20-2.aruba.it [62.149.155.165])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0AE840887
 for <buildroot@buildroot.org>; Wed,  3 Jul 2024 09:07:46 +0000 (UTC)
Received: from smtpclient.apple ([84.33.84.190])
 by Aruba Outgoing Smtp  with ESMTPSA
 id OvxnskNAX9WDgOvxnsVkz4; Wed, 03 Jul 2024 11:07:44 +0200
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Mime-Version: 1.0 (1.0)
Date: Wed, 3 Jul 2024 11:07:43 +0200
Message-Id: <A6E24BF2-2EBA-46F1-A502-93C0B3B5EA06@benettiengineering.com>
References: <20240702231947.279854-1-james.hilliard1@gmail.com>
In-Reply-To: <20240702231947.279854-1-james.hilliard1@gmail.com>
To: James Hilliard <james.hilliard1@gmail.com>
X-Mailer: iPhone Mail (21F90)
X-CMAE-Envelope: MS4xfDsDU5fQ5crTLubzRgPHbN4ks1ie5Sa4T8R+ui7EBopnbG9gbi6xRUFu13rG9RFfQAjnofGfXFhmTpof+VhXwUTDYySpuHICrxDi7uBdadovT7Tez3Zv
 gx3HbI+ak96ipED4XrD0VuWGBiRnarW6sKkkPO0iD1UMxSrpveLY0ZnwV4GjSwxU9iE45emZlhniPBxUR1ncNhEciYXiJWoqivmtSPJhYCwO9ihaAHmOFtXT
 23GCHVKGFSqtG1/wGyVgDw==
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=aruba.it; s=a1; 
 t=1719997664; bh=D1XFsF6hy0EAErbqxXuDRy6bRJkxMbtGwY/1l5Jc23c=;
 h=Content-Type:From:Mime-Version:Subject:Date:To;
 b=PPi1mMFDZnSGJ+nji/2ebz3eDaCVaOi9dLECSBUWl0YfoQ/mZdl/FH8OEM4XlEIjK
 QiAZxcl4LUMRMTXDWP51tFZ+uGt5koh7cruBzmhBlj3pFLS63LetLhCy6Tc3ySE06K
 yCWW4XyIGi+TwIHW4C5+fPAs9wtxrjdr8/x5oZqO9TL6oCfVSbY2bcAsqqLTehG8/G
 FdA1M4VaMZH85rPe2Ep6WpWcPW+qEt/hugZ2wmtMM/xAHy7scNTavOA1OLcmCebex2
 yfjR3w6O5imEYlDy/IPBB3HTmJ8HEyAlygOJSyii/7vDRflcAWpqaL6ZKjbX4K6Qg/
 nx57k+fUW2WvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=benettiengineering.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=aruba.it header.i=@aruba.it header.a=rsa-sha256
 header.s=a1 header.b=PPi1mMFD
Subject: Re: [Buildroot] [PATCH 1/1] package/swupdate: bump to version
 2024.05.2
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
Content-Type: multipart/mixed; boundary="===============4002413370029658012=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============4002413370029658012==
Content-Type: multipart/alternative; boundary=Apple-Mail-1C889CE4-7B7E-487A-A898-CC488E6D5506
Content-Transfer-Encoding: 7bit


--Apple-Mail-1C889CE4-7B7E-487A-A898-CC488E6D5506
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi James,<div><br></div><div>thank you but I=
=E2=80=99ve already sent a patch for this:</div><div><div style=3D"display: b=
lock;" class=3D""><div style=3D"-webkit-user-select: all; -webkit-user-drag:=
 element; display: inline-block;" class=3D"apple-rich-link" draggable=3D"tru=
e" role=3D"link" data-url=3D"https://patchwork.ozlabs.org/project/buildroot/=
patch/20240621215143.283984-1-giulio.benetti@benettiengineering.com/"><a sty=
le=3D"border-radius:10px;font-family:-apple-system, Helvetica, Arial, sans-s=
erif;display:block;-webkit-user-select:none;width:300px;user-select:none;-we=
bkit-user-modify:read-only;user-modify:read-only;overflow:hidden;text-decora=
tion:none;" class=3D"lp-rich-link" rel=3D"nofollow" href=3D"https://patchwor=
k.ozlabs.org/project/buildroot/patch/20240621215143.283984-1-giulio.benetti@=
benettiengineering.com/" dir=3D"ltr" role=3D"button" draggable=3D"false" wid=
th=3D"300"><table style=3D"table-layout:fixed;border-collapse:collapse;width=
:300px;background-color:#E9E9EB;font-family:-apple-system, Helvetica, Arial,=
 sans-serif;" class=3D"lp-rich-link-emailBaseTable" cellpadding=3D"0" cellsp=
acing=3D"0" border=3D"0" width=3D"300"><tbody><tr><td vertical-align=3D"cent=
er"><table bgcolor=3D"#E9E9EB" cellpadding=3D"0" cellspacing=3D"0" width=3D"=
300" style=3D"font-family:-apple-system, Helvetica, Arial, sans-serif;table-=
layout:fixed;background-color:rgba(233, 233, 235, 1);" class=3D"lp-rich-link=
-captionBar"><tbody><tr><td style=3D"padding:8px 0px 8px 0px;" class=3D"lp-r=
ich-link-captionBar-textStackItem"><div style=3D"max-width:100%;margin:0px 1=
6px 0px 16px;overflow:hidden;" class=3D"lp-rich-link-captionBar-textStack"><=
div style=3D"word-wrap:break-word;font-weight:500;font-size:12px;overflow:hi=
dden;text-overflow:ellipsis;text-align:left;" class=3D"lp-rich-link-captionB=
ar-textStack-topCaption-leading"><a rel=3D"nofollow" href=3D"https://patchwo=
rk.ozlabs.org/project/buildroot/patch/20240621215143.283984-1-giulio.benetti=
@benettiengineering.com/" style=3D"text-decoration: none" draggable=3D"false=
"><font color=3D"#000000" style=3D"color: rgba(0, 0, 0, 1);">package/swupdat=
e: bump to version 2024.05.2 - Patchwork</font></a></div><div style=3D"word-=
wrap:break-word;font-weight:400;font-size:11px;overflow:hidden;text-overflow=
:ellipsis;text-align:left;" class=3D"lp-rich-link-captionBar-textStack-botto=
mCaption-leading"><a rel=3D"nofollow" href=3D"https://patchwork.ozlabs.org/p=
roject/buildroot/patch/20240621215143.283984-1-giulio.benetti@benettienginee=
ring.com/" style=3D"text-decoration: none" draggable=3D"false"><font color=3D=
"#A2A2A9" style=3D"color: rgba(60, 60, 67, 0.6);">patchwork.ozlabs.org</font=
></a></div></div></td><td style=3D"padding:0px 12px 0px 0px;" class=3D"lp-ri=
ch-link-captionBar-rightIconItem" width=3D"36"><a rel=3D"nofollow" href=3D"h=
ttps://patchwork.ozlabs.org/project/buildroot/patch/20240621215143.283984-1-=
giulio.benetti@benettiengineering.com/" draggable=3D"false"><img src=3D"data=
:image/png;base64,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3D" dr=
aggable=3D"false" style=3D"pointer-events:none !important;display:inline-blo=
ck;width:36px;height:36px;" class=3D"lp-rich-link-captionBar-rightIcon" widt=
h=3D"36" height=3D"36" data-unique-identifier=3D""></a></td></tr></tbody></t=
able></td></tr></tbody></table></a></div></div><br></div><div>Best regards<b=
r id=3D"lineBreakAtBeginningOfSignature"><div dir=3D"ltr">Giulio Benetti</di=
v><div dir=3D"ltr"><br><blockquote type=3D"cite">Il giorno 3 lug 2024, alle o=
re 01:20, James Hilliard &lt;james.hilliard1@gmail.com&gt; ha scritto:<br><b=
r></blockquote></div><blockquote type=3D"cite"><div dir=3D"ltr">=EF=BB=BF<sp=
an>Signed-off-by: James Hilliard &lt;james.hilliard1@gmail.com&gt;</span><br=
><span>---</span><br><span> package/swupdate/swupdate.hash | 2 +-</span><br>=
<span> package/swupdate/swupdate.mk &nbsp;&nbsp;| 2 +-</span><br><span> 2 fi=
les changed, 2 insertions(+), 2 deletions(-)</span><br><span></span><br><spa=
n>diff --git a/package/swupdate/swupdate.hash b/package/swupdate/swupdate.ha=
sh</span><br><span>index 13964351f6..ac28acb1f4 100644</span><br><span>--- a=
/package/swupdate/swupdate.hash</span><br><span>+++ b/package/swupdate/swupd=
ate.hash</span><br><span>@@ -1,5 +1,5 @@</span><br><span> # Locally calculat=
ed</span><br><span>-sha256 &nbsp;c8af1e964d0123a7d4bbba981170eff723db87dcd37=
e5881c584ffee54194d1a &nbsp;swupdate-2024.05.tar.gz</span><br><span>+sha256 &=
nbsp;2736045e885ad6c5dcba8dcc6c7582d0b76ef29a3d6ab7c4080908356e35e3b2 &nbsp;=
swupdate-2024.05.2.tar.gz</span><br><span> sha256 &nbsp;4cf04ed34ff0ebbf5c71=
345b56e6af5093fc17206364cca0ebbae92ef3940683 &nbsp;LICENSES/BSD-1-Clause.txt=
</span><br><span> sha256 &nbsp;e27a3e87706b3aa5ff2e50eaafe2e6ed5397fbf2d7679=
eaf444a6d000518a3a6 &nbsp;LICENSES/BSD-3-Clause.txt</span><br><span> sha256 &=
nbsp;0558101984550fa84d1d13c2af11d116c20079d2be58711e8d99cadce7009192 &nbsp;=
LICENSES/CC0-1.0.txt</span><br><span>diff --git a/package/swupdate/swupdate.=
mk b/package/swupdate/swupdate.mk</span><br><span>index b36aabb1e7..75e4af5d=
b4 100644</span><br><span>--- a/package/swupdate/swupdate.mk</span><br><span=
>+++ b/package/swupdate/swupdate.mk</span><br><span>@@ -4,7 +4,7 @@</span><b=
r><span> #</span><br><span> ################################################=
################################</span><br><span></span><br><span>-SWUPDATE_=
VERSION =3D 2024.05</span><br><span>+SWUPDATE_VERSION =3D 2024.05.2</span><b=
r><span> SWUPDATE_SITE =3D $(call github,sbabic,swupdate,$(SWUPDATE_VERSION)=
)</span><br><span> SWUPDATE_LICENSE =3D GPL-2.0, GPL-2.0+, LGPL-2.1+, MIT, I=
SC, BSD-1-Clause, BSD-3-Clause, CC0-1.0, CC-BY-SA-4.0, OFL-1.1</span><br><sp=
an> SWUPDATE_LICENSE_FILES =3D LICENSES/BSD-1-Clause.txt \</span><br><span>-=
- </span><br><span>2.34.1</span><br><span></span><br><span>_________________=
______________________________</span><br><span>buildroot mailing list</span>=
<br><span>buildroot@buildroot.org</span><br><span>https://lists.buildroot.or=
g/mailman/listinfo/buildroot</span><br></div></blockquote></div></body></htm=
l>=

--Apple-Mail-1C889CE4-7B7E-487A-A898-CC488E6D5506--

--===============4002413370029658012==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4002413370029658012==--
