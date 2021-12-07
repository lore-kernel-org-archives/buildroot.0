Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4ED25C433EF
	for <buildroot@archiver.kernel.org>; Tue,  7 Dec 2021 11:27:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBF0040556;
	Tue,  7 Dec 2021 11:27:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v-3IsYLo8Pbo; Tue,  7 Dec 2021 11:27:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7308B40532;
	Tue,  7 Dec 2021 11:27:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 340771BF489
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 11:27:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 238198291C
 for <buildroot@lists.busybox.net>; Tue,  7 Dec 2021 11:27:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=unikie-com.20210112.gappssmtp.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id C2N8cnbRy1au for <buildroot@lists.busybox.net>;
 Tue,  7 Dec 2021 11:27:28 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 34CD382893
 for <buildroot@buildroot.org>; Tue,  7 Dec 2021 11:27:28 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id r11so55371477edd.9
 for <buildroot@buildroot.org>; Tue, 07 Dec 2021 03:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=unikie-com.20210112.gappssmtp.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=AMa/xKk7iLWqaiGfyTiKe8KuxuUynO6FknImEPPGV78=;
 b=IzKk3tVAeL+KrFmnOIrdki2d4FsmSG+ZjTmt8VIRiSt+UZiDnf28yzkAWpg5LCyCXn
 Npzq54GpwIWbrkD9L+7U6TktGAMRnQ6aTCB3Hx5Rr9DR+7l4P0W2J8xth1mqKx009J/9
 bIcI8m98b5DczV3AVrmevKRV6H7Rofan5g74fL42ZriacfW8EF3vGIDq6GQlsPoRwYvI
 vxLCUNg2G9x90lc2ZGeLzDqMPz/PSSBwMUtt4mIO9W0NkdNMdGdOfEJh4u3Xn+UArXtX
 jAw1rbCNarepu9WBOQgYTsXQJ5NYQqdW9tODAdfOCuHi2OaiWBRM3GYa75fv164gCaaG
 bdxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=AMa/xKk7iLWqaiGfyTiKe8KuxuUynO6FknImEPPGV78=;
 b=E9c/E/R4Yv34MQSj7VTeXAd2ig1d9hGADsd/qjv/JpxPngZ2FqXkCWY2uRCWsXKMif
 ABITmNcHRa95V+1wJ+qvhkMPMj4TfG8ifI9Z4FoGMWzrmeB3qjsxPr+dfWhar8WHrg2g
 71eVZTCFDpZAYhpPAiXbwkI8QO8lenwY+Z4bQ2DUre3kexSx94hZ19pcJm+JczR/Brso
 DaET8alSp1lOceOIxZkvv3sJzf46jVudtSebKAxV4MG2ilCSGtyxrhFStGXcK74Sp4GJ
 idIIb/Lo7bHp/ZH7e2wLar0BPo2fu33LhlRKrlsXKOGGKYqm+stgPzj7tHm+9mwvgO2V
 76Fg==
X-Gm-Message-State: AOAM532YI4B+5xx0k7powgD5ZvH6UMRahRQO+ancS+H0CVNabLGWN3OE
 nRRwTOtOd6FvWNcilOPowXr8r8Kd7vfSGpqzA9ci2gLBi1pzzJsM
X-Google-Smtp-Source: ABdhPJzoIMbu0f+LoCdKLTU4lZYjxDoOjZjkV95XWv1Dk4f9KwAxXTqfFXICEfbzSqjP6pjmGeuNPuiqPg4mBsQKLRw=
X-Received: by 2002:a05:6402:35c5:: with SMTP id
 z5mr8625218edc.166.1638876446295; 
 Tue, 07 Dec 2021 03:27:26 -0800 (PST)
MIME-Version: 1.0
From: =?UTF-8?Q?Jos=C3=A9_Pekkarinen?= <jose.pekkarinen@unikie.com>
Date: Tue, 7 Dec 2021 13:27:15 +0200
Message-ID: <CAJPV9MqnSviULFaVRO6m00bF-bfysMQ_Z9qWQiwzx+E1u-iLqg@mail.gmail.com>
To: buildroot <buildroot@buildroot.org>
Subject: [Buildroot] Arm opcodes support
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
Content-Type: multipart/mixed; boundary="===============2582675989276297155=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2582675989276297155==
Content-Type: multipart/alternative; boundary="00000000000069977505d28ca8eb"

--00000000000069977505d28ca8eb
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

I hit the following issue making a

package for avocado framework. I wonder
what other packages do when this is hit.

../src/arm/sysv.S: Assembler messages:
../src/arm/sysv.S:104: Error: selected processor does not support ARM
opcodes

Thanks!


Jos=C3=A9 Pekkarinen.

--00000000000069977505d28ca8eb
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><span style=3D"font-family:monospace"><span style=3D"=
color:rgb(0,0,0)"><br></span></span></div><blockquote style=3D"margin:0 0 0=
 40px;border:none;padding:0px"><div><span style=3D"font-family:monospace"><=
span style=3D"color:rgb(0,0,0)">Hi,</span></span></div><div><span style=3D"=
font-family:monospace"><span style=3D"color:rgb(0,0,0)"><br></span></span><=
/div></blockquote><blockquote style=3D"margin:0 0 0 40px;border:none;paddin=
g:0px"><div><span style=3D"font-family:monospace"><span style=3D"color:rgb(=
0,0,0)">I hit the following issue making a</span></span></div></blockquote>=
<font color=3D"#000000" face=3D"monospace">package for avocado framework. I=
 wonder</font><div><font color=3D"#000000" face=3D"monospace">what other pa=
ckages do when this is hit.<br></font><div><span style=3D"font-family:monos=
pace"><span style=3D"color:rgb(0,0,0)"><br></span></span></div><span style=
=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0)">../src/arm/sysv=
.S: Assembler messages:
</span><br>../src/arm/sysv.S:104: Error: selected processor does not suppor=
t ARM opcodes<br></span><div><br></div></div><blockquote style=3D"margin:0 =
0 0 40px;border:none;padding:0px"><div><div>Thanks!</div></div></blockquote=
><div><br><div dir=3D"ltr" class=3D"gmail_signature" data-smartmail=3D"gmai=
l_signature"><div dir=3D"ltr"><blockquote style=3D"margin:0 0 0 40px;border=
:none;padding:0px">Jos=C3=A9 Pekkarinen.</blockquote></div></div></div></di=
v>

--00000000000069977505d28ca8eb--

--===============2582675989276297155==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2582675989276297155==--
