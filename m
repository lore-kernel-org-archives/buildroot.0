Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2735CC001DB
	for <buildroot@archiver.kernel.org>; Thu, 10 Aug 2023 12:55:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C374D402DC;
	Thu, 10 Aug 2023 12:55:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C374D402DC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id cvcXaS-qw7iW; Thu, 10 Aug 2023 12:55:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3F7C402D0;
	Thu, 10 Aug 2023 12:55:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org F3F7C402D0
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DD0F71BF2E4
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 12:55:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B6B4D60D70
 for <buildroot@lists.busybox.net>; Thu, 10 Aug 2023 12:55:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B6B4D60D70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XC1JWaw-aWGj for <buildroot@lists.busybox.net>;
 Thu, 10 Aug 2023 12:55:24 +0000 (UTC)
Received: from mail-yb1-xb36.google.com (mail-yb1-xb36.google.com
 [IPv6:2607:f8b0:4864:20::b36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DD89360B8D
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 12:55:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DD89360B8D
Received: by mail-yb1-xb36.google.com with SMTP id
 3f1490d57ef6-d075a831636so823549276.3
 for <buildroot@buildroot.org>; Thu, 10 Aug 2023 05:55:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691672122; x=1692276922;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=R09YpS4na4SLIZkmkrk5R3gfrZIGGB0jb9go7oX7txw=;
 b=K6dAn4lHQ9ix6GzMibzmPI+OS6ViGsopfB4banURwvZdP6wauiSwNJ9/5PRmjwzTdq
 yXcK5RypHRXvBF5KNNF2JNiZTFDJjvZZRKWr99PsIPbf9qfQTUuHPMVMyPh86h6LM8Td
 8bkYDhVcB8Ibk7TAgzCXbaIWyD1i+R3jG9YWz397zUD4iKG3LcrajnTEwloK5mhk6y6B
 Oqsk4X5VQwRWD86AsSUaPCBzDT3lQxDHUJcaO/1ghrdnoO8sxUSumyWQpVlzjGSYE3Y3
 6jmV3LlolnT/0ZpTbUGy8qgIjjDu28w78RJFqYoK7cnH9LfstRMBtAr6XBhBRVciOK+N
 7vrQ==
X-Gm-Message-State: AOJu0Yw21bROlNAW/nemWOJ6WjpjgWk8nNegcxubJBCFaieH68GY79T7
 aGizWrRz2wifSfXUpyPIUf9fZ9pA2VrdYbOUWz9FoG+Voww=
X-Google-Smtp-Source: AGHT+IGRJ81uswCz0zKaTmyG9ymSOUSBJETMbMz52YXoVGHg/c223z5aPPLOqzELorCFqN7N1GCDjh7H13D/FNF0Jt0=
X-Received: by 2002:a05:6902:1347:b0:d06:49e9:a29c with SMTP id
 g7-20020a056902134700b00d0649e9a29cmr2454698ybu.34.1691672122511; Thu, 10 Aug
 2023 05:55:22 -0700 (PDT)
MIME-Version: 1.0
From: Robert Smigielski <ptdropper@gmail.com>
Date: Thu, 10 Aug 2023 08:55:11 -0400
Message-ID: <CABWt4ev1G2+YQ0_TzmH-YM1sb8HkAVEySW_ALfw2vPgrfcy8kA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1691672122; x=1692276922;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=R09YpS4na4SLIZkmkrk5R3gfrZIGGB0jb9go7oX7txw=;
 b=bkWcTrc3wJBWMRrK74o6lCPrUv8cBNsX0MZ7f9cWm1L/BWRd0//4xNIVyJv6bN61Hh
 TeTRFRh6Mcfcvbi3eYs08dJtALdOPesM9T+sg5eXtW/VnbkIfB1MeFVYTKFHWdIhjqcg
 oGDM0zRQ7EkCjKDWEO0TtdoY+v6vGmNFF087cJlMt8mUp+OEbrqAhSnPVmyldhU7Rkfb
 wH8wxxOBvCZLe5S+O5TytCN5FTOakRq8H3uWg6SaXnuy95izSRSbXmt0ZdvMA2T18cMH
 A58SM4Pi7NYzYnUJzJRJFCtmCpHkBfPrLF8Tjusa/I6tLOI2RoIB/IT84UR29oVtqlzC
 gEYg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bkWcTrc3
Subject: [Buildroot] CycloneDX SBOM support
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
Content-Type: multipart/mixed; boundary="===============2419178891910524959=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============2419178891910524959==
Content-Type: multipart/alternative; boundary="000000000000f055910602911b82"

--000000000000f055910602911b82
Content-Type: text/plain; charset="UTF-8"

Announcing CycloneDX support for the embedded / IOT / MIOT world. Using
your Buildroot output, my project produces CycloneDX SBOM files for supply
chain management and vulnerability management. I am a long time Buildroot
user now in the device security space. Glad to provide CycloneDX SBOM
support for Buildroot users.

https://github.com/CycloneDX/cyclonedx-buildroot

https://pypi.org/project/CycloneDX-Buildroot/


-- 
Robert Smigielski

--000000000000f055910602911b82
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Announcing CycloneDX support for the embedded / IOT / MIOT=
 world. Using your Buildroot output, my project produces CycloneDX SBOM fil=
es for supply chain management and vulnerability management. I am a long ti=
me Buildroot user now in the device security space. Glad to provide Cyclone=
DX SBOM support for Buildroot users.<div dir=3D"auto"><br></div><div dir=3D=
"auto"><a href=3D"https://github.com/CycloneDX/cyclonedx-buildroot" target=
=3D"_blank">https://github.com/CycloneDX/cyclonedx-buildroot</a></div><div =
dir=3D"auto"><br></div><div dir=3D"auto"><a href=3D"https://pypi.org/projec=
t/CycloneDX-Buildroot/" target=3D"_blank">https://pypi.org/project/CycloneD=
X-Buildroot/</a></div><br class=3D"gmail-Apple-interchange-newline"><div><b=
r></div><span class=3D"gmail_signature_prefix">-- </span><br><div dir=3D"lt=
r" class=3D"gmail_signature" data-smartmail=3D"gmail_signature"><div dir=3D=
"ltr"><div><div dir=3D"ltr">Robert Smigielski<br><span></span><span></span>=
</div></div></div></div></div>

--000000000000f055910602911b82--

--===============2419178891910524959==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============2419178891910524959==--
