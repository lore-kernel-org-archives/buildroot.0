Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1258AC54EE9
	for <buildroot@archiver.kernel.org>; Wed,  7 Sep 2022 14:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64FD560D52;
	Wed,  7 Sep 2022 14:40:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64FD560D52
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id RozhbpOd8gAk; Wed,  7 Sep 2022 14:40:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 833D260D4C;
	Wed,  7 Sep 2022 14:40:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 833D260D4C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 74AD91BF28D
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 14:40:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5CF6840587
 for <buildroot@lists.busybox.net>; Wed,  7 Sep 2022 14:40:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5CF6840587
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XCJSS6g-PpZc for <buildroot@lists.busybox.net>;
 Wed,  7 Sep 2022 14:40:36 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B459940586
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com
 [IPv6:2001:4860:4864:20::2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id B459940586
 for <buildroot@buildroot.org>; Wed,  7 Sep 2022 14:40:36 +0000 (UTC)
Received: by mail-oa1-x2e.google.com with SMTP id
 586e51a60fabf-127d10b4f19so10744194fac.9
 for <buildroot@buildroot.org>; Wed, 07 Sep 2022 07:40:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date;
 bh=0cTlsB3H6cV7+bOSXAouoYlJ/nzIXXbPQKT+ce0p+yI=;
 b=g1C4rn3VfKiLmPQwF6rLxJeqbhbnLC1OkZQMyIW74/d4a+59v45MWCiRZ2/DVBQ1oB
 4DVY0HdeyuHZzKPKTGOwRl6xOXo1ewTKNI5omSo1JenNNKI1uJhtoLuewEU4dKZZfWip
 Pj3GsibMLpUECMfBxcanO8IFSf9m+/LClTFX1FUbstbN9R/7Fdkxb5uCWSGJ201s1j7d
 5C55aosMcKzCqE7YwmraXvJN8i//mAx1a5D7QyEisiCJmHEqZsFXVrL2PMVV8YmoPu7B
 dx8Vj85Ya9QnwEzc+0hgC2cthF/gncoze1PxiuvPteW3tPMuWtqFt3j+/E9E89kItFnR
 mmAA==
X-Gm-Message-State: ACgBeo1UDEoGRKM1gM+1utJ1Y8PeJIxPwuVb8/7Z0G1z3+udHMqmCm7x
 6m6Nb3KwO9sByRoyErYsqV9TgovewSfkwhd9M0ORQncQnyc=
X-Google-Smtp-Source: AA6agR4ZnTt4cgeqHu5norg4w8r51CvqSBkToojnJVQZB9R0JD9m62YMwfbBVyhqyi3H9U0WFHJUrVDz/xF7fLMoIUY=
X-Received: by 2002:a05:6870:344d:b0:11e:4aa4:869b with SMTP id
 i13-20020a056870344d00b0011e4aa4869bmr1911291oah.208.1662561635628; Wed, 07
 Sep 2022 07:40:35 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Wed, 7 Sep 2022 16:40:24 +0200
Message-ID: <CADYjeSu2TUq3Wkk-AFK8TM=xazH66jKPD8Vg6HA9W3WnX2xymg@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date;
 bh=0cTlsB3H6cV7+bOSXAouoYlJ/nzIXXbPQKT+ce0p+yI=;
 b=kLFpusFT4/Bt1Qp5yZ4NIXXfx8TQGRMqy46ZDITLL6sokSLLi04uWlJA5EnEvwwSUN
 VdIhg0G9/V5gAH3HLqxTsxppT9xks3XCAvZRJxrs1mtimLvVGZVp9uOjzYugr+79s79e
 Zlq22V9d45VOYmN3sUTuat9CpnAbdoaZkc0fZ2UlUJ+aXjEeX1wZUHUR9VuuKvphg5Sb
 piufLdTPB+WhKzBXPrZY/yOCoYIpat66ndbGh9XUloBgaOPS4/BwmJ2kDg+sFPP2xgt6
 UXTS8tzte/2sTXtJIVgL6u/kQOAEPRxYyS/Y3JzQr7tm1MY+31TbBRyuLtAB001hHX99
 i0Tw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=kLFpusFT
Subject: [Buildroot] How to include prebuilt binary using buildroot?
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
Content-Type: multipart/mixed; boundary="===============6675906681452549152=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6675906681452549152==
Content-Type: multipart/alternative; boundary="000000000000b5798b05e8174bfc"

--000000000000b5798b05e8174bfc
Content-Type: text/plain; charset="UTF-8"

Hello All,

I think this is rather a basic question:

An application package is not part of buildroot But I am looking for
possibilities to include it in my image. But there are prebuilt binary
available for the application in github. Now I am thinking to include them
by downloading and extracting the downloaded package (.tar.gz). I believe
this is something possible using Yocto using SRC_URI. But is this feasible
with buildroot also, may be with BR2_ROOTFS_POST_IMAGE_SCRIPT?

*Or*, using rootfs overlay the only solution?

Can someone please let me know what is the best approach?

Thanks in advance

-
Sourabh

--000000000000b5798b05e8174bfc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>I think this is rather a bas=
ic question:</div><div><br></div><div>An application package is not part of=
 buildroot But I am looking for possibilities to include it in my image. Bu=
t there are prebuilt binary available for the application in github. Now I =
am thinking to include them by downloading and extracting the downloaded pa=
ckage (.tar.gz). I believe this is something possible using Yocto using SRC=
_URI. But is this feasible with buildroot also,=C2=A0may be with BR2_ROOTFS=
_POST_IMAGE_SCRIPT?</div><div><br></div><div><b>Or</b>, using rootfs overla=
y the only solution?</div><div><br></div><div>Can someone please let me kno=
w what is the best approach?</div><div><br></div><div>Thanks in advance</di=
v><div><br></div><div>-</div><div>Sourabh</div></div>

--000000000000b5798b05e8174bfc--

--===============6675906681452549152==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6675906681452549152==--
