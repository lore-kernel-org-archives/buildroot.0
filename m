Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 190DAC433EF
	for <buildroot@archiver.kernel.org>; Mon, 28 Feb 2022 20:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C7F3081ADE;
	Mon, 28 Feb 2022 20:05:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZgUo1ztAj5tL; Mon, 28 Feb 2022 20:05:38 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 06C288175A;
	Mon, 28 Feb 2022 20:05:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 498FF1BF255
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 20:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4613060E57
 for <buildroot@lists.busybox.net>; Mon, 28 Feb 2022 20:05:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id fzF4abY5r-3l for <buildroot@lists.busybox.net>;
 Mon, 28 Feb 2022 20:05:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9CD1460AF6
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 20:05:34 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id w7so14500390qvr.3
 for <buildroot@buildroot.org>; Mon, 28 Feb 2022 12:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=7RAmEGp0ktkgG8444gWWa0viFRHmvfd/eBLG1HhlRiQ=;
 b=ENgMnSlgGm1Ndm4pPnXJQji5ulWrHtJnbpcNKHBEiPH5rWWd7TkdTAY+G+sszqyp86
 lS5ulsvu2dHISH61QOECyitkX0ddhVnHOZ8aaQgxEVyepD8VNNz9zyD54apLK0uS63gp
 YOA83qCVYOyMhrP8S9PVLryQLvqoRPqwvdCNBKBiShu0IdDuZFmX9Zui6ZIBdKR+xgU5
 w7YgFDrzXOt2ht8D/NUtmmQU+SLX6U8xiHmT9BqUWUNvkqDW+Jni/BYt26MXPKaulC8u
 TKs568p5FqJSRArlHM8E62UX9s1HL4miYGR4Llhu3ugnmoamx4iQAYX8q9nWaE2HsulY
 8Jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=7RAmEGp0ktkgG8444gWWa0viFRHmvfd/eBLG1HhlRiQ=;
 b=3x0yyKz4WT3eXiARbF+p9XLroESNNsAKbhzTissw75T2OeynW2m6x+nprmdldIykVV
 eiCsfniwzMKz/rlfkti7zXiReJ/3aiaqFd2OuoqkaOSaWUj/9DV96D8qFr9v/ssP1zac
 sg6wITQvlRaUS4utkIT4ftkFVMMyJToHC4vy+mlHTgKxr5DcU573lgupHEycSiIkQkKJ
 2bCJPEJD8aYBFQoRLha8jBfAhl8olioy2R/HO2dkQI3ig5X16Ar22nzU+rDRlA/C+ufF
 Z+I72adoh9WEhB9gkizICctddP9iMFKGzDkNfGt5gdrLksYqzjx3YebEp7ZFhjS/rcBj
 h1kQ==
X-Gm-Message-State: AOAM531aR8zywepjQgjATSpG0yuBG84LaAlOte2nNfCDXwZB8MQFEZpt
 h2GPUbBnaszHUSiTFXO7Qvrszd27tYq8pw6iHTK1zrReMc03VA==
X-Google-Smtp-Source: ABdhPJzKRE55TjTvN4exg3t3PXouLE+elTQP+9aKKdhd3r5x00L9ZoHez8t0KFSG23orX9JXAnWDrV/wVTyJwgSG5FE=
X-Received: by 2002:a05:6214:27ca:b0:432:c4cd:4e90 with SMTP id
 ge10-20020a05621427ca00b00432c4cd4e90mr11146766qvb.116.1646078733267; Mon, 28
 Feb 2022 12:05:33 -0800 (PST)
MIME-Version: 1.0
From: Jacques Samoun <jacques.samoun33@gmail.com>
Date: Mon, 28 Feb 2022 21:05:22 +0100
Message-ID: <CACaKL1zwub5JhqnjF9cNtHWW5h1Syx94i1JQt4U108EF7yU+4A@mail.gmail.com>
To: Buildroot Mailing List <buildroot@buildroot.org>
Subject: [Buildroot] device table
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
Content-Type: multipart/mixed; boundary="===============5515325941798790789=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5515325941798790789==
Content-Type: multipart/alternative; boundary="0000000000002b381405d91992a2"

--0000000000002b381405d91992a2
Content-Type: text/plain; charset="UTF-8"

Hello,
despite all my tries, i just cannot make the "device_table" feature work as
described in the manual.
Basically, i am trying to set 666 rights to /dev/tty + add a dialout group,
so i created the following file (device_table.txt"

/dev/tty c 666 root dialout 5 0 - - -

and have set the correct variable in menuconfig. I know for sure that the
build has handled this file ... but looking at the /dev/tty, it is clear
that nothing has happened, the permissions are still 600 and the dialout
group has not been set.

Am I missing something ?
Thanks,
Jacques

--0000000000002b381405d91992a2
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div dir=3D"ltr">Hello,<div>despite all m=
y tries, i just cannot make the &quot;device_table&quot; feature work as de=
scribed in the manual.</div><div>Basically, i am trying to set 666 rights t=
o /dev/tty + add a dialout group, so i created the following file (device_t=
able.txt&quot;</div><div><br></div><div>/dev/tty c 666 root dialout 5 0 - -=
 -</div><div><br></div><div>and have set the correct variable in menuconfig=
. I know for sure that the build has handled this file ... but looking at t=
he /dev/tty, it is clear that nothing has happened, the permissions are sti=
ll 600 and the dialout group has not been set.</div><div><br></div><div>Am =
I missing something ?</div><div>Thanks,</div><div>Jacques</div><div><br></d=
iv></div></div></div>

--0000000000002b381405d91992a2--

--===============5515325941798790789==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5515325941798790789==--
