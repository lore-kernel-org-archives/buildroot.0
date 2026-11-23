Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02F4A606A31A
	for <buildroot@archiver.kernel.org>; Mon, 23 Nov 2026 19:06:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=buildroot.org header.i=@buildroot.org header.a=rsa-sha256 header.s=default header.b=H6Oag7Mc;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoFGvs6J
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE1E460684;
	Mon, 23 Nov 2026 19:06:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bj6VgWm5YHyr; Mon, 23 Nov 2026 19:06:39 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org DF91560661
Authentication-Results: smtp3.osuosl.org; arc=none smtp.remote-ip=140.211.166.142
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1795460799;
	b=ZswLPnwyq9Dxqmd45++XPWh8lVwWNEQa7V5BGVnrYPDSB/NHl6hA7ev93fzt7iDJ3NWE
	 xcnRXiJElcVRHJMRrdQ55F4JTTzFdinMrMjoXwwsgittrPIQayCNHh0VyADDlpoJDga/G
	 udkguoSTVRXKRFc1FRxL+NJxDm7UBh0DDELB/9RwPtthzCrUSKn8h0ccPhQw9mVcUpMk9
	 DgPcb3ywpQI06pIurVSjHb6DqxOffuV+Qe9XuP5iIkpLKed8KLcrxUZGoDgwolgutbcqy
	 r8iqGdsI/SZ+krhqHGNGh1mqC6nb29pfs0ajVA+B9zwKxsrasOiQZJB8gDx1iS6RovQ==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1795460799;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:MIME-Version:From:Date:X-Gm-Features:Message-ID:To:Subject:
	 X-BeenThere:X-Mailman-Version:Precedence:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:Content-Type:
	 Errors-To:Sender;
	bh=vamPjpSB9Xc34XFWOlplFnTaFjEG/I+2qsr0kU6vlHM=;
	b=CtT9qsAIsnMhE+HcJGaLEGyT7atD+jAL3Lqb4CNjL0v8E47h28U56UfrC/teTpzEo27B
	 tZwuPSNWeHrvBsDbp0azePCTrYI/uK8zdpq5syf/6Mx4K9qfnEfYrlZMTuX13b2W80Prr
	 3nyYDkKzUxmK0hWN0D6TmKijqN8xuKr2ldHNYnoXscLUlYUhx74hYoV6ffqz1/kjq/Q9A
	 29PSSAP4PjLueb5rr8SV0Dp5qjLGGFiBTCkK9utI9qdYLRDovawOKF22tsZn+zmh+uzK6
	 dPvfCoZUQAXqPGeJ0XNYj32S+7SHAcZlIQtp9CvVBjuIjJYxToP76bQFd2km4qAOfLw==
ARC-Authentication-Results: i=1; smtp3.osuosl.org; 
	dmarc=pass header.from=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=NoFGvs6J;
	arc=none smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1795460799;
	bh=vamPjpSB9Xc34XFWOlplFnTaFjEG/I+2qsr0kU6vlHM=;
	h=From:Date:To:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=H6Oag7Mcyfzf6hzSqk9X7dTwB2RWuz5j74GfhssNB9ImN/1KKQPzrm8Vg+KzeFUj3
	 CYWSWLy4bQqpQcMAVGg1YsblgUnfdsDkI1O+oceZvL/xyLSIMQtld1phqQsYM6TzDE
	 bPvquEGF5hSf7wuDs/imh1gE3jOP7unz04BRu65aPlwST4NRFwM3t4EucMsLQyskSF
	 4HjpYU0fXGv7HRnphqhoH5D4FfysmoCSBvTdtz/Sn8cXIGQQLJKg5ykyZeApWvDW0N
	 7PaMBdjhpweK2p6BUB8TOvKNiW5O2oeSgv/CtUJGQqDv2qtcaMYZSfASJ+JB5zC+UA
	 AAK44oesu/67Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id DF91560661;
	Mon, 23 Nov 2026 19:06:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E8F0422B
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:06:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CDBC860661
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:06:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6IrvMvcrYUmP for <buildroot@buildroot.org>;
 Mon, 23 Nov 2026 19:06:37 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.2 smtp3.osuosl.org BB23E60600
