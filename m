Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C572ECAAD3
	for <buildroot@archiver.kernel.org>; Sun, 11 Sep 2022 17:58:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A43B682456;
	Sun, 11 Sep 2022 17:58:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A43B682456
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id GSES1fUypZhi; Sun, 11 Sep 2022 17:58:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D308B81D35;
	Sun, 11 Sep 2022 17:58:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D308B81D35
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 079AF1BF5D7
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 17:58:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D5CF4410E7
 for <buildroot@lists.busybox.net>; Sun, 11 Sep 2022 17:58:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5CF4410E7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id VbmoVrQfZQWM for <buildroot@lists.busybox.net>;
 Sun, 11 Sep 2022 17:58:34 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B3CB1410BA
Received: from mail-vs1-xe2d.google.com (mail-vs1-xe2d.google.com
 [IPv6:2607:f8b0:4864:20::e2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B3CB1410BA
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 17:58:33 +0000 (UTC)
Received: by mail-vs1-xe2d.google.com with SMTP id k2so6822372vsk.8
 for <buildroot@buildroot.org>; Sun, 11 Sep 2022 10:58:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=0u5ic8cHLL+wFJRZCMH+UxVKzLF6norwhP7jp6xafdI=;
 b=mkQjvX07vsiAbzmmABUHnJzsy/3wO22jlsPTBwj/Qbt9niwDHuWA7Gf5oxqRsxrNly
 rZhrA/jx3ppV30aVN6617Zb2XcXhkN47/dUlS8gdgKKGrhxfGjrSLd0JlDo11l0XmsJ0
 7DCdyd1Ck8OCTkypO5E1z37VO5ldBoX/QHmioqeZjn7nTx8vCw8zn+DWWv2rxrHw9H31
 mPquNHsT4f7xW1fgbngxTPDvycxsliyF/WUe2wvflkb87K9MWT6MTjI2GetNiVkEWnbF
 0sClpgAq+OJeQw5yL7CGep3cbySxQd6wrDaj/3X9OakwLcGhoC9H7jMbupEvIKHDJJu7
 2yHw==
X-Gm-Message-State: ACgBeo0+YzcmkuXtZbQDWxPAhGVzo5XbZ0RXzWjTuFfOzz2TCZjLFl1x
 lWNEH/taIduLzqn7zUMSYoKtxAJbyunhfza1ASdBUhN5ddI=
X-Google-Smtp-Source: AA6agR4ygqPt7iFSSH+ItPgiOG6i8+xXqvRyzXN4sg9cI5HmdPvQfQTornzkcXGVJ19XrxZPJ3VNXRHW9H4zXbRuLuY=
X-Received: by 2002:a05:6102:1511:b0:398:73bd:9b4d with SMTP id
 f17-20020a056102151100b0039873bd9b4dmr1395671vsv.33.1662919112254; Sun, 11
 Sep 2022 10:58:32 -0700 (PDT)
MIME-Version: 1.0
From: Zvi Vered <veredz72@gmail.com>
Date: Sun, 11 Sep 2022 20:58:22 +0300
Message-ID: <CABRndgyUttoHU1dUOacMsbKFWTBvUn+Fr99WmQ57EC0CoX4JCA@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=0u5ic8cHLL+wFJRZCMH+UxVKzLF6norwhP7jp6xafdI=;
 b=pkQIVt29i4h8neZvk1uXQQuvOZvmOfBB/zDRWfOHfk3CfMY2+9fsTvUvRXCL/wZSU9
 whnbiIS5J9wQf2CUSSUcd7MpQqI1q2BinysmoqTfddGkzPJxo0KIau3FxnrBlWxhLX3M
 qnMfxJWi+Z5IH42ajIopzKVmBCQBRw5DfXSA/vEGled2Ymo4cXrGGlv9kS+/IU3FPQrM
 d5YHcU29WfucnLC3E14+ULxMZ7R34c8s0xJcS548asQ1O+1Ueqv8d3Z7O1NgyoylnW5Z
 jttQkF9/sY6RRyE9REoUi+HVBW9pQLm/R08fCNZITehCaYmqiK+Kyx0jU5AUE2MQ/SRY
 T7Qg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=pkQIVt29
Subject: [Buildroot] 2022.02.1: read-only file system
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
Content-Type: multipart/mixed; boundary="===============5362221192220086500=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============5362221192220086500==
Content-Type: multipart/alternative; boundary="000000000000f9e9b605e86a8679"

--000000000000f9e9b605e86a8679
Content-Type: text/plain; charset="UTF-8"

Hello,

I'm using buildroot 2022.02.1 under x86 embedded SBC.
The root file system is located on the on-board disk.
The boot argument contains 'ro' (checked with /proc/cmdline after login)
but the disk is not read-only.

When I used the same boot args with busybox, it worked fine.
Of course with busybox I had to tailor all other mandatory files and
directories.

I need read-only rootfs to defend this embedded system in case of
power-down / cold reset.

Beyond the default configuration, the rootfs also contains ntp client,
httpd, pci tools.

Thank you,
Zvika

--000000000000f9e9b605e86a8679
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<div><br></div><div>I&#39;m using buildroot 2022.02.=
1 under x86 embedded SBC.=C2=A0</div><div>The root file system is located o=
n the on-board disk.=C2=A0</div><div>The boot argument contains &#39;ro&#39=
; (checked with /proc/cmdline after login) but the disk is not read-only.=
=C2=A0</div><div><br></div><div>When I used the same boot args with busybox=
, it worked fine.</div><div>Of course with busybox I had to tailor all othe=
r mandatory files and directories.=C2=A0</div><div><br></div><div>I need re=
ad-only rootfs to defend this embedded system in case of power-down / cold =
reset.=C2=A0</div><div><br></div><div>Beyond the default configuration, the=
 rootfs also contains ntp client, httpd, pci tools.=C2=A0</div><div><br></d=
iv><div>Thank you,</div><div>Zvika=C2=A0</div><div><br></div><div>=C2=A0=C2=
=A0</div><div><br></div></div>

--000000000000f9e9b605e86a8679--

--===============5362221192220086500==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============5362221192220086500==--
