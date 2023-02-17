Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86311C6379F
	for <buildroot@archiver.kernel.org>; Fri, 17 Feb 2023 15:53:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C86B80EE8;
	Fri, 17 Feb 2023 15:53:06 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C86B80EE8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oxQMqqu0Gvzz; Fri, 17 Feb 2023 15:53:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 478C580F51;
	Fri, 17 Feb 2023 15:53:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 478C580F51
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8F5991BF311
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 15:53:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 75756419D5
 for <buildroot@lists.busybox.net>; Fri, 17 Feb 2023 15:53:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 75756419D5
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x_YpRcXCQc36 for <buildroot@lists.busybox.net>;
 Fri, 17 Feb 2023 15:53:00 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3AE014186A
Received: from mail-oa1-x30.google.com (mail-oa1-x30.google.com
 [IPv6:2001:4860:4864:20::30])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3AE014186A
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 15:53:00 +0000 (UTC)
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-17172af73b7so1600887fac.2
 for <buildroot@buildroot.org>; Fri, 17 Feb 2023 07:53:00 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zMKiJtgN9N1gk7hODipOT7ggzV8JLccegrQfdA36U9o=;
 b=5/rhtiUF9n3ylHlDDEZBvhgk0auS0bExKjM8YE1mpeGL/iX0V/F0fepa/yHyNiM0Z+
 oFdezOaR1j7B3xFIJRDDsymPGM7S+sRa6oL56e7vSnZDX357lxWHFvv3IaE4OLRksJMq
 kYaH8eMEescgdKw4DCLSjKv938LcV2Fp8y2Ftxs1IIFgvXx1/V7EyzmW4dl8XUvUyxhs
 +jyt5+aRbLLpbEdX2Bf7V029l3JWFdvdooIMgSt8KIuHItwsyDsTCY64WV8V5EAmdLSw
 w+0atUAzeEPUtt8WnRuuJzjgi9Xp5YT6qU0gztjnfenApTa5TExpVsi1G6h6omPWD4Vi
 YoTg==
X-Gm-Message-State: AO0yUKWH3YGBBu+zfiwF2KD9X/LMJKNIvNsqOCJagEJYQf5QgTheQZSe
 U3Km0FvjDMjmoKbmkVxNGwkzOw/Uub5Qx+p1NCVDtG59gzo=
X-Google-Smtp-Source: AK7set9w98FHT4GaHybFFUg8e0oAgJqGMDX4Ek1vR0+VnAmdKRIhyNuQ4ThszrLj5oigLXopu8CrF1IqyZIiofI8oJ0=
X-Received: by 2002:a05:6870:a18b:b0:16e:8b95:8548 with SMTP id
 a11-20020a056870a18b00b0016e8b958548mr422386oaf.208.1676649178980; Fri, 17
 Feb 2023 07:52:58 -0800 (PST)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Fri, 17 Feb 2023 16:52:49 +0100
Message-ID: <CADYjeStw7HOAxA_ipNUNW4EsQzUZQydhW+Uaa8_UusE_wisy-g@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=zMKiJtgN9N1gk7hODipOT7ggzV8JLccegrQfdA36U9o=;
 b=iaXQuo6LU3Nn8GfLAucKfqZ5UPjiKhzK4rPWaWGG8J+OhKpnIsxKhwb0HT0TEM37pc
 La1PvcKt+34QSP8OFuxT27r1URMbLykro46zv+ZcG73JGIgG8lJuIZov4bKibVAniDu5
 6aYfrAJMumrWXGnKH4eixFlhGQOFos1Fw+r63t5UFrwYcqZtoyDV4nqkIA4rPLX1jdlH
 E3psgC2ers6gJRhcCym5Vr911oMKeMUeMMAqUx/4c6WjqtkxgWIgZ58SRfwQV27ptgiD
 RmXkqkyUlGbr5cUjAKcA7l6AUGdVRWR+r6hoeFDnRJZD2qxkXAfcxVv4FcCJoGbSj/Jv
 96Sw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=iaXQuo6L
Subject: [Buildroot] Missing curl binary
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
Content-Type: multipart/mixed; boundary="===============0390430063246284107=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============0390430063246284107==
Content-Type: multipart/alternative; boundary="000000000000b9e67c05f4e74eea"

--000000000000b9e67c05f4e74eea
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to include curl binary in my image. I have
selected BR2_PACKAGE_LIBCURL=y , BR2_PACKAGE_LIBCURL_CURL=y in the Config.
But still the curl binary is not installed in the target. Can anyone please
let me know what is the issue here and how to resolve it?

Thank you,
Sourabh

--000000000000b9e67c05f4e74eea
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello,<br><div><br></div><div>I am trying to include curl =
binary in my image. I have selected=C2=A0BR2_PACKAGE_LIBCURL=3Dy ,=C2=A0BR2=
_PACKAGE_LIBCURL_CURL=3Dy in the Config. But still the curl binary is not i=
nstalled in the target. Can anyone please let me know what is the issue her=
e and how to resolve it?</div><div><br></div><div>Thank you,</div><div>Sour=
abh</div></div>

--000000000000b9e67c05f4e74eea--

--===============0390430063246284107==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0390430063246284107==--