Authentication-Results: smtp3.osuosl.org; arc=pass header.oldest-pass=0
 smtp.remote-ip="2607:f8b0:4864:20::a30"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::a30; helo=mail-vk1-xa30.google.com;
 envelope-from=ab.sen0791@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20260707 header.b=NoFGvs6J
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BB23E60600
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 19:06:36 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-5eae12762c9so1503797e0c.1
 for <buildroot@buildroot.org>; Mon, 23 Nov 2026 11:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20260707; t=1795460795; x=1796065595; darn=buildroot.org;
 h=content-type:to:subject:message-id:date:from:mime-version:from:to
 :cc:subject:date:message-id:reply-to:content-type;
 bh=08fOZX3AmzA6k55p/Hz+j9A4CdBREpbHJjdkREwnBPg=;
 b=NoFGvs6JxCmx41seazVaLHfYO1c2yaJ3hjed1s7HaX8GkRuhgujibfXWFb1gQ4pTLk
 SbduWjc/Q+b+5b/0MvNSu7JgKwKUrhOA4//Z7zui/AYVNl3JRRnauLJ1pXV3Yrja48yH
 VjWAAh6XdSFX3skWTDesWD+VmqSGyktZH5eynsOBE5KCbl7LDvqFis2WOB4xBcN3+SVG
 +cBU3qMdkfyrUekpvgCAH/3Cu+cKXiCRK77yAC590dDqbyVI2TjmHlQp41noGle+wOnp
 F+Rs6u9P6/ADjoNObhIn7B+xeSyGWv9PbdZ1Rg1BXdKUjyrNncWkWHrimVfyMG/1w6Kh
 GiMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1795460795; x=1796065595;
 h=content-type:to:subject:message-id:date:from:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=08fOZX3AmzA6k55p/Hz+j9A4CdBREpbHJjdkREwnBPg=;
 b=XvnEZ8kUyDRovS+HeNCyF6bWXjeCaf3/qz/0Pj8P7kT8qvXKXEhIfMG3UaPbnKVImI
 y5GUMpud04G8dVN4O8bsp7gbjGFHFpLm94RS21/r0nMkgK4vTwifz7Pb790tW1G83gXZ
 xYFCm8Uih9jjzKK93mE/ECxl+4DQ6v1k6hYg6igRONrZ1zx0aNF+pB2fRK9X792fsZuH
 BnPRWNBY2OTdhUdPo3OIL+utGXuSnkZDiyq0TS7p1p5zqXHNCkl2SSnTgW+ccejoq6BR
 E8c2JXMX8l8QYzMo/EBCHLSJjVxkHLoGvkNoK6DInLqtjyUT9c1IrdFynp4Q7I/9Hf+b
 NANg==
X-Gm-Message-State: APuU4Z99yYTEV5JKjCDpkk/IEWXRG9Kqu5oogNL/NzDZwnxDkMaQQbgu
 WuZmAyf33cJO3cSJ96TOi35QqjAMc6k5RYsgrALyy3uNeai/AO/p19S84l2cfYlqY+c7NODqrWj
 qFApIoMgb5SgdFy0JdYCEsCiXDW4ZntrIVxcb
