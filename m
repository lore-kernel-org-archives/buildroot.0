Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8E7C2BD09
	for <buildroot@archiver.kernel.org>; Sat,  6 Jul 2024 12:15:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8862660648;
	Sat,  6 Jul 2024 12:15:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x5h1L_lRN1zs; Sat,  6 Jul 2024 12:15:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 927A960895
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 927A960895;
	Sat,  6 Jul 2024 12:15:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CA04C1BF2A7
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 12:15:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B46B66084B
 for <buildroot@lists.busybox.net>; Sat,  6 Jul 2024 12:15:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id hDFa5A_NgMGX for <buildroot@lists.busybox.net>;
 Sat,  6 Jul 2024 12:15:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52e; helo=mail-ed1-x52e.google.com;
 envelope-from=mail2akash97@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 6FF6960648
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6FF6960648
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 6FF6960648
 for <buildroot@buildroot.org>; Sat,  6 Jul 2024 12:15:00 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-58ba3e37feeso3380805a12.3
 for <buildroot@buildroot.org>; Sat, 06 Jul 2024 05:15:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720268098; x=1720872898;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=A7tJ7LYYqePgxeIL8PQADMrljYkyMiRfcmiW8LoWCFU=;
 b=Lx3DLK50sb8rgm/0nsGTfAQrjJVZ2IsDyYVth7hyJAl4T+ezOToAKTD9zqWX2qn3H1
 OhJ1QuGc7ol5NAVTskCT/aIJY+gvA1fsWwuavFjoxUw5P8v6VO8cBWGmlLsvLX50WktV
 z28PP0tf1pX4HKUvtcjey5hphuADe4Ng9R25WRwgGE67u+Ds6vbCyl+JvxSBkKGEQIyW
 QjXs22jD4MSUd2J9LpVy9W64dRT1ng5EbsZ3lnZnFfDu27Q5rQsf8fIDGOCHdp1S6Fuz
 vOihhDdKlWIAVMzchAJfC0W0m4+jxL1fK76nKdXUcSFuixzYVC17P/EVdVwkGF3C769T
 Tt/A==
X-Gm-Message-State: AOJu0YzG4AbOGig4wpLnb9+55CyIWfR5/gzis8jZhiuXv23FYpFJXD2U
 SeNwTwjUO7Pm4wReSEG0X/L2OiBgZvLoxsC8gCrhnSRYBS6g4zb9QTkv1RVHFvT1nwMPdab4mRF
 +2en4mZ7PiakaZ5ugPICtaoPA65t3lQ==
X-Google-Smtp-Source: AGHT+IEPQOy1Ty5DVq3OZnCpMOrvKaIjUW6xUIZLc5DDhWMjJ0i166/QfQVipCs5TSr2KzB+D0clE0RUEJ7akT64WZg=
X-Received: by 2002:a17:906:4893:b0:a77:e2e3:354d with SMTP id
 a640c23a62f3a-a77e2e34b53mr107088766b.23.1720268097679; Sat, 06 Jul 2024
 05:14:57 -0700 (PDT)
MIME-Version: 1.0
References: <CAK2J2tS_xGcztt69CHHSROBDi=NgWN_ACOCF00kVHi7zh1yDGQ@mail.gmail.com>
In-Reply-To: <CAK2J2tS_xGcztt69CHHSROBDi=NgWN_ACOCF00kVHi7zh1yDGQ@mail.gmail.com>
From: Keerthivasan Raghavan <mail2akash97@gmail.com>
Date: Sat, 6 Jul 2024 17:44:46 +0530
Message-ID: <CAK2J2tQtz_h6QBtuuVQh=4TNpohGAbp240UpmtswfMLF3cef1g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1720268098; x=1720872898; darn=buildroot.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=A7tJ7LYYqePgxeIL8PQADMrljYkyMiRfcmiW8LoWCFU=;
 b=OxQx9HvcJcd4LCPUDXbUGPyTFnMFfpOveAW0TDYNAOWT3iIaWMR2qlci3IXhXcxMif
 KK4Q0eK8N7qGeM/YVU1MiS8cHDfqaGJMaumjwhDtogicrp465oyv0Bk8QOfx07ho8ZUd
 nH8VsMM39aK7mG8YX+WgY3VmR8JgR/8AyXzW+0y7jmLaZeOpK8wXOSRAkUJo+tJyHFJw
 QvuqmSaD5kSoay4a+wpOHUk46qhP+lkmB7ULBrWX13cv5g0lTv9y3C4UzXi01x+d+tTK
 9CG31enxFTGgI2vxxOV8jhaVY66PuhTDhv2ivfNcjgsZrSw2WX63q9HIDD2RBsCXFUdO
 xWEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=OxQx9Hvc
Subject: [Buildroot] Fwd: Debug prefix map
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
Content-Type: multipart/mixed; boundary="===============7193353591767898423=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============7193353591767898423==
Content-Type: multipart/alternative; boundary="000000000000e17bac061c932078"

--000000000000e17bac061c932078
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

---------- Forwarded message ---------
From: Keerthivasan Raghavan <mail2akash97@gmail.com>
Date: Sat, Jul 6, 2024 at 9:50=E2=80=AFAM
Subject: Debug prefix map
To: <buildroot@buildroot.org>


Hi All,

I am a new buildroot user. Been experimenting with buildroot and rpi4.
Wanted to know if buildroot has any provision to enable debug prefix
mapping like in yocto
<https://docs.yoctoproject.org/ref-manual/variables.html#term-DEBUG_PREFIX_=
MAP>
. I came across the debugging section(8.13.2 using gdb in buildroot) in the
buildroot manual but found no reference to prefix map. Does buildroot have
any concept/provison of a debug map ? If not, what can I do to simulate it =
?


Thank you,
Keerthivasan Raghavan

--000000000000e17bac061c932078
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=3D"gmail_attr">---------- Forwarded message ---------<br>From: <b class=3D=
"gmail_sendername" dir=3D"auto">Keerthivasan Raghavan</b> <span dir=3D"auto=
">&lt;<a href=3D"mailto:mail2akash97@gmail.com">mail2akash97@gmail.com</a>&=
gt;</span><br>Date: Sat, Jul 6, 2024 at 9:50=E2=80=AFAM<br>Subject: Debug p=
refix map<br>To:  &lt;<a href=3D"mailto:buildroot@buildroot.org">buildroot@=
buildroot.org</a>&gt;<br></div><br><br><div dir=3D"ltr"><div><div><div>Hi A=
ll,<br><br></div>I am a new buildroot user. Been experimenting with buildro=
ot and rpi4.<br></div><div>Wanted to know if buildroot has any provision to=
 enable debug prefix mapping like in <a href=3D"https://docs.yoctoproject.o=
rg/ref-manual/variables.html#term-DEBUG_PREFIX_MAP" target=3D"_blank">yocto=
</a> . I came across the debugging section(8.13.2 using gdb in buildroot) i=
n the buildroot manual but found no reference to prefix map. Does buildroot=
 have any concept/provison of a debug map ? If not, what can I do to simula=
te it ?<br><br></div><br></div><div>Thank you,<br></div><div>Keerthivasan R=
aghavan<br></div></div>
</div></div>

--000000000000e17bac061c932078--

--===============7193353591767898423==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============7193353591767898423==--
