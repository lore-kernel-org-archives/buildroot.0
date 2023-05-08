Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55D1FC7EE23
	for <buildroot@archiver.kernel.org>; Mon,  8 May 2023 10:35:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0D8260E8B;
	Mon,  8 May 2023 10:35:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B0D8260E8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id voKkwGygzFZS; Mon,  8 May 2023 10:35:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF0B2610BC;
	Mon,  8 May 2023 10:35:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EF0B2610BC
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 732031BF2BB
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 10:35:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57D874169E
 for <buildroot@lists.busybox.net>; Mon,  8 May 2023 10:35:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 57D874169E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7LsJHvYT1x2g for <buildroot@lists.busybox.net>;
 Mon,  8 May 2023 10:35:11 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6439941B40
Received: from mail-oa1-x2b.google.com (mail-oa1-x2b.google.com
 [IPv6:2001:4860:4864:20::2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6439941B40
 for <buildroot@buildroot.org>; Mon,  8 May 2023 10:35:10 +0000 (UTC)
Received: by mail-oa1-x2b.google.com with SMTP id
 586e51a60fabf-1929818d7faso30630087fac.0
 for <buildroot@buildroot.org>; Mon, 08 May 2023 03:35:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683542109; x=1686134109;
 h=to:subject:message-id:date:from:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=UN6p7dW6QMAZqnPs86EqI1np9a/DenTFPUIAR3osJLQ=;
 b=ijsG6+lO/khiJq8miDhv7QkK0uZ+9/YTNlU51y5xFw7HDdZBW5ait29Cg+usiEinQy
 siH5LngzCQy1ieb6osrRmPIPxy/l5hGfGRdFkMpcOhMLuuSZe617+WdzoE/U76h1Qz4X
 noSdfkLIEt6ObpeNq+unvtJPJ/GTyg/XZHgimWkgxt8TMxqEgjLJTjzcgYMuoyfy9+TJ
 tNg9kvtZQ9wfBq18DKai23UPtzPlC/tRjmlDVSaaPNEPGk1cs0hRa5zI1ukdgGlIAj1c
 2d47Ip79cFI6DAkiHwwk6DZ+5ysWurvIb0koMxwNZlmj00FpZGp7mlNAnynnDgFQQakC
 Yf+Q==
X-Gm-Message-State: AC+VfDzjAe/OqfCZ2suC3wTjRIOtzfsCNoKAyafBIQPArPmVLkQQNImV
 bnpkJQvqx0JbaoBMdoMZ+d3+HsaXFAw+lQYRUK6I1JCJJ4k=
X-Google-Smtp-Source: ACHHUZ4oBpwrEywA4mChnI+e4BpzIQ2NZd+a0WbrweYwT7lPJfRYAo000zB7D7MpW/k/aEZOVYPivVyj8lh9QMN4vy4=
X-Received: by 2002:a4a:868e:0:b0:54f:84ea:84e4 with SMTP id
 x14-20020a4a868e000000b0054f84ea84e4mr1070264ooh.3.1683542109176; Mon, 08 May
 2023 03:35:09 -0700 (PDT)
MIME-Version: 1.0
From: Sourabh Hegde <hrsourabh011@gmail.com>
Date: Mon, 8 May 2023 12:34:58 +0200
Message-ID: <CADYjeSv5qORodur3uKXp3zm_DRtVEeX=jTR_oBcTYMKks3k+iQ@mail.gmail.com>
To: buildroot@buildroot.org
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1683542109; x=1686134109;
 h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
 :date:message-id:reply-to;
 bh=UN6p7dW6QMAZqnPs86EqI1np9a/DenTFPUIAR3osJLQ=;
 b=TT+qWZOtBqE3uH7DggPow77AttVRQ7vOKwXa85EZ+pTJo9liXcBm3JvVfj7y8flidp
 Z0jYDWyqxPw0jIdw1I1PiP2q8JQ/hpEdXPiPaCkPcm5vsoYUVI/+bmoZw084seLvc4BK
 ThoruNXglDMhIE5AU8GqKSXdG/aMAF/AuMASPFc4E2TDyMB71TRFE+LoF4soS+tmkUJ1
 eZJuz8YUzc04mdQ5aZTOA+/wKvZzsQSLeXVobIJpw+/1KybH0bG0tjYvDHIgZfrTkWuY
 uGZdI76sS4wHqaBvLawhRkeH54CCdIBW6gfIdZX8spRjFCszBvr25a0KWpTkqLrt94MG
 qcxA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=TT+qWZOt
Subject: [Buildroot] Adding custom package to buildroot | tar.gz: not in
 gzip format
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
Content-Type: multipart/mixed; boundary="===============4537304954707026995=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============4537304954707026995==
Content-Type: multipart/alternative; boundary="00000000000061c97205fb2c314d"

--00000000000061c97205fb2c314d
Content-Type: text/plain; charset="UTF-8"

Hello All,

I am trying to add a custom package to buildroot packages. The package is a
simple compiled binary file that will be downloaded from Git. I am not
doing any build in the buildroot. Only installing the binary to target.

But, during package extracting process, I am getting below error:

gzip -d -c /dl/awsclient/awsclient-1.5.0.tar.gz | tar --strip-components=1
-C /home/ultratronik/tmp/br.mmia53.standard/build/awsclient-1.5.0   -xf -

gzip: /dl/awsclient/awsclient-1.5.0.tar.gz: not in gzip format
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors

The tar.gz file is downloaded in the buildroot download directory but it is
not in gzip format.
Inspecting file with "file" showed:awsclient-1.5.0.tar.gz: HTML document,
UTF-8 Unicode text, with very long lines

The package Makefile:

AWSCLIENT_SOURCE=awsclient-$(AWSCLIENT_VERSION).tar.gz
AWSCLIENT_SITE=
https://git.osb-connagtive.com/iot/public/awsclient-releases/uploads/a0e69fa56d7772454b2587df2a800feb/awsclient-1.5.0.tar.gz
AWSCLIENT_SITE_METHOD=git

Can anyone please let me know how I can download the file in the correct
format?

Thank you,
Sourabh

--00000000000061c97205fb2c314d
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr">Hello All,<div><br></div><div>I am trying to add a custom =
package to buildroot packages. The package is a simple compiled binary file=
 that will be downloaded from Git. I am not doing any build in the buildroo=
t. Only installing the binary to target.</div><div><br></div><div>But, duri=
ng package extracting process, I am getting below error:</div><div><br></di=
v><div>gzip -d -c /dl/awsclient/awsclient-1.5.0.tar.gz | tar --strip-compon=
ents=3D1 -C /home/ultratronik/tmp/br.mmia53.standard/build/awsclient-1.5.0 =
=C2=A0 -xf -<br><br>gzip: /dl/awsclient/awsclient-1.5.0.tar.gz: not in gzip=
 format<br>tar: This does not look like a tar archive<br>tar: Exiting with =
failure status due to previous errors<br></div><div><br></div><div>The tar.=
gz file is downloaded in the buildroot download directory but it is not in =
gzip format.</div><div>Inspecting file with &quot;file&quot; showed:awsclie=
nt-1.5.0.tar.gz: HTML document, UTF-8 Unicode text, with very long lines</d=
iv><div><br></div><div>The package Makefile:</div><div><br></div><div>AWSCL=
IENT_SOURCE=3Dawsclient-$(AWSCLIENT_VERSION).tar.gz<br>AWSCLIENT_SITE=3D<a =
href=3D"https://git.osb-connagtive.com/iot/public/awsclient-releases/upload=
s/a0e69fa56d7772454b2587df2a800feb/awsclient-1.5.0.tar.gz">https://git.osb-=
connagtive.com/iot/public/awsclient-releases/uploads/a0e69fa56d7772454b2587=
df2a800feb/awsclient-1.5.0.tar.gz</a><br>AWSCLIENT_SITE_METHOD=3Dgit<br></d=
iv><div><br></div><div>Can anyone please let me know how I can download the=
 file in the correct format?</div><div><br></div><div>Thank you,</div><div>=
Sourabh</div></div>

--00000000000061c97205fb2c314d--

--===============4537304954707026995==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============4537304954707026995==--
