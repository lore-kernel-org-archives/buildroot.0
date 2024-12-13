Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48EB5E7717D
	for <buildroot@archiver.kernel.org>; Fri, 13 Dec 2024 10:19:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EFA6B608FC;
	Fri, 13 Dec 2024 10:19:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m-stqR3A0-Py; Fri, 13 Dec 2024 10:19:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 0F903608D8
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0F903608D8;
	Fri, 13 Dec 2024 10:19:13 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1F3F1146
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 10:19:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CF40413BC
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 10:19:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 36TLZpoYsH-n for <buildroot@buildroot.org>;
 Fri, 13 Dec 2024 10:19:10 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=159.69.201.130;
 helo=mail.3ffe.de; envelope-from=michael@walle.cc; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 26D9B4135A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 26D9B4135A
Received: from mail.3ffe.de (0001.3ffe.de [159.69.201.130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 26D9B4135A
 for <buildroot@buildroot.org>; Fri, 13 Dec 2024 10:19:10 +0000 (UTC)
Received: from localhost (unknown [213.135.10.150])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (2048 bits)
 server-digest SHA256) (No client certificate requested)
 by mail.3ffe.de (Postfix) with ESMTPSA id D300414B;
 Fri, 13 Dec 2024 11:11:12 +0100 (CET)
Date: Fri, 13 Dec 2024 11:11:10 +0100
Message-Id: <D6AHPO6PLTAA.3JA4YPDT3G8B5@walle.cc>
Cc: <buildroot@buildroot.org>
To: "Sergey Matyukevich" <geomatsi@gmail.com>, "Edgar Bonet"
 <bonet@grenoble.cnrs.fr>
X-Mailer: aerc 0.16.0
References: <20241208214748.524923-1-geomatsi@gmail.com>
 <dcbd3f77-e737-41a2-9f23-87141d0bdf9b@grenoble.cnrs.fr>
 <Z1in3yM7ddVMYEqq@curiosity>
In-Reply-To: <Z1in3yM7ddVMYEqq@curiosity>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=walle.cc; s=mail2022082101; t=1734084672;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:content-type:content-type:in-reply-to:in-reply-to:
 references:references; bh=8U/jhQkS4wbU+MDa7IO56zvM4scujRnkNI69Qvdzz/E=;
 b=Wge+NPr/BkVob6GBNSK/RI4BpSEi8jtUqDj0MEPN5IjI6LL+e0QhwQyprdTBHDp6z3obrZ
 yoCcdMDv+DToSOdrNiJYyn89EkgOVJHU3DXktiN70pu+hQQNmosphJdFCM06i7MnHVUoki
 IuMjLImbHfCMdUZZhFjpNqPGEENybtZgnSdqCnhNgp8/iciaIo8SBCWhHFQfeR0sfVxr5w
 rfbOKtp9OkCbNouofHo+f6iZu3pnuFEtyGl8OlWQfPneiQx5JYUjz7pecx2xERET/j+MEy
 5if+ytKL1ncbwRJoYL+Ncf6YZxh7liQgwub77MnbodifPWNkFkOWNKxuVj8h5g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=walle.cc
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=walle.cc header.i=@walle.cc header.a=rsa-sha256
 header.s=mail2022082101 header.b=Wge+NPr/
Subject: Re: [Buildroot] [PATCH 0/3] {linux,
 linux-headers}: add support for 6.12
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Michael Walle via buildroot <buildroot@buildroot.org>
Reply-To: Michael Walle <michael@walle.cc>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="===============1860283023772108377=="
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

--===============1860283023772108377==
Content-Type: multipart/signed;
 boundary=3c2accdf0b3857046b5cc2b413d64f22926abc2ccfec2ad1d4f0f30cd473;
 micalg=pgp-sha384; protocol="application/pgp-signature"

--3c2accdf0b3857046b5cc2b413d64f22926abc2ccfec2ad1d4f0f30cd473
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi,

> IIUC at the moment Buildroot includes the following configurations that
> make use of BR2_LINUX_KERNEL_CUSTOM_DTS_PATH:
> - acmesystems_acqua_a5_256mb_defconfig (v6.6)
> - acmesystems_acqua_a5_512mb_defconfig (v6.6)
> - octavo_osd32mp1_brk_defconfig (v5.10)
> - octavo_osd32mp1_red_defconfig (v5.10)
> - s6lx9_microboard_defconfig (v4.4.7)
>
> Kernel version from each config is specified in parentheses. Adding new
> v6.12 kernel is not going to break any of those boards right away.

What about buildroot externals? I'd presume they'll make extensive
use of this very feature.

-michael

--3c2accdf0b3857046b5cc2b413d64f22926abc2ccfec2ad1d4f0f30cd473
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iKcEABMJAC8WIQTIVZIcOo5wfU/AngkSJzzuPgIf+AUCZ1wIPxEcbWljaGFlbEB3
YWxsZS5jYwAKCRASJzzuPgIf+MGJAX0YAHXuSezRmNHD3vtJh9AV+4Ni51aJAAan
kUi7YJO0H5AKH1ik/maOvaqtOjiGJ6YBgKfiK2RF7E4d2s3crLfbM6TKDc7O3Nl7
4M9cdIoChl3gKsc10sOaZeZgqIILVWBlyw==
=ll8k
-----END PGP SIGNATURE-----

--3c2accdf0b3857046b5cc2b413d64f22926abc2ccfec2ad1d4f0f30cd473--

--===============1860283023772108377==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot

--===============1860283023772108377==--
