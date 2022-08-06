Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26762C19F2D
	for <buildroot@archiver.kernel.org>; Sat,  6 Aug 2022 17:29:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C3FC60B96;
	Sat,  6 Aug 2022 17:29:09 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9C3FC60B96
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qhEf2-Gj4h5k; Sat,  6 Aug 2022 17:29:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D38F660B6A;
	Sat,  6 Aug 2022 17:29:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D38F660B6A
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E4FD81BF5A6
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 17:29:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C78754027F
 for <buildroot@lists.busybox.net>; Sat,  6 Aug 2022 17:29:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C78754027F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WHcPxG5TTAgB for <buildroot@lists.busybox.net>;
 Sat,  6 Aug 2022 17:29:05 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 2D0864017A
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com
 [IPv6:2607:f8b0:4864:20::b2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 2D0864017A
 for <buildroot@buildroot.org>; Sat,  6 Aug 2022 17:29:05 +0000 (UTC)
Received: by mail-yb1-xb2f.google.com with SMTP id i62so8077772yba.5
 for <buildroot@buildroot.org>; Sat, 06 Aug 2022 10:29:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
 bh=KAFMBDBneFOC2b+B9otEdL/0G1S8sG+JNt6C+WK6WKw=;
 b=ltukEvYIQYXbnxESwZCSFjy+RMWv2c9bMnNkdWxS1TQCN7aATdGvMcskT2FRtAm3tx
 +S9QPYS6hVUuRfgM+g6S6sSzkxmsn0QZknbKrFTSUwrGTQmfquBQzH4972Z0PDjp95JG
 yCbACViLkEZXObZrY065B9CejKsls5aK82fHlEeQ3nY1AvnFFxhEG6zcpEq7ERtVoA8q
 zVT0WAwwm8Z6icgvLGLtnmEXy86xheq9MA8sCjrEZDEBQ9L0a1eEi7Kputntyjy5qobt
 nOucwCxjFDfuQHxoQ7/ba1kcdN4j2HAb90gNn15C1N4W7c6S/gy+rkfCSLslB8f8q05e
 S6aw==
X-Gm-Message-State: ACgBeo1Z9SdC1/BiLCVAFP6z8/noPGNjbFfgyq0yEHEZi0VURmRDZRd4
 X/8DYcSVitIfQthXU1s1f/tK3dONGMKNA3anR70YMrIcBsA=
X-Google-Smtp-Source: AA6agR7Z3V7zMk4DSUm/uN/0oOAvXMviTvOo1fEa2dmpbZmAAQuNLl8AD0kiGkPge7cYgdVGcXRgRev9qsY2fNKP2Mo=
X-Received: by 2002:a5b:54d:0:b0:671:a63:32ad with SMTP id
 r13-20020a5b054d000000b006710a6332admr9885311ybp.496.1659806943528; 
 Sat, 06 Aug 2022 10:29:03 -0700 (PDT)
MIME-Version: 1.0
From: Stefano Cottafavi <stefano.cottafavi@gmail.com>
Date: Sat, 6 Aug 2022 19:28:52 +0200
Message-ID: <CAPn86JAvLDjLZYGTvCeJDD45o7Erro2aM8wYzRO73OWW3ehfVw@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=mime-version:from:date:message-id:subject:to;
 bh=KAFMBDBneFOC2b+B9otEdL/0G1S8sG+JNt6C+WK6WKw=;
 b=V0f8CPfNwo+Vg6FyqX5NKgkvOA1XteT5UOXl0i1/Jj7RsQfXsy8M2Ep5cJOzNn6HOx
 GaHnvyjnfNRCNXcI0ubIUxQf835EkSMz5SPCHJzW4d2IV+2BTA11Y2HGI3GC/0QZAcJ5
 URWwB0t19irz2Wh3pGRNwtIYOc3Q7U9GOmT8paNATRIdg97UXau5GOu7JD+h8B6/pk6C
 aQiqyG0nj5PDu0pTY5ex9JYf9J0ScAkdpWK59GfaExwXGZi0jkTZIqfTiuwCibIpjue3
 HhjYW148g8IgdqVxhwyimzcIfK5WIDeJdpyrvcxPVnjMaa6257A+HvnGDny0JTWVyjx6
 yPdA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=V0f8CPfN
Subject: [Buildroot] OpenCV modules headers not in the SDK
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
Content-Type: multipart/mixed; boundary="===============6668558053842467701=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============6668558053842467701==
Content-Type: multipart/alternative; boundary="00000000000043cbac05e595ebf8"

--00000000000043cbac05e595ebf8
Content-Type: text/plain; charset="UTF-8"

Hi all,
I've successfully built Buildroot 2022.05 for the Raspberry Pi4 adding
support for Qt5 and OpenCV (including objdetect module amongst few other).
I've also managed to generate the SDK for such a build however I can't find
the header files of those OpenCV modules anywhere in the SDK.

Is this expected or a bug?

Cheers,
Stefano

--00000000000043cbac05e595ebf8
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:monospac=
e,monospace;font-size:small">Hi all,</div><div class=3D"gmail_default" styl=
e=3D"font-family:monospace,monospace;font-size:small">I&#39;ve successfully=
 built Buildroot 2022.05 for the Raspberry Pi4 adding support for Qt5 and O=
penCV (including objdetect module amongst few other).</div><div class=3D"gm=
ail_default" style=3D"font-family:monospace,monospace;font-size:small">I&#3=
9;ve also managed to generate=C2=A0the SDK for such a build however I can&#=
39;t find the header files of those OpenCV modules anywhere in the SDK.</di=
v><div class=3D"gmail_default" style=3D"font-family:monospace,monospace;fon=
t-size:small"><br></div><div class=3D"gmail_default" style=3D"font-family:m=
onospace,monospace;font-size:small">Is this expected or a bug?</div><div cl=
ass=3D"gmail_default" style=3D"font-family:monospace,monospace;font-size:sm=
all"><br></div><div class=3D"gmail_default" style=3D"font-family:monospace,=
monospace;font-size:small">Cheers,</div><div class=3D"gmail_default" style=
=3D"font-family:monospace,monospace;font-size:small">Stefano</div></div>

--00000000000043cbac05e595ebf8--

--===============6668558053842467701==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============6668558053842467701==--