X-Gm-Gg: AZFdTZe7IGJ96+cJC8teK/c1A9vk+RYr/4jHJVZzgW4E/5hGyrulduS5JuM6rH2KjVM
 Hmu91Qz0mDMdSvpQqzylvFm0fvvUBtYGI8NnsnLcvhkjieI6tiSZ0d6feVJuniHPz9YykQ5Id3b
 hsbnWQCpy5HV10fGohRgM+Bx6dQW8iT0vbM2V7/038m9m7qkfg+Lmxe1Ju+8+iDSpLgXkJKypBR
 VlyFL+H46fUiiS8aAZpptRh8bgW9csRvjZdu/6WkU80SNU4fYR1dIW91uKqE8AvkslBWtUukbFz
 p2u/v8XwLOmwXlkWuWQrgl7MGF0HOVKpp7l/DyGVys7e740PhWxWNv62/I5BSWyxJPnhT/zSQnE
 nWa1zChD+Xlf8vmquK7r08+tckGd5sPU9cmv8Ix9v+hYbziHbdnstozBmFEOlBlE1uYFvVOe7qh
 XHXGclFwTSt92T/U0jxyv4pG+lIbWImHZWu/pSHbyhiwSOD8U=
X-Received: by 2002:a05:6122:4890:b0:5ea:c77f:2f22 with SMTP id
 71dfb90a1353d-5ee8af637fcmr6047685e0c.22.1795460795070; Mon, 23 Nov 2026
 11:06:35 -0800 (PST)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: Abhishek Sen <ab.sen0791@gmail.com>
Date: Mon, 23 Nov 2026 20:06:22 +0100
X-Gm-Features: Aa3M54qLsSnM2Z5EvZSRCOuZFXbdrPyG7g7xEHU2klvisxqwlJxyXersJ41LXn0
Message-ID: <CALst+bt+2fpQLj-EqsW3TSh=4f_kTGdE9XWfXC051dyrqMfsVQ@mail.gmail.com>
To: buildroot@buildroot.org
Subject: [Buildroot] [ANNOUNCE] Trowl- Open-source,
 security scanner for Buildroot images
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: multipart/mixed; boundary="===============3367369421001907232=="
Sender: "buildroot" <buildroot-bounces@buildroot.org>
X-Spam-Status: No, score=2.1 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_PASS autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Level: **
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============3367369421001907232==
Content-Type: multipart/alternative; boundary="000000000000e600310660f64acc"

--000000000000e600310660f64acc
Content-Type: text/plain; charset="UTF-8"

Hello everyone,

My name is Abhishek, and I am building Trowl <https://trowl.dev/>- an
open-source scanner to simplify post-build security analysis of embedded
Linux images (including Buildroot).

Trowl unpacks the image to detect hardening gaps and secrets, analyse SBOM
and CVEs in a single workflow. The analysis runs locally, and generates a
self-contained HTML report along with OpenVEX and JSON output.

The project is in early preview, and I'd like to share it with the
Buildroot community to understand where it can be better improved
(integrations, input/output formats, analysis gaps, etc.). I hope this can
become a good tool within Buildroot workflows to scan and secure nightly
builds.

Any feedback directly on the repo (GitHub Issues or Discussions) would be
greatly appreciated!

Best Regards,
Abhishek

--000000000000e600310660f64acc
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><p>Hello everyone,</p><p>My name is Abhishek, and I am bui=
lding=C2=A0<a href=3D"https://trowl.dev/">Trowl</a>- an open-source scanner=
 to simplify post-build security analysis of embedded Linux images (includi=
ng Buildroot).</p><p>Trowl unpacks the image to detect hardening gaps and s=
ecrets, analyse SBOM and CVEs in a single workflow. The analysis runs local=
ly, and generates a self-contained HTML report along with OpenVEX and JSON =
output.</p><p>The project is in early preview, and I&#39;d like to share it=
 with the Buildroot community to understand where it can be better improved=
 (integrations, input/output formats, analysis gaps, etc.). I hope this can=
 become a good tool within Buildroot workflows to scan and secure nightly b=
uilds.</p><p>Any feedback directly on the repo (GitHub Issues or Discussion=
s) would be greatly appreciated!=C2=A0</p><p>Best Regards,<br>Abhishek</p><=
/div>

--000000000000e600310660f64acc--

--===============3367369421001907232==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============3367369421001907232==--
