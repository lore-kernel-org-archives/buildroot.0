Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A6ECC43334
	for <buildroot@archiver.kernel.org>; Sat, 16 Jul 2022 14:47:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F012F60D75;
	Sat, 16 Jul 2022 14:47:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F012F60D75
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 37EUvje6QaGt; Sat, 16 Jul 2022 14:47:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03B90605AF;
	Sat, 16 Jul 2022 14:47:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03B90605AF
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8ACFF1BF5DD
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 14:47:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6590681D16
 for <buildroot@lists.busybox.net>; Sat, 16 Jul 2022 14:47:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6590681D16
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BqCzJvC8CjDF for <buildroot@lists.busybox.net>;
 Sat, 16 Jul 2022 14:47:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4AEF181CEF
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4AEF181CEF
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 14:47:17 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id 70so7016514pfx.1
 for <buildroot@buildroot.org>; Sat, 16 Jul 2022 07:47:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=+4NkwSCq+/voU6hrFo2PMGUjPt0kH5X4z8GbA43zQlE=;
 b=Xr5CXPpCUfXX+PFMvxLvj7CUDx3EhcfgKnuG1yOulB2b2MrER5IA/qKPoT+UqmAgpO
 Q7/80a374Jt6Q0DvU5FXLfTfc8HlONpuehxtdEKwgnVz/FFi42XL8JeHD/NFNzUlZefP
 f87JjRCogcDpdsP1NDPdwaT2ScXuiLuLRHMOSx7302StDtClj1A9yA3E1Uf7VtucSur+
 U4B2mNevIRkiHHPgG+aQYzdtD4Q+d2X7Ygf6fODz8pXql6X1iTIAGnL101EYYwn97qVe
 y+sHxM278ggPDTKF60Eu/EsXwFARLop9B6BuD1jQO4w7Yn9o8QdlA7Xc6POztPxFZX9J
 earg==
X-Gm-Message-State: AJIora8PdU7UJS6NeR6xQlsW5iPhTe36v6sbaUpl99qFTxxdDUUjS1CL
 6xpXCaev36SOAJFhfqguaLUDEBKC4mZvnyGWurtB5ebdXGc=
X-Google-Smtp-Source: AGRyM1tYXdNei6n4X8TDvfZ2mY1RhZQDYfvcJuEMptZNV00BTEXpzOvMnE+qTKSRNbLUKAhgW11FltJS3B/NXXMOBEY=
X-Received: by 2002:a05:6a00:23c9:b0:52a:cedd:3992 with SMTP id
 g9-20020a056a0023c900b0052acedd3992mr19242800pfc.43.1657982836326; Sat, 16
 Jul 2022 07:47:16 -0700 (PDT)
MIME-Version: 1.0
From: Ritvik <ritviktanksalkar@gmail.com>
Date: Sat, 16 Jul 2022 20:16:40 +0530
Message-ID: <CAJxTgFwAMUZVo3dmnLoLtzNmc1USC2XgQ0tHaebZEYsUdrKrpw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=+4NkwSCq+/voU6hrFo2PMGUjPt0kH5X4z8GbA43zQlE=;
 b=DTOtEzRPzYGO0waGplpHkWfquCiprhN81Lpxq2a6rgECLzysIVYlNeEI0s3DZfP3JW
 NlHssHQcAGZJftcytir8ESAaMSXNR6D7E9Chw/ctvz76ObiJN2bVlWBeisxmMIQ0wNU1
 oXl+508BqE9ORrFTShdAJitfivZ6R+SrAR46tHKpUyJZZPF3nwbmcuKkw3jz1dOUP55w
 +iFD90pC1QYvhicGA/C9s9ZozvM4oEY4dM3aG2eOAhxZzf7bGjTjlnTL4r+rStb1qIRk
 n68ddyAfZaTFzRLgRhEsU0e7JeByqqlRpWj+NnynoIpfQiWL2fUXk8FPmEv5utilWxhD
 joiA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=DTOtEzRP
Subject: [Buildroot] aufs-util patching raises duplicate patch issue
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
Content-Type: multipart/mixed; boundary="===============6625086039664166478=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6625086039664166478==
Content-Type: multipart/alternative; boundary="00000000000000c6ec05e3ed361d"

--00000000000000c6ec05e3ed361d
Content-Type: text/plain; charset="UTF-8"

Hello all,

While compiling buildroot with linux kernel 5.10.115-cip7, the compilation
stops while applying a aufs-utils specific patch "0002-no-check-ver.patch"
saying that there are conflicting files. Below are the details. Any help in
this regard would be highly appreciated.


*>>> aufs-util  Patching*
Applying 0002-no-check-ver.patch using patch:
Error: duplicate filename '0002-no-check-ver.patch'
Conflicting files are:
  already applied:
/home/ubuntu/buildroot-2022.02.3/package/aufs-util//0002-no-check-ver.patch
  to be applied  :
/home/ubuntu/buildroot-2022.02.3/package/aufs-util//0002-no-check-ver.patch
make[1]: *** [package/pkg-generic.mk:251:
/home/ubuntu/buildroot-2022.02.3/output/build/aufs-util/.stamp_patched]
Error 1
make: *** [Makefile:84: _all] Error 2

Warm Regards,
Cyb0rG

--00000000000000c6ec05e3ed361d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello all,<div><div><br></div><div>While compiling buildro=
ot with linux kernel=C2=A05.10.115-cip7, the compilation stops while applyi=
ng a aufs-utils specific patch &quot;0002-no-check-ver.patch&quot; saying t=
hat there are conflicting files. Below are the details. Any help in this re=
gard would be highly appreciated.</div><div><br></div><div><b>&gt;&gt;&gt; =
aufs-util =C2=A0Patching<br></b><br>Applying 0002-no-check-ver.patch using =
patch:<br>Error: duplicate filename &#39;0002-no-check-ver.patch&#39;<br>Co=
nflicting files are:<br>=C2=A0 already applied: /home/ubuntu/buildroot-2022=
.02.3/package/aufs-util//0002-no-check-ver.patch<br>=C2=A0 to be applied =
=C2=A0: /home/ubuntu/buildroot-2022.02.3/package/aufs-util//0002-no-check-v=
er.patch<br>make[1]: *** [package/<a href=3D"http://pkg-generic.mk:251">pkg=
-generic.mk:251</a>: /home/ubuntu/buildroot-2022.02.3/output/build/aufs-uti=
l/.stamp_patched] Error 1<br>make: *** [Makefile:84: _all] Error 2<br></div=
><div><br clear=3D"all"><div><div dir=3D"ltr" class=3D"gmail_signature" dat=
a-smartmail=3D"gmail_signature"><div dir=3D"ltr"><div dir=3D"ltr">Warm Rega=
rds,<div>Cyb0rG</div><div><br></div></div></div></div></div></div></div></d=
iv>

--00000000000000c6ec05e3ed361d--

--===============6625086039664166478==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6625086039664166478==--
