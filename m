Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F3E3C433F5
	for <buildroot@archiver.kernel.org>; Wed, 29 Dec 2021 12:58:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAF2040897;
	Wed, 29 Dec 2021 12:58:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ec3Sc4YnPZhw; Wed, 29 Dec 2021 12:58:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3B9734067C;
	Wed, 29 Dec 2021 12:58:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 269541BF303
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 12:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1552581372
 for <buildroot@lists.busybox.net>; Wed, 29 Dec 2021 12:58:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id mkGCxlbZV1sj for <buildroot@lists.busybox.net>;
 Wed, 29 Dec 2021 12:58:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3F1EC8136E
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 12:58:06 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id m25so18759377qtq.13
 for <buildroot@buildroot.org>; Wed, 29 Dec 2021 04:58:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=hf6JT8X8ORra1gemVbPHCQenLibEV9lnueByKSBWDv8=;
 b=L9kkLigTal862+3bHfqH47lpx8rru6ITKhrt7iSCjAzXLf/a8i/NCEShcpJ9zp6Bbz
 qKPazmTbfDEbcLw4NR11tI84MtnDUEuYwOygc7+nSVnTCPUrV3bVb+rr3i9RGktIyESe
 lbieUWxunc5HzI8XhBBkvB9WBoPl4vYSfHvDpgyRs5EjMtNtMlJufjzWRXLkZY+9SbK9
 pBooO08hjdMbjA8Mnxs9/vaAbDwrwzhOrFm9kVClKFaRLsuoYD9azscGS3QULSC/aAxc
 SRncoeyLWudOBNX6w9Uqt9julRW5ku78KSwsWSh63rqaeB8Yg6bvw9MXqdViIpy3QFFX
 IfOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=hf6JT8X8ORra1gemVbPHCQenLibEV9lnueByKSBWDv8=;
 b=DYhSOf7pwhyI+8tYxbooAUbyj9MaM5pruPJ/fmvI+gvo2w4zoKCZusVfCCKmrSF3wG
 ercA+06riqtS1AeTAW4XMoT47nr3L/twv0r/W6W8rzRR+fDExwe/Sq/gmreDoOBT1KYO
 M7ezVz4Dr4mZLTRtrGuBXSF6AIfN+jAOBUaaKn5XzLxQezSC8yQ8p4zRmwPxRV3Dte0f
 M85E1Urfaud8oMDhE61TGkTeLTTO9u/JtGohSujiVPMvVQuMo41tO4kkuUjhxogifpsA
 CE7qhuFBHNOsokUXvedZsKCOOY0UVflBfH4XdS+v3reuXYYNGJzx4v1zE5RN4kk5bFoc
 q8HQ==
X-Gm-Message-State: AOAM533S2bMKbUIlyFUvM9z2M7BnSASDZmGN682zAlX5lNAQluKaAe5d
 8dgNxdiBlt0XBNV64rZT6/9o1b4gOfuGkC829RtG+Y/LsnrbyQ==
X-Google-Smtp-Source: ABdhPJzY9Pcit6sCBnyz9o1ahK2Mb/D1Sm3MNrK8fNfGDfKyRTdBLvEoeG6H3X70l2Earqti9BU9ETG7a0Fz2CIp8bA=
X-Received: by 2002:ac8:7c44:: with SMTP id o4mr10295305qtv.260.1640782684851; 
 Wed, 29 Dec 2021 04:58:04 -0800 (PST)
MIME-Version: 1.0
From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Wed, 29 Dec 2021 14:57:54 +0200
Message-ID: <CACaKL1yLOT159yE2Kptoay7Ng+1+vb+tCUxJoVqr9gLha660jw@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: [Buildroot] Patching a BR package makefile
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
Content-Type: multipart/mixed; boundary="===============2731541078410677600=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2731541078410677600==
Content-Type: multipart/alternative; boundary="000000000000158fdc05d4487dd1"

--000000000000158fdc05d4487dd1
Content-Type: text/plain; charset="UTF-8"

Hello,

I had to modify a OPENSSH_CONF_OPTS of the openssh.mk package makefile to
solve a known interoperability issue (openssh vs libopenssl). Now the fix
is verified, i would like to create a patch to be applied to this openssh.mk
.

However, while I already did a couple of patches to other packages, they
were always so far applied to the course code of the packages. In
this specific case, I do not know how to make this on the
buildroot/package/<package>.mk file.

Is there a preferred way to do so ?

Regards,
Jacques

--000000000000158fdc05d4487dd1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><div><br></div><div>I had to modify a=C2=A0OPENS=
SH_CONF_OPTS of the <a href=3D"http://openssh.mk">openssh.mk</a> package=C2=
=A0makefile to solve a known interoperability issue (openssh vs libopenssl)=
. Now the fix is verified, i would like to create a patch to be applied to =
this <a href=3D"http://openssh.mk">openssh.mk</a>.</div><div><br></div><div=
>However, while I already did a couple of patches to other packages, they w=
ere always=C2=A0so far applied to the course=C2=A0code of the packages. In =
this=C2=A0specific=C2=A0case, I do not know how to make this on the buildro=
ot/package/&lt;package&gt;.mk file.</div><div><br></div><div>Is there a pre=
ferred way to do so ?</div><div><br></div><div>Regards,</div><div>Jacques</=
div></div>

--000000000000158fdc05d4487dd1--

--===============2731541078410677600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2731541078410677600==--
