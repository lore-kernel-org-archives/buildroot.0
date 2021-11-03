Return-Path: <SRS0=0gS+=PW=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F25CC433EF
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 05:40:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D4AD060F5A
	for <buildroot@archiver.kernel.org>; Wed,  3 Nov 2021 05:40:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D4AD060F5A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 72BF8608D9;
	Wed,  3 Nov 2021 05:40:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lNpZwx8D0Hgt; Wed,  3 Nov 2021 05:40:36 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id CA6B0607F9;
	Wed,  3 Nov 2021 05:40:35 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 512D71BF476
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 05:40:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3EAA9400FC
 for <buildroot@lists.busybox.net>; Wed,  3 Nov 2021 05:40:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=senzilla.io
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1i3GbFaDV_RS for <buildroot@lists.busybox.net>;
 Wed,  3 Nov 2021 05:40:32 +0000 (UTC)
X-Greylist: delayed 00:06:18 by SQLgrey-1.8.0
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 917C24000B
 for <buildroot@buildroot.org>; Wed,  3 Nov 2021 05:40:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=senzilla.io; s=key1;
 t=1635917650;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hK3ZF66qmofNXgP2FsLeeDjHQQu95HsBpk3igReZ0Oo=;
 b=vLVhn3omCEGLRFlVOC63KEmpYemUW2E6EH7JtL5yN3rCr1uFlgZPLVAhPRtXNUGF+KKHBJ
 8zrUD5PO/n5tjdFUxYD1mv3T2d/UyyuGHX1aFso62AEzr4nW5nBB0vCB72XkjnxKKAXWjK
 RFGf0/SaF/JAfYQNLUAMYDMCQCJZee4=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
MIME-Version: 1.0
Date: Wed, 3 Nov 2021 06:34:08 +0100
Message-Id: <2076D2E9-2867-4AB4-9AF3-F750E232DDB0@senzilla.io>
References: <CAJ+0ANuxaQEALo8wFWkZNwAjkwvzC5h8jkLj2mYMRhQfo3UX=w@mail.gmail.com>
In-Reply-To: <CAJ+0ANuxaQEALo8wFWkZNwAjkwvzC5h8jkLj2mYMRhQfo3UX=w@mail.gmail.com>
To: Nikos Mouzakitis <mzktsn@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: hi@senzilla.io
Subject: Re: [Buildroot] Qemu doesn't read ACPI tables with EDK2 firmware.
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
From: DO via buildroot <buildroot@buildroot.org>
Reply-To: DO <hi@senzilla.io>
Cc: buildroot@buildroot.org
Content-Type: multipart/mixed; boundary="===============0886954531536372018=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>


--===============0886954531536372018==
Content-Type: multipart/alternative; boundary=Apple-Mail-4F6B3004-CEE1-44E6-8984-20610D4F4112
Content-Transfer-Encoding: 7bit


--Apple-Mail-4F6B3004-CEE1-44E6-8984-20610D4F4112
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Nico,

> On 28 Oct 2021, at 23:27, Nikos Mouzakitis <mzktsn@gmail.com> wrote:
>=20
> However, when I tried to use EDK2 ovmf firmware instead of the predefined S=
eaBios that comes with QEMU, I am booting to Linux, but only with one core..=


Where are you getting the EDK2 firmware from? Are you using some package pro=
vided by your distro, or building it from source with Buildroot?

> Trying to find the issue of this, it lead me into finding out that kernel,=
 is not able to read/detect the ACPI table provided from EDK2 I guess.

Could it be that your kernel is not built with ACPI support?

Cheers

D. Olsson
PGP: 8204A8CD=

--Apple-Mail-4F6B3004-CEE1-44E6-8984-20610D4F4112
Content-Type: text/html;
	charset=utf-8
Content-Transfer-Encoding: quoted-printable

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; charset=3D=
utf-8"></head><body dir=3D"auto">Hi Nico,<br><div dir=3D"ltr"><br><blockquot=
e type=3D"cite">On 28 Oct 2021, at 23:27, Nikos Mouzakitis &lt;mzktsn@gmail.=
com&gt; wrote:<br></blockquote></div><blockquote type=3D"cite"><div dir=3D"l=
tr"><div dir=3D"auto"><div dir=3D"auto" style=3D"color:rgb(80,0,80);font-siz=
e:12.8px;font-family:sans-serif"><br></div><div dir=3D"auto" style=3D"color:=
rgb(80,0,80);font-size:12.8px;font-family:sans-serif">However, when I tried t=
o use EDK2 ovmf firmware instead of the predefined SeaBios that comes with Q=
EMU, I am booting to Linux, but only with one core..</div></div></div></bloc=
kquote><div><br></div><div>Where are you getting the EDK2 firmware from? Are=
 you using some package provided by your distro, or building it from source w=
ith Buildroot?</div><br><blockquote type=3D"cite"><div dir=3D"ltr"><div dir=3D=
"auto"><div dir=3D"auto" style=3D"color:rgb(80,0,80);font-size:12.8px;font-f=
amily:sans-serif">Trying to find the issue of this, it lead me into finding o=
ut that kernel, is not able to read/detect the ACPI table provided from EDK2=
 I guess.</div></div></div></blockquote><div><br></div><div>Could it be that=
 your kernel is not built with ACPI support?</div><br><div>Cheers</div><div>=
<br></div><div>D. Olsson</div><div>PGP:&nbsp;8204A8CD</div></body></html>=

--Apple-Mail-4F6B3004-CEE1-44E6-8984-20610D4F4112--

--===============0886954531536372018==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============0886954531536372018==--
